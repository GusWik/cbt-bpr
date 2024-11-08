<?php

session_start();
require_once '../../config/db_cbt_v1.php';

// Proses form submission untuk menambahkan user
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_user'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $nama = $_POST['nama'];
    $kode_kantor = $_POST['kode_kantor'];
    $role = $_POST['role'];

    $sql = "INSERT INTO t_users (username, password, nama, kode_kantor, role)
            VALUES (?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $username, $password, $nama, $kode_kantor, $role);

    if ($stmt->execute()) {
        header("Location: user.php?success=1");
        exit();
    } else {
        $error = "Error: " . $stmt->error;
    }
    $stmt->close();
}

$result = $conn->query("SELECT * FROM t_users");
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
                <h3>Menu User</h3>
            </div>
            <div class="page-content">
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Tabel Daftar User</h5>
                            <button type="button" class="btn btn-primary" onclick="showInsertModal()">Add New User</button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="table1">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama</th>
                                            <th>Username</th>
                                            <th>Kode Kantor</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach ($result as $row) {
                                            $id_user = $row['id'];
                                            $username = htmlspecialchars($row['username']);
                                            $nama = htmlspecialchars($row['nama']);
                                            $kode_kantor = htmlspecialchars($row['kode_kantor']);
                                            $role = htmlspecialchars($row['role']);

                                            echo "<tr>";
                                            echo "<td>" . $no++ . "</td>";
                                            echo "<td>$nama</td>";
                                            echo "<td>$username</td>";
                                            echo "<td>$kode_kantor</td>";
                                            echo "<td>" . ucfirst($role) . "</td>";
                                            echo "<td>
                                                <button class='btn btn-warning btn-sm' onclick='editUser($id_user, \"$username\", \"" . htmlspecialchars($row['password']) . "\", \"$nama\", \"$kode_kantor\", \"$role\")'>Edit</button>
                                                <button class='btn btn-danger btn-sm' onclick='deleteUser($id_user)'>Delete</button>
                                              </td>";
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

    <!-- Insert User Modal -->
    <div class="modal fade" id="insertUserModal" tabindex="-1" aria-labelledby="insertUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="insertUserModalLabel">Add New User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="insertUserForm">
                        <div class="mb-3">
                            <label for="insert_username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="insert_username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="insert_password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="insert_password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="insert_nama" class="form-label">Nama</label>
                            <input type="text" class="form-control" id="insert_nama" name="nama" required>
                        </div>
                        <div class="mb-3">
                            <label for="insert_kode_kantor" class="form-label">Kode Kantor</label>
                            <input type="text" class="form-control" id="insert_kode_kantor" name="kode_kantor" required>
                        </div>
                        <div class="mb-3">
                            <label for="insert_role" class="form-label">Role</label>
                            <select class="form-select" id="insert_role" name="role" required>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="insertUser()">Add User</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm">
                        <input type="hidden" id="edit_id" name="id">
                        <div class="mb-3">
                            <label for="edit_username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="edit_username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="edit_password" name="password">
                        </div>
                        <div class="mb-3">
                            <label for="edit_nama" class="form-label">Nama</label>
                            <input type="text" class="form-control" id="edit_nama" name="nama" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_kode_kantor" class="form-label">Kode Kantor</label>
                            <input type="text" class="form-control" id="edit_kode_kantor" name="kode_kantor" required>
                        </div>
                        <div class="mb-3">
                            <label for="edit_role" class="form-label">Role</label>
                            <select class="form-select" id="edit_role" name="role" required>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="updateUser()">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete User Modal -->
    <div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteUserModalLabel">Delete User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this user?</p>
                    <input type="hidden" id="delete_id">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" onclick="confirmDelete()">Delete</button>
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
    <script src="../../assets/static/js/pages/datatables.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.all.min.js"></script>

    <!-- JS untuk modal edit dan delete -->
    <script src="./scripts.js"></script>

</body>