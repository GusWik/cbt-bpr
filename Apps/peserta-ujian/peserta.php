<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Query untuk mengambil daftar kantor cabang
$query_cabang = "SELECT DISTINCT kode_kantor FROM t_pegawai ORDER BY kode_kantor";
$result_cabang = $conn->query($query_cabang);

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
                <h3>Data Peserta Ujian</h3>
            </div>
            <div class="page-content">
                <!-- Card Pemilihan Kantor Cabang -->
                <section class="row" id="pilih-cabang-section">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Pilih Kantor Cabang</h4>
                            </div>
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-md-8">
                                        <select class="form-select" id="select-cabang">
                                            <option value="">-- Pilih Kantor --</option>
                                            <?php
                                            $query_cabang = "SELECT DISTINCT k.kode_kantor, k.nama_kantor 
                    FROM t_kantor k 
                    INNER JOIN t_pegawai p ON k.kode_kantor = p.kode_kantor 
                    ORDER BY k.kode_kantor ASC";
                                            $result_cabang = $conn->query($query_cabang);
                                            while ($cabang = $result_cabang->fetch_assoc()):
                                            ?>
                                                <option value="<?php echo $cabang['kode_kantor']; ?>">
                                                    <?php echo $cabang['nama_kantor']; ?>
                                                </option>
                                            <?php endwhile; ?>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <button id="tampilkanPegawai" class="btn btn-primary w-100">Tampilkan Pegawai</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Tabel Pegawai dan Peserta (awalnya tersembunyi) -->
                <section class="row" id="tabel-section" style="display: none;">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h4 class="card-title">Daftar Pegawai</h4>
                                <button id="tambahPeserta" class="btn btn-primary">Tambah ke Peserta Ujian</button>
                            </div>
                            <div class="card-body">
                                <!-- Loading spinner ditaruh disini -->
                                <div id="loading-spinner" style="display:none;">
                                    <div class="text-center">
                                        <div class="spinner-border text-primary" role="status">
                                            <span class="visually-hidden">Loading...</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table" id="table-pegawai">
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" id="selectAll"></th>
                                                <th>Kode Pegawai</th>
                                                <th>Nama Pegawai</th>
                                                <th>Jabatan</th>
                                                <th>Kode Kantor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Daftar Peserta Ujian</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" id="table-peserta">
                                        <thead>
                                            <tr>
                                                <th>Kode Pegawai</th>
                                                <th>Nama Pegawai</th>
                                                <th>Tanggal Ujian</th>
                                                <th>Status</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
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

    <!-- Modal Tambah Peserta -->
    <div class="modal fade" id="modalTambahPeserta" tabindex="-1" aria-labelledby="modalTambahPesertaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTambahPesertaLabel">Tambah Peserta Ujian</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formTambahPeserta">
                        <div class="mb-3">
                            <label for="tgl_ujian" class="form-label">Tanggal Ujian</label>
                            <input type="date" class="form-control" id="tgl_ujian" name="tgl_ujian" required>
                        </div>
                        <div class="mb-3">
                            <label for="jml_soal" class="form-label">Jumlah Soal</label>
                            <input type="number" class="form-control" id="jml_soal" name="jml_soal" required>
                        </div>
                        <div class="mb-3">
                            <label for="id_bidang_soal" class="form-label">Bidang Soal</label>
                            <select class="form-select" id="id_bidang_soal" name="id_bidang_soal" required>
                                <!-- Opsi bidang soal akan diisi melalui AJAX -->
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="waktu_ujian" class="form-label">Waktu Ujian (menit)</label>
                            <input type="number" class="form-control" id="waktu_ujian" name="waktu_ujian" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="button" class="btn btn-primary" id="simpanPeserta">Simpan</button>
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
    <script src="../../assets/extensions/datatables.net/js/dataTables.checkboxes.min.js"></script>
    <script src="../../assets/static/js/pages/datatables.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>

    <!-- Tambahkan CSS Select2 di header -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <!-- Tambahkan JS Select2 sebelum closing body -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- JS untuk interaksi -->
    <script src="./scripts.js"></script>
    <style>
        #table-pegawai thead th {
            background-color: #198754;
            /* Bootstrap green */
            color: white;
        }

        #table-peserta thead th {
            background-color: #dc3545;
            /* Bootstrap red */
            color: white;
        }
    </style>
</body>