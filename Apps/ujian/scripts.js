$(document).ready(function () {
  let waktuUjian;
  let currentSoal = 1;
  let timerInterval;

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
        selesaiUjian();
      }
    }, 1000);
  }

  function loadSoal(nomorSoal) {
    // Reset semua radio button
    $('input[name="jawaban"]').prop("checked", false);

    $.ajax({
      url: "get_soal.php",
      type: "POST",
      data: { nomor: nomorSoal },
      success: function (response) {
        const soal = JSON.parse(response);
        $(".pertanyaan").html(soal.pertanyaan);
        $('label[for="pilihan_a"]').html(soal.pilihan_a);
        $('label[for="pilihan_b"]').html(soal.pilihan_b);
        $('label[for="pilihan_c"]').html(soal.pilihan_c);
        $('label[for="pilihan_d"]').html(soal.pilihan_d);
      },
    });
  }

  $(".nomor-soal").click(function () {
    currentSoal = $(this).data("nomor");
    $("#nomor-aktif").text(currentSoal);
    loadSoal(currentSoal);
  });

  $('input[name="jawaban"]').change(function () {
    const jawaban = $(this).val();
    $.ajax({
      url: "simpan_jawaban.php",
      type: "POST",
      data: {
        nomor: currentSoal,
        jawaban: jawaban,
      },
      success: function () {
        $(`.nomor-soal[data-nomor="${currentSoal}"]`)
          .removeClass("btn-danger")
          .addClass("btn-success soal-terjawab");
      },
    });
  });

  $("#nextSoal").click(function () {
    if (currentSoal < totalSoal) {
      currentSoal++;
      $("#nomor-aktif").text(currentSoal);
      loadSoal(currentSoal);
    }
  });

  $("#prevSoal").click(function () {
    if (currentSoal > 1) {
      currentSoal--;
      $("#nomor-aktif").text(currentSoal);
      loadSoal(currentSoal);
    }
  });

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
        let answers = {};
        $('input[name="jawaban"]:checked').each(function () {
          let nomorSoal = $(this).closest(".soal").data("nomor");
          answers[nomorSoal] = $(this).val();
        });

        $.ajax({
          url: "selesai_ujian.php",
          method: "POST",
          data: { answers: answers },
          success: function (response) {
            window.location.href = "../penilaian/";
          },
        });
      }
    });
  });

  initWaktuUjian();
});
