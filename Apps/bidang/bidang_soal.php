<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$result = $conn->query("SELECT * FROM t_bidang_soal");
?>

<?php include '../docker/header.php'; ?>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div id="app">
        <?php include '../docker/sidebar.php'; ?>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h3>Menu Bidang Soal</h3>
            </div>
            <div class="page-content">
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Tabel Daftar Bidang Soal</h5>
                            <button type="button" class="btn btn-primary" onclick="showInsertModal()">Tambah Bidang Soal</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="table1">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama Bidang Soal</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach ($result as $row) {
                                            echo "<tr>";
                                            echo "<td>" . $no++ . "</td>";
                                            echo "<td>" . htmlspecialchars($row['nm_bidang_soal']) . "</td>";
                                            echo "<td>
                                                <button class='btn btn-warning btn-sm' onclick='editBidangSoal({$row['id_bidang_soal']}, \"" . htmlspecialchars($row['nm_bidang_soal']) . "\")'>Edit</button>
                                                <button class='btn btn-danger btn-sm' onclick='deleteBidangSoal({$row['id_bidang_soal']})'>Delete</button>
                                              </td>";
                                            echo "</tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <?php include '../docker/footer.php'; ?>
        </div>
    </div>

    <!-- Insert Bidang Soal Modal -->
    <div class="modal fade" id="insertBidangSoalModal" tabindex="-1" aria-labelledby="insertBidangSoalModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="insertBidangSoalModalLabel">Tambah Bidang Soal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="insertBidangSoalForm">
                        <div class="mb-3">
                            <label for="insert_nm_bidang_soal" class="form-label">Nama Bidang Soal</label>
                            <input type="text" class="form-control" id="insert_nm_bidang_soal" name="nm_bidang_soal" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="insertBidangSoal()">Tambah</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Bidang Soal Modal -->
    <div class="modal fade" id="editBidangSoalModal" tabindex="-1" aria-labelledby="editBidangSoalModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editBidangSoalModalLabel">Edit Bidang Soal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editBidangSoalForm">
                        <input type="hidden" id="edit_id_bidang_soal" name="id_bidang_soal">
                        <div class="mb-3">
                            <label for="edit_nm_bidang_soal" class="form-label">Nama Bidang Soal</label>
                            <input type="text" class="form-control" id="edit_nm_bidang_soal" name="nm_bidang_soal" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="updateBidangSoal()">Simpan Perubahan</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Bidang Soal Modal -->
    <div class="modal fade" id="deleteBidangSoalModal" tabindex="-1" aria-labelledby="deleteBidangSoalModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteBidangSoalModalLabel">Hapus Bidang Soal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Apakah Anda yakin ingin menghapus bidang soal ini?</p>
                    <input type="hidden" id="delete_id_bidang_soal">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                    <button type="button" class="btn btn-danger" onclick="confirmDelete()">Hapus</button>
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