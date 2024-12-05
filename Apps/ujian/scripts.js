$(document).ready(function () {
  let waktuUjian;
  let currentSoal = 1;
  let timerInterval;
  let tempJawaban = {};

  function initWaktuUjian() {
    sessionStorage.clear();

    $.ajax({
      url: "get_waktu_ujian.php",
      type: "GET",
      success: function (response) {
        console.log("Waktu dari server:", response);
        waktuUjian = parseInt(response) * 60;
        startTimer();
      },
      error: function (xhr, status, error) {
        console.error("Error:", error);
      },
    });
  }

  function startTimer() {
    const timerDisplay = document.getElementById("timer");
    let timer = waktuUjian;

    if (timerInterval) clearInterval(timerInterval);

    timerInterval = setInterval(function () {
      if (timer >= 0) {
        let hours = Math.floor(timer / 3600);
        let minutes = Math.floor((timer % 3600) / 60);
        let seconds = timer % 60;

        timerDisplay.innerHTML = `${String(hours).padStart(2, "0")}:${String(
          minutes
        ).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;

        timer--;
      } else {
        clearInterval(timerInterval);
        selesaiUjianOtomatis();
      }
    }, 1000);
  }

  function loadSoal(nomorSoal) {
    $.ajax({
      url: "get_soal.php",
      type: "POST",
      data: { nomor: nomorSoal },
      success: function (response) {
        console.log("Response soal:", response);

        const soal =
          typeof response === "string" ? JSON.parse(response) : response;

        if (soal) {
          $("#current_soal_id").val(soal.id_soal);
          $(".pertanyaan").html(soal.pertanyaan);

          $('label[for="pilihan_a"]').html(soal.pilihan_a);
          $('label[for="pilihan_b"]').html(soal.pilihan_b);
          $('label[for="pilihan_c"]').html(soal.pilihan_c);
          $('label[for="pilihan_d"]').html(soal.pilihan_d);

          $('input[name="jawaban"]').prop("checked", false);

          $("#nomor-aktif").text(nomorSoal);
          currentSoal = nomorSoal;

          if (tempJawaban[soal.id_soal]) {
            $(
              `input[name="jawaban"][value="${tempJawaban[soal.id_soal]}"]`
            ).prop("checked", true);
          }
        }
      },
      error: function (xhr, status, error) {
        console.error("Ajax error:", error);
      },
    });
  }

  $(".nomor-soal").click(function () {
    currentSoal = $(this).data("nomor");
    loadSoal(currentSoal);
  });

  $('input[name="jawaban"]').change(function () {
    const jawaban = $(this).val();
    const soalId = $("#current_soal_id").val();
    tempJawaban[soalId] = jawaban;

    $(`.nomor-soal[data-nomor="${currentSoal}"]`)
      .removeClass("btn-danger")
      .addClass("btn-success soal-terjawab");
  });

  $("#nextSoal").click(function () {
    currentSoal++;
    loadSoal(currentSoal);
  });

  $("#prevSoal").click(function () {
    if (currentSoal > 1) {
      currentSoal--;
      loadSoal(currentSoal);
    }
  });

  function selesaiUjianOtomatis() {
    $.ajax({
      url: "selesai_ujian.php",
      method: "POST",
      data: { answers: tempJawaban },
      success: function (response) {
        Swal.fire({
          title: "WAKTU SUDAH HABIS!",
          text: "UJIAN SUDAH SELESAI, SILAHKAN CEK NILAI ANDA",
          icon: "warning",
          confirmButtonColor: "#3085d6",
          confirmButtonText: "OKE",
        }).then((result) => {
          window.location.href = "../penilaian/";
        });
      },
    });
  }

  $("#selesaiUjian").click(function () {
    Swal.fire({
      title: "Anda yakin?",
      text: "Ujian akan diselesaikan",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Ya, Selesai!",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "selesai_ujian.php",
          method: "POST",
          data: { answers: tempJawaban },
          success: function (response) {
            window.location.href = "../penilaian/";
          },
        });
      }
    });
  });

  initWaktuUjian();
  loadSoal(1);
});
