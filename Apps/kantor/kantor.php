<?php
session_start();
require_once '../../config/db_cbt_v1.php';

$result = $conn->query("SELECT * FROM t_kantor");
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
                <h3>Daftar Kantor</h3>
            </div>
            <div class="page-content">
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Tabel Daftar Kantor</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="table1">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode Kantor</th>
                                            <th>Nama Kantor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach ($result as $row) {
                                            echo "<tr>";
                                            echo "<td>" . $no++ . "</td>";
                                            echo "<td>" . htmlspecialchars($row['kode_kantor']) . "</td>";
                                            echo "<td>" . htmlspecialchars($row['nama_kantor']) . "</td>";
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

</body>