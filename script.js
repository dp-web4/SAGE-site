// ============ MOBILE NAV TOGGLE ============
const navToggle = document.querySelector('.nav-toggle');
const navLinks = document.querySelector('.nav-links');

navToggle.addEventListener('click', () => {
  navLinks.classList.toggle('open');
});

// Close mobile nav on link click
navLinks.querySelectorAll('a').forEach(link => {
  link.addEventListener('click', () => {
    navLinks.classList.remove('open');
  });
});

// ============ ACTIVE NAV HIGHLIGHTING ============
const sections = document.querySelectorAll('section[id]');
const navAnchors = document.querySelectorAll('.nav-links a');

function updateActiveNav() {
  const scrollY = window.scrollY + 120;

  sections.forEach(section => {
    const top = section.offsetTop;
    const height = section.offsetHeight;
    const id = section.getAttribute('id');

    if (scrollY >= top && scrollY < top + height) {
      navAnchors.forEach(a => {
        a.classList.remove('active');
        if (a.getAttribute('href') === '#' + id) {
          a.classList.add('active');
        }
      });
    }
  });
}

window.addEventListener('scroll', updateActiveNav, { passive: true });
updateActiveNav();

// ============ ACCORDION ============
document.querySelectorAll('.acc-header').forEach(header => {
  header.addEventListener('click', () => {
    const item = header.parentElement;
    const wasOpen = item.classList.contains('open');

    // Close all
    document.querySelectorAll('.acc-item').forEach(i => i.classList.remove('open'));

    // Toggle clicked
    if (!wasOpen) {
      item.classList.add('open');
    }
  });
});

// ============ NAV BACKGROUND ON SCROLL ============
const nav = document.getElementById('nav');

function updateNavBg() {
  if (window.scrollY > 50) {
    nav.style.borderBottomColor = 'rgba(0, 212, 170, 0.15)';
  } else {
    nav.style.borderBottomColor = '';
  }
}

window.addEventListener('scroll', updateNavBg, { passive: true });
