function showLoginAlert(status, message, redirectUrl) {
  if (status === "success") {
    Swal.fire({
      icon: "success",
      title: "Login Berhasil!",
      text: message,
      timer: 2000,
      showConfirmButton: false,
    }).then(() => {
      window.location.href = redirectUrl;
    });
  } else {
    Swal.fire({
      icon: "error",
      title: "Login Gagal",
      text: message,
    });
  }
}

//  validasi form sebelum submit
document.querySelector("form").addEventListener("submit", function (e) {
  e.preventDefault();

  let username = document.querySelector('input[name="username"]').value;
  let password = document.querySelector('input[name="password"]').value;

  if (username.trim() === "" || password.trim() === "") {
    Swal.fire({
      icon: "warning",
      title: "Oops...",
      text: "Username dan password harus diisi!",
    });
  } else {
    this.submit();
  }
});

function showLogoutAlert(message) {
  Swal.fire({
    icon: "success",
    title: "Logout Berhasil",
    text: message,
    timer: 2000,
    showConfirmButton: false,
  });
}
