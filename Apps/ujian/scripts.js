$(document).ready(function () {
  let waktuUjian;

  // Inisialisasi waktu ujian
  function initWaktuUjian() {
    $.ajax({
      url: "get_waktu_ujian.php",
      type: "GET",
      success: function (response) {
        waktuUjian = response * 60;
        startTimer();
      },
    });
  }

  // Timer countdown
  function startTimer() {
    const timerDisplay = document.getElementById("timer");
    let timer = waktuUjian;

    let countdown = setInterval(function () {
      let hours = Math.floor(timer / 3600);
      let minutes = Math.floor((timer % 3600) / 60);
      let seconds = timer % 60;

      timerDisplay.innerHTML = `${String(hours).padStart(2, "0")}:${String(
        minutes
      ).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;

      if (--timer < 0) {
        clearInterval(countdown);
        selesaiUjian();
      }
    }, 1000);
  }

  // Event click nomor soal
  $(".nomor-soal").click(function () {
    const nomor = $(this).data("nomor");
    window.location.href = `index.php?nomor=${nomor}`;
  });

  // Simpan jawaban
  $('input[name="jawaban"]').change(function () {
    const nomor = $("#nomor-aktif").text();
    const jawaban = $(this).val();

    $.ajax({
      url: "simpan_jawaban.php",
      type: "POST",
      data: {
        nomor: nomor,
        jawaban: jawaban,
      },
      success: function () {
        $(`.nomor-soal[data-nomor="${nomor}"]`)
          .removeClass("btn-danger")
          .addClass("btn-success soal-terjawab");
      },
    });
  });

  // Selesai ujian
  $("#selesaiUjian").click(function () {
    Swal.fire({
      title: "Selesai Ujian?",
      text: "Pastikan semua soal sudah dijawab!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Ya, Selesai!",
      cancelButtonText: "Batal",
    }).then((result) => {
      if (result.isConfirmed) {
        selesaiUjian();
      }
    });
  });

  function selesaiUjian() {
    $.ajax({
      url: "selesai_ujian.php",
      type: "POST",
      success: function () {
        Swal.fire({
          title: "Ujian Selesai!",
          text: "Terima kasih telah mengikuti ujian",
          icon: "success",
          confirmButtonText: "OK",
        }).then(() => {
          window.location.href = "../dashboard-peserta/";
        });
      },
    });
  }

  // Inisialisasi
  initWaktuUjian();

  // Handle next & prev
  $("#nextSoal").click(function () {
    const currentNo = parseInt($("#nomor-aktif").text());
    const nextNo = currentNo + 1;
    if (nextNo <= totalSoal) {
      window.location.href = `index.php?nomor=${nextNo}`;
    }
  });

  $("#prevSoal").click(function () {
    const currentNo = parseInt($("#nomor-aktif").text());
    const prevNo = currentNo - 1;
    if (prevNo >= 1) {
      window.location.href = `index.php?nomor=${prevNo}`;
    }
  });
});
