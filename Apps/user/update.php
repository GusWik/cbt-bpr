<?php

require_once '../../config/db_cbt_v1.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $nama = $_POST['nama'];
    $kode_kantor = $_POST['kode_kantor'];
    $role = $_POST['role'];

    // Jika password tidak diubah, jangan update password
    if (empty($password)) {
        $sql = "UPDATE t_users SET username = ?, nama = ?, kode_kantor = ?, role = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssi", $username, $nama, $kode_kantor, $role, $id);
    } else {
        $sql = "UPDATE t_users SET username = ?, password = ?, nama = ?, kode_kantor = ?, role = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssssi", $username, $password, $nama, $kode_kantor, $role, $id);
    }

    if ($stmt->execute()) {
        echo json_encode(["success" => true]);
    } else {
        echo json_encode(["success" => false, "error" => $conn->error]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "error" => "Invalid request"]);
}

$conn->close();
