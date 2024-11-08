function showInsertModal() {
    $('#insertUserModal').modal('show');
}

function insertUser() {
    $.ajax({
        url: 'insert.php',
        type: 'POST',
        data: $('#insertUserForm').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil!',
                    text: 'User berhasil ditambahkan',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#insertUserModal').modal('hide');
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: 'Error menambahkan user: ' + response.error,
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

function editUser(id, username, password, nama, kode_kantor, role) {
    $('#edit_id').val(id);
    $('#edit_username').val(username);
    $('#edit_password').val(''); // Clear password field for security
    $('#edit_nama').val(nama);
    $('#edit_kode_kantor').val(kode_kantor);
    $('#edit_role').val(role);
    $('#editUserModal').modal('show');
}

function updateUser() {
    $.ajax({
        url: 'update.php',
        type: 'POST',
        data: $('#editUserForm').serialize(),
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil!',
                    text: 'User berhasil diperbarui',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: 'Error memperbarui user: ' + response.error,
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

function deleteUser(id) {
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
        data: { id: id },
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                Swal.fire(
                    'Terhapus!',
                    'User berhasil dihapus.',
                    'success'
                ).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            } else {
                console.log("Error details:", response);
                let errorMessage = "Error menghapus user: " + response.error;
                if (response.constraints) {
                    errorMessage += "\n\nDitemukan constraint di tabel: " + 
                        response.constraints.map(c => c.TABLE_NAME).join(", ");
                }
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal!',
                    text: errorMessage,
                });
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("AJAX error:", textStatus, errorThrown);
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
