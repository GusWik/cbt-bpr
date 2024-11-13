<?php
session_start();
require_once '../../config/db_cbt_v1.php';
?>
<?php include '../docker/header.php' ?>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div id="app">
        <div id="main" class="layout-horizontal">
            <header>
                <nav class="navbar navbar-expand navbar-light navbar-top">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-lg-0">
                                <li class="nav-item">
                                    <a href="../dashboard-peserta/" class="nav-link">
                                        <i class="bi bi-grid-fill"></i> Dashboard
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="../penilaian" class="nav-link">
                                        <i class="bi bi-clock-history"></i> Riwayat Ujian
                                    </a>
                                </li>
                                <li class="nav-item dropdown me-3">
                                    <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                        <i class="bi bi-person-fill"></i> <?php echo $_SESSION['nama']; ?>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li><a class="dropdown-item" href="../login/logout.php"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
            <div class="content-wrapper container">
                <div class="page-heading">
                    <h3>Hasil Penilaian Ujian</h3>
                </div>
                <div class="page-content">
                    <section class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Daftar Hasil Ujian</h4>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped" id="table1">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Tanggal Ujian</th>
                                                <th>Nama Peserta</th>
                                                <th>Bidang Soal</th>
                                                <th>Jumlah Soal</th>
                                                <th>Nilai</th>
                                                <th>Status</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $query = "SELECT 
                                                        pu.*, 
                                                        p.nm_pegawai,
                                                        bs.nm_bidang_soal
                                                    FROM t_peserta_ujian pu
                                                    JOIN t_pegawai p ON pu.kd_pegawai = p.kd_pegawai
                                                    JOIN t_bidang_soal bs ON pu.id_bidang_soal = bs.id_bidang_soal
                                                    WHERE pu.flag_aktif = 0
                                                    ORDER BY pu.tgl_ujian DESC";
                                            $result = $conn->query($query);
                                            $no = 1;
                                            while ($row = $result->fetch_assoc()) {
                                                echo "<tr>";
                                                echo "<td>" . $no++ . "</td>";
                                                echo "<td>" . date('d-m-Y', strtotime($row['tgl_ujian'])) . "</td>";
                                                echo "<td>" . $row['nm_pegawai'] . "</td>";
                                                echo "<td>" . $row['nm_bidang_soal'] . "</td>";
                                                echo "<td>" . $row['jml_soal'] . "</td>";
                                                echo "<td>" . $row['total_nilai_ujian'] . "</td>";
                                                echo "<td>" . ($row['total_nilai_ujian'] == 100 ? '<span class="badge bg-success">Lulus</span>' : '<span class="badge bg-danger">Tidak Lulus</span>') . "</td>";
                                                echo "<td>";
                                                if ($row['total_nilai_ujian'] == 100) {
                                                    echo "<button class='btn btn-primary btn-sm' onclick='generateSertifikat(" . $row['id_peserta'] . ")'><i class='bi bi-file-earmark-pdf'></i> Sertifikat</button>";
                                                }
                                                echo "</td>";
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
            </div>
        </div>
    </div>

    <script src="../../assets/static/js/components/dark.js"></script>
    <script src="../../assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/compiled/js/app.js"></script>
    <script src="../../assets/extensions/jquery/jquery.min.js"></script>
    <script src="../../assets/extensions/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../../assets/extensions/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#table1').DataTable();
        });

        function generateSertifikat(id_peserta) {
            window.location.href = 'generate_sertifikat.php?id=' + id_peserta;
        }
    </script>
</body>

</html>