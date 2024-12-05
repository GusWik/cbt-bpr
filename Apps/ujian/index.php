<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Cek session
if (!isset($_SESSION['username'])) {
    header("Location: ../login/");
    exit();
}

$kd_pegawai = $_SESSION['username'];

// Ambil data peserta ujian
$query_peserta = "SELECT * FROM t_peserta_ujian WHERE kd_pegawai = ? AND flag_aktif = 1";
$stmt = $conn->prepare($query_peserta);
$stmt->bind_param("s", $kd_pegawai);
$stmt->execute();
$peserta = $stmt->get_result()->fetch_assoc();

if (!$peserta) {
    header("Location: ../dashboard/");
    exit();
}

// Set session id_peserta
$_SESSION['id_peserta'] = $peserta['id_peserta'];
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
                                <h4 class="card-title">Nomor Soal</h4>
                                <div class="timer-section text-center mb-3">
                                    <h3 id="timer">00:00:00</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="soal-navigation d-flex flex-wrap gap-2">
                                    <?php
                                    // Ambil jumlah soal dari database
                                    $query_jml_soal = "SELECT COUNT(*) as total FROM t_bank_soal";
                                    $result_jml = $conn->query($query_jml_soal);
                                    $row_jml = $result_jml->fetch_assoc();
                                    $total_soal = $row_jml['total'];

                                    // Generate tombol sesuai jumlah soal
                                    for ($i = 1; $i <= $total_soal; $i++) {
                                        echo "<button class='btn btn-danger nomor-soal' style='font-size: 12px;' data-nomor='$i'>$i</button>";
                                    }

                                    ?>
                                </div>
                                <div class="text-center mt-4">
                                    <button id="selesaiUjian" class="btn btn-primary">Selesai Ujian</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card Soal (70%) -->
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Soal No. <span id="nomor-aktif">1</span></h4>
                            </div>
                            <div class="card-body">
                                <form id="formJawaban">
                                    <input type="hidden" id="current_soal_id" value="<?php echo $soal['id_soal']; ?>">
                                    <div id="konten-soal">
                                        <?php
                                        // Query untuk mengambil soal secara acak
                                        $query_soal = "SELECT * FROM t_bank_soal ORDER BY RAND() LIMIT 1";
                                        $result_soal = $conn->query($query_soal);

                                        if ($result_soal && $result_soal->num_rows > 0) {
                                            $soal = $result_soal->fetch_assoc();
                                        ?>
                                            <div class="pertanyaan mb-4">
                                                <?php echo $soal['pertanyaan']; ?>
                                            </div>

                                            <div class="pilihan-jawaban" data-soal-id="<?php echo $soal['id_soal']; ?>">
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
                                        <?php
                                        } else {
                                            echo "Tidak ada soal tersedia.";
                                        }
                                        ?>
                                    </div>
                                    <div class="d-flex justify-content-between mt-4">
                                        <button type="button" class="btn btn-secondary" id="prevSoal">
                                            <i class="bi bi-arrow-left"></i> Sebelumnya
                                        </button>
                                        <button type="button" class="btn btn-primary" id="nextSoal">
                                            Selanjutnya <i class="bi bi-arrow-right"></i>
                                        </button>
                                    </div>
                                </form>
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

    <script>
        const totalSoal = <?php echo $total_soal; ?>;
        const currentSoalId = <?php echo $soal['id_soal']; ?>;
        let currentNomor = 1;
    </script>

    <script src="./scripts.js"></script>

    <style>
        .nomor-soal {
            font-size: 16px;
        }

        .soal-terjawab {
            background-color: #198754 !important;
            border-color: #198754 !important;
        }
    </style>
</body>