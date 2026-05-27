(function () {
  if (document.getElementById("portfolio")) return;

  const main = document.querySelector("main");
  if (!main) return;

  const pathDepth = window.location.pathname
    .split("/")
    .filter(Boolean)
    .length;
  const assetRoot = pathDepth > 1 ? "../../" : "../";
  const isEnglish = document.documentElement.lang.toLowerCase().startsWith("en");
  const copy = isEnglish
    ? {
        portfolioTitle: "Our Portfolio",
        portfolioDescription: "Our work covers pop song arrangements, marches, jingles, soundtracks, and music for promotional media, advertising, and corporate identity. Every project is handled with detail and dedication so the music can deliver its message, build identity, and create a strong impact.",
        portfolioButton: "View Full Portfolio",
        whyTitle: "Why Choose a Professional Music Arrangement Service?",
        whyItems: [
          "Looking for one of the best music arrangement services in Indonesia? We are here as a one-stop music production solution. With years of experience in string and orchestral arrangement, we make sure every notation and harmony detail is handled carefully.",
          "Using a professional music arrangement service gives you many advantages compared with doing everything alone. Beyond better quality, you also receive a fresh perspective for developing the music.",
          "Additional services such as mixing, mastering, and recording also make the production process more efficient because everything is handled in one integrated workflow.",
          "Our on-location vocal recording service helps musicians from many areas get professional studio recording quality without having to leave home.",
          "A professional arranger understands song structure, music theory, and current industry trends. This helps your song become more competitive in the digital music market."
        ],
        faqTitle: "QUESTIONS",
        faqItems: [
          {
            question: "How much does music arrangement cost?",
            answer: "The price depends on arrangement complexity, number of instruments, and production needs. Contact us for the best offer based on your project."
          },
          {
            question: "Can you record outside the city?",
            answer: "Yes, we provide on-location recording services in various cities in Indonesia with professional equipment."
          },
          {
            question: "Does it include sheet music?",
            answer: "It depends on the selected package. We also provide dedicated professional sheet music and notation services."
          }
        ],
        ctaTitle: "Ready to Create Your Best Music?",
        ctaButton: "Consult Now",
        ctaLink: "View Portfolio",
        whatsappText: "Hello Dimas, I want to consult"
      }
    : {
        portfolioTitle: "Portofolio Kami",
        portfolioDescription: "Layanan kami mencakup aransemen lagu pop, mars, jingle, soundtrack, hingga musik untuk media promosi, iklan, dan corporate identity. Setiap karya kami kerjakan dengan detail dan dedikasi untuk menghasilkan musik yang mampu menyampaikan pesan, membangun identitas, dan memberikan dampak yang kuat.",
        portfolioButton: "Portofolio Selengkapnya",
        whyTitle: "Kenapa Memilih Jasa Aransemen Musik Profesional?",
        whyItems: [
          "Mencari jasa aransemen musik terbaik di Indonesia? Kami hadir sebagai solusi one-stop music production. Dengan pengalaman bertahun-tahun dalam menangani aransemen string dan orkestra, kami memastikan setiap detail notasi dan harmoni terjaga.",
          "Menggunakan jasa aransemen musik profesional memberikan banyak keuntungan dibandingkan mengerjakan sendiri. Selain hasil yang lebih berkualitas, Anda juga mendapatkan perspektif baru dalam pengembangan musik.",
          "Selain itu, layanan tambahan seperti mixing, mastering, dan recording membuat proses produksi menjadi lebih efisien karena semua dikerjakan dalam satu sistem yang terintegrasi.",
          "Tidak hanya di studio, layanan vocal recording panggilan kami memudahkan musisi dari berbagai daerah untuk mendapatkan kualitas rekaman studio profesional tanpa harus keluar rumah.",
          "Seorang arranger profesional memahami struktur lagu, teori musik, serta tren industri yang terus berkembang. Hal ini memungkinkan lagu Anda memiliki daya saing lebih tinggi di pasar musik digital."
        ],
        faqTitle: "PERTANYAAN",
        faqItems: [
          {
            question: "Berapa harga jasa aransemen musik?",
            answer: "Harga tergantung tingkat kompleksitas aransemen, jumlah instrumen, dan kebutuhan produksi. Silakan hubungi kami untuk penawaran terbaik sesuai kebutuhan Anda."
          },
          {
            question: "Apakah bisa recording luar kota?",
            answer: "Ya, kami menyediakan layanan recording on-location ke berbagai kota di Indonesia dengan peralatan profesional."
          },
          {
            question: "Apakah termasuk partitur?",
            answer: "Tergantung paket yang dipilih. Kami juga menyediakan layanan khusus penulisan partitur profesional."
          }
        ],
        ctaTitle: "Siap Mewujudkan Musik Terbaik Anda?",
        ctaButton: "Konsultasi Sekarang",
        ctaLink: "Lihat Portofolio",
        whatsappText: "Halo Dimas, saya mau konsultasi"
      };
  const whatsappUrl = `https://wa.me/6285737690807?text=${encodeURIComponent(copy.whatsappText)}`;
  const songTitle = title => `<div class="pf-song"><span>${title}</span></div>`;

  main.insertAdjacentHTML("beforeend", `
    <section class="pf-section" id="portfolio">
      <div class="pf-container">
        <div class="pf-title-wrap">
          <h2 class="pf-title">${copy.portfolioTitle}</h2>
        </div>

        <div class="pf-grid">
          <div class="pf-column">
            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Galenna - Kau Jangan Pergi")}
                  <div class="pf-artist">Pop Ballad</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Kang Deden - Kau Jangan Pergi.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Rasika Seta - Tak Ku Sangka")}
                  <div class="pf-artist">Pop Ballad</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Kang Deden - Tak Ku Sangka.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Alte - Letih")}
                  <div class="pf-artist">Pop Rock</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Alte - Letih.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("KUA Menteng")}
                  <div class="pf-artist">Mars</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Tepuk Sakinah - Mars.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>
          </div>

          <div class="pf-column">
            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Ditlantas Polda Jatim")}
                  <div class="pf-artist">Jingle</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Ditlantas Polda Jatim - Jingle.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Sekolah Alam Kreativa")}
                  <div class="pf-artist">Jingle</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Saka - Jingle.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Nisa - Lebaran Sebentar Lagi")}
                  <div class="pf-artist">Pop Ballad</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Nisa - Lebaran.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Anni - Sholawat")}
                  <div class="pf-artist">Pop Ballad</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Anni - Sholawat.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>
          </div>

          <div class="pf-column">
            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Sela - Tetap Setia")}
                  <div class="pf-artist">Strange Arrangement</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Sela - Live Arrange.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Anginangan - Hanya Dirimu")}
                  <div class="pf-artist">Pop Blues</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Anginangan - Hanya Dirimu.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Widy Astuti - Adakah")}
                  <div class="pf-artist">Bossanova</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Heri - Adakah.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>

            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  ${songTitle("Angkasa Pura Indonesia")}
                  <div class="pf-artist">Music Profile</div>
                </div>
              </div>
              <div class="pf-dots">
                <audio src="${assetRoot}MUSIK/Jasa aransemen lagu - Angkasapura - Scoring.mp3" preload="none"></audio>
                <span></span><span></span><span></span>
              </div>
            </div>
          </div>
        </div>

        <p class="pf-desc">${copy.portfolioDescription}</p>

        <div class="pf-btn-wrap" onclick="window.open('https://www.instagram.com/musiknyadimas/', '_blank')">
          <button class="pf-btn-main">
            <span class="pf-circle">
              <svg viewBox="0 0 24 24" fill="none">
                <path d="M4 12H18" stroke="#304E4B" stroke-width="2.5" stroke-linecap="round"/>
                <path d="M13 7L18 12L13 17" stroke="#304E4B" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <span class="pf-text-btn">${copy.portfolioButton}</span>
          </button>
        </div>
      </div>
    </section>

    <section class="why-section">
      <div class="why-container">
        <div class="why-row top-align">
          <div class="why-col">
            <div class="why-title">${copy.whyTitle}</div>
          </div>
          <div class="why-col">
            <div class="why-item item-3">
              <p>${copy.whyItems[2]}</p>
              <div class="why-number">3.</div>
            </div>
          </div>
        </div>

        <div class="why-row bottom-align">
          <div class="why-col">
            <div class="why-item">
              <p>${copy.whyItems[0]}</p>
              <div class="why-number">1.</div>
            </div>
          </div>
          <div class="why-col">
            <div class="why-item">
              <p>${copy.whyItems[3]}</p>
              <div class="why-number">4.</div>
            </div>
          </div>
        </div>

        <div class="why-row bottom-align">
          <div class="why-col">
            <div class="why-item">
              <p>${copy.whyItems[1]}</p>
              <div class="why-number">2.</div>
            </div>
          </div>
          <div class="why-col">
            <div class="why-item">
              <p>${copy.whyItems[4]}</p>
              <div class="why-number">5.</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="faq-section">
      <div class="faq-container">
        <h2 class="faq-title">${copy.faqTitle}</h2>

        <div class="faq-item">
          <div class="faq-question">
            <span>${copy.faqItems[0].question}</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">${copy.faqItems[0].answer}</div>
        </div>

        <div class="faq-item">
          <div class="faq-question">
            <span>${copy.faqItems[1].question}</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">${copy.faqItems[1].answer}</div>
        </div>

        <div class="faq-item">
          <div class="faq-question">
            <span>${copy.faqItems[2].question}</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">${copy.faqItems[2].answer}</div>
        </div>
      </div>
    </section>

    <section class="cta-section parallax-section" id="konsultasi">
      <div class="cta-container">
        <div class="cta-line left"></div>
        <div class="cta-line right"></div>
        <h2 class="cta-title">${copy.ctaTitle}</h2>
        <div class="cta-actions">
          <div class="cta-btn-wrap">
            <button class="cta-btn-primary" onclick="window.open('${whatsappUrl}', '_blank')">
              <span class="cta-circle">
                <svg viewBox="0 0 24 24" fill="none">
                  <path d="M4 12H18" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round"/>
                  <path d="M13 7L18 12L13 17" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </span>
              <span class="cta-btn-text">${copy.ctaButton}</span>
            </button>
          </div>
          <a href="#portfolio" class="cta-link">${copy.ctaLink}</a>
        </div>
      </div>
    </section>
  `);

})();
