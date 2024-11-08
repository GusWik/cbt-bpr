const body = document.body; // Hanya satu deklarasi

const theme = localStorage.getItem('theme');

if (theme) {
  document.documentElement.setAttribute('data-bs-theme', theme);
}