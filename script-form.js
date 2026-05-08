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

          textarea.style.height = "auto";

          textarea.style.height =
            textarea.scrollHeight + "px";

          state.selections[group.name] = textarea.value;

          updateSummary();

        });

        wrap.appendChild(textarea);
      }

      // OPTIONS
      else{

        const box = document.createElement("div");
        box.className = "option-box";

        group.options.forEach((option, index) => {

          const btn = document.createElement("button");

          btn.dataset.index = index;

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
    // ACCORDION
// ACCORDION
    const header = big.querySelector(".big-header");

    header.addEventListener("click", () => {

      big.classList.toggle("closed");

      checkAllClosed();

    });

    // WAJIB ADA
    accordionContainer.appendChild(big);

    });

    // WAJIB ADA
}


renderAccordion();

function checkAllClosed(){

  const groups =
    document.querySelectorAll(".big-group");

  const allClosed =
    [...groups].every(group =>
      group.classList.contains("closed")
    );

  const hero =
    document.querySelector(".hero-section");

  if(allClosed){

    hero.classList.add("all-closed");

  }else{

    hero.classList.remove("all-closed");

  }

}

/* REORDER ACTIVE */

function reorderOptions(box){

  const items = [...box.querySelectorAll(".option")];

  // simpan posisi awal
  const firstPositions = new Map();

  items.forEach(item => {
    firstPositions.set(item, item.getBoundingClientRect());
  });

  // urutan asli
  const originalOrder = [...items].sort((a, b) => {
    return Number(a.dataset.index) - Number(b.dataset.index);
  });

  // active di depan
  const active = originalOrder.filter(item =>
    item.classList.contains("active")
  );

  const inactive = originalOrder.filter(item =>
    !item.classList.contains("active")
  );

  // render ulang
  [...active, ...inactive].forEach(item => {
    box.appendChild(item);
  });

  // animasi FLIP
  requestAnimationFrame(() => {

    items.forEach(item => {

      const first = firstPositions.get(item);
      const last = item.getBoundingClientRect();

      const dx = first.left - last.left;
      const dy = first.top - last.top;

      if(dx || dy){

        item.animate(
          [
            {
              transform: `translate(${dx}px, ${dy}px)`
            },
            {
              transform: `translate(0,0)`
            }
          ],
          {
            duration: 420,
            easing: "cubic-bezier(0.22, 1, 0.36, 1)"
          }
        );

      }

    });

  });

}
/* SEARCH */

/* SEARCH FUZZY */

function normalizeText(text){

  return text
    .toLowerCase()
    .replace(/ph/g, "f")
    .replace(/v/g, "f")
    .replace(/c/g, "k")
    .replace(/j/g, "y")
    .replace(/q/g, "k");

}

function levenshtein(a, b){

  const matrix = [];

  for(let i = 0; i <= b.length; i++){
    matrix[i] = [i];
  }

  for(let j = 0; j <= a.length; j++){
    matrix[0][j] = j;
  }

  for(let i = 1; i <= b.length; i++){

    for(let j = 1; j <= a.length; j++){

      if(b.charAt(i - 1) === a.charAt(j - 1)){

        matrix[i][j] = matrix[i - 1][j - 1];

      }else{

        matrix[i][j] = Math.min(
          matrix[i - 1][j - 1] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j] + 1
        );

      }

    }

  }

  return matrix[b.length][a.length];

}

function isFuzzyMatch(text, keyword){

  const a = normalizeText(text);
  const b = normalizeText(keyword);

  // exact
  if(a.includes(b)) return true;

  // indonesia -> english
  const aliases = {
    gitar: "guitar",
    terompet: "trumpet",
    kajon: "cajon",
    drum: "drum",
    bass: "bass"
  };

  if(aliases[b] && a.includes(aliases[b])){
    return true;
  }

  const words = a.split(" ");

  return words.some(word => {

    const distance = levenshtein(word, b);

    return distance <= 2;

  });

}

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

      const hasInput =
        group.querySelector(".custom-input");

      let hasVisibleOption = false;

      options.forEach(option => {

        const text =
          option.innerText.toLowerCase();

        const match =
          keyword === ""
          ? true
          : isFuzzyMatch(text, keyword);

        if(match){

          option.style.display = "flex";
          hasVisibleOption = true;

        }else{

          option.style.display = "none";

        }

      });

      if(keyword === ""){

        group.style.display = "block";

        hasVisibleGroup = true;

      }else if(hasInput){

        group.style.display = "block";

        hasVisibleGroup = true;

      }else if(hasVisibleOption){

        group.style.display = "block";

        hasVisibleGroup = true;

      }else{

        group.style.display = "none";

      }

    });

    const content =
      bigGroup.querySelector(".big-content");

    if(hasVisibleGroup || keyword === ""){

      bigGroup.classList.remove("closed");
      content.style.display = "block";

    }else{

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

/* WHATSAPP */

function generateWA(total){

  let message = "";

  message += "Halo Musiknya Dimas,\n\n";
  message += "Saya ingin melakukan pemesanan arrangement.\n\n";

  DATA.forEach(section => {

    let sectionText = "";

    section.groups.forEach(group => {

      const value = state.selections[group.name];

      if(value && value.length){

        sectionText += `• ${group.name}\n`;

        // ARRAY
        if(Array.isArray(value)){

          value.forEach(item => {
            sectionText += `   - ${item}\n`;
          });

        }else{

          sectionText += `   - ${value}\n`;

        }

        sectionText += `\n`;

      }

    });

    if(sectionText){

      message += "====================\n";
      message += `${section.title.toUpperCase()}\n`;
      message += "====================\n\n";

      message += sectionText;

    }

  });

  message += "====================\n";
  message += "TOTAL BIAYA\n";
  message += "====================\n\n";

  message += `${formatRupiah(total)}`;

  // WAJIB encode
  const encodedMessage = encodeURIComponent(message);

  const url =
    `https://wa.me/6285737690807?text=${encodedMessage}`;

  document.getElementById("waButton").href = url;

}

updateSummary();


window.addEventListener("scroll", () => {

  const hero =
    document.querySelector(".hero-section");

  const scrollY = window.scrollY;

  hero.style.backgroundPosition =
    `center ${scrollY * 0.45}px`;

});