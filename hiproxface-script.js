// ======================================
// PARALLAX EFFECT
// ======================================

const heroBg = document.querySelector('.hero-bg');

document.addEventListener('mousemove', (e) => {

  const screenWidth = window.innerWidth;
  const screenHeight = window.innerHeight;

  const moveX = (e.clientX - screenWidth / 2) / 45;
  const moveY = (e.clientY - screenHeight / 2) / 45;

  heroBg.style.transform = `
    translate(${moveX}px, ${moveY}px)
  `;

});


// ======================================
// MOBILE MENU
// ======================================

const mobileMenuBtn = document.querySelector('.mobile-menu-btn');

const mobileMenuOverlay = document.querySelector('.mobile-menu-overlay');

const mobileCloseBtn = document.querySelector('.mobile-close-btn');

mobileMenuBtn.addEventListener('click', () => {

  mobileMenuOverlay.classList.add('active');

});

mobileCloseBtn.addEventListener('click', () => {

  mobileMenuOverlay.classList.remove('active');

});