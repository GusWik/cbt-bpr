function showInsertModal() {
    $('#insertBidangSoalModal').modal('show');
}

function insertBidangSoal() {
    $.ajax({
        url: 'insert.php',
        type: 'POST',
        data: $('#insertBidangSoalForm').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil!',
                    text: 'Bidang soal berhasil ditambahkan',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#insertBidangSoalModal').modal('hide');
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: 'Error menambahkan bidang soal: ' + response.error,
                });
            }
        },
        error: function() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Terjadi kesalahan saat memproses permintaan Anda.',
            });
        }
    });
}

function editBidangSoal(id, nm_bidang_soal) {
    $('#edit_id_bidang_soal').val(id);
    $('#edit_nm_bidang_soal').val(nm_bidang_soal);
    $('#editBidangSoalModal').modal('show');
}

function updateBidangSoal() {
    $.ajax({
        url: 'update.php',
        type: 'POST',
        data: $('#editBidangSoalForm').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil!',
                    text: 'Bidang soal berhasil diperbarui',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: 'Error memperbarui bidang soal: ' + response.error,
                });
            }
        },
        error: function() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Terjadi kesalahan saat memproses permintaan Anda.',
            });
        }
    });
}

function deleteBidangSoal(id) {
    Swal.fire({
        title: 'Apakah Anda yakin?',
        text: "Anda tidak akan dapat mengembalikan ini!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ya, hapus!',
        cancelButtonText: 'Batal'
    }).then((result) => {
        if (result.isConfirmed) {
            confirmDelete(id);
        }
    });
}

function confirmDelete(id) {
    $.ajax({
        url: 'delete.php',
        type: 'POST',
        data: { id_bidang_soal: id },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire(
                    'Terhapus!',
                    'Bidang soal berhasil dihapus.',
                    'success'
                ).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: 'Error menghapus bidang soal: ' + response.error,
                });
            }
        },
        error: function() {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Terjadi kesalahan saat memproses permintaan Anda.',
            });
        }
    });
}

$(document).ready(function() {
    // Your existing document.ready code here
});
