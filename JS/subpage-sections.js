(function () {
  if (document.getElementById("portfolio")) return;

  const main = document.querySelector("main");
  if (!main) return;

  const pathDepth = window.location.pathname
    .split("/")
    .filter(Boolean)
    .length;
  const assetRoot = pathDepth > 1 ? "../../" : "../";

  main.insertAdjacentHTML("beforeend", `
    <section class="pf-section" id="portfolio">
      <div class="pf-container">
        <div class="pf-title-wrap">
          <h2 class="pf-title">Portofolio Kami</h2>
        </div>

        <div class="pf-grid">
          <div class="pf-column">
            <div class="pf-item">
              <div class="pf-left">
                <div class="pf-play"></div>
                <div>
                  <div class="pf-song">Galenna - Kau Jangan Pergi</div>
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
                  <div class="pf-song">Rasika Seta - Tak Ku Sangka</div>
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
                  <div class="pf-song">Alte - Letih</div>
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
                  <div class="pf-song">KUA Menteng</div>
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
                  <div class="pf-song">Ditlantas Polda Jatim</div>
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
                  <div class="pf-song">Sekolah Alam Kreativa</div>
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
                  <div class="pf-song">Nisa - Lebaran Sebentar Lagi</div>
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
                  <div class="pf-song">Anni - Sholawat</div>
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
                  <div class="pf-song">Sela - Tetap Setia</div>
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
                  <div class="pf-song">Anginangan - Hanya Dirimu</div>
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
                  <div class="pf-song">Widy Astuti - Adakah</div>
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
                  <div class="pf-song">Angkasa Pura Indonesia</div>
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

        <p class="pf-desc">
          Layanan kami mencakup aransemen lagu pop, mars, jingle, soundtrack, hingga musik untuk media promosi, iklan, dan corporate identity.
          Setiap karya kami kerjakan dengan detail dan dedikasi untuk menghasilkan musik yang mampu menyampaikan pesan, membangun identitas, dan memberikan dampak yang kuat.
        </p>

        <div class="pf-btn-wrap" onclick="window.open('https://www.instagram.com/musiknyadimas/', '_blank')">
          <button class="pf-btn-main">
            <span class="pf-circle">
              <svg viewBox="0 0 24 24" fill="none">
                <path d="M4 12H18" stroke="#304E4B" stroke-width="2.5" stroke-linecap="round"/>
                <path d="M13 7L18 12L13 17" stroke="#304E4B" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <span class="pf-text-btn">Portofolio Selengkapnya</span>
          </button>
        </div>
      </div>
    </section>

    <section class="why-section">
      <div class="why-container">
        <div class="why-row top-align">
          <div class="why-col">
            <div class="why-title">Kenapa Memilih Jasa Aransemen Musik Profesional?</div>
          </div>
          <div class="why-col">
            <div class="why-item item-3">
              <p>Selain itu, layanan tambahan seperti mixing, mastering, dan recording membuat proses produksi menjadi lebih efisien karena semua dikerjakan dalam satu sistem yang terintegrasi.</p>
              <div class="why-number">3.</div>
            </div>
          </div>
        </div>

        <div class="why-row bottom-align">
          <div class="why-col">
            <div class="why-item">
              <p>Mencari jasa aransemen musik terbaik di Indonesia? Kami hadir sebagai solusi one-stop music production. Dengan pengalaman bertahun-tahun dalam menangani aransemen string dan orkestra, kami memastikan setiap detail notasi dan harmoni terjaga.</p>
              <div class="why-number">1.</div>
            </div>
          </div>
          <div class="why-col">
            <div class="why-item">
              <p>Tidak hanya di studio, layanan vocal recording panggilan kami memudahkan musisi dari berbagai daerah untuk mendapatkan kualitas rekaman studio profesional tanpa harus keluar rumah.</p>
              <div class="why-number">4.</div>
            </div>
          </div>
        </div>

        <div class="why-row bottom-align">
          <div class="why-col">
            <div class="why-item">
              <p>Menggunakan jasa aransemen musik profesional memberikan banyak keuntungan dibandingkan mengerjakan sendiri. Selain hasil yang lebih berkualitas, Anda juga mendapatkan perspektif baru dalam pengembangan musik.</p>
              <div class="why-number">2.</div>
            </div>
          </div>
          <div class="why-col">
            <div class="why-item">
              <p>Seorang arranger profesional memahami struktur lagu, teori musik, serta tren industri yang terus berkembang. Hal ini memungkinkan lagu Anda memiliki daya saing lebih tinggi di pasar musik digital.</p>
              <div class="why-number">5.</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="faq-section">
      <div class="faq-container">
        <h2 class="faq-title">PERTANYAAN</h2>

        <div class="faq-item">
          <div class="faq-question">
            <span>Berapa harga jasa aransemen musik?</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">Harga tergantung tingkat kompleksitas aransemen, jumlah instrumen, dan kebutuhan produksi. Silakan hubungi kami untuk penawaran terbaik sesuai kebutuhan Anda.</div>
        </div>

        <div class="faq-item">
          <div class="faq-question">
            <span>Apakah bisa recording luar kota?</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">Ya, kami menyediakan layanan recording on-location ke berbagai kota di Indonesia dengan peralatan profesional.</div>
        </div>

        <div class="faq-item">
          <div class="faq-question">
            <span>Apakah termasuk partitur?</span>
            <div class="faq-icon">+</div>
          </div>
          <div class="faq-answer">Tergantung paket yang dipilih. Kami juga menyediakan layanan khusus penulisan partitur profesional.</div>
        </div>
      </div>
    </section>

    <section class="cta-section parallax-section" id="konsultasi">
      <div class="cta-container">
        <div class="cta-line left"></div>
        <div class="cta-line right"></div>
        <h2 class="cta-title">Siap Mewujudkan Musik Terbaik Anda?</h2>
        <div class="cta-actions">
          <div class="cta-btn-wrap">
            <button class="cta-btn-primary" onclick="window.open('https://wa.me/6285737690807?text=Halo%20Dimas,%20saya%20mau%20konsultasi', '_blank')">
              <span class="cta-circle">
                <svg viewBox="0 0 24 24" fill="none">
                  <path d="M4 12H18" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round"/>
                  <path d="M13 7L18 12L13 17" stroke="#CF7325" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </span>
              <span class="cta-btn-text">Konsultasi Sekarang</span>
            </button>
          </div>
          <a href="#portfolio" class="cta-link">Lihat Portofolio</a>
        </div>
      </div>
    </section>
  `);
})();
