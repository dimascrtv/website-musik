(function () {
  const menuLinks = [
    { label: "Home", href: "index.html" },
    { label: "Layanan Kami", target: "layanan-kami" },
    { label: "Portofolio", target: "portfolio" },
    { label: "Konsultasi", target: "konsultasi" }
  ];

  function isSubPage() {
    const path = window.location.pathname.replace(/\/+$/, "");
    return path !== "" && path !== "/index.html";
  }

  function hasHomeSection(target) {
    return Boolean(document.getElementById(target));
  }

  function homeHref(target) {
    if (hasHomeSection(target)) return `#${target}`;
    return `${isSubPage() ? "../" : ""}index.html#${target}`;
  }

  function menuHref(link) {
    if (link.href) return `${isSubPage() ? "../" : ""}${link.href}`;
    return homeHref(link.target);
  }

  function assetPath(path) {
    return `${isSubPage() ? "../" : ""}${path}`;
  }

  function renderMenuLinks(container) {
    container.innerHTML = menuLinks
      .map(link => `<a href="${menuHref(link)}">${link.label}</a>`)
      .join("");
  }

  function syncDesktopMenus() {
    document.querySelectorAll(".menu").forEach(renderMenuLinks);
  }

  function injectStyles() {
    if (document.getElementById("site-mobile-menu-style")) return;

    const style = document.createElement("style");
    style.id = "site-mobile-menu-style";
    style.textContent = `
      .site-mobile-menu-overlay {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: flex;
        flex-direction: column;
        padding: 43px max(24px, calc((100vw - 1144px) / 2)) 28px;
        color: #ffffff;
        background:
          linear-gradient(
            135deg,
            rgba(6, 78, 59, 0.78),
            rgba(4, 55, 43, 0.62)
          );
        backdrop-filter: blur(22px) saturate(140%);
        -webkit-backdrop-filter: blur(22px) saturate(140%);
        font-family: "Poppins", Arial, sans-serif;
        opacity: 0;
        visibility: hidden;
        pointer-events: none;
        transform: translateY(-14px);
        transition: opacity 0.35s ease, visibility 0.35s ease, transform 0.35s ease;
      }

      .site-mobile-menu-overlay.is-open {
        opacity: 1;
        visibility: visible;
        pointer-events: auto;
        transform: translateY(0);
      }

      .site-mobile-menu-top {
        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      .site-mobile-menu-close {
        display: inline-flex;
        align-items: center;
        gap: 14px;
        padding: 0;
        color: #ffffff;
        background: transparent;
        border: 0;
        font-family: inherit;
        font-size: 13px;
        font-weight: 400;
        line-height: 1.7;
        letter-spacing: 0;
        text-transform: uppercase;
        cursor: pointer;
      }

      .site-mobile-menu-x {
        position: relative;
        display: block;
        width: 24px;
        height: 24px;
      }

      .site-mobile-menu-x::before,
      .site-mobile-menu-x::after {
        content: "";
        position: absolute;
        top: 11px;
        left: 2px;
        width: 22px;
        height: 2px;
        background: #ffffff;
        border-radius: 20px;
      }

      .site-mobile-menu-x::before {
        transform: rotate(45deg);
      }

      .site-mobile-menu-x::after {
        transform: rotate(-45deg);
      }

      .site-mobile-menu-logo img {
        width: 84px;
        height: auto;
        display: block;
      }

      .site-mobile-menu-links {
        width: 100%;
        margin: clamp(170px, 28vh, 260px) 0 0;
        border-top: 1px solid rgba(255, 255, 255, 0.14);
      }

      .site-mobile-menu-links a {
        display: flex;
        width: 100%;
        min-height: 82px;
        align-items: center;
        justify-content: flex-start;
        color: #ffffff;
        border-bottom: 1px solid rgba(255, 255, 255, 0.14);
        font-size: clamp(30px, 8.8vw, 54px);
        font-weight: 500;
        line-height: 1.24;
        letter-spacing: 0;
        text-transform: uppercase;
        text-decoration: none !important;
        position: relative;
      }

      .site-mobile-menu-links a::before,
      .site-mobile-menu-links a::after {
        content: none !important;
        display: none !important;
      }

      body > .mobile-menu-icon {
        display: none;
      }

      @media (max-width: 1190px) {
        .mobile-menu-icon,
        .mobile-menu-btn {
          width: 35px;
          height: 24px;
          display: flex;
          flex-direction: column;
          justify-content: space-between;
          flex-shrink: 0;
          padding: 0;
          border: 0;
          background: transparent;
          cursor: pointer;
        }

        .mobile-menu-icon span,
        .mobile-menu-btn span {
          display: block;
          height: 2px;
          background: #ffffff;
          border-radius: 20px;
        }

        .mobile-menu-icon span:nth-child(1),
        .mobile-menu-btn span:nth-child(1) {
          width: 16px;
        }

        .mobile-menu-icon span:nth-child(2),
        .mobile-menu-icon span:nth-child(3),
        .mobile-menu-btn span:nth-child(2),
        .mobile-menu-btn span:nth-child(3) {
          width: 35px;
        }

        body > .mobile-menu-icon {
          position: fixed;
          top: 28px;
          left: 24px;
          z-index: 9000;
          display: flex;
        }
      }

      body.site-mobile-menu-open {
        overflow: visible;
      }

      body.site-mobile-menu-open .mobile-menu-icon,
      body.site-mobile-menu-open .mobile-menu-btn {
        opacity: 0;
        pointer-events: none;
      }

      @media (min-width: 1191px) {
        .site-mobile-menu-overlay {
          display: none;
        }
      }

      @media (min-width: 768px) and (max-width: 1190px) {
        .site-mobile-menu-overlay {
          padding: clamp(40px, 5vw, 56px) max(32px, calc((100vw - 1144px) / 2)) 32px;
        }

        .site-mobile-menu-links {
          margin-top: clamp(170px, 28vh, 260px);
        }

        .site-mobile-menu-links a {
          min-height: clamp(62px, 8vw, 82px);
          font-size: clamp(34px, 5vw, 54px);
          line-height: 1.26;
        }
      }

      @media (max-width: 480px) {
        .site-mobile-menu-overlay {
          padding-left: 24px;
          padding-right: 24px;
        }

        .site-mobile-menu-links a {
          min-height: 72px;
        }
      }

      .floating-wa {
        position: fixed;
        right: 24px;
        bottom: 24px;
        z-index: 8999;
        width: 62px;
        height: 62px;
        border-radius: 999px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        background: #25d366;
        overflow: hidden;
        box-shadow: 0 14px 30px rgba(0, 0, 0, 0.22);
        animation: floatingWaFocus 3.2s ease-in-out infinite;
        transition: transform 0.25s ease, box-shadow 0.25s ease, background 0.25s ease;
      }

      .floating-wa::before {
        content: "";
        position: absolute;
        inset: -10px;
        border: 2px solid rgba(37, 211, 102, 0.55);
        border-radius: inherit;
        opacity: 0;
        transform: scale(0.78);
        animation: floatingWaRing 3.2s ease-out infinite;
        pointer-events: none;
      }

      .floating-wa::after {
        content: "";
        position: absolute;
        inset: -18px;
        background: linear-gradient(
          115deg,
          transparent 35%,
          rgba(255, 255, 255, 0.42) 48%,
          transparent 62%
        );
        transform: translateX(-115%) rotate(8deg);
        animation: floatingWaShine 3.2s ease-in-out infinite;
        pointer-events: none;
      }

      .floating-wa:hover {
        transform: translateY(-4px) scale(1.04);
        background: #20bd5a;
        box-shadow: 0 18px 38px rgba(0, 0, 0, 0.28);
        animation-play-state: paused;
      }

      .floating-wa svg {
        width: 32px;
        height: 32px;
        fill: currentColor;
      }

      @keyframes floatingWaFocus {
        0%, 100% {
          transform: translateY(0) scale(1) rotate(0deg);
          box-shadow: 0 14px 30px rgba(0, 0, 0, 0.22);
        }

        18% {
          transform: translateY(-5px) scale(1.045) rotate(-2deg);
          box-shadow: 0 20px 40px rgba(0, 0, 0, 0.26);
        }

        24% {
          transform: translateY(-5px) scale(1.045) rotate(2deg);
        }

        30% {
          transform: translateY(-4px) scale(1.035) rotate(-1deg);
        }

        38% {
          transform: translateY(0) scale(1) rotate(0deg);
          box-shadow: 0 14px 30px rgba(0, 0, 0, 0.22);
        }
      }

      @keyframes floatingWaRing {
        0%, 8%, 100% {
          opacity: 0;
          transform: scale(0.78);
        }

        20% {
          opacity: 0.58;
        }

        52% {
          opacity: 0;
          transform: scale(1.42);
        }
      }

      @keyframes floatingWaShine {
        0%, 42%, 100% {
          transform: translateX(-115%) rotate(8deg);
          opacity: 0;
        }

        16% {
          opacity: 0.85;
        }

        32% {
          transform: translateX(115%) rotate(8deg);
          opacity: 0;
        }
      }

      @media (prefers-reduced-motion: reduce) {
        .floating-wa,
        .floating-wa::before,
        .floating-wa::after {
          animation: none;
        }
      }

      @media (max-width: 767px) {
        .floating-wa {
          right: 18px;
          bottom: 18px;
          width: 56px;
          height: 56px;
        }

        .floating-wa svg {
          width: 29px;
          height: 29px;
        }
      }
    `;
    document.head.appendChild(style);
  }

  function createOverlay() {
    const overlay = document.createElement("div");
    overlay.className = "site-mobile-menu-overlay";
    overlay.setAttribute("aria-hidden", "true");

    overlay.innerHTML = `
      <div class="site-mobile-menu-top">
        <button class="site-mobile-menu-close" type="button" aria-label="Tutup menu">
          <span>Close</span>
          <i class="site-mobile-menu-x" aria-hidden="true"></i>
        </button>
        <a class="site-mobile-menu-logo" href="${homeHref("layanan-kami")}" aria-label="Musiknya Dimas">
          <img src="${assetPath("IMAGE/logo dimas and friends.png")}" alt="Logo Musiknya Dimas">
        </a>
      </div>
      <nav class="site-mobile-menu-links" aria-label="Navigasi mobile">
      </nav>
    `;

    document.body.appendChild(overlay);
    renderMenuLinks(overlay.querySelector(".site-mobile-menu-links"));
    return overlay;
  }

  function ensureMenuButton() {
    const existing = document.querySelector(".mobile-menu-icon, .mobile-menu-btn");
    if (existing) {
      existing.setAttribute("role", "button");
      existing.setAttribute("aria-label", existing.getAttribute("aria-label") || "Buka menu");
      return existing;
    }

    const button = document.createElement("button");
    button.className = "mobile-menu-icon";
    button.type = "button";
    button.setAttribute("aria-label", "Buka menu");
    button.innerHTML = "<span></span><span></span><span></span>";
    document.body.prepend(button);
    return button;
  }

  function ensureFloatingWhatsApp() {
    if (document.querySelector(".floating-wa")) return;

    const link = document.createElement("a");
    link.className = "floating-wa";
    link.href = "https://wa.me/6285737690807?text=Halo%20Dimas,%20saya%20mau%20konsultasi";
    link.target = "_blank";
    link.rel = "noopener";
    link.setAttribute("aria-label", "Chat WhatsApp Musiknya Dimas");
    link.innerHTML = `
      <svg viewBox="0 0 32 32" aria-hidden="true">
        <path d="M16.04 3.2A12.7 12.7 0 0 0 5.22 22.58L3.6 28.8l6.37-1.6A12.7 12.7 0 1 0 16.04 3.2Zm0 2.3a10.4 10.4 0 1 1 0 20.8 10.52 10.52 0 0 1-5.32-1.46l-.38-.22-3.77.95.98-3.68-.25-.4A10.4 10.4 0 0 1 16.04 5.5Zm-4.46 5.67c-.22 0-.58.08-.88.42-.3.33-1.16 1.13-1.16 2.77 0 1.63 1.2 3.21 1.36 3.43.17.22 2.32 3.7 5.72 5.04 2.83 1.12 3.4.9 4.02.84.62-.06 2-.82 2.28-1.61.28-.79.28-1.47.2-1.61-.08-.14-.3-.22-.64-.39-.33-.16-2-.98-2.3-1.09-.31-.11-.53-.16-.75.17-.22.33-.86 1.09-1.06 1.31-.19.22-.39.25-.72.09-.33-.17-1.4-.52-2.67-1.65-.99-.88-1.66-1.97-1.85-2.3-.2-.33-.02-.51.15-.68.15-.15.33-.39.5-.58.16-.2.22-.33.33-.56.11-.22.06-.42-.03-.59-.08-.16-.75-1.8-1.03-2.47-.27-.65-.55-.56-.75-.57h-.64Z"/>
      </svg>
    `;
    document.body.appendChild(link);
  }

  document.addEventListener("DOMContentLoaded", () => {
    injectStyles();
    ensureFloatingWhatsApp();
    syncDesktopMenus();

    const overlay = createOverlay();
    const menuButton = ensureMenuButton();
    const closeButton = overlay.querySelector(".site-mobile-menu-close");
    const links = overlay.querySelectorAll("a");

    menuButton.setAttribute("aria-expanded", "false");

    const openMenu = () => {
      overlay.classList.add("is-open");
      overlay.setAttribute("aria-hidden", "false");
      menuButton.setAttribute("aria-expanded", "true");
      document.body.classList.add("site-mobile-menu-open");
    };

    const closeMenu = () => {
      overlay.classList.remove("is-open");
      overlay.setAttribute("aria-hidden", "true");
      menuButton.setAttribute("aria-expanded", "false");
      document.body.classList.remove("site-mobile-menu-open");
    };

    menuButton.addEventListener("click", openMenu);
    closeButton.addEventListener("click", closeMenu);

    links.forEach(link => {
      link.addEventListener("click", closeMenu);
    });

    document.addEventListener("keydown", event => {
      if (event.key === "Escape") closeMenu();
    });
  });
})();
