$(document).ready(function () {
  // Handler untuk tombol mulai ujian
  $("#mulaiUjian").click(function () {
    Swal.fire({
      title: "Mulai Ujian?",
      text: "Pastikan Anda siap untuk memulai ujian. Timer akan berjalan setelah Anda memulai.",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Ya, Mulai Ujian!",
      cancelButtonText: "Batal",
    }).then((result) => {
      if (result.isConfirmed) {
        // Redirect ke halaman ujian
        window.location.href = "../ujian/index.php";
      }
    });
  });

  // Cek status ujian saat halaman dimuat
  function checkUjianStatus() {
    $.ajax({
      url: "get_info_ujian.php",
      type: "POST",
      dataType: "json",
      success: function (response) {
        if (response.status === "ongoing") {
          window.location.href = "../ujian/index.php";
        }
      },
    });
  }

  // Jalankan cek status
  checkUjianStatus();

  function selesaiUjian() {
    $.ajax({
      url: "../penilaian/kalkulasi.php",
      type: "POST",
      data: {
        id_peserta: id_peserta,
        jawaban: jawaban,
      },
      success: function (response) {
        window.location.href = "../dashboard-peserta/index.php";
      },
    });
  }
});
