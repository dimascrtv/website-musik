// ======================================
// PARALLAX MOUSE EFFECT
// ======================================

const heroBg = document.querySelector('.hero-bg');

document.addEventListener('mousemove', (e) => {

  // ukuran layar
  const screenWidth = window.innerWidth;
  const screenHeight = window.innerHeight;

  // posisi cursor dari tengah layar
  const moveX = (e.clientX - screenWidth / 2) / 45;
  const moveY = (e.clientY - screenHeight / 2) / 45;

  // gerakan background
  heroBg.style.transform = `
    translate(${moveX}px, ${moveY}px)
  `;

});