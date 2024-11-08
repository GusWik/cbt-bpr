$(document).ready(function() {
    // DataTable initialization
    var table = $('#pegawaiTable').DataTable();

    // Add new pegawai
    $('#savePegawaiBtn').click(function() {
        $.ajax({
            url: 'insert.php',
            method: 'POST',
            data: $('#addPegawaiForm').serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    $('#addPegawaiModal').modal('hide');
                    Swal.fire('Sukses', response.message, 'success').then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            },
            error: function() {
                Swal.fire('Error', 'Terjadi kesalahan pada server', 'error');
            }
        });
    });

    // Edit pegawai
    $('.edit-pegawai').click(function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'get_pegawai.php',
            method: 'GET',
            data: {id: id},
            dataType: 'json',
            success: function(data) {
                $('#edit_id_pegawai').val(data.id_pegawai);
                $('#edit_kd_pegawai').val(data.kd_pegawai);
                $('#edit_nm_pegawai').val(data.nm_pegawai);
                $('#edit_jabatan_pegawai').val(data.jabatan_pegawai);
                $('#edit_kode_kantor').val(data.kode_kantor);
                $('#editPegawaiModal').modal('show');
            },
            error: function() {
                Swal.fire('Error', 'Gagal mengambil data pegawai', 'error');
            }
        });
    });

    // Update pegawai
    $('#updatePegawaiBtn').click(function() {
        $.ajax({
            url: 'update.php',
            method: 'POST',
            data: $('#editPegawaiForm').serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    $('#editPegawaiModal').modal('hide');
                    Swal.fire('Sukses', response.message, 'success').then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            },
            error: function() {
                Swal.fire('Error', 'Terjadi kesalahan pada server', 'error');
            }
        });
    });

    // Delete pegawai
    $('.delete-pegawai').click(function() {
        var id = $(this).data('id');
        $('#deletePegawaiModal').modal('show');
        $('#confirmDeleteBtn').data('id', id);
    });

    $('#confirmDeleteBtn').click(function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'delete.php',
            method: 'POST',
            data: {id_pegawai: id},
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    $('#deletePegawaiModal').modal('hide');
                    Swal.fire('Sukses', response.message, 'success').then((result) => {
                        if (result.isConfirmed) {
                            location.reload();
                        }
                    });
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            },
            error: function() {
                Swal.fire('Error', 'Terjadi kesalahan pada server', 'error');
            }
        });
    });
});
