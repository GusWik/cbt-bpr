<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Fetch pegawai data
$query = "SELECT * FROM t_pegawai";
$result = $conn->query($query);

include '../docker/header.php';
?>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div id="app">
        <?php include '../docker/sidebar.php' ?>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h3>Daftar Pegawai</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Data Pegawai</h4>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPegawaiModal">
                                    Tambah Pegawai
                                </button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" id="table1">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Kode Pegawai</th>
                                                <th>Nama Pegawai</th>
                                                <th>Jabatan</th>
                                                <th>Kode Kantor</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $no = 1;
                                            while ($row = $result->fetch_assoc()): ?>
                                                <tr>
                                                    <td><?php echo $no++ ?></td>
                                                    <td><?php echo $row['kd_pegawai']; ?></td>
                                                    <td><?php echo $row['nm_pegawai']; ?></td>
                                                    <td><?php echo $row['jabatan_pegawai']; ?></td>
                                                    <td><?php echo $row['kode_kantor']; ?></td>
                                                    <td>
                                                        <button class="btn btn-sm btn-warning edit-pegawai" data-id="<?php echo $row['id_pegawai']; ?>">Edit</button>
                                                        <button class="btn btn-sm btn-danger delete-pegawai" data-id="<?php echo $row['id_pegawai']; ?>">Hapus</button>
                                                    </td>
                                                </tr>
                                            <?php endwhile; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <?php include '../docker/footer.php' ?>
        </div>
    </div>

    <!-- Modal Tambah Pegawai -->
    <div class="modal fade" id="addPegawaiModal" tabindex="-1" aria-labelledby="addPegawaiModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addPegawaiModalLabel">Tambah Pegawai Baru</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addPegawaiForm">
                        <div class="mb-3">
                            <label for="kd_pegawai" class="form-label">Kode Pegawai</label>
                            <input type="text" class="form-control" id="kd_pegawai" name="kd_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="nm_pegawai" class="form-label">Nama Pegawai</label>
                            <input type="text" class="form-control" id="nm_pegawai" name="nm_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="jabatan_pegawai" class="form-label">Jabatan</label>
                            <input type="text" class="form-control" id="jabatan_pegawai" name="jabatan_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="kode_kantor" class="form-label">Kode Kantor</label>
                            <input type="text" class="form-control" id="kode_kantor" name="kode_kantor" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="savePegawaiBtn">Simpan</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Edit Pegawai -->
    <div class="modal fade" id="editPegawaiModal" tabindex="-1" aria-labelledby="editPegawaiModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPegawaiModalLabel">Edit Pegawai</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editPegawaiForm">
                        <input type="hidden" id="edit_id_pegawai" name="id_pegawai">
                        <div class="mb-3">
                            <label for="edit_kd_pegawai" class="form-label">Kode Pegawai</label>
                            <input type="text" class="form-control" id="edit_kd_pegawai" name="kd_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_nm_pegawai" class="form-label">Nama Pegawai</label>
                            <input type="text" class="form-control" id="edit_nm_pegawai" name="nm_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_jabatan_pegawai" class="form-label">Jabatan</label>
                            <input type="text" class="form-control" id="edit_jabatan_pegawai" name="jabatan_pegawai" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_kode_kantor" class="form-label">Kode Kantor</label>
                            <input type="text" class="form-control" id="edit_kode_kantor" name="kode_kantor" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="updatePegawaiBtn">Update</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Konfirmasi Hapus -->
    <div class="modal fade" id="deletePegawaiModal" tabindex="-1" aria-labelledby="deletePegawaiModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deletePegawaiModalLabel">Konfirmasi Hapus</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Apakah Anda yakin ingin menghapus pegawai ini?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Hapus</button>
                </div>
            </div>
        </div>
    </div>

    <!-- JS Dependencies -->
    <link rel="stylesheet" href="../../assets/compiled/css/app.css">
    <link rel="stylesheet" href="../../assets/compiled/css/app-dark.css">
    <link rel="stylesheet" href="../../assets/compiled/css/iconly.css">

    <script src="../../assets/static/js/components/dark.js"></script>
    <script src="../../assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/compiled/js/app.js"></script>
    <script src="../../assets/extensions/jquery/jquery.min.js"></script>
    <script src="../../assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../../assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../assets/static/js/pages/datatables.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>

    <!-- JS untuk modal edit dan delete -->
    <script src="./scripts.js"></script>
</body>