<?php
session_start();
require_once '../../config/db_cbt_v1.php';
?>
<?php include '../docker/header.php' ?>

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
                <h3>Laporan Data Ujian</h3>
            </div>

            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Filter Laporan Ujian</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Pilih Tanggal Ujian</label>
                                            <input type="date" id="tanggal_ujian" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4 d-flex align-items-end">
                                        <button type="button" id="btn-tampil" class="btn btn-primary me-2">
                                            <i class="bi bi-search"></i> Tampilkan Data
                                        </button>
                                        <button type="button" id="btn-reset" class="btn btn-secondary">
                                            <i class="bi bi-arrow-clockwise"></i> Reset
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card" id="hasil-laporan" style="display:none">
                            <div class="card-header">
                                <h4>Hasil Ujian</h4>
                                <!-- Tombol Export ke Excel -->
                                <button type="button" class="btn btn-success" id="btn-export-excel">
                                    <i class="bi bi-file-earmark-excel"></i> Export Excel
                                </button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="tabel-hasil">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Nama Pegawai</th>
                                                <th>Kode Pegawai</th>
                                                <th>Tanggal Ujian</th>
                                                <th>Waktu Ujian</th>
                                                <th>Nilai Ujian</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody id="hasil-data"></tbody>
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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.3/xlsx.full.min.js"></script> <!-- SheetJS Library -->
   
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

    <!-- Date picker -->
    <link rel="stylesheet" href="../../assets/extensions/flatpickr/flatpickr.min.css">
    <script src="../../assets/extensions/flatpickr/flatpickr.min.js"></script>

</body>