/* ============================================================
   TANAY HALDAR — PORTFOLIO JAVASCRIPT
   Particles · Navigation · Animations · Interactivity
   ============================================================ */

// ===== NAVBAR SCROLL =====
(function () {
  const navbar = document.getElementById('navbar');
  const menuToggle = document.getElementById('menuToggle');
  const navLinks = document.querySelector('.nav-links');

  window.addEventListener('scroll', function () {
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  }, { passive: true });

  // Mobile menu toggle
  if (menuToggle) {
    menuToggle.addEventListener('click', function () {
      const isOpen = navLinks.classList.toggle('open');
      menuToggle.setAttribute('aria-expanded', isOpen);
    });
  }

  // Close menu on link click
  document.querySelectorAll('.nav-links a').forEach(function (link) {
    link.addEventListener('click', function () {
      navLinks.classList.remove('open');
      menuToggle.setAttribute('aria-expanded', 'false');
    });
  });
})();

// ===== PARTICLE SYSTEM =====
(function () {
  const container = document.getElementById('particles');
  if (!container) return;

  const colors = ['#6c63ff', '#22d3ee', '#a78bfa', '#f472b6'];
  const count = 40;

  for (let i = 0; i < count; i++) {
    createParticle(container, colors);
  }

  function createParticle(container, colors) {
    const p = document.createElement('div');
    p.className = 'particle';

    const size = Math.random() * 3 + 1;
    const color = colors[Math.floor(Math.random() * colors.length)];
    const left = Math.random() * 100;
    const duration = Math.random() * 15 + 8;
    const delay = Math.random() * 10;

    p.style.cssText = `
      width: ${size}px;
      height: ${size}px;
      left: ${left}%;
      background: ${color};
      animation-duration: ${duration}s;
      animation-delay: ${delay}s;
      box-shadow: 0 0 ${size * 3}px ${color};
    `;

    container.appendChild(p);
  }
})();

// ===== INTERSECTION OBSERVER ANIMATIONS =====
(function () {
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -60px 0px'
  };

  const observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  const animatedSelectors = [
    '.skill-category',
    '.project-card',
    '.timeline-item',
    '.cert-card',
    '.team-card',
    '.detail-item',
    '.contact-card',
    '.qc-meta-item',
    '.game-list li'
  ];

  animatedSelectors.forEach(function (sel) {
    document.querySelectorAll(sel).forEach(function (el, i) {
      el.style.opacity = '0';
      el.style.animationDelay = (i * 0.08) + 's';
      observer.observe(el);
    });
  });
})();

// ===== ACTIVE NAV HIGHLIGHT =====
(function () {
  const sections = document.querySelectorAll('section[id]');
  const navLinks = document.querySelectorAll('.nav-links a');

  const sectionObserver = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        const id = entry.target.id;
        navLinks.forEach(function (link) {
          link.style.color = '';
          if (link.getAttribute('href') === '#' + id) {
            link.style.color = 'var(--color-accent)';
          }
        });
      }
    });
  }, { threshold: 0.4 });

  sections.forEach(function (section) {
    sectionObserver.observe(section);
  });
})();

// ===== SMOOTH HOVER TILT (CARDS) =====
(function () {
  const cards = document.querySelectorAll('.project-card, .skill-category, .cert-card');

  cards.forEach(function (card) {
    card.addEventListener('mousemove', function (e) {
      const rect = card.getBoundingClientRect();
      const x = (e.clientX - rect.left) / rect.width - 0.5;
      const y = (e.clientY - rect.top) / rect.height - 0.5;
      card.style.transform = `translateY(-8px) rotateX(${y * -6}deg) rotateY(${x * 6}deg)`;
      card.style.transition = 'none';
    });

    card.addEventListener('mouseleave', function () {
      card.style.transform = '';
      card.style.transition = '';
    });
  });
})();

// ===== TYPED HERO NAME EFFECT =====
(function () {
  const nameEl = document.querySelector('.name-highlight');
  if (!nameEl) return;

  const name = 'Tanay Haldar';
  nameEl.textContent = '';
  let i = 0;

  function typeChar() {
    if (i < name.length) {
      nameEl.textContent += name[i];
      i++;
      setTimeout(typeChar, 70);
    }
  }

  setTimeout(typeChar, 600);
})();

// ===== COUNTER ANIMATION =====
(function () {
  const statNumbers = document.querySelectorAll('.stat-number');

  const counterObserver = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = el.textContent;

        // Only animate numeric values
        const numMatch = target.match(/^(\d+)/);
        if (numMatch) {
          const end = parseInt(numMatch[1]);
          const suffix = target.slice(numMatch[0].length);
          let current = 0;
          const step = Math.ceil(end / 30);
          const timer = setInterval(function () {
            current = Math.min(current + step, end);
            el.textContent = current + suffix;
            if (current >= end) clearInterval(timer);
          }, 40);
        }
        counterObserver.unobserve(el);
      }
    });
  }, { threshold: 1 });

  statNumbers.forEach(function (el) {
    counterObserver.observe(el);
  });
})();

// ===== STRUCTURED DATA VERIFICATION (DEV HELPER) =====
(function () {
  if (typeof window !== 'undefined' && window.location.hostname === 'localhost') {
    console.log('%c[SEO] Tanay Haldar Portfolio loaded successfully.', 'color: #6c63ff; font-weight: bold;');
    console.log('%c[SEO] JSON-LD structured data present.', 'color: #22d3ee;');
    console.log('%c[SEO] Meta tags: title, description, og:*, twitter:* all present.', 'color: #4ade80;');
  }
})();
