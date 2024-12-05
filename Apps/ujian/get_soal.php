<?php
session_start();
require_once '../../config/db_cbt_v1.php';

if (!isset($_SESSION['username'])) {
    echo json_encode(['status' => 'error', 'message' => 'Session tidak valid']);
    exit;
}

$kd_pegawai = $_SESSION['username'];
$nomor_soal = isset($_POST['nomor']) ? (int)$_POST['nomor'] : 1;

// Jika belum ada daftar soal di session, generate dan simpan
if (!isset($_SESSION['soal_ids'])) {
    $query = "SELECT id_soal FROM t_bank_soal ORDER BY RAND()";
    $result = $conn->query($query);
    $soal_ids = [];
    while ($row = $result->fetch_assoc()) {
        $soal_ids[] = $row['id_soal'];
    }
    $_SESSION['soal_ids'] = $soal_ids;
}

// Ambil id soal dari daftar yang sudah diacak
$id_soal = $_SESSION['soal_ids'][$nomor_soal - 1];

// Query untuk mengambil detail soal
$query = "SELECT * FROM t_bank_soal WHERE id_soal = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('i', $id_soal);
$stmt->execute();
$result = $stmt->get_result();

if ($result && $result->num_rows > 0) {
    $soal = $result->fetch_assoc();
    $output = [
        'status' => 'success',
        'id_soal' => $soal['id_soal'],
        'nomor' => $nomor_soal,
        'pertanyaan' => $soal['pertanyaan'],
        'pilihan_a' => $soal['pilihan_a'],
        'pilihan_b' => $soal['pilihan_b'],
        'pilihan_c' => $soal['pilihan_c'],
        'pilihan_d' => $soal['pilihan_d']
    ];
} else {
    $output = [
        'status' => 'error',
        'message' => 'Soal tidak ditemukan'
    ];
}

header('Content-Type: application/json');
echo json_encode($output);
