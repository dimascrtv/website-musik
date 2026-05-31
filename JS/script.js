document.addEventListener("DOMContentLoaded", () => {

  const revealItems = document.querySelectorAll(
    "section p, main p, .faq-answer"
  );

  if (revealItems.length) {
    revealItems.forEach((item, index) => {
      item.classList.add("text-reveal");
      item.style.setProperty("--reveal-delay", `${Math.min(index % 4, 3) * 90}ms`);
    });

    if (!("IntersectionObserver" in window)) {
      revealItems.forEach(item => item.classList.add("is-visible"));
    } else {
      const revealObserver = new IntersectionObserver(
        entries => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              entry.target.classList.add("is-visible");
              revealObserver.unobserve(entry.target);
            }
          });
        },
        {
          threshold: 0.16,
          rootMargin: "0px 0px -8% 0px"
        }
      );

      revealItems.forEach(item => revealObserver.observe(item));
    }
  }

  const cards = document.querySelectorAll(".audio-card");

  cards.forEach(card => {
    const btn = card.querySelector(".play-btn");
    const icon = card.querySelector(".icon");
    const audio = card.querySelector("audio");
    const durationText = card.querySelector(".duration");
    const waveform = card.querySelector(".waveform");

    const TOTAL_BARS = 30;

for (let i = 0; i < TOTAL_BARS; i++) {
  const bar = document.createElement("div");

  // 🔥 TAMBAH active di awal
  bar.classList.add("wave-bar", "active");

  bar.style.height = (Math.random() * 100) + "%";

  waveform.appendChild(bar);
}

waveform.classList.add("has-bars");

    let raf;

    function formatTime(time) {
      let min = Math.floor(time / 60);
      let sec = Math.floor(time % 60);
      if (sec < 10) sec = "0" + sec;
      return `${min}:${sec}`;
    }


  function updateUI() {
    if (!audio.duration) return;

    const current = audio.currentTime;
    const duration = audio.duration;

    durationText.textContent = formatTime(current);

    const percent = current / duration;
    const bars = waveform.querySelectorAll(".wave-bar");

    const activeBars = Math.floor(percent * bars.length);

    bars.forEach((bar, index) => {
      if (index < activeBars) {
        bar.classList.remove("active"); // jadi abu
      } else {
        bar.classList.add("active"); // tetap putih
      }
    });

    if (!audio.paused) {
      raf = requestAnimationFrame(updateUI);
    }
  }

    async function toggleAudio() {
      document.querySelectorAll(".audio-card").forEach(c => {
        const a = c.querySelector("audio");
        const d = c.querySelector(".duration");
        const i = c.querySelector(".icon");
        const bars = c.querySelectorAll(".wave-bar");

        if (a !== audio) {
          a.pause();
          a.currentTime = 0;

          if (d) d.textContent = "00:00";
          if (i) i.className = "icon play";

          bars.forEach(bar => bar.classList.add("active"));
        }
      });

      document.querySelectorAll(".icon").forEach(i => {
        i.classList.remove("stop");
        i.classList.add("play");
      });

      if (audio.paused) {
        try {
          await audio.play();
          icon.className = "icon stop";
          updateUI();
        } catch (err) {
          console.log("Audio gagal play:", err);
        }
      } else {
        audio.pause();
        icon.classList.remove("stop");
        icon.classList.add("play");
        cancelAnimationFrame(raf);
      }
    }

    btn.addEventListener("click", event => {
      event.stopPropagation();
      toggleAudio();
    });

    card.addEventListener("click", event => {
      if (event.target.closest("audio")) return;
      toggleAudio();
    });

    // klik waveform
    waveform.addEventListener("click", (e) => {
      e.stopPropagation();
      if (!audio.duration) return;

      const rect = waveform.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const percent = x / rect.width;

      audio.currentTime = percent * audio.duration;

      updateUI();

      if (audio.paused) toggleAudio();
    });

    // reset
    audio.addEventListener("ended", () => {
      icon.classList.remove("stop");
      icon.classList.add("play");

      durationText.textContent = "00:00";

      cancelAnimationFrame(raf);
    });
	
	audio.addEventListener("loadedmetadata", () => {
	durationText.textContent = formatTime(audio.duration);
	});

    audio.addEventListener("pause", () => {
      icon.classList.remove("stop");
      icon.classList.add("play");
      cancelAnimationFrame(raf);
    });

  });


  


});


// ==== PORTOFOLIO SCRIPT (AMAN) ====
document.querySelectorAll('.pf-item').forEach(item => {
  item.addEventListener('click', () => {
    item.classList.toggle('active');
  });
});

// ==== PORTOFOLIO AUDIO (ISOLATED) ====
document.querySelectorAll('.pf-item').forEach(item => {
  const playBtn = item.querySelector('.pf-play');
  const audio = item.querySelector('audio');

  let isPlaying = false;

  playBtn.addEventListener('click', async () => {

    // 🔥 STOP SEMUA AUDIO LAIN
    document.querySelectorAll('.pf-item').forEach(other => {
      const otherAudio = other.querySelector('audio');
      const otherBtn = other.querySelector('.pf-play');

      if (otherAudio !== audio) {
        otherAudio.pause();
        otherAudio.currentTime = 0;
        otherBtn.classList.remove('playing');
      }
    });

    // 🔥 PLAY / STOP TOGGLE
    if (!isPlaying) {
      try {
        await audio.play();
        isPlaying = true;
        playBtn.classList.add('playing');
      } catch (err) {
        console.log('Gagal play:', err);
      }
    } else {
      audio.pause();
      audio.currentTime = 0;
      isPlaying = false;
      playBtn.classList.remove('playing');
    }
  });

  // 🔥 AUTO RESET SAAT SELESAI
  audio.addEventListener('ended', () => {
    isPlaying = false;
    playBtn.classList.remove('playing');
  });
});

document.querySelectorAll('.pf-dots').forEach(dots => {
  dots.addEventListener('click', () => {

    dots.classList.remove('active');

    setTimeout(() => {
      dots.classList.add('active');
    }, 10);

    setTimeout(() => {
      dots.classList.remove('active');
    }, 400);
  });
});



// ==== FAQ ACCORDION ====
document.querySelectorAll('.faq-question').forEach(q => {
  q.addEventListener('click', () => {
    const item = q.parentElement;

    // close yang lain
    document.querySelectorAll('.faq-item').forEach(i => {
      if (i !== item) i.classList.remove('active');
    });

    // toggle
    item.classList.toggle('active');
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const items = document.querySelectorAll('.ns-item');

  items.forEach(item => {
    const bg = item.querySelector('.ns-bg-img');

    item.addEventListener('mousemove', (e) => {
      const rect = item.getBoundingClientRect();

      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;

      const moveX = (x / rect.width - 0.5) * 40;
      const moveY = (y / rect.height - 0.5) * 40;

      bg.style.transform = `
        translate(-50%, -50%)
        translate(${-moveX}px, ${-moveY}px)
      `;
    });

    item.addEventListener('mouseleave', () => {
      bg.style.transform = 'translate(-50%, -50%)';
    });
  });
});


window.addEventListener('scroll', () => {
  const items = document.querySelectorAll('.ns-item');

  items.forEach(item => {
    const rightText = item.querySelector('.ns-right');
    const rect = item.getBoundingClientRect();
    const windowHeight = window.innerHeight;

    // progress masuk layar (0 → 1)
    let progress = (windowHeight - rect.top) / windowHeight;
    progress = Math.max(0, Math.min(1, progress));

    // 🔥 START DARI BAWAH BANGET
    const startOffset = 350; // bisa kamu tweak (300–500)

    // 🔥 GERAK NATURAL (lebih panjang)
    const move = startOffset * (1 - progress);

    rightText.style.transform = `translateY(${move}px)`;

    // 🔥 MUNCUL LEBIH HALUS & TELAT
    const opacity = Math.min(1, progress * 1.5);
    rightText.style.opacity = opacity;
  });
});


// ==== PARALLAX SMOOTH (PREMIUM FEEL) ====
function updateParallaxSections() {
  const sections = document.querySelectorAll('.parallax-section');

  sections.forEach(section => {
    if (section.classList.contains('cta-section')) {
      const rect = section.getBoundingClientRect();
      const windowHeight = window.innerHeight;
      let progress = (windowHeight - rect.top) / (windowHeight + rect.height);
      progress = Math.max(0, Math.min(1, progress));

      const speed = window.matchMedia('(max-width: 768px)').matches ? 170 : 360;
      const y = (progress - 0.5) * speed;
      section.style.setProperty('--cta-parallax-y', `${y}px`);
      return;
    }

    const rect = section.getBoundingClientRect();
    const windowHeight = window.innerHeight;

    // progress saat masuk viewport
    let progress = (windowHeight - rect.top) / (windowHeight + rect.height);

    // clamp biar aman
    progress = Math.max(0, Math.min(1, progress));

    // 🔥 ini kunci parallax (beda speed)
    const speed = window.matchMedia('(max-width: 768px)').matches ? 360 : 1100;
    const y = (progress - 0.5) * speed;

    section.style.backgroundPosition = `center calc(50% + ${y}px)`;
  });
}

window.addEventListener('scroll', updateParallaxSections);
window.addEventListener('load', updateParallaxSections);
requestAnimationFrame(updateParallaxSections);

function updatePortfolioMarquee() {
  const isTablet = window.matchMedia('(min-width: 768px) and (max-width: 1190px)').matches;

  document.querySelectorAll('.pf-song').forEach(song => {
    if (!song.querySelector('span')) {
      const text = song.textContent;
      song.textContent = '';
      const span = document.createElement('span');
      span.textContent = text;
      song.appendChild(span);
    }

    const text = song.querySelector('span');
    song.classList.remove('is-marquee');
    song.style.removeProperty('--pf-marquee-distance');
    song.style.removeProperty('--pf-marquee-duration');

    if (!isTablet || !text) return;

    const overflow = text.scrollWidth - song.clientWidth;
    if (overflow <= 4) return;

    const distance = overflow + 26;
    const duration = Math.max(7, Math.min(14, distance / 13));
    song.style.setProperty('--pf-marquee-distance', `${distance}px`);
    song.style.setProperty('--pf-marquee-duration', `${duration}s`);
    song.classList.add('is-marquee');
  });
}

window.addEventListener('load', updatePortfolioMarquee);
window.addEventListener('resize', updatePortfolioMarquee);
requestAnimationFrame(updatePortfolioMarquee);


  document.querySelectorAll('.card-arrow').forEach(item => {
    item.addEventListener('click', () => {
      const target = item.getAttribute('data-link');

      document.querySelector(target).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });


function initScoreGallery() {
  const modal = document.querySelector('[data-score-modal]');
  if (!modal) return;

  const frame = modal.querySelector('.score-modal-frame');
  const title = modal.querySelector('#scoreModalTitle');
  const getStep = (outer) => {
    const firstCard = outer.querySelector('.score-card');
    if (!firstCard) return outer.clientWidth * 0.8;

    const track = outer.querySelector('.score-track');
    const gap = track ? parseFloat(getComputedStyle(track).columnGap || getComputedStyle(track).gap) : 24;
    return firstCard.getBoundingClientRect().width + gap;
  };

  const openModal = (src, pdfTitle) => {
    if (!src || !frame) return;

    frame.src = src;
    if (title) title.textContent = pdfTitle || 'Preview Partitur';
    modal.classList.add('is-open');
    modal.setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden';
  };

  const closeModal = () => {
    modal.classList.remove('is-open');
    modal.setAttribute('aria-hidden', 'true');
    if (frame) frame.src = '';
    document.body.style.overflow = '';
  };

  document.querySelectorAll('.score-song').forEach(section => {
    const outer = section.querySelector('[data-score-track]');
    const prev = section.querySelector('[data-score-prev]');
    const next = section.querySelector('[data-score-next]');
    const cards = section.querySelectorAll('.score-card');

    if (!outer) return;

    prev?.addEventListener('click', () => {
      outer.scrollBy({ left: -getStep(outer), behavior: 'smooth' });
    });

    next?.addEventListener('click', () => {
      outer.scrollBy({ left: getStep(outer), behavior: 'smooth' });
    });

    cards.forEach(card => {
      card.addEventListener('click', () => {
        openModal(card.dataset.pdfSrc, card.dataset.pdfTitle);
      });
    });
  });

  modal.querySelectorAll('[data-score-close]').forEach(button => {
    button.addEventListener('click', closeModal);
  });

  document.addEventListener('keydown', event => {
    if (event.key === 'Escape' && modal.classList.contains('is-open')) {
      closeModal();
    }
  });
}

initScoreGallery();


  



  



  
