<?php
session_start();
require_once '../../config/db_cbt_v1.php';

function hitungNilai($id_peserta)
{
    global $conn;

    // Ambil data peserta
    $query_peserta = "SELECT jml_soal FROM t_peserta_ujian WHERE id_peserta = ?";
    $stmt = $conn->prepare($query_peserta);
    $stmt->bind_param("i", $id_peserta);
    $stmt->execute();
    $result = $stmt->get_result();
    $peserta = $result->fetch_assoc();

    // Hitung jawaban benar
    $query_nilai = "SELECT COUNT(*) as total_benar 
                   FROM t_hasil_ujian 
                   WHERE id_peserta = ? AND nilai_per_soal = 1";
    $stmt = $conn->prepare($query_nilai);
    $stmt->bind_param("i", $id_peserta);
    $stmt->execute();
    $result = $stmt->get_result();
    $nilai = $result->fetch_assoc();

    // Kalkulasi nilai akhir
    $total_nilai = ($nilai['total_benar'] / $peserta['jml_soal']) * 100;

    // Update nilai di t_peserta_ujian
    $query_update = "UPDATE t_peserta_ujian 
                    SET total_nilai_ujian = ?, 
                        flag_aktif = 0 
                    WHERE id_peserta = ?";
    $stmt = $conn->prepare($query_update);
    $stmt->bind_param("ii", $total_nilai, $id_peserta);
    $stmt->execute();

    // Jika nilai 100, generate sertifikat
    if ($total_nilai == 100) {
        generateSertifikat($id_peserta);
    }

    return $total_nilai;
}

function generateSertifikat($id_peserta)
{
    global $conn;

    // Generate nomor sertifikat
    $no_sertifikat = "BPR/CBT/" . date('Y') . "/" . sprintf("%04d", $id_peserta);

    // Insert ke t_sertifikat
    $query = "INSERT INTO t_sertifikat (no_sertifikat, id_peserta, tgl_terbit) 
              VALUES (?, ?, CURDATE())";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("si", $no_sertifikat, $id_peserta);
    $stmt->execute();
}

// Response JSON
header('Content-Type: application/json');
$response = ['success' => true, 'message' => 'Nilai berhasil dikalkulasi'];
echo json_encode($response);
