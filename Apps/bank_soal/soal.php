<?php
include '../docker/header.php';
require_once '../../config/db_cbt_v1.php';

// Fetch bidang soal for dropdown
$bidang_soal_query = "SELECT * FROM t_bidang_soal";
$bidang_soal_result = $conn->query($bidang_soal_query);

// Fetch existing soal
$soal_query = "SELECT s.*, b.nm_bidang_soal FROM t_bank_soal s JOIN t_bidang_soal b ON s.bidang_soal = b.id_bidang_soal";
$soal_result = $conn->query($soal_query);
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
                <h3>Bank Soal</h3>
            </div>
            <div class="page-content">
                <section class="row">

                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Daftar Soal</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body">
                                    <!-- Tambahkan ini di dalam card-body, sebelum tabel -->
                                    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addSoalModal">
                                        Tambah Soal
                                    </button>

                                    <div class="table-responsive">
                                        <table class="table" id="table1">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Bidang Soal</th>
                                                    <th>Pertanyaan</th>
                                                    <th>Jawaban Benar</th>
                                                    <th>Aksi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $no = 1;
                                                while ($row = $soal_result->fetch_assoc()): ?>
                                                    <tr>
                                                        <td><?php echo $no++ ?></td>
                                                        <td><?php echo $row['nm_bidang_soal']; ?></td>
                                                        <td><?php echo $row['pertanyaan']; ?></td>
                                                        <td><?php echo $row['jawaban_benar']; ?></td>
                                                        <td>
                                                            <button class="btn btn-sm btn-warning edit-soal" data-id="<?php echo $row['id_soal']; ?>">Edit</button>
                                                            <button class="btn btn-sm btn-danger delete-soal" data-id="<?php echo $row['id_soal']; ?>">Hapus</button>
                                                        </td>
                                                    </tr>
                                                <?php endwhile; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <?php include '../docker/footer.php' ?>
        </div>


        <!-- Modal Tambah Soal -->
        <div class="modal fade" id="addSoalModal" tabindex="-1" aria-labelledby="addSoalModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSoalModalLabel">Tambah Soal Baru</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addSoalForm">
                            <div class="mb-3">
                                <label for="bidang_soal" class="form-label">Bidang Soal</label>
                                <select class="form-select" id="bidang_soal" name="bidang_soal" required>
                                    <?php
                                    $bidang_soal_result->data_seek(0);
                                    while ($bidang = $bidang_soal_result->fetch_assoc()) {
                                        echo "<option value='" . $bidang['id_bidang_soal'] . "'>" . $bidang['nm_bidang_soal'] . "</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="pertanyaan" class="form-label">Pertanyaan</label>
                                <textarea class="form-control" id="pertanyaan" name="pertanyaan" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="pilihan_a" class="form-label">Pilihan A</label>
                                <input type="text" class="form-control" id="pilihan_a" name="pilihan_a" required>
                            </div>
                            <div class="mb-3">
                                <label for="pilihan_b" class="form-label">Pilihan B</label>
                                <input type="text" class="form-control" id="pilihan_b" name="pilihan_b" required>
                            </div>
                            <div class="mb-3">
                                <label for="pilihan_c" class="form-label">Pilihan C</label>
                                <input type="text" class="form-control" id="pilihan_c" name="pilihan_c" required>
                            </div>
                            <div class="mb-3">
                                <label for="pilihan_d" class="form-label">Pilihan D</label>
                                <input type="text" class="form-control" id="pilihan_d" name="pilihan_d" required>
                            </div>
                            <div class="mb-3">
                                <label for="jawaban_benar" class="form-label">Jawaban Benar</label>
                                <select class="form-select" id="jawaban_benar" name="jawaban_benar" required>
                                    <option value="a">A</option>
                                    <option value="b">B</option>
                                    <option value="c">C</option>
                                    <option value="d">D</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="button" class="btn btn-primary" id="saveSoalBtn">Simpan</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Edit Soal -->
        <div class="modal fade" id="editSoalModal" tabindex="-1" aria-labelledby="editSoalModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editSoalModalLabel">Edit Soal</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editSoalForm">
                            <input type="hidden" id="edit_id_soal" name="id_soal">
                            <div class="mb-3">
                                <label for="edit_bidang_soal" class="form-label">Bidang Soal</label>
                                <select class="form-select" id="edit_bidang_soal" name="bidang_soal" required>
                                    <?php
                                    $bidang_soal_result->data_seek(0);
                                    while ($bidang = $bidang_soal_result->fetch_assoc()) {
                                        echo "<option value='" . $bidang['id_bidang_soal'] . "'>" . $bidang['nm_bidang_soal'] . "</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="edit_pertanyaan" class="form-label">Pertanyaan</label>
                                <textarea class="form-control" id="edit_pertanyaan" name="pertanyaan" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="edit_pilihan_a" class="form-label">Pilihan A</label>
                                <input type="text" class="form-control" id="edit_pilihan_a" name="pilihan_a" required>
                            </div>
                            <div class="mb-3">
                                <label for="edit_pilihan_b" class="form-label">Pilihan B</label>
                                <input type="text" class="form-control" id="edit_pilihan_b" name="pilihan_b" required>
                            </div>
                            <div class="mb-3">
                                <label for="edit_pilihan_c" class="form-label">Pilihan C</label>
                                <input type="text" class="form-control" id="edit_pilihan_c" name="pilihan_c" required>
                            </div>
                            <div class="mb-3">
                                <label for="edit_pilihan_d" class="form-label">Pilihan D</label>
                                <input type="text" class="form-control" id="edit_pilihan_d" name="pilihan_d" required>
                            </div>
                            <div class="mb-3">
                                <label for="edit_jawaban_benar" class="form-label">Jawaban Benar</label>
                                <select class="form-select" id="edit_jawaban_benar" name="jawaban_benar" required>
                                    <option value="a">A</option>
                                    <option value="b">B</option>
                                    <option value="c">C</option>
                                    <option value="d">D</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="button" class="btn btn-primary" id="updateSoalBtn">Update</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Konfirmasi Hapus -->
        <div class="modal fade" id="deleteSoalModal" tabindex="-1" aria-labelledby="deleteSoalModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteSoalModalLabel">Konfirmasi Hapus</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Apakah Anda yakin ingin menghapus soal ini?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Hapus</button>
                    </div>
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
    <script src="scripts.js"></script>
</body>