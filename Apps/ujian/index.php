<?php
session_start();
require_once '../../config/db_cbt_v1.php';
?>
<?php include '../docker/header.php' ?>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div id="app">
        <div id="main" style="margin-left: 0; width: 100%;">
            <div class="page-heading">
                <h3>Ujian CBT</h3>
            </div>

            <div class="page-content">
                <div class="row">
                    <!-- Card Navigasi Soal (30%) -->
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Navigasi Soal</h4>
                                <!-- Timer -->
                                <div class="timer-section text-center mb-3">
                                    <h3 id="timer">00:00:00</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Grid Nomor Soal -->
                                <!-- Grid Nomor Soal -->
                                <div class="soal-navigation d-flex flex-wrap gap-2">
                                    <?php
                                    // Ambil jumlah soal dari database
                                    $query_jml_soal = "SELECT COUNT(*) as total FROM t_bank_soal WHERE bidang_soal = 1";
                                    $result_jml = $conn->query($query_jml_soal);
                                    $row_jml = $result_jml->fetch_assoc();
                                    $total_soal = $row_jml['total'];

                                    // Generate tombol sesuai jumlah soal
                                    for ($i = 1; $i <= $total_soal; $i++) {
                                        echo "<button class='btn btn-danger nomor-soal' data-nomor='$i'>$i</button>";
                                    }
                                    ?>
                                </div>
                                <!-- Tombol Selesai -->
                                <div class="text-center mt-4">
                                    <button id="selesaiUjian" class="btn btn-primary">Selesai Ujian</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card Soal (70%) -->
                    <!-- Card Soal (70%) -->
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Soal No. <span id="nomor-aktif">1</span></h4>
                            </div>
                            <div class="card-body">
                                <div id="konten-soal">
                                    <div class="pertanyaan mb-4">
                                        <?php
                                        // Query untuk mengambil soal
                                        $query_soal = "SELECT * FROM t_bank_soal WHERE bidang_soal = 1 LIMIT 1";
                                        $result_soal = $conn->query($query_soal);
                                        $soal = $result_soal->fetch_assoc();
                                        echo $soal['pertanyaan'];
                                        ?>
                                    </div>
                                    <div class="pilihan-jawaban">
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="radio" name="jawaban" value="a">
                                            <label class="form-check-label"><?php echo $soal['pilihan_a']; ?></label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="radio" name="jawaban" value="b">
                                            <label class="form-check-label"><?php echo $soal['pilihan_b']; ?></label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="radio" name="jawaban" value="c">
                                            <label class="form-check-label"><?php echo $soal['pilihan_c']; ?></label>
                                        </div>
                                        <div class="form-check mb-3">
                                            <input class="form-check-input" type="radio" name="jawaban" value="d">
                                            <label class="form-check-label"><?php echo $soal['pilihan_d']; ?></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between mt-4">
                                    <button class="btn btn-secondary" id="prevSoal">
                                        <i class="bi bi-arrow-left"></i> Sebelumnya
                                    </button>
                                    <button class="btn btn-primary" id="nextSoal">
                                        Selanjutnya <i class="bi bi-arrow-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JS Dependencies -->
    <script src="../../assets/static/js/components/dark.js"></script>
    <script src="../../assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/compiled/js/app.js"></script>
    <script src="../../assets/extensions/jquery/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <script src="./scripts.js"></script>

    <style>
        .nomor-soal {
            width: 45px;
            height: 45px;
            margin: 5px;
        }

        .soal-terjawab {
            background-color: #198754 !important;
            border-color: #198754 !important;
        }
    </style>
</body>