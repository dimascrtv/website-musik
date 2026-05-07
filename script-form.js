const DATA = [
  {
    title: "Orchestra",
    groups: [
      {
        name: "Strings Section",
        options: ["Violin 1", "Violin 2", "Viola", "Cello", "Contrabass"]
      },
      {
        name: "Woodwind Section",
        options: ["Flute", "Oboe", "Clarinet", "Piccolo", "Bassoon"]
      },
      {
        name: "Brass Section",
        options: ["Trumpet", "Trombone", "Horn", "Tuba", "Saxophone"]
      },
      {
        name: "Orchestral Percussion",
        options: ["Timpani", "Snare Drum", "Bass Drum", "Cymbals"]
      },
      {
        name: "Hand Percussion",
        options: ["Shaker", "Tambourine", "Cowbell", "Triangle"]
      },
      {
        name: "Melody Percussion",
        options: ["Glockenspiel", "Xylophone", "Marimba", "Vibraphone"]
      },
      {
        name: "Ethnic Percussion",
        options: ["Cajon", "Congas", "Bongos"]
      }
    ]
  },

  {
    title: "Modern Band",
    groups: [
      {
        name: "Keyboard & Piano Section",
        options: ["Piano", "Upright", "Electric Piano"]
      },
      {
        name: "Synthesizer Section",
        options: ["Pad", "Lead", "Synth Bass"]
      },
      {
        name: "Guitar Section",
        options: ["Acoustic Guitar", "Guitar Nylon", "Electric Guitar"]
      },
      {
        name: "Bass Section",
        options: ["Electric Bass", "Acoustic Bass"]
      },
      {
        name: "Rhythm Section",
        options: ["Acoustic Drum Kit", "Electronic Drum Kit"]
      }
    ]
  },

  {
    title: "Durasi Musik (Wajib isi)",
    groups: [
      {
        name: "Durasi maksimal",
        options: ["1 Menit", "2 Menit", "3 Menit", "4 Menit", "5 Menit"]
      }
    ]
  },

  {
    title: "Referensi (Wajib isi)",
    groups: [
      {
        name: "Masukan Link Referensi",
        input: true,
        placeholder: "Link youtube / instagram"
      },
      {
        name: "Catatan",
        textarea: true,
        placeholder: "Catatan untuk referensi"
      }
    ]
  },

  {
    title: "Revisi",
    groups: [
      {
        name: "Revisi minor",
        options: ["2x Revisi", "3x Revisi", "4x Revisi", "5x Revisi"]
      }
    ]
  },

  {
    title: "Mixing Mastering",
    groups: [
      {
        name: "Mixing",
        options: ["Include", "Exclude"]
      },
      {
        name: "Mastering",
        options: ["Include", "Exclude"]
      }
    ]
  }

];

const state = {
  selections: {}
};

const accordionContainer = document.getElementById("accordionContainer");

function renderAccordion(){

  accordionContainer.innerHTML = "";

  DATA.forEach(section => {

    const big = document.createElement("div");
    big.className = "big-group";

    big.innerHTML = `
      <div class="big-header">
        <h3>${section.title}</h3>
        <div class="arrow"></div>
      </div>

      <div class="big-line"></div>

      <div class="big-content"></div>
    `;

    const content = big.querySelector(".big-content");

    section.groups.forEach(group => {

      const wrap = document.createElement("div");
      wrap.className = "instrument-group";

      const label = document.createElement("label");
      label.innerText = group.name;

      wrap.appendChild(label);

      // INPUT
      if(group.input){

        const input = document.createElement("input");
        input.className = "custom-input";
        input.placeholder = group.placeholder;

        input.addEventListener("input", () => {
          state.selections[group.name] = input.value;
          updateSummary();
        });

        wrap.appendChild(input);
      }

      // TEXTAREA
      else if(group.textarea){

        const textarea = document.createElement("textarea");
        textarea.className = "custom-input";
        textarea.placeholder = group.placeholder;

        textarea.addEventListener("input", () => {
          state.selections[group.name] = textarea.value;
          updateSummary();
        });

        wrap.appendChild(textarea);
      }

      // OPTIONS
      else{

        const box = document.createElement("div");
        box.className = "option-box";

        group.options.forEach(option => {

          const btn = document.createElement("button");
          btn.className = "option";

          btn.innerHTML = `
            <span>${option}</span>
            <div class="remove"></div>
          `;

          btn.addEventListener("click", () => {

            // SINGLE SELECT
            if(
              group.name === "Durasi maksimal" ||
              group.name === "Revisi minor" ||
              group.name === "Mixing" ||
              group.name === "Mastering"
            ){

              box.querySelectorAll(".option").forEach(el=>{
                el.classList.remove("active");
              });

              btn.classList.add("active");

              state.selections[group.name] = [option];

            }else{

              btn.classList.toggle("active");

              const active = [
                ...box.querySelectorAll(".option.active span")
              ].map(el => el.innerText);

              state.selections[group.name] = active;
            }

            reorderOptions(box);
            updateSummary();

          });

          box.appendChild(btn);

        });

        wrap.appendChild(box);

      }

      content.appendChild(wrap);

    });

    // ACCORDION
    const header = big.querySelector(".big-header");

    header.addEventListener("click", () => {
      big.classList.toggle("closed");

      if(big.classList.contains("closed")){
        content.style.display = "none";
      }else{
        content.style.display = "block";
      }
    });

    accordionContainer.appendChild(big);

  });

}

renderAccordion();

/* REORDER ACTIVE */

function reorderOptions(box){

  const active = [...box.querySelectorAll(".option.active")];
  const inactive = [...box.querySelectorAll(".option:not(.active)")];

  box.innerHTML = "";

  active.forEach(item => box.appendChild(item));
  inactive.forEach(item => box.appendChild(item));

}

/* SEARCH */

document
.getElementById("instrumentSearch")
.addEventListener("input", function () {

  const keyword = this.value.toLowerCase().trim();

  const bigGroups = document.querySelectorAll(".big-group");

  bigGroups.forEach(bigGroup => {

    const instrumentGroups =
      bigGroup.querySelectorAll(".instrument-group");

    let hasVisibleGroup = false;

    instrumentGroups.forEach(group => {

      const options =
        group.querySelectorAll(".option");

      let hasVisibleOption = false;

      options.forEach(option => {

        const text =
          option.innerText.toLowerCase();

        const match =
          text.includes(keyword);

        if (keyword === "") {

          option.style.display = "flex";
          hasVisibleOption = true;

        } else {

          if (match) {
            option.style.display = "flex";
            hasVisibleOption = true;
          } else {
            option.style.display = "none";
          }

        }

      });

      // tampil/sembunyikan 1 group kecil
      if (hasVisibleOption || keyword === "") {

        group.style.display = "block";
        hasVisibleGroup = true;

      } else {

        group.style.display = "none";

      }

    });

    // buka/tutup accordion besar
    const content =
      bigGroup.querySelector(".big-content");

    if (hasVisibleGroup || keyword === "") {

      bigGroup.classList.remove("closed");
      content.style.display = "block";

    } else {

      bigGroup.classList.add("closed");
      content.style.display = "none";

    }

  });

});

/* SUMMARY */

function updateSummary(){

  const container = document.getElementById("summaryContent");

  container.innerHTML = "";

  let totalInstruments = 0;

  let duration = 1;

  // GET DURATION
  if(state.selections["Durasi maksimal"]){

    const text = state.selections["Durasi maksimal"][0];

    duration = parseInt(text);

  }

  let total = 0;

  DATA.forEach(section => {

    const sectionWrap = document.createElement("div");
    sectionWrap.className = "summary-box";

    let hasData = false;

    const title = document.createElement("div");
    title.className = "summary-main";
    title.innerText = section.title;

    sectionWrap.appendChild(title);

    section.groups.forEach(group => {

      const value = state.selections[group.name];

      if(value && value.length){

        hasData = true;

        const item = document.createElement("div");
        item.className = "summary-item";

        const left = document.createElement("span");
        left.innerText = group.name;

        const right = document.createElement("span");
        right.className = "right";

        if(Array.isArray(value)){
          right.innerText = value.join(", ");
        }else{
          right.innerText = value;
        }

        item.appendChild(left);
        item.appendChild(right);

        sectionWrap.appendChild(item);

        // COUNT INSTRUMENT
        if(
          section.title === "Orchestra" ||
          section.title === "Modern Band"
        ){
          totalInstruments += value.length;
        }

      }

    });

    if(hasData){
      container.appendChild(sectionWrap);
    }

  });

  // PRICE

  total += totalInstruments * duration * 100000;

  // REVISI
  if(state.selections["Revisi minor"]){

    const rev = parseInt(
      state.selections["Revisi minor"][0]
    );

    total += rev * 100000;

  }

  // MIXING
  if(
    state.selections["Mixing"] &&
    state.selections["Mixing"][0] === "Include"
  ){

    total += totalInstruments * duration * 50000;

  }

  // MASTERING
  if(
    state.selections["Mastering"] &&
    state.selections["Mastering"][0] === "Include"
  ){

    total += totalInstruments * duration * 25000;

  }

  document.getElementById("totalPrice").innerText =
    formatRupiah(total);

  generateWA(total);

}

function formatRupiah(number){

  return new Intl.NumberFormat("id-ID", {
    style:"currency",
    currency:"IDR",
    maximumFractionDigits:0
  }).format(number);

}

/* WHATSAPP */

function generateWA(total){

  let message = `Halo, saya ingin melakukan pemesanan.%0A%0A`;

  DATA.forEach(section => {

    let sectionText = "";

    section.groups.forEach(group => {

      const value = state.selections[group.name];

      if(value && value.length){

        sectionText += `• ${group.name}: ${
          Array.isArray(value)
          ? value.join(", ")
          : value
        }%0A`;

      }

    });

    if(sectionText){
      message += `*${section.title}*%0A${sectionText}%0A`;
    }

  });

  message += `Total: ${formatRupiah(total)}`;

  const url =
  `https://wa.me/6285737690807?text=${message}`;

  document
  .getElementById("waButton")
  .href = url;

}

updateSummary();