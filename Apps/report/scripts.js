$(document).ready(function () {
  // Ketika tombol tampil ditekan
  $("#btn-tampil").click(function () {
    const tanggal = $("#tanggal_ujian").val();
    if (tanggal) {
      loadLaporan(tanggal); // Memanggil fungsi untuk memuat laporan berdasarkan tanggal
    } else {
      Swal.fire({
        icon: "warning",
        title: "Peringatan",
        text: "Silakan pilih tanggal terlebih dahulu",
      });
    }
  });

  // Ketika tombol reset ditekan
  $("#btn-reset").click(function () {
    $("#tanggal_ujian").val(""); // Mengosongkan input tanggal
    $("#hasil-laporan").hide(); // Menyembunyikan laporan
    $("#hasil-data").html(""); // Mengosongkan data laporan
  });

  // Tombol Export ke Excel
  $("#btn-export-excel").click(function () {
    exportToExcel(); // Memanggil fungsi untuk mengekspor ke Excel
  });
});

// Fungsi untuk memuat laporan berdasarkan tanggal
function loadLaporan(tanggal) {
  $.ajax({
    url: "process.php",
    type: "POST",
    data: { tanggal: tanggal }, // Mengirim tanggal sebagai parameter
    dataType: "json",
    beforeSend: function () {
      Swal.fire({
        title: "Loading...",
        didOpen: () => {
          Swal.showLoading(); // Menampilkan loading sebelum data muncul
        },
        allowOutsideClick: false, // Mencegah klik di luar dialog
      });
    },
    success: function (response) {
      Swal.close(); // Menutup loading setelah data diterima
      if (response.status === "success") {
        $("#hasil-laporan").show(); // Menampilkan laporan
        let html = "";
        if (response.data.length > 0) {
          // Mengisi data ke tabel jika ada data
          response.data.forEach((item, index) => {
            html += `
                  <tr>
                      <td>${index + 1}</td>
                      <td>${item.nama_pegawai}</td>
                      <td>${
                        item.kd_pegawai
                      }</td> <!-- Menampilkan kode pegawai -->
                      <td>${item.tgl_ujian}</td>
                      <td>${item.waktu_ujian} menit</td>
                      <td>${item.total_nilai_ujian}</td>
                      <td style="color: ${item.status_color};">${
              item.status
            }</td> <!-- Menambahkan warna status -->
                  </tr>
                `;
          });
        } else {
          // Jika tidak ada data, tampilkan pesan tidak ada data
          html =
            '<tr><td colspan="7" class="text-center">Tidak ada data untuk tanggal ini</td></tr>';
        }
        $("#hasil-data").html(html); // Memasukkan data ke dalam tabel
      } else {
        // Menampilkan error jika gagal
        Swal.fire({
          icon: "error",
          title: "Error",
          text: response.message || "Terjadi kesalahan",
        });
      }
    },
    error: function (xhr, status, error) {
      Swal.close(); // Menutup loading
      console.error("Ajax error:", error);
      Swal.fire({
        icon: "error",
        title: "Error",
        text: "Terjadi kesalahan saat memuat data",
      });
    },
  });
}

// Fungsi untuk mengekspor data ke Excel
function exportToExcel() {
  const wb = XLSX.utils.table_to_book(document.getElementById("tabel-hasil"), {
    sheet: "Laporan", // Nama sheet Excel
  });
  XLSX.writeFile(wb, "Laporan_Ujian.xlsx"); // Menyimpan file Excel dengan nama Laporan_Ujian.xlsx
}
