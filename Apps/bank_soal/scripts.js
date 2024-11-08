$(document).ready(function () {
  // DataTable initialization
  var table = $("#soalTable").DataTable();

  // Add new soal
  $("#saveSoalBtn").click(function () {
    $.ajax({
      url: "insert.php",
      method: "POST",
      data: $("#addSoalForm").serialize(),
      dataType: "json",
      success: function (response) {
        if (response.status === "success") {
          $("#addSoalModal").modal("hide");
          Swal.fire("Sukses", response.message, "success").then((result) => {
            if (result.isConfirmed) {
              location.reload();
            }
          });
        } else {
          Swal.fire("Error", response.message, "error");
        }
      },
      error: function () {
        Swal.fire("Error", "Terjadi kesalahan pada server", "error");
      },
    });
  });

  // Edit soal
  $(".edit-soal").click(function () {
    var id = $(this).data("id");
    $.ajax({
      url: "get_soal.php",
      method: "GET",
      data: { id: id },
      dataType: "json",
      success: function (data) {
        $("#edit_id_soal").val(data.id_soal);
        $("#edit_bidang_soal").val(data.bidang_soal);
        $("#edit_pertanyaan").val(data.pertanyaan);
        $("#edit_pilihan_a").val(data.pilihan_a);
        $("#edit_pilihan_b").val(data.pilihan_b);
        $("#edit_pilihan_c").val(data.pilihan_c);
        $("#edit_pilihan_d").val(data.pilihan_d);
        $("#edit_jawaban_benar").val(data.jawaban_benar);
        $("#editSoalModal").modal("show");
      },
      error: function () {
        Swal.fire("Error", "Gagal mengambil data soal", "error");
      },
    });
  });

  // Update soal
  $("#updateSoalBtn").click(function () {
    $.ajax({
      url: "update.php",
      method: "POST",
      data: $("#editSoalForm").serialize(),
      dataType: "json",
      success: function (response) {
        if (response.status === "success") {
          $("#editSoalModal").modal("hide");
          Swal.fire("Sukses", response.message, "success").then((result) => {
            if (result.isConfirmed) {
              location.reload();
            }
          });
        } else {
          Swal.fire("Error", response.message, "error");
        }
      },
      error: function () {
        Swal.fire("Error", "Terjadi kesalahan pada server", "error");
      },
    });
  });

  // Delete soal
  $(".delete-soal").click(function () {
    var id = $(this).data("id");
    $("#deleteSoalModal").modal("show");
    $("#confirmDeleteBtn").data("id", id);
  });

  $("#confirmDeleteBtn").click(function () {
    var id = $(this).data("id");
    $.ajax({
      url: "delete.php",
      method: "POST",
      data: { id_soal: id },
      dataType: "json",
      success: function (response) {
        if (response.status === "success") {
          $("#deleteSoalModal").modal("hide");
          Swal.fire("Sukses", response.message, "success").then((result) => {
            if (result.isConfirmed) {
              location.reload();
            }
          });
        } else {
          Swal.fire("Error", response.message, "error");
        }
      },
      error: function () {
        Swal.fire("Error", "Terjadi kesalahan pada server", "error");
      },
    });
  });
});
