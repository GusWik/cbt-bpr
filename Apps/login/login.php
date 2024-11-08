<?php
session_start();

if (isset($_SESSION['login_error'])) {
    echo '<div class="alert alert-danger">' . $_SESSION['login_error'] . '</div>';
    unset($_SESSION['login_error']);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BPR NTB</title>

    <!-- Include your CSS files here -->
    <link rel="stylesheet" href="../../assets/compiled/css/app.css">
    <link rel="stylesheet" href="../../assets/compiled/css/app-dark.css">
    <link rel="stylesheet" href="../../assets/compiled/css/iconly.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">

    <style>
        body {
            background-color: #f2f7ff;
        }

        .container-login {
            height: 100vh;
            display: flex;
            align-items: center;
        }
    </style>
</head>

<body>
    <script src="../../assets/static/js/initTheme.js"></script>
    <div class="container-login">
        <div class="row justify-content-center w-100">
            <div class="col-xl-4 col-lg-6 col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <img src="../assets/compiled/png/logobpr.png" alt="Logo BPR" style="width: 70%; max-width: 200px;">
                        </div>
                        <h3 class="text-center mb-4">Login</h3>
                        <form action="process_login.php" method="post">
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="text" class="form-control form-control-xl" placeholder="Username" name="username" required>
                                <div class="form-control-icon">
                                    <i class="bi bi-person"></i>
                                </div>
                            </div>
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="password" class="form-control form-control-xl" placeholder="Password" name="password" required>
                                <div class="form-control-icon">
                                    <i class="bi bi-shield-lock"></i>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block btn-lg shadow-sm mt-5">Login</button>
                        </form>
                        <div class="text-center mt-5">
                            <p class="text-gray-600 small">
                                <a href="https://www.bprntb.co.id/" class="font-weight-bold">PT. BPR NTB (Perseroda)</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include your JS files here -->
    <script src="../../assets/static/js/components/dark.js"></script>
    <script src="../../assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/compiled/js/app.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
    <?php
    if (isset($_SESSION['login_status'])) {
        $redirectUrl = isset($_SESSION['redirect_url']) ? $_SESSION['redirect_url'] : "../";
        echo "<script>
            document.addEventListener('DOMContentLoaded', function() {
                showLoginAlert('{$_SESSION['login_status']}', '{$_SESSION['login_message']}', '$redirectUrl');
            });
        </script>";
        unset($_SESSION['login_status']);
        unset($_SESSION['login_message']);
        unset($_SESSION['redirect_url']);
    } elseif (isset($_GET['logout']) && $_GET['logout'] == 'success') {
        echo "<script>
            document.addEventListener('DOMContentLoaded', function() {
                Swal.fire({
                    icon: 'success',
                    title: 'Logout Berhasil',
                    text: 'Anda telah berhasil logout.',
                    timer: 2000,
                    showConfirmButton: false
                });
            });
        </script>";
    }
    ?>
</body>

</html>