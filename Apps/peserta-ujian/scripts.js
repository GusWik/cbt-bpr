$(document).ready(function () {
  // Sembunyikan tabel saat halaman dimuat
  $("#tabel-section").hide();

  // Load data peserta di awal
  loadPesertaData();

  // Handler untuk tombol tampilkan pegawai
  $("#tampilkanPegawai").click(function () {
    var kodeCabang = $("#select-cabang").val();
    if (kodeCabang) {
      $("#tabel-section").show();
      loadPegawaiData(kodeCabang);
    } else {
      Swal.fire(
        "Peringatan",
        "Silakan pilih kantor cabang terlebih dahulu",
        "warning"
      );
    }
  });

  // Fungsi untuk load data pegawai berdasarkan cabang
  function loadPegawaiData(kodeCabang) {
    $.ajax({
      url: "get_pegawai.php",
      type: "POST",
      data: { kode_kantor: kodeCabang },
      success: function (response) {
        if ($.fn.DataTable.isDataTable("#table-pegawai")) {
          $("#table-pegawai").DataTable().destroy();
        }
        $("#table-pegawai tbody").html(response);
        $("#table-pegawai").DataTable({
          order: [[2, "asc"]],
        });
      },
    });
  }

  // Fungsi untuk load data peserta
  function loadPesertaData() {
    $.ajax({
      url: "get_peserta.php",
      type: "POST",
      success: function (response) {
        if ($.fn.DataTable.isDataTable("#table-peserta")) {
          $("#table-peserta").DataTable().destroy();
        }
        $("#table-peserta tbody").html(response);
        $("#table-peserta").DataTable({
          order: [[2, "desc"]],
        });
      },
    });
  }

  // Handler untuk tombol tambah peserta
  $("#tambahPeserta").click(function () {
    var selectedPegawai = $(".pegawai-checkbox:checked")
      .map(function () {
        return this.value;
      })
      .get();

    if (selectedPegawai.length === 0) {
      Swal.fire("Peringatan", "Pilih setidaknya satu pegawai", "warning");
      return;
    }

    $("#modalTambahPeserta").modal("show");

    // Load bidang soal
    $.ajax({
      url: "get_bidang_soal.php",
      type: "GET",
      dataType: "json",
      success: function (data) {
        var options = '<option value="">Pilih Bidang Soal</option>';
        $.each(data, function (key, value) {
          options +=
            '<option value="' + value.id + '">' + value.nama + "</option>";
        });
        $("#id_bidang_soal").html(options);
      },
      error: function () {
        console.error("Gagal mengambil data bidang soal");
        Swal.fire("Error", "Gagal mengambil data bidang soal", "error");
      },
    });
  });

  // Handler untuk simpan peserta
  $("#simpanPeserta").click(function () {
    var formData = $("#formTambahPeserta").serialize();
    var selectedPegawai = $(".pegawai-checkbox:checked")
      .map(function () {
        return this.value;
      })
      .get();

    formData += "&pegawai=" + JSON.stringify(selectedPegawai);

    $.ajax({
      url: "penambahan_peserta.php",
      type: "POST",
      data: formData,
      dataType: "json",
      success: function (response) {
        if (response.status === "success") {
          $("#modalTambahPeserta").modal("hide");
          $("#formTambahPeserta")[0].reset();
          $(".pegawai-checkbox").prop("checked", false);
          $("#selectAll").prop("checked", false);

          var currentCabang = $("#select-cabang").val();
          loadPegawaiData(currentCabang);
          loadPesertaData();

          Swal.fire("Sukses", response.message, "success");
        } else {
          Swal.fire("Error", response.message, "error");
        }
      },
      error: function () {
        Swal.fire("Error", "Terjadi kesalahan pada server", "error");
      },
    });
  });

  // Handler untuk batalkan peserta
  $(document).on("click", ".batalkan-peserta", function () {
    var idPeserta = $(this).data("id");
    var currentCabang = $("#select-cabang").val();

    Swal.fire({
      title: "Apakah Anda yakin?",
      text: "Peserta ini akan dibatalkan dari ujian",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Ya, batalkan!",
      cancelButtonText: "Tidak",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: "batalkan_penambahan_peserta.php",
          type: "POST",
          data: { id_peserta: idPeserta },
          dataType: "json",
          success: function (response) {
            if (response.status === "success") {
              Swal.fire("Sukses", response.message, "success").then(() => {
                loadPegawaiData(currentCabang);
                loadPesertaData();
              });
            } else {
              Swal.fire("Error", response.message, "error");
            }
          },
          error: function () {
            Swal.fire("Error", "Terjadi kesalahan pada server", "error");
          },
        });
      }
    });
  });

  // Handler checkbox selectAll
  $("#selectAll").change(function () {
    $(".pegawai-checkbox").prop("checked", this.checked);
  });

  // Inisialisasi Select2
  $("#select-cabang").select2({
    placeholder: "-- Pilih Kantor --",
    width: "100%",
    dropdownAutoWidth: true,
    dropdownParent: $("#select-cabang").parent(),
  });

  function loadPegawaiData(kodeCabang) {
    // Tampilkan loading spinner
    $("#table-pegawai tbody").html(
      '<tr><td colspan="5" class="text-center"><div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div></td></tr>'
    );

    setTimeout(function () {
      $.ajax({
        url: "get_pegawai.php",
        type: "POST",
        data: { kode_kantor: kodeCabang },
        success: function (response) {
          if ($.fn.DataTable.isDataTable("#table-pegawai")) {
            $("#table-pegawai").DataTable().destroy();
          }
          $("#table-pegawai tbody").html(response);
          $("#table-pegawai").DataTable({
            order: [[2, "asc"]],
          });
        },
      });
    }, 1000); // Delay 1 detik
  }
});
