<?php
session_start();
require_once '../../config/db_cbt_v1.php';
?>
<?php include '../docker/header.php' ?>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div id="app">

        <div id="main" style="margin-left: 0; width: 100%;">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>

            </header>

            <div class="page-heading">
                <h3>Dashboard Peserta Ujian</h3>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
                <div>
                    <a href="../login/logout.php" class="btn btn-danger">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </div>
            </div>
            <br>
            <div class="page-content">
                <section class="row">
                    <?php
                    $username = $_SESSION['username'];
                    $kode_kantor = $_SESSION['kode_kantor'];

                    // Get pegawai data
                    $query_pegawai = "SELECT kd_pegawai, nm_pegawai FROM t_pegawai WHERE kd_pegawai = '$username' AND kode_kantor = '$kode_kantor'";
                    $result_pegawai = $conn->query($query_pegawai);
                    $pegawai = $result_pegawai->fetch_assoc();
                    $kd_pegawai = $pegawai['kd_pegawai'];

                    // Main query for exam info
                    $query = "SELECT pu.*, p.nm_pegawai, p.jabatan_pegawai, p.kode_kantor, k.nama_kantor, bs.nm_bidang_soal 
                            FROM t_peserta_ujian pu
                            JOIN t_pegawai p ON pu.kd_pegawai = p.kd_pegawai
                            JOIN t_kantor k ON p.kode_kantor = k.kode_kantor
                            JOIN t_bidang_soal bs ON pu.id_bidang_soal = bs.id_bidang_soal
                            WHERE pu.kd_pegawai = '$kd_pegawai' AND pu.flag_aktif = 1";

                    $result = $conn->query($query);

                    if ($result && $result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                    ?>
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Informasi Peserta</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-4">Nama Pegawai</div>
                                        <div class="col-md-8">: <?= $row['nm_pegawai'] ?></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-4">Jabatan</div>
                                        <div class="col-md-8">: <?= $row['jabatan_pegawai'] ?></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-4">Kantor</div>
                                        <div class="col-md-8">: <?= $row['nama_kantor'] ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Informasi Ujian</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-4">Bidang Soal</div>
                                        <div class="col-md-8">: <?= $row['nm_bidang_soal'] ?></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-4">Tanggal Ujian</div>
                                        <div class="col-md-8">: <?= date('d-m-Y', strtotime($row['tgl_ujian'])) ?></div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-4">Durasi</div>
                                        <div class="col-md-8">: <?= $row['waktu_ujian'] ?> Menit</div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-12 text-center">
                                            <?php if ($row['total_nilai_ujian'] > 0): ?>
                                                <button class="btn btn-success" disabled>Ujian Selesai</button>
                                            <?php else: ?>
                                                <a href="../ujian/" class="btn btn-primary" id="mulaiUjian">Mulai Ujian</a>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                    } else {
                        echo '<div class="col-12"><div class="alert alert-info">Anda belum terdaftar sebagai peserta ujian.</div></div>';
                    }
                    ?>
                </section>
            </div>
            <?php include '../docker/footer.php' ?>
        </div>
    </div>

    <!-- JS Dependencies -->
    <script src="../../assets/static/js/components/dark.js"></script>
    <script src="../../assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/compiled/js/app.js"></script>
    <script src="../../assets/extensions/jquery/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <script src="./scripts.js"></script>
</body>