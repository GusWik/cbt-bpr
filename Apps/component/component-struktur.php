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
                <h3>Profile Statistics</h3>
            </div>
            <div class="page-content">
                <section class="row">

                </section>
            </div>
            <?php include '../docker/footer.php' ?>
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