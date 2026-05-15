(function () {
  const menuLinks = [
    { label: "Aransemen", href: "aransemen-orkestrasi.html" },
    { label: "Partitur", href: "#" },
    { label: "Mixing Mastering", href: "#" },
    { label: "Recording", href: "../studio/recording.html" }
  ];

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
        line-height: 1;
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
        margin: auto 0;
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
        line-height: 1.08;
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

      @media (max-width: 768px) {
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
        overflow: hidden;
      }

      body.site-mobile-menu-open .mobile-menu-icon,
      body.site-mobile-menu-open .mobile-menu-btn {
        opacity: 0;
        pointer-events: none;
      }

      @media (min-width: 769px) {
        .site-mobile-menu-overlay {
          display: none;
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
        <a class="site-mobile-menu-logo" href="index.html" aria-label="Musiknya Dimas">
          <img src="../IMAGE/logo dimas and friends.png" alt="Logo Musiknya Dimas">
        </a>
      </div>
      <nav class="site-mobile-menu-links" aria-label="Navigasi mobile">
        ${menuLinks.map(link => `<a href="${link.href}">${link.label}</a>`).join("")}
      </nav>
    `;

    document.body.appendChild(overlay);
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

  document.addEventListener("DOMContentLoaded", () => {
    injectStyles();

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
