<?php
session_start();
require_once '../../config/db_cbt_v1.php';

// Set header JSON
header('Content-Type: application/json');

// Validasi input
if (!isset($_POST['tanggal'])) {
    echo json_encode(['status' => 'error', 'message' => 'Tanggal tidak ditemukan']);
    exit;
}

$tanggal = $_POST['tanggal'];

try {
    // Menyusun query untuk mengambil data dari t_peserta_ujian dan t_pegawai
    $query = "SELECT 
                p.id_peserta,
                pg.nm_pegawai as nama_pegawai,  -- Mengambil nama pegawai dari tabel t_pegawai
                p.kd_pegawai,  -- Menampilkan kode pegawai
                p.tgl_ujian,
                p.jml_soal,
                p.waktu_ujian,
                p.total_nilai_ujian,
                CASE 
                    WHEN p.total_nilai_ujian >= 65 THEN 'Lulus'   -- Menentukan status berdasarkan nilai
                    ELSE 'Tidak Lulus'
                END as status,
                CASE 
                    WHEN p.total_nilai_ujian >= 65 THEN 'green'   -- Menentukan warna untuk status
                    ELSE 'red'
                END as status_color
              FROM t_peserta_ujian p
              JOIN t_pegawai pg ON p.kd_pegawai = pg.kd_pegawai  -- Join dengan t_pegawai berdasarkan kd_pegawai
              WHERE DATE(p.tgl_ujian) = ?  -- Filter berdasarkan tanggal ujian
              ORDER BY p.tgl_ujian DESC";

    $stmt = $conn->prepare($query);
    $stmt->bind_param('s', $tanggal);  // Bind tanggal yang diterima
    $stmt->execute();
    $result = $stmt->get_result();

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;  // Menambahkan data yang diambil ke array $data
    }

    echo json_encode([
        'status' => 'success',
        'data' => $data  // Mengembalikan data dalam format JSON
    ]);
} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()  // Menangani error jika ada
    ]);
}
