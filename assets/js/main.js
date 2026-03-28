// ═══════════════════════════════════════════════════════════════
// MAIN.JS - Minimal vanilla JS for navigation toggle & dark mode
// ═══════════════════════════════════════════════════════════════

(function() {
  'use strict';

  // Dark Mode Toggle
  const themeToggle = document.getElementById('theme-toggle');
  const html = document.documentElement;
  
  // Get saved theme or system preference
  const getPreferredTheme = () => {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      return savedTheme;
    }
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  };
  
  // Set theme
  const setTheme = (theme) => {
    html.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
  };
  
  // Initialize theme
  setTheme(getPreferredTheme());
  
  // Theme toggle click handler
  if (themeToggle) {
    themeToggle.addEventListener('click', () => {
      const currentTheme = html.getAttribute('data-theme');
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      setTheme(newTheme);
    });
  }
  
  // Listen for system theme changes
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
    if (!localStorage.getItem('theme')) {
      setTheme(e.matches ? 'dark' : 'light');
    }
  });

  // Mobile Navigation Toggle
  const navToggle = document.querySelector('.nav__toggle');
  const navMenu = document.querySelector('.nav__menu');

  if (navToggle && navMenu) {
    navToggle.addEventListener('click', function() {
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      this.setAttribute('aria-expanded', !isExpanded);
      navMenu.setAttribute('data-visible', !isExpanded);
    });

    // Close menu when clicking on a link
    navMenu.querySelectorAll('.nav__link').forEach(link => {
      link.addEventListener('click', () => {
        navToggle.setAttribute('aria-expanded', 'false');
        navMenu.setAttribute('data-visible', 'false');
      });
    });

    // Close menu on escape key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && navMenu.getAttribute('data-visible') === 'true') {
        navToggle.setAttribute('aria-expanded', 'false');
        navMenu.setAttribute('data-visible', 'false');
        navToggle.focus();
      }
    });
  }

  // Lazy load images
  if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
      img.src = img.dataset.src;
    });
  } else {
    // Fallback for browsers that don't support lazy loading
    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js';
    document.body.appendChild(script);
  }

  // Add loaded class for animations
  document.documentElement.classList.add('js-loaded');
})();