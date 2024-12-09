<?php
$current_page = basename($_SERVER['PHP_SELF']);
?>

<?php
function isActive($page)
{
    global $current_page;
    return ($current_page == $page) ? 'active' : '';
}
?>


<div id="sidebar">
    <div class="sidebar-wrapper active">
        <div class="sidebar-header position-relative">
            <div class="d-flex justify-content-between align-items-center">
                <div class="logo">
                    <a href="http://localhost:8081/cbt-bpr/Apps/index.php">
                        <img src="http://localhost/cbt-bpr/Apps/assets/compiled/png/logobpr.png" alt="Logo" srcset="">
                    </a>
                </div>
                <div class="theme-toggle d-flex gap-2  align-items-center mt-2">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                        role="img" class="iconify iconify--system-uicons" width="20" height="20"
                        preserveAspectRatio="xMidYMid meet" viewBox="0 0 21 21">
                        <g fill="none" fill-rule="evenodd" stroke="currentColor" stroke-linecap="round"
                            stroke-linejoin="round">
                            <path
                                d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
                                opacity=".3"></path>
                            <g transform="translate(-210 -1)">
                                <path d="M220.5 2.5v2m6.5.5l-1.5 1.5"></path>
                                <circle cx="220.5" cy="11.5" r="4"></circle>
                                <path d="m214 5l1.5 1.5m5 14v-2m6.5-.5l-1.5-1.5M214 18l1.5-1.5m-4-5h2m14 0h2"></path>
                            </g>
                        </g>
                    </svg>
                    <div class="form-check form-switch fs-6">
                        <input class="form-check-input  me-0" type="checkbox" id="toggle-dark" style="cursor: pointer">
                        <label class="form-check-label"></label>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
                        role="img" class="iconify iconify--mdi" width="20" height="20" preserveAspectRatio="xMidYMid meet"
                        viewBox="0 0 24 24">
                        <path fill="currentColor"
                            d="m17.75 4.09l-2.53 1.94l.91 3.06l-2.63-1.81l-2.63 1.81l.91-3.06l-2.53-1.94L12.44 4l1.06-3l1.06 3l3.19.09m3.5 6.91l-1.64 1.25l.59 1.98l-1.7-1.17l-1.7 1.17l.59-1.98L15.75 11l2.06-.05L18.5 9l.69 1.95l2.06.05m-2.28 4.95c.83-.08 1.72 1.1 1.19 1.85c-.32.45-.66.87-1.08 1.27C15.17 23 8.84 23 4.94 19.07c-3.91-3.9-3.91-10.24 0-14.14c.4-.4.82-.76 1.27-1.08c.75-.53 1.93.36 1.85 1.19c-.27 2.86.69 5.83 2.89 8.02a9.96 9.96 0 0 0 8.02 2.89m-1.64 2.02a12.08 12.08 0 0 1-7.8-3.47c-2.17-2.19-3.33-5-3.49-7.82c-2.81 3.14-2.7 7.96.31 10.98c3.02 3.01 7.84 3.12 10.98.31Z">
                        </path>
                    </svg>
                </div>
                <div class="sidebar-toggler  x">
                    <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                </div>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-title">Data CBT</li>

                <li class="sidebar-item <?php echo isActive('index.php'); ?>">
                    <a href="/cbt-bpr/Apps/index.php" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-item <?php echo isActive('laporan.php'); ?>">
                    <a href="/cbt-bpr/Apps/report/laporan.php" class='sidebar-link'>
                        <i class="bi bi-stack"></i>
                        <span>Hasil Ujian</span>
                    </a>
                </li>

                <li class="sidebar-title">Data Soal</li>

                <li class="sidebar-item <?php echo isActive('peserta.php'); ?>">
                    <a href="/cbt-bpr/Apps/peserta-ujian/peserta.php" class='sidebar-link'>
                        <i class="bi bi-stack-overflow"></i>
                        <span>Peserta Ujian</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo isActive('soal.php'); ?>">
                    <a href="/cbt-bpr/Apps/bank_soal/soal.php" class='sidebar-link'>
                        <i class="bi bi-clipboard2-check-fill"></i>
                        <span>Bank Soal</span>
                    </a>
                </li>

                <li class="sidebar-item <?php echo isActive('bidang_soal.php'); ?>">
                    <a href="/cbt-bpr/Apps/bidang/bidang_soal.php" class='sidebar-link'>
                        <i class="bi bi-clipboard2-data-fill"></i>
                        <span>Bidang Soal</span>
                    </a>
                </li>

                <li class="sidebar-title">Data User</li>

                <li class="sidebar-item <?php echo isActive('daftar_pegawai.php'); ?>">
                    <a href="/cbt-bpr/Apps/pegawai/daftar_pegawai.php" class='sidebar-link'>
                        <i class="bi bi-people-fill"></i>
                        <span>Daftar Pegawai</span>
                    </a>
                </li>

                <li class="sidebar-item <?php echo isActive('kantor.php'); ?>">
                    <a href="/cbt-bpr/Apps/kantor/kantor.php" class='sidebar-link'>
                        <i class="bi bi-building"></i>
                        <span>Daftar Kantor</span>
                    </a>
                </li>

                <li class="sidebar-item <?php echo isActive('user.php'); ?>">
                    <a href="/cbt-bpr/Apps/user/user.php" class='sidebar-link'>
                        <i class="bi bi-person-fill"></i>
                        <span>User</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a href="#" class='sidebar-link' id="logoutLink">
                        <i class="bi bi-door-open-fill"></i>
                        <span>Logout</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>
<script>
    document.getElementById('logoutLink').addEventListener('click', function(e) {
        e.preventDefault();
        Swal.fire({
            title: 'Logout',
            text: "Apakah Anda yakin ingin logout?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, logout!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '/cbt-bpr/Apps/login/logout.php';
            }
        });
    });
</script>