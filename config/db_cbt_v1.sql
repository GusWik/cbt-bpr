/*
 Navicat Premium Data Transfer

 Source Server         : MySql XAMPP
 Source Server Type    : MySQL
 Source Server Version : 100417 (10.4.17-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_cbt_v1

 Target Server Type    : MySQL
 Target Server Version : 100417 (10.4.17-MariaDB)
 File Encoding         : 65001

 Date: 05/12/2024 11:12:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bank_soal
-- ----------------------------
DROP TABLE IF EXISTS `t_bank_soal`;
CREATE TABLE `t_bank_soal`  (
  `id_soal` int NOT NULL AUTO_INCREMENT,
  `bidang_soal` int NOT NULL,
  `pertanyaan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilihan_a` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilihan_b` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilihan_c` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pilihan_d` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jawaban_benar` enum('a','b','c','d','e','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_soal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bank_soal
-- ----------------------------
INSERT INTO `t_bank_soal` VALUES (3, 1, 'helpdesk', 'helpdesk', 'helpdesk', 'helpdesk', 'helpdesk', 'a', '2024-10-22 11:08:57');
INSERT INTO `t_bank_soal` VALUES (4, 1, 'Apa fungsi utama dari bank sentral?', 'Menerbitkan obligasi', 'Mengawasi perbankan', 'Mengatur kebijakan moneter', 'Memberikan pinjaman kepada nasabah', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (5, 1, 'Apa itu deposito?', 'Tabungan yang dapat diambil kapan saja', 'Investasi jangka panjang', 'Simpanan berjangka di bank', 'Dana talangan', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (6, 1, 'Apa kepanjangan dari BI dalam dunia perbankan Indonesia?', 'Bank Indonesia', 'Bank Internasional', 'Bank Investasi', 'Bank Independen', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (7, 1, 'Apa yang dimaksud dengan giro?', 'Tabungan berjangka', 'Tabungan yang memiliki bunga tetap', 'Simpanan yang dapat ditarik dengan cek', 'Investasi dengan risiko rendah', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (8, 1, 'Apa itu kredit macet?', 'Pinjaman yang gagal dibayar', 'Pinjaman dengan bunga tinggi', 'Pinjaman tanpa agunan', 'Pinjaman dengan tenor panjang', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (9, 1, 'Apa fungsi dari OJK?', 'Mengatur dan mengawasi sektor jasa keuangan', 'Menerbitkan uang', 'Memberikan pinjaman', 'Mengelola dana pensiun', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (10, 1, 'Apa itu bunga bank?', 'Biaya administrasi bulanan', 'Keuntungan yang diberikan oleh bank untuk simpanan', 'Hasil investasi bank', 'Jumlah total tabungan nasabah', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (11, 1, 'Apa arti dari istilah \"likuiditas\" dalam perbankan?', 'Kemampuan bank untuk membayar utang jangka panjang', 'Kemampuan bank untuk memenuhi kewajiban jangka pendek', 'Jumlah nasabah yang dimiliki bank', 'Jumlah uang tunai yang tersedia di bank', 'a', '2024-12-03 16:44:54');
INSERT INTO `t_bank_soal` VALUES (12, 1, 'Apa yang dimaksud dengan pinjaman tanpa agunan?', 'Pinjaman dengan jaminan aset', 'Pinjaman tanpa jaminan', 'Pinjaman dengan bunga tetap', 'Pinjaman yang hanya untuk usaha', 'a', '2024-12-03 16:44:54');

-- ----------------------------
-- Table structure for t_bidang_soal
-- ----------------------------
DROP TABLE IF EXISTS `t_bidang_soal`;
CREATE TABLE `t_bidang_soal`  (
  `id_bidang_soal` int NOT NULL AUTO_INCREMENT,
  `nm_bidang_soal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_bidang_soal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bidang_soal
-- ----------------------------
INSERT INTO `t_bidang_soal` VALUES (1, 'Operasional');
INSERT INTO `t_bidang_soal` VALUES (2, 'Bisnis');
INSERT INTO `t_bidang_soal` VALUES (3, 'Kepatuhan');
INSERT INTO `t_bidang_soal` VALUES (4, 'Bisnis');
INSERT INTO `t_bidang_soal` VALUES (5, 'Menejemen Risiko');

-- ----------------------------
-- Table structure for t_hasil_ujian
-- ----------------------------
DROP TABLE IF EXISTS `t_hasil_ujian`;
CREATE TABLE `t_hasil_ujian`  (
  `id_hasil_ujian` int NOT NULL AUTO_INCREMENT,
  `tgl_ujian` date NOT NULL,
  `id_peserta` int NOT NULL,
  `id_soal` int NOT NULL,
  `jawaban_dipilih` enum('a','b','c','d','e','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nilai_per_soal` int NULL DEFAULT 0 COMMENT 'Jawaban Benar=1, Jawaban Salah=0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_hasil_ujian`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hasil_ujian
-- ----------------------------
INSERT INTO `t_hasil_ujian` VALUES (1, '2024-12-05', 1, 3, 'a', 1, '2024-12-05 10:40:50');
INSERT INTO `t_hasil_ujian` VALUES (2, '2024-12-05', 1, 4, 'b', 0, '2024-12-05 10:40:53');
INSERT INTO `t_hasil_ujian` VALUES (3, '2024-12-05', 1, 3, 'a', 1, '2024-12-05 10:48:29');
INSERT INTO `t_hasil_ujian` VALUES (4, '2024-12-05', 1, 4, 'b', 0, '2024-12-05 10:48:33');
INSERT INTO `t_hasil_ujian` VALUES (5, '2024-12-05', 1, 5, 'c', 0, '2024-12-05 10:48:37');
INSERT INTO `t_hasil_ujian` VALUES (6, '2024-12-05', 1, 6, 'b', 0, '2024-12-05 10:48:44');
INSERT INTO `t_hasil_ujian` VALUES (7, '2024-12-05', 1, 7, 'c', 0, '2024-12-05 10:48:46');
INSERT INTO `t_hasil_ujian` VALUES (8, '2024-12-05', 1, 8, 'a', 1, '2024-12-05 10:48:47');
INSERT INTO `t_hasil_ujian` VALUES (9, '2024-12-05', 1, 8, 'b', 0, '2024-12-05 10:48:48');
INSERT INTO `t_hasil_ujian` VALUES (10, '2024-12-05', 1, 8, 'a', 1, '2024-12-05 10:48:50');
INSERT INTO `t_hasil_ujian` VALUES (11, '2024-12-05', 1, 9, 'b', 0, '2024-12-05 10:48:52');
INSERT INTO `t_hasil_ujian` VALUES (12, '2024-12-05', 1, 10, 'a', 1, '2024-12-05 10:48:53');
INSERT INTO `t_hasil_ujian` VALUES (13, '2024-12-05', 1, 11, 'b', 0, '2024-12-05 10:48:55');
INSERT INTO `t_hasil_ujian` VALUES (14, '2024-12-05', 1, 12, 'a', 1, '2024-12-05 10:48:57');
INSERT INTO `t_hasil_ujian` VALUES (15, '2024-12-05', 1, 0, 'a', 0, '2024-12-05 10:48:59');
INSERT INTO `t_hasil_ujian` VALUES (16, '2024-12-05', 3, 3, 'a', 1, '2024-12-05 11:10:18');
INSERT INTO `t_hasil_ujian` VALUES (17, '2024-12-05', 3, 4, 'a', 1, '2024-12-05 11:10:22');
INSERT INTO `t_hasil_ujian` VALUES (18, '2024-12-05', 3, 5, 'b', 0, '2024-12-05 11:10:25');
INSERT INTO `t_hasil_ujian` VALUES (19, '2024-12-05', 3, 6, 'a', 1, '2024-12-05 11:10:29');
INSERT INTO `t_hasil_ujian` VALUES (20, '2024-12-05', 3, 7, 'a', 1, '2024-12-05 11:10:31');
INSERT INTO `t_hasil_ujian` VALUES (21, '2024-12-05', 3, 8, 'a', 1, '2024-12-05 11:10:32');
INSERT INTO `t_hasil_ujian` VALUES (22, '2024-12-05', 3, 9, 'a', 1, '2024-12-05 11:10:35');
INSERT INTO `t_hasil_ujian` VALUES (23, '2024-12-05', 3, 10, 'b', 0, '2024-12-05 11:10:38');
INSERT INTO `t_hasil_ujian` VALUES (24, '2024-12-05', 3, 11, 'c', 0, '2024-12-05 11:10:39');
INSERT INTO `t_hasil_ujian` VALUES (25, '2024-12-05', 3, 12, 'd', 0, '2024-12-05 11:10:41');
INSERT INTO `t_hasil_ujian` VALUES (26, '2024-12-05', 3, 0, 'd', 0, '2024-12-05 11:10:44');

-- ----------------------------
-- Table structure for t_kantor
-- ----------------------------
DROP TABLE IF EXISTS `t_kantor`;
CREATE TABLE `t_kantor`  (
  `id_kantor` int NOT NULL AUTO_INCREMENT,
  `kode_kantor` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kantor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kantor`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_kantor
-- ----------------------------
INSERT INTO `t_kantor` VALUES (1, '000', 'KPNO Mataram ');
INSERT INTO `t_kantor` VALUES (2, '001', 'POKP Mataram ');
INSERT INTO `t_kantor` VALUES (3, '002', 'KC Gerung');
INSERT INTO `t_kantor` VALUES (4, '003', 'KC Narmada ');
INSERT INTO `t_kantor` VALUES (5, '004', 'KC Labuapi ');
INSERT INTO `t_kantor` VALUES (6, '005', 'KC Kuripan');
INSERT INTO `t_kantor` VALUES (7, '006', 'KC Gunung Sari');
INSERT INTO `t_kantor` VALUES (8, '007', 'KC Kayangan');
INSERT INTO `t_kantor` VALUES (9, '008', 'KC Bayan');
INSERT INTO `t_kantor` VALUES (10, '009', 'KC Praya');
INSERT INTO `t_kantor` VALUES (11, '010', 'KC Praya Timur');
INSERT INTO `t_kantor` VALUES (12, '011', 'KC Janapria');
INSERT INTO `t_kantor` VALUES (13, '012', 'KC Batukliang');
INSERT INTO `t_kantor` VALUES (14, '013', 'KC Pujut');
INSERT INTO `t_kantor` VALUES (15, '014', 'KC Jonggat');
INSERT INTO `t_kantor` VALUES (16, '015', 'KC Kopang');
INSERT INTO `t_kantor` VALUES (17, '016', 'KC Praya Barat');
INSERT INTO `t_kantor` VALUES (18, '017', 'KC Pringgarata');
INSERT INTO `t_kantor` VALUES (19, '018', 'KC Selong');
INSERT INTO `t_kantor` VALUES (20, '019', 'KC Montong Betok ');
INSERT INTO `t_kantor` VALUES (21, '020', 'KC Kotaraja');
INSERT INTO `t_kantor` VALUES (22, '021', 'KC Paokmotong');
INSERT INTO `t_kantor` VALUES (23, '022', 'KC Dasan Lekong ');
INSERT INTO `t_kantor` VALUES (24, '023', 'KC Aikmel');
INSERT INTO `t_kantor` VALUES (25, '024', 'KC Labuhan Lombok');
INSERT INTO `t_kantor` VALUES (26, '025', 'KC Sambelia');
INSERT INTO `t_kantor` VALUES (27, '026', 'KC Taliwang');
INSERT INTO `t_kantor` VALUES (28, '027', 'KC Seteluk');
INSERT INTO `t_kantor` VALUES (29, '028', 'KC Sumbawa');
INSERT INTO `t_kantor` VALUES (30, '029', 'KC Empang');
INSERT INTO `t_kantor` VALUES (31, '030', 'KC Plampang');
INSERT INTO `t_kantor` VALUES (32, '031', 'KC Lopok');
INSERT INTO `t_kantor` VALUES (33, '032', 'KC Moyo');
INSERT INTO `t_kantor` VALUES (34, '033', 'KC Lenangguar');
INSERT INTO `t_kantor` VALUES (35, '034', 'KC Labuhan Sumbawa');
INSERT INTO `t_kantor` VALUES (36, '035', 'KC Utan');
INSERT INTO `t_kantor` VALUES (37, '036', 'KC Alas');
INSERT INTO `t_kantor` VALUES (38, '037', 'KC Dompu');
INSERT INTO `t_kantor` VALUES (39, '038', 'KC Montabaru');
INSERT INTO `t_kantor` VALUES (40, '039', 'KC Soriutu');
INSERT INTO `t_kantor` VALUES (41, '040', 'KC Rasabou');
INSERT INTO `t_kantor` VALUES (42, '041', 'KC Bima');
INSERT INTO `t_kantor` VALUES (43, '042', 'KC Woha');
INSERT INTO `t_kantor` VALUES (44, '043', 'KC Bolo');
INSERT INTO `t_kantor` VALUES (45, '044', 'KC Sape');

-- ----------------------------
-- Table structure for t_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `t_pegawai`;
CREATE TABLE `t_pegawai`  (
  `id_pegawai` int NOT NULL AUTO_INCREMENT,
  `kd_pegawai` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nm_pegawai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan_pegawai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_kantor` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pegawai`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 498 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pegawai
-- ----------------------------
INSERT INTO `t_pegawai` VALUES (1, 'X01001', 'User test', 'Admin Operasional', '000');
INSERT INTO `t_pegawai` VALUES (2, 'X0003', 'ISLAN HULAOLI, S.E.', 'Pemimpin Satuan Kerja  Manajemen Risiko', '000');
INSERT INTO `t_pegawai` VALUES (3, 'X0004', 'SUMIATUN, S.E.', 'Pemimpin Satuan Kerja Audit Intern (SKAI)', '000');
INSERT INTO `t_pegawai` VALUES (4, 'X0005', 'MOH. ZUHROL FATA, S.E.I.', 'Pemimpin Divisi Operasional', '000');
INSERT INTO `t_pegawai` VALUES (5, 'X0010', 'IRWANSYAH, A.Md.', 'Pemimpin Sub Divisi Perencanaan dan Pengembangan', '000');
INSERT INTO `t_pegawai` VALUES (6, 'X0011', 'UNTUNG SUNARYO, A.Md.', 'Pemimpin Sub Divisi IT', '000');
INSERT INTO `t_pegawai` VALUES (7, 'X0012', 'HENDRO SUDIYANTO, S.T.', 'Pemimpin Sub Divisi Pelaporan dan Akuntansi', '000');
INSERT INTO `t_pegawai` VALUES (8, 'X0013', 'SRI PUJI ASTUTI, S.Mn.', 'Pemimpin Sub Divisi Umum', '000');
INSERT INTO `t_pegawai` VALUES (9, 'X0014', 'ABDUL KARIM, S.E.', 'Pemimpin Sub  Satuan Kerja Kepatuhan', '000');
INSERT INTO `t_pegawai` VALUES (10, 'X0015', 'YUSUF SA\'BAN, S.E.', 'Pemimpin Satuan Kerja Kepatuhan dan APU-PPT', '000');
INSERT INTO `t_pegawai` VALUES (11, 'X0016', 'AMI BRIMAPON,S.Kom.', 'Pemimpin Divisi Bisnis', '000');
INSERT INTO `t_pegawai` VALUES (12, 'X0017', 'LALU MUSLIHIN, S.E.', 'Penyelia Penyelamatan Kredit', '000');
INSERT INTO `t_pegawai` VALUES (13, 'X0018', 'FARIDA MUKMINA, S.E.', 'Pemimpin Sub Divisi Dana dan Literasi', '000');
INSERT INTO `t_pegawai` VALUES (14, 'X0019', 'SABARUDIN, S.E.', 'Auditor KPNO', '000');
INSERT INTO `t_pegawai` VALUES (15, 'X0020', 'MUH. AGISNI', 'Penyelia Literasi', '000');
INSERT INTO `t_pegawai` VALUES (16, 'X0022', 'ADE PERDANA PUTRA, S.E.', 'Pemimpin Sub Divisi Sekretaris', '000');
INSERT INTO `t_pegawai` VALUES (17, 'X0025', 'M. SARIF WAHYUDI', 'Administrasi APU-PPT', '000');
INSERT INTO `t_pegawai` VALUES (18, 'X0026', 'SISWANTO', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (19, 'X0027', 'MAHYUNI', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (20, 'X0028', 'HURAISAH', 'Administrasi Kepatuhan', '000');
INSERT INTO `t_pegawai` VALUES (21, 'X0030', 'RUSDI', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (22, 'X0035', 'YOGA SEPTIANDREI', 'Penyelia Perencanaan ', '000');
INSERT INTO `t_pegawai` VALUES (23, 'X0041', 'AUDITRA BELLA ASSAKHA', 'Administrasi Dana', '000');
INSERT INTO `t_pegawai` VALUES (24, 'X0043', 'AGGIED DWI INTAN PERMATASARI', 'Penyelia Kredit', '000');
INSERT INTO `t_pegawai` VALUES (25, 'X0045', 'NANA ZAFIRA', 'Administrasi Kredit', '000');
INSERT INTO `t_pegawai` VALUES (26, 'X0097', 'RAHMAWATI', 'Pemimpin Sub Divisi SDM', '000');
INSERT INTO `t_pegawai` VALUES (27, 'X0109', 'WARSITO', 'Penyelia  Penyelesaian Kredit', '000');
INSERT INTO `t_pegawai` VALUES (28, 'X0128', 'ISWANTO AGUS SANTOSO, S.Kom.', 'Penyelia Pelaporan dan Akuntansi', '000');
INSERT INTO `t_pegawai` VALUES (29, 'X0129', 'H. SUBHAN, S.H.', 'Auditor Wilayah mataram, Lombok Barat dan Lombok Utara', '000');
INSERT INTO `t_pegawai` VALUES (30, 'X0163', 'SRI UTAMI BUDIWATI, S.E.', 'Administrasi SDM', '000');
INSERT INTO `t_pegawai` VALUES (31, 'X0165', 'LALU FAHRURROZI, S.E.', 'Auditor Wilayah Lombok Timur', '000');
INSERT INTO `t_pegawai` VALUES (32, 'X0187', 'POPY AMALIA SAPUTRI, A.Md.', 'Penyelia SDM', '000');
INSERT INTO `t_pegawai` VALUES (33, 'X0213', 'H. LALU DIDI JANUARDI, S.E.', 'Pemimpin Divisi Perencanaan dan Pengembangan', '000');
INSERT INTO `t_pegawai` VALUES (34, 'X0228', 'LALU ADI FANSYURI, S.E.', 'Pemimpin Sub SKAI', '000');
INSERT INTO `t_pegawai` VALUES (35, 'X0267', 'KHAIRUNNISA, S.E.', 'Auditor Wilayah Lombok tengah', '000');
INSERT INTO `t_pegawai` VALUES (36, 'X0276', 'SARINDAWAN, S.E.', 'Pemimpin Sub Divisi Penyelamatan Kredit', '000');
INSERT INTO `t_pegawai` VALUES (37, 'X0307', 'SRI HARTATI, S.E.', 'Auditor Wilayah KSB', '000');
INSERT INTO `t_pegawai` VALUES (38, 'X0329', 'SUPIADI, S.E.', 'Auditor Wilayah Sumbawa', '000');
INSERT INTO `t_pegawai` VALUES (39, 'X0384', 'AKHMAD ISWANDI, S.T.', 'Staf SKAI', '000');
INSERT INTO `t_pegawai` VALUES (40, 'X0418', 'SYAMSIAH, S.E.', 'Administrasi SDM', '000');
INSERT INTO `t_pegawai` VALUES (41, 'X0420', 'TITI SUMARTI, S.E.', 'Auditor wilayah Dompu', '000');
INSERT INTO `t_pegawai` VALUES (42, 'X0438', 'NURHAYATI, S.E.', 'Administrasi SDM', '000');
INSERT INTO `t_pegawai` VALUES (43, 'X0448', 'ARUNG SAMUDRA, S.H.', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (44, 'X0451', 'ILHAM HADISURYA, S.E.', 'Pemimpin Sub Satker  APU-PPT', '000');
INSERT INTO `t_pegawai` VALUES (45, 'X0475', 'NURWAHIDAH, S.P.', 'Auditor Wilayah Bima', '000');
INSERT INTO `t_pegawai` VALUES (46, 'X0560', 'AHMAD MU\'ALLAL HIFNI', 'Administrasi Pelaporan dan Akuntansi', '000');
INSERT INTO `t_pegawai` VALUES (47, 'X0587', 'M. RAIHAN MUBARAQ', 'Anggota Komite ', '000');
INSERT INTO `t_pegawai` VALUES (48, 'X0594', 'HUDA YATUR RAHMAN', 'Administrasi Manajemen Risiko', '000');
INSERT INTO `t_pegawai` VALUES (49, 'X0598', 'MUHAMMAD YUNANI', 'Administrasi Rumah Tangga', '000');
INSERT INTO `t_pegawai` VALUES (50, 'X0599', 'MUHAMMAD RIZDARAHMAN', 'Administrasi Rumah Tangga', '000');
INSERT INTO `t_pegawai` VALUES (51, 'X0607', 'IDA BAGUS WIDIANTARA', 'Administrasi IT', '000');
INSERT INTO `t_pegawai` VALUES (52, 'X0608', 'DWINA MEISONYA', 'Administrasi SDM', '000');
INSERT INTO `t_pegawai` VALUES (53, 'X0614', 'SARAH AINUN PUSPANINGTIAS', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (54, 'X0686', 'VARIZKA SALSABILLA WULANDARI', 'Administrasi Umum', '000');
INSERT INTO `t_pegawai` VALUES (55, 'X0021', 'DELVI WULANDARI, S.E.', 'Penyelia Operasional', '001');
INSERT INTO `t_pegawai` VALUES (56, 'X0033', 'BAIQ ENDANG MAHARAWATI', 'Penyelia Bisnis', '001');
INSERT INTO `t_pegawai` VALUES (57, 'X0034', 'SLAMETO', 'Penyelia Penyelamatan Kredit', '001');
INSERT INTO `t_pegawai` VALUES (58, 'X0037', 'APRIMA ROHMAYATI', 'Kepala Kantor Kas Bertais', '001');
INSERT INTO `t_pegawai` VALUES (59, 'X0040', 'NUR AAN ROHAIDAH', 'AO Pengembangan Kredit', '001');
INSERT INTO `t_pegawai` VALUES (60, 'X0100', 'AHMAD HARMAIN, S.H.', 'Analis Kredit', '001');
INSERT INTO `t_pegawai` VALUES (61, 'X0173', 'ROHAYATI, A.Md.', 'Teller Kantor Kas Bertais', '001');
INSERT INTO `t_pegawai` VALUES (62, 'X0442', 'LALU ATMAHADI, S.H.', 'Pemimpin Cabang', '001');
INSERT INTO `t_pegawai` VALUES (63, 'X0564', 'ANNISA RAHMAWATI', 'Administrasi Operasional', '001');
INSERT INTO `t_pegawai` VALUES (64, 'X0590', 'SITI MAESYARAH', 'AO Pengembangan Kredit', '001');
INSERT INTO `t_pegawai` VALUES (65, 'X0593', 'IDA BAGUS NARARYA PRAYASCITA ADNYANA', 'Funding Officer', '001');
INSERT INTO `t_pegawai` VALUES (66, 'X0612', 'NIDYA PUSPITA PRATIWI', 'Administrasi Umum', '001');
INSERT INTO `t_pegawai` VALUES (67, 'X0624', 'NANDA SETIA LESTARI', 'Teller', '001');
INSERT INTO `t_pegawai` VALUES (68, 'X0647', 'DESY RAHMI MARIANA', 'Funding Officer', '001');
INSERT INTO `t_pegawai` VALUES (69, 'X0659', 'I PUTU CINDY ARY SUHARTHA', 'AO Penyelamatan Kredit', '001');
INSERT INTO `t_pegawai` VALUES (70, 'X0023', 'NUR KAMARIA', 'AO Pengembangan Kredit', '002');
INSERT INTO `t_pegawai` VALUES (71, 'X0031', 'KHAIRUNNISA ARIANY ZAIN', 'Pemimpin Cabang', '002');
INSERT INTO `t_pegawai` VALUES (72, 'X0038', 'LALU RESKY EKA SAPUTRA', 'Penyelia Bisnis', '002');
INSERT INTO `t_pegawai` VALUES (73, 'X0042', 'NURHAYATI, S.Pd.', 'Administrasi Operasional', '002');
INSERT INTO `t_pegawai` VALUES (74, 'X0052', 'URWATUL AINY, A.Md.', 'Penyelia Penyelamatan Kredit', '002');
INSERT INTO `t_pegawai` VALUES (75, 'X0102', 'HABIBAH', 'Analis Kredit', '002');
INSERT INTO `t_pegawai` VALUES (76, 'X0111', 'SAEFUL HAQ', 'AO Penyelamatan Kredit', '002');
INSERT INTO `t_pegawai` VALUES (77, 'X0630', 'ARIGHI DEWANTARA', 'Funding Officer', '002');
INSERT INTO `t_pegawai` VALUES (78, 'X0669', 'MAUDIANA DWI NOVITASARI', 'Teller', '002');
INSERT INTO `t_pegawai` VALUES (79, 'X0032', 'BAIQ NURAINI', 'Penyelia Operasional', '003');
INSERT INTO `t_pegawai` VALUES (80, 'X0069', 'SARIMAH', 'Funding Officer', '003');
INSERT INTO `t_pegawai` VALUES (81, 'X0072', 'BAIQ ROSIANI RAHAYU, S.E.', 'Analis Kredit', '003');
INSERT INTO `t_pegawai` VALUES (82, 'X0076', 'M. AMIN FAJRI, A.Md.', 'Penyelia Penyelamatan Kredit', '003');
INSERT INTO `t_pegawai` VALUES (83, 'X0089', 'SUKRIADI', 'AO Penyelamatan Kredit', '003');
INSERT INTO `t_pegawai` VALUES (84, 'X0091', 'DATU AFRIAN SUTEJA', 'Penyelia Bisnis', '003');
INSERT INTO `t_pegawai` VALUES (85, 'X0098', 'WAHYULI HARYANTI', 'Teller', '003');
INSERT INTO `t_pegawai` VALUES (86, 'X0282', 'BAIQ ISMAYA SUNU, S.E.', 'Administrasi Operasional', '003');
INSERT INTO `t_pegawai` VALUES (87, 'X0328', 'ABDUS SALAM, S E.', 'Pemimpin Cabang', '003');
INSERT INTO `t_pegawai` VALUES (88, 'X0616', 'MUHAMMAD ANDRY KURNIAWAN', 'AO Pengembangan Kredit', '003');
INSERT INTO `t_pegawai` VALUES (89, 'X0661', 'INGGIT YUSTIKA', 'Funding Officer', '003');
INSERT INTO `t_pegawai` VALUES (90, 'X0036', 'ANNISA HIDAYATI', 'Penyelia Penyelamatan Kredit', '004');
INSERT INTO `t_pegawai` VALUES (91, 'X0044', 'SEKA PRATIA GUSNIAJAM', 'Analis Kredit', '004');
INSERT INTO `t_pegawai` VALUES (92, 'X0079', 'SUKRAN', 'AO Pengembangan Kredit', '004');
INSERT INTO `t_pegawai` VALUES (93, 'X0080', 'SITI RAHMAH, S.Adm.', 'Funding Officer', '004');
INSERT INTO `t_pegawai` VALUES (94, 'X0081', 'FITRIYAH, A.Md.', 'Penyelia Bisnis', '004');
INSERT INTO `t_pegawai` VALUES (95, 'X0364', 'YULIANTI, S.E.', 'Penyelia Operasional', '004');
INSERT INTO `t_pegawai` VALUES (96, 'X0596', 'DIAN PANDU HIDAYAT', 'AO Penyelamatan Kredit', '004');
INSERT INTO `t_pegawai` VALUES (97, 'X0615', 'SEPTI YUNITA SARI', 'AO Pengembangan Kredit', '004');
INSERT INTO `t_pegawai` VALUES (98, 'X0622', 'FAJRI RIADI', 'Funding Officer', '004');
INSERT INTO `t_pegawai` VALUES (99, 'X0675', 'NANDYTA FRISMAYA PUTRI', 'Administrasi Operasional', '004');
INSERT INTO `t_pegawai` VALUES (100, 'X0682', 'SWARIN PUTRI SAHLYA', 'Teller', '004');
INSERT INTO `t_pegawai` VALUES (101, 'X0057', 'ZUHRIYAH', 'AO Pengembangan Kredit', '005');
INSERT INTO `t_pegawai` VALUES (102, 'X0067', 'ROHATI, S.Sos.', 'Penyelia Operasional', '005');
INSERT INTO `t_pegawai` VALUES (103, 'X0088', 'MARMUJAHIDIN, A.Md.', 'AO Pengembangan Kredit', '005');
INSERT INTO `t_pegawai` VALUES (104, 'X0126', 'SAMSUL BAHRI', 'Penyelia Bisnis', '005');
INSERT INTO `t_pegawai` VALUES (105, 'X0199', 'YENI NOVARINA, S.E.', 'Pemimpin Cabang', '005');
INSERT INTO `t_pegawai` VALUES (106, 'X0220', 'WITYASNU HADI, S.Pd.', 'Analis Kredit', '005');
INSERT INTO `t_pegawai` VALUES (107, 'X0563', 'VIKA ELMIATIN', 'Administrasi Operasional', '005');
INSERT INTO `t_pegawai` VALUES (108, 'X0629', 'ST. AINUN UTAMY PUTRI', 'Funding Officer', '005');
INSERT INTO `t_pegawai` VALUES (109, 'X0655', 'GEDE SUPUTRA WIJAYA DHARMA', 'AO Penyelamatan Kredit', '005');
INSERT INTO `t_pegawai` VALUES (110, 'X0680', 'SALSHABILA', 'Teller', '005');
INSERT INTO `t_pegawai` VALUES (111, 'X0039', 'DADANG KURNIAWAN', 'Analis Kredit', '006');
INSERT INTO `t_pegawai` VALUES (112, 'X0054', 'LALU MUH. ZAKARIA', 'Pemimpin Cabang', '006');
INSERT INTO `t_pegawai` VALUES (113, 'X0070', 'DENDA EKA FITRIANI, A.Md.', 'Teller', '006');
INSERT INTO `t_pegawai` VALUES (114, 'X0077', 'GUSDIANA KOMALA DEWI, S.Adm.', 'Penyelia Operasional', '006');
INSERT INTO `t_pegawai` VALUES (115, 'X0099', 'MUHAMMAD HAMZANI', 'AO Pengembangan Kredit', '006');
INSERT INTO `t_pegawai` VALUES (116, 'X0101', 'IRFAN TAUFIQ, A.Md.', 'Penyelia Bisnis', '006');
INSERT INTO `t_pegawai` VALUES (117, 'X0214', 'SUGIHARTO, S.E.', 'Penyelia Penyelamatan Kredit', '006');
INSERT INTO `t_pegawai` VALUES (118, 'X0559', 'MADE INDRIANI RISANTI DEWI', 'Administrasi Operasional', '006');
INSERT INTO `t_pegawai` VALUES (119, 'X0628', 'GHALIB GALIHSTAN ABIMANYU', 'AO Penyelamatan Kredit', '006');
INSERT INTO `t_pegawai` VALUES (120, 'X0662', 'IZKA ARDINAVAIZURA', 'Funding Officer', '006');
INSERT INTO `t_pegawai` VALUES (121, 'X0053', 'LALU MUHTAR ISWADI', 'Pemimpin Cabang', '007');
INSERT INTO `t_pegawai` VALUES (122, 'X0056', 'AHMAD MIZWAR, A.Md.', 'AO Penyelamatan Kredit', '007');
INSERT INTO `t_pegawai` VALUES (123, 'X0105', 'HADIJAH', 'Penyelia Penyelamatan Kredit', '007');
INSERT INTO `t_pegawai` VALUES (124, 'X0106', 'LALU BASRI', 'Penyelia Bisnis', '007');
INSERT INTO `t_pegawai` VALUES (125, 'X0107', 'SUGENG WIJANARKO', 'Penyelia Operasional', '007');
INSERT INTO `t_pegawai` VALUES (126, 'X0108', 'HAMDI', 'Analis Kredit', '007');
INSERT INTO `t_pegawai` VALUES (127, 'X0110', 'RIATIP, S.Pd.', 'AO Pengembangan Kredit', '007');
INSERT INTO `t_pegawai` VALUES (128, 'X0595', 'GEDE TEGUH M. PRAYITNA', 'AO Penyelamatan Kredit', '007');
INSERT INTO `t_pegawai` VALUES (129, 'X0625', 'NANDA TUHFATUL ATQIYA', 'Teller', '007');
INSERT INTO `t_pegawai` VALUES (130, 'X0688', 'YADAN HAQQY', 'Funding Officer', '007');
INSERT INTO `t_pegawai` VALUES (131, 'X0692', 'ZELLY ALFANY', 'Administrasi Operasional', '007');
INSERT INTO `t_pegawai` VALUES (132, 'X0104', 'IDAN, S.E.', 'Pemimpin Cabang', '008');
INSERT INTO `t_pegawai` VALUES (133, 'X0112', 'AYUNISASIH', 'Teller', '008');
INSERT INTO `t_pegawai` VALUES (134, 'X0115', 'HASANAH', 'Penyelia Bisnis', '008');
INSERT INTO `t_pegawai` VALUES (135, 'X0116', 'KETUT CARIASTA', 'Penyelia Penyelamatan Kredit', '008');
INSERT INTO `t_pegawai` VALUES (136, 'X0117', 'AHMAD EFENDI, A.Md.', 'Penyelia Operasional', '008');
INSERT INTO `t_pegawai` VALUES (137, 'X0118', 'ZAENUDIN', 'Funding Officer', '008');
INSERT INTO `t_pegawai` VALUES (138, 'X0119', 'INSUN', 'AO Pengembangan Kredit', '008');
INSERT INTO `t_pegawai` VALUES (139, 'X0120', 'BAIQ KARTINI', 'Administrasi Umum', '008');
INSERT INTO `t_pegawai` VALUES (140, 'X0121', 'NURMAEDI', 'Analis Kredit', '008');
INSERT INTO `t_pegawai` VALUES (141, 'X0122', 'RADEN WIRA KARMA', 'AO Pengembangan Kredit', '008');
INSERT INTO `t_pegawai` VALUES (142, 'X0604', 'PUJA GADUH RAKSA', 'Administrasi Operasional', '008');
INSERT INTO `t_pegawai` VALUES (143, 'X0668', 'MAS ZIBANG SUBADIL', 'Funding Officer', '008');
INSERT INTO `t_pegawai` VALUES (144, 'X0009', 'SUPARDI,  S.E.', 'Pemimpin Cabang', '009');
INSERT INTO `t_pegawai` VALUES (145, 'X0131', 'LAI\'IN MEIDIA HASTUTI, S.H.', 'Teller', '009');
INSERT INTO `t_pegawai` VALUES (146, 'X0160', 'IKA ROSDIANA, S.H.', 'Analis Kredit', '009');
INSERT INTO `t_pegawai` VALUES (147, 'X0162', 'Hj. MARIATI, S.E.', 'AO Penyelamatan Kredit', '009');
INSERT INTO `t_pegawai` VALUES (148, 'X0174', 'SIDIK', 'Penyelia Bisnis', '009');
INSERT INTO `t_pegawai` VALUES (149, 'X0182', 'MUKIM, S.E.', 'Penyelia Penyelamatan Kredit', '009');
INSERT INTO `t_pegawai` VALUES (150, 'X0183', 'H. MOHAMMAD MAKI', 'Funding Officer', '009');
INSERT INTO `t_pegawai` VALUES (151, 'X0216', 'H. MUHAMAD ZAENURI', 'AO Pengembangan Kredit', '009');
INSERT INTO `t_pegawai` VALUES (152, 'X0218', 'ABDUL HANAN', 'AO Penyelamatan Kredit', '009');
INSERT INTO `t_pegawai` VALUES (153, 'X0219', 'ZUHAEMAH, S.E.', 'Penyelia Operasional', '009');
INSERT INTO `t_pegawai` VALUES (154, 'X0567', 'MUHAMMAD ISTIQLAL', 'Administrasi Operasional', '009');
INSERT INTO `t_pegawai` VALUES (155, 'X0667', 'M. NAUFAL MAHARDHIKA PRANANDA', 'Funding Officer', '009');
INSERT INTO `t_pegawai` VALUES (156, 'X0024', 'DARA SASKIA MESAYU, S.E.', 'Penyelia Operasional', '010');
INSERT INTO `t_pegawai` VALUES (157, 'X0135', 'EMI KRISNAWATI, S.E.', 'Penyelia Bisnis', '010');
INSERT INTO `t_pegawai` VALUES (158, 'X0144', 'ABDUL WARIS', 'AO Pengembangan Kredit', '010');
INSERT INTO `t_pegawai` VALUES (159, 'X0151', 'H. YUDI JANUAR WEDEN, S.E.', 'Pemimpin Cabang', '010');
INSERT INTO `t_pegawai` VALUES (160, 'X0153', 'MUHAMAD BUDIARLI, S.E.', 'Penyelia Penyelamatan Kredit', '010');
INSERT INTO `t_pegawai` VALUES (161, 'X0191', 'LALU ZAENAL ARIFIN', 'AO Pengembangan Kredit', '010');
INSERT INTO `t_pegawai` VALUES (162, 'X0211', 'WINDY ERDITA CHANDRA, A.Md.', 'Teller', '010');
INSERT INTO `t_pegawai` VALUES (163, 'X0676', 'NIKMATIL AHYINI SAKURO', 'Administrasi Operasional', '010');
INSERT INTO `t_pegawai` VALUES (164, 'X0678', 'RIRIN APRIANI', 'Funding Officer', '010');
INSERT INTO `t_pegawai` VALUES (165, 'X0125', 'MEGA ARSIAH, S.E.', 'Pemimpin Cabang', '011');
INSERT INTO `t_pegawai` VALUES (166, 'X0152', 'SUKARNAWADI', 'Penyelia Bisnis', '011');
INSERT INTO `t_pegawai` VALUES (167, 'X0155', 'BAIQ PUSPA HARIANI', 'Funding Officer', '011');
INSERT INTO `t_pegawai` VALUES (168, 'X0156', 'MUHAMAD AMRULLAH', 'AO Penyelamatan Kredit', '011');
INSERT INTO `t_pegawai` VALUES (169, 'X0157', 'ZAENAL ABIDIN', 'AO Pengembangan Kredit', '011');
INSERT INTO `t_pegawai` VALUES (170, 'X0167', 'BUDI HARIANTO, S.E.', 'Analis Kredit', '011');
INSERT INTO `t_pegawai` VALUES (171, 'X0171', 'RINA AGUSTIANI RAIS, S.E.', 'Administrasi Operasional', '011');
INSERT INTO `t_pegawai` VALUES (172, 'X0206', 'LALU ANDRI JUNI ATMAWINATA', 'Penyelia Penyelamatan Kredit', '011');
INSERT INTO `t_pegawai` VALUES (173, 'X0217', 'YULI RAHMA ANDRIANI, S.H.', 'Funding Officer', '011');
INSERT INTO `t_pegawai` VALUES (174, 'X0641', 'ANDRE JUNIO HERMAWAN', 'AO Pengembangan Kredit', '011');
INSERT INTO `t_pegawai` VALUES (175, 'X0683', 'TIAS JULIA ANANTA', 'Teller', '011');
INSERT INTO `t_pegawai` VALUES (176, 'X0066', 'SRI YUNI ASTUTI', 'Penyelia Bisnis', '012');
INSERT INTO `t_pegawai` VALUES (177, 'X0124', 'H. MUZAKKAR, S.P.', 'Pemimpin Cabang', '012');
INSERT INTO `t_pegawai` VALUES (178, 'X0132', 'H. PADLI BADRUS, S.E.', 'AO Penyelamatan Kredit', '012');
INSERT INTO `t_pegawai` VALUES (179, 'X0158', 'NOVIA SOPIA WIJAYA', 'Administrasi Operasional', '012');
INSERT INTO `t_pegawai` VALUES (180, 'X0159', 'RAHMAT HIDAYAT', 'Analis Kredit', '012');
INSERT INTO `t_pegawai` VALUES (181, 'X0175', 'LALU MUHAMMAD ADNAN FAUZI, S.H.', 'Penyelia Penyelamatan Kredit', '012');
INSERT INTO `t_pegawai` VALUES (182, 'X0188', 'Hj. MERTAYANI', 'AO Pengembangan Kredit', '012');
INSERT INTO `t_pegawai` VALUES (183, 'X0200', 'MARZUKI', 'Funding Officer', '012');
INSERT INTO `t_pegawai` VALUES (184, 'X0521', 'ERNI JUMHAR, S.E.', 'Penyelia Operasional', '012');
INSERT INTO `t_pegawai` VALUES (185, 'X0605', 'ARMAN ARI PRADANA', 'Funding Officer', '012');
INSERT INTO `t_pegawai` VALUES (186, 'X0637', 'ADENTIYA YELITA WIYANTARI', 'AO Pengembangan Kredit', '012');
INSERT INTO `t_pegawai` VALUES (187, 'X0656', 'GITA SEFA PRAYUDA', 'Teller', '012');
INSERT INTO `t_pegawai` VALUES (188, 'X0060', 'WAHYU NAZIRIN', 'AO Pengembangan Kredit', '013');
INSERT INTO `t_pegawai` VALUES (189, 'X0136', 'MUHIDIN, S.E.', 'AO Penyelamatan Kredit', '013');
INSERT INTO `t_pegawai` VALUES (190, 'X0137', 'AHMAD MULYADI SAPUTRA, S.H.', 'Administrasi Operasional', '013');
INSERT INTO `t_pegawai` VALUES (191, 'X0164', 'IWAN WIDARTHA, S.H.', 'Penyelia Bisnis', '013');
INSERT INTO `t_pegawai` VALUES (192, 'X0177', 'Hj. BAIQ BAHRUL AINI', 'Funding Officer', '013');
INSERT INTO `t_pegawai` VALUES (193, 'X0180', 'SAHENUM', 'Analis Kredit', '013');
INSERT INTO `t_pegawai` VALUES (194, 'X0205', 'LALU AKHMAD FAUZI, S.H.', 'Pemimpin Cabang', '013');
INSERT INTO `t_pegawai` VALUES (195, 'X0207', 'MUHAMAD ABDUH', 'Penyelia Operasional', '013');
INSERT INTO `t_pegawai` VALUES (196, 'X0565', 'SITI RIZKY ANI ', 'Teller', '013');
INSERT INTO `t_pegawai` VALUES (197, 'X0618', 'MUHAMAD ARDHI WAHYUDI', 'AO Pengembangan Kredit', '013');
INSERT INTO `t_pegawai` VALUES (198, 'X0085', 'LALU BADRI', 'Penyelia Bisnis', '014');
INSERT INTO `t_pegawai` VALUES (199, 'X0086', 'NI NYOMAN ARYATI, S.E.', 'Penyelia Penyelamatan Kredit', '014');
INSERT INTO `t_pegawai` VALUES (200, 'X0095', 'IKRAM, S.E.', 'Pemimpin Cabang', '014');
INSERT INTO `t_pegawai` VALUES (201, 'X0186', 'MURDIMAN, S.E.', 'Penyelia Operasional', '014');
INSERT INTO `t_pegawai` VALUES (202, 'X0208', 'MUHAMAD IRWAN, S.Sos.', 'Analis Kredit', '014');
INSERT INTO `t_pegawai` VALUES (203, 'X0209', 'LALU BAYU PUJIANDRA ATMAJA, S.E.', 'AO Pengembangan Kredit', '014');
INSERT INTO `t_pegawai` VALUES (204, 'X0586', 'BAIQ WAHYUNI SAFITRI', 'Administrasi Operasional', '014');
INSERT INTO `t_pegawai` VALUES (205, 'X0644', 'BAIQ NOVITA DENA CAHYANI', 'Teller', '014');
INSERT INTO `t_pegawai` VALUES (206, 'X0693', 'ZEVANIA FARAZETA', 'Funding Officer', '014');
INSERT INTO `t_pegawai` VALUES (207, 'X0169', 'DEVI MIASARI, S.Kom.', 'Administrasi Operasional', '015');
INSERT INTO `t_pegawai` VALUES (208, 'X0170', 'HARY ZULKARNAEN, S.E.', 'Penyelia Bisnis', '015');
INSERT INTO `t_pegawai` VALUES (209, 'X0179', 'DIRAWAT', 'AO Penyelamatan Kredit', '015');
INSERT INTO `t_pegawai` VALUES (210, 'X0192', 'QOMALA SARI DEWI, S.E.', 'Analis Kredit', '015');
INSERT INTO `t_pegawai` VALUES (211, 'X0198', 'BAIQ MULIANA, S.E.', 'Pemimpin Cabang', '015');
INSERT INTO `t_pegawai` VALUES (212, 'X0215', 'BUDI AGUS SAHRIAL', 'Funding Officer', '015');
INSERT INTO `t_pegawai` VALUES (213, 'X0597', 'GITHA LAKSMI FAHERA', 'Teller', '015');
INSERT INTO `t_pegawai` VALUES (214, 'X0639', 'ALDI SEFTIAN SUHAERI', 'AO Pengembangan Kredit', '015');
INSERT INTO `t_pegawai` VALUES (215, 'X0059', 'YOS SOEDARSO, S.H.', 'AO Penyelamatan Kredit', '016');
INSERT INTO `t_pegawai` VALUES (216, 'X0082', 'KAMARUDIN, A.Md.', 'Analis Kredit', '016');
INSERT INTO `t_pegawai` VALUES (217, 'X0096', 'SUHARDI ANSOR', 'Pemimpin Cabang', '016');
INSERT INTO `t_pegawai` VALUES (218, 'X0143', 'FAHRUDIN, S.Sos.', 'Penyelia Bisnis', '016');
INSERT INTO `t_pegawai` VALUES (219, 'X0189', 'ZAITUN', 'AO Pengembangan Kredit', '016');
INSERT INTO `t_pegawai` VALUES (220, 'X0190', 'LALU MARYUNAN', 'Penyelia Operasional', '016');
INSERT INTO `t_pegawai` VALUES (221, 'X0202', 'DEWI MARIA APRISANI', 'Administrasi Operasional', '016');
INSERT INTO `t_pegawai` VALUES (222, 'X0210', 'BAIQ SITI NURBAYA', 'Funding Officer', '016');
INSERT INTO `t_pegawai` VALUES (223, 'X0635', 'VIRA APRILIYANTI', 'Funding Officer', '016');
INSERT INTO `t_pegawai` VALUES (224, 'X0660', 'IMA NIRWANA PUTRI', 'Teller', '016');
INSERT INTO `t_pegawai` VALUES (225, 'X0051', 'BAIQ ENIK NURIWAYATI, S.E.', 'Penyelia Operasional', '017');
INSERT INTO `t_pegawai` VALUES (226, 'X0087', 'HILNI WIDA SAFITRI', 'Funding Officer', '017');
INSERT INTO `t_pegawai` VALUES (227, 'X0148', 'KIKI MARBASELA ASRIWANI, S.E.', 'Analis Kredit', '017');
INSERT INTO `t_pegawai` VALUES (228, 'X0178', 'BAIQ PUJA HASTUTI', 'AO Pengembangan Kredit', '017');
INSERT INTO `t_pegawai` VALUES (229, 'X0185', 'SAHDAN, S.E.', 'Pemimpin Cabang', '017');
INSERT INTO `t_pegawai` VALUES (230, 'X0193', 'ADIPATI MASMARENG GEMANG JANUAR, S.E.', 'Penyelia Bisnis', '017');
INSERT INTO `t_pegawai` VALUES (231, 'X0203', 'ALVIAN FIRDAUS, A.Md.', 'AO Penyelamatan Kredit', '017');
INSERT INTO `t_pegawai` VALUES (232, 'X0602', 'LALU MUHAMMAD ARI SAGITA DESTRINISA', 'Administrasi Operasional', '017');
INSERT INTO `t_pegawai` VALUES (233, 'X0617', 'DEDISETIADI WAHYU PRATAMA', 'AO Pengembangan Kredit', '017');
INSERT INTO `t_pegawai` VALUES (234, 'X0651', 'ELSA IN AMIARTI', 'Teller', '017');
INSERT INTO `t_pegawai` VALUES (235, 'X0134', 'MAYA HELVIA, S.Pd.', 'Teller', '018');
INSERT INTO `t_pegawai` VALUES (236, 'X0224', 'IRLAN YUNIAR, S.E.', 'Pemimpin Cabang', '018');
INSERT INTO `t_pegawai` VALUES (237, 'X0227', 'ENY KUSMAYANTI, S.E.', 'Penyelia Operasional', '018');
INSERT INTO `t_pegawai` VALUES (238, 'X0229', 'SRIDIANI', 'Funding Officer', '018');
INSERT INTO `t_pegawai` VALUES (239, 'X0278', 'DENI ISNAENI', 'Penyelia Bisnis', '018');
INSERT INTO `t_pegawai` VALUES (240, 'X0562', 'DEWI AZANIATUN APRIANTI', 'Analis Kredit', '018');
INSERT INTO `t_pegawai` VALUES (241, 'X0623', 'ELSA NOVIANTI SAPUTRI', 'Administrasi Operasional', '018');
INSERT INTO `t_pegawai` VALUES (242, 'X0632', 'MIFTAHUL JANNAH', 'AO Pengembangan Kredit', '018');
INSERT INTO `t_pegawai` VALUES (243, 'X0653', 'FEBBY SAPUTRA M, M.Ak', 'AO Penyelamatan Kredit', '018');
INSERT INTO `t_pegawai` VALUES (244, 'X0672', 'MUHAMMAD ZUHAIR HAMAMI', 'AO Pengembangan Kredit', '018');
INSERT INTO `t_pegawai` VALUES (245, 'X0240', 'H. MANSYUR, S.E.', 'Pemimpin Cabang', '019');
INSERT INTO `t_pegawai` VALUES (246, 'X0241', 'LANDUH ILHAM SATRIA, S.T.', 'Analis Kredit', '019');
INSERT INTO `t_pegawai` VALUES (247, 'X0242', 'HENDRAWAN SUSILO, S.P.', 'Penyelia Operasional', '019');
INSERT INTO `t_pegawai` VALUES (248, 'X0246', 'RACHMAT FAJAR FITRIYANTO, S.Kom.', 'AO Penyelamatan Kredit', '019');
INSERT INTO `t_pegawai` VALUES (249, 'X0247', 'BAIQ SURYANINGSIH', 'Funding Officer', '019');
INSERT INTO `t_pegawai` VALUES (250, 'X0248', 'MARZUKI', 'Administrasi Operasional', '019');
INSERT INTO `t_pegawai` VALUES (251, 'X0287', 'SUKARMAN, S.E.', 'Penyelia Bisnis', '019');
INSERT INTO `t_pegawai` VALUES (252, 'X0603', 'GHINA SALSABILA', 'Teller', '019');
INSERT INTO `t_pegawai` VALUES (253, 'X0684', 'TITISAN WAHYU NURUL LAILA', 'AO Pengembangan Kredit', '019');
INSERT INTO `t_pegawai` VALUES (254, 'X0239', 'MELANI CATUR WULANDARI', 'Teller', '020');
INSERT INTO `t_pegawai` VALUES (255, 'X0244', 'GUPRAN, A.Md.', 'Pemimpin Cabang', '020');
INSERT INTO `t_pegawai` VALUES (256, 'X0253', 'LALU RAJENDRA GDE WIJAYA', 'Penyelia Operasional', '020');
INSERT INTO `t_pegawai` VALUES (257, 'X0255', 'BAIQ ENGGI SUMANTARI', 'Analis Kredit', '020');
INSERT INTO `t_pegawai` VALUES (258, 'X0256', 'BAIQ SULASTINI', 'AO Pengembangan Kredit', '020');
INSERT INTO `t_pegawai` VALUES (259, 'X0271', 'BAIQ SUHARLINA, S.E.', 'Penyelia Bisnis', '020');
INSERT INTO `t_pegawai` VALUES (260, 'X0582', 'BAIQ DIAN SUKMA LESTARI', 'Funding Officer', '020');
INSERT INTO `t_pegawai` VALUES (261, 'X0643', 'BAIQ DYAH FITRIANI ASTUTI', 'Administrasi Operasional', '020');
INSERT INTO `t_pegawai` VALUES (262, 'X0666', 'M ROMZI QIZIL', 'AO Penyelamatan Kredit', '020');
INSERT INTO `t_pegawai` VALUES (263, 'X0230', 'BAIQ MERY APRILIA', 'AO Penyelamatan Kredit', '021');
INSERT INTO `t_pegawai` VALUES (264, 'X0261', 'ASRINI ROSDIANA, S.E.', 'Administrasi Operasional', '021');
INSERT INTO `t_pegawai` VALUES (265, 'X0264', 'ABDILLAH', 'Analis Kredit', '021');
INSERT INTO `t_pegawai` VALUES (266, 'X0266', 'EMYLIA, S.E.', 'Pemimpin Cabang', '021');
INSERT INTO `t_pegawai` VALUES (267, 'X0569', 'HELMY NORMANITA', 'Funding Officer', '021');
INSERT INTO `t_pegawai` VALUES (268, 'X0627', 'NUR IMAMSYAH SURYADI', 'AO Pengembangan Kredit', '021');
INSERT INTO `t_pegawai` VALUES (269, 'X0690', 'YUNITA DWI SAPUTRI', 'Teller', '021');
INSERT INTO `t_pegawai` VALUES (270, 'X0225', 'INDAH RIZKIATHI, S.P.', 'Penyelia Operasional', '022');
INSERT INTO `t_pegawai` VALUES (271, 'X0233', 'DEVI APRIYASTUTI', 'AO Pengembangan Kredit', '022');
INSERT INTO `t_pegawai` VALUES (272, 'X0252', 'MUHAMMAD RUSAN, S.E.', 'Pemimpin Cabang', '022');
INSERT INTO `t_pegawai` VALUES (273, 'X0263', 'RIZKI PEBRINA, S.E.', 'Teller', '022');
INSERT INTO `t_pegawai` VALUES (274, 'X0273', 'ASMIATY', 'AO Penyelamatan Kredit', '022');
INSERT INTO `t_pegawai` VALUES (275, 'X0274', 'ABDUL MANSYUR', 'Analis Kredit', '022');
INSERT INTO `t_pegawai` VALUES (276, 'X0277', 'LALU MUH. FAUZI, S.H.', 'Penyelia Bisnis', '022');
INSERT INTO `t_pegawai` VALUES (277, 'X0633', 'MAYA RIZKI ANZOLA', 'Administrasi Operasional', '022');
INSERT INTO `t_pegawai` VALUES (278, 'X0636', 'RANA TRI HULTAVIANA, SE', 'Funding Officer', '022');
INSERT INTO `t_pegawai` VALUES (279, 'X0251', 'NUR EDI PURQAN, S.E.', 'Penyelia Bisnis', '023');
INSERT INTO `t_pegawai` VALUES (280, 'X0279', 'TAUFAN RIADI', 'Penyelia Operasional', '023');
INSERT INTO `t_pegawai` VALUES (281, 'X0280', 'MUH. KADERI', 'AO Pengembangan Kredit', '023');
INSERT INTO `t_pegawai` VALUES (282, 'X0291', 'ROSPITA, S.Ag.', 'Administrasi Operasional', '023');
INSERT INTO `t_pegawai` VALUES (283, 'X0294', 'NURUL AEN, S.E.', 'Pemimpin Cabang', '023');
INSERT INTO `t_pegawai` VALUES (284, 'X0570', 'M. ALVIAN NUANSA P.', 'Analis Kredit', '023');
INSERT INTO `t_pegawai` VALUES (285, 'X0611', 'BAIQ JULIANTI', 'AO Penyelamatan Kredit', '023');
INSERT INTO `t_pegawai` VALUES (286, 'X0658', 'HARTANTI', 'Teller', '023');
INSERT INTO `t_pegawai` VALUES (287, 'X0671', 'MUHAMAD BAGAS PARTAWIJAYA', 'Funding Officer', '023');
INSERT INTO `t_pegawai` VALUES (288, 'X0283', 'AHMAT BUKRAN, S.Kom.', 'Penyelia Bisnis', '024');
INSERT INTO `t_pegawai` VALUES (289, 'X0286', 'HUSNUL HAMDI', 'Pemimpin Cabang', '024');
INSERT INTO `t_pegawai` VALUES (290, 'X0288', 'MUH. LUTFI', 'AO Penyelamatan Kredit', '024');
INSERT INTO `t_pegawai` VALUES (291, 'X0289', 'LALU ANDRIAN KUSUMA ATMAJA', 'Analis Kredit', '024');
INSERT INTO `t_pegawai` VALUES (292, 'X0290', 'BAIQ SURIANI', 'Funding Officer', '024');
INSERT INTO `t_pegawai` VALUES (293, 'X0584', 'SILFIA AZMIATUN A', 'Administrasi Operasional', '024');
INSERT INTO `t_pegawai` VALUES (294, 'X0585', 'SYAWALUDIN AKBAR ALI', 'AO Pengembangan Kredit', '024');
INSERT INTO `t_pegawai` VALUES (295, 'X0613', 'ANGGIA MUAWWADATUL AUDINI', 'Teller', '024');
INSERT INTO `t_pegawai` VALUES (296, 'X0090', 'IFTIKAR HARYADI, S.E.', 'Penyelia Bisnis', '025');
INSERT INTO `t_pegawai` VALUES (297, 'X0127', 'MUHAMAD NUH', 'AO Pengembangan Kredit', '025');
INSERT INTO `t_pegawai` VALUES (298, 'X0293', 'FITRIAH', 'Penyelia Operasional', '025');
INSERT INTO `t_pegawai` VALUES (299, 'X0295', 'MASTUR, S.H.', 'Pemimpin Cabang', '025');
INSERT INTO `t_pegawai` VALUES (300, 'X0296', 'LALU ASMADIL WASLI, S.E.', 'Funding Officer', '025');
INSERT INTO `t_pegawai` VALUES (301, 'X0297', 'MUH. RIPTO', 'AO Penyelamatan Kredit', '025');
INSERT INTO `t_pegawai` VALUES (302, 'X0298', 'NETI ASTRINA, S.E.', 'Administrasi Operasional', '025');
INSERT INTO `t_pegawai` VALUES (303, 'X0299', 'LIS SUGIARTO', 'Analis Kredit', '025');
INSERT INTO `t_pegawai` VALUES (304, 'X0645', 'BQ. DIANI MARDINA', 'Teller', '025');
INSERT INTO `t_pegawai` VALUES (305, 'X0302', 'HUSAIN, S.E.', 'Penyelia Penyelamatan Kredit', '026');
INSERT INTO `t_pegawai` VALUES (306, 'X0303', 'YUYUN WULANSARI, A.Md.', 'Penyelia Operasional', '026');
INSERT INTO `t_pegawai` VALUES (307, 'X0304', 'DERMAWANSYAH, S.E.', 'Penyelia Bisnis', '026');
INSERT INTO `t_pegawai` VALUES (308, 'X0306', 'NURHASANAH', 'AO Pengembangan kredit', '026');
INSERT INTO `t_pegawai` VALUES (309, 'X0309', 'RIZKA AVISAH, S.E.', 'Funding Officer', '026');
INSERT INTO `t_pegawai` VALUES (310, 'X0310', 'MURDANI ASTUTI', 'Analis Kredit', '026');
INSERT INTO `t_pegawai` VALUES (311, 'X0311', 'YULIA PARTINA, S.E.', 'AO Penyelamatan Kredit', '026');
INSERT INTO `t_pegawai` VALUES (312, 'X0314', 'IRAWANSYAH, S.Pd.', 'Pemimpin Cabang', '026');
INSERT INTO `t_pegawai` VALUES (313, 'X0619', 'LALU MOH HANDIKA HASYIM', 'Administrasi Operasional', '026');
INSERT INTO `t_pegawai` VALUES (314, 'X0665', 'LALU PANJI LINTANG', 'AO Pengembangan Kredit', '026');
INSERT INTO `t_pegawai` VALUES (315, 'X0691', 'YUYAN ANGGRAINY', 'Teller', '026');
INSERT INTO `t_pegawai` VALUES (316, 'X0305', 'SOFYAN', 'Penyelia Penyelamatan Kredit', '027');
INSERT INTO `t_pegawai` VALUES (317, 'X0315', 'WAN IRAWAN', 'Penyelia Bisnis', '027');
INSERT INTO `t_pegawai` VALUES (318, 'X0316', 'IIN NURAINI, S.E.', 'Penyelia Operasional', '027');
INSERT INTO `t_pegawai` VALUES (319, 'X0318', 'SHERLY IFTIHARI, S.Ak.', 'Analis Kredit', '027');
INSERT INTO `t_pegawai` VALUES (320, 'X0319', 'NASIATUL JANNAH, S.Ak.', 'AO Pengembangan Kredit', '027');
INSERT INTO `t_pegawai` VALUES (321, 'X0322', 'MUHAMMAD YASIN, S.E.', 'Pemimpin Cabang', '027');
INSERT INTO `t_pegawai` VALUES (322, 'X0455', 'TITIAN RIZKI, S.E.', 'AO Penyelamatan Kredit', '027');
INSERT INTO `t_pegawai` VALUES (323, 'X0469', 'M. ADITYA PERDANA PUTRA', 'Administrasi Operasional', '027');
INSERT INTO `t_pegawai` VALUES (324, 'X0657', 'HAFIZH ALDIANSYAH', 'Funding Officer', '027');
INSERT INTO `t_pegawai` VALUES (325, 'X0687', 'VIRA AULIA RAHMAN', 'Teller', '027');
INSERT INTO `t_pegawai` VALUES (326, 'X0324', 'SRI SASTRIANINGSIH, A.Md.', 'Penyelia Bisnis', '028');
INSERT INTO `t_pegawai` VALUES (327, 'X0325', 'RUSTIATI, S.E.', 'Penyelia Penyelamatan Kredit', '028');
INSERT INTO `t_pegawai` VALUES (328, 'X0330', 'NUNUNG AINURRAHMI', 'Funding Officer', '028');
INSERT INTO `t_pegawai` VALUES (329, 'X0331', 'MASUJI', 'Teller Kantor Kas Seketeng', '028');
INSERT INTO `t_pegawai` VALUES (330, 'X0345', 'I G N NYOMAN WIYADNYANA, S.E.', 'Penyelia Operasional', '028');
INSERT INTO `t_pegawai` VALUES (331, 'X0380', 'MUHAMMAD IKHSAN, S.E.', 'Pemimpin Cabang', '028');
INSERT INTO `t_pegawai` VALUES (332, 'X0397', 'SYAIFUL ANAM, S.E.', 'AO Penyelamatan Kredit', '028');
INSERT INTO `t_pegawai` VALUES (333, 'X0579', 'CHAERUNNISA', 'Analis Kredit', '028');
INSERT INTO `t_pegawai` VALUES (334, 'X0609', 'LALU ARYAPANJI ADIPATIWARDANA', 'AO Pengembangan Kredit', '028');
INSERT INTO `t_pegawai` VALUES (335, 'X0642', 'AYIE REGITA CAHYANI', 'Administrasi Operasional', '028');
INSERT INTO `t_pegawai` VALUES (336, 'X0685', 'VANIA DWI ZUHRA', 'Teller', '028');
INSERT INTO `t_pegawai` VALUES (337, 'X0343', 'SITI MUKMIN, S.E.', 'Penyelia Operasional', '029');
INSERT INTO `t_pegawai` VALUES (338, 'X0346', 'DANANG ABDAN SYAKURA, S.P.', 'Funding Officer', '029');
INSERT INTO `t_pegawai` VALUES (339, 'X0347', 'SIGIT KAMSENO, S.Pd.', 'Penyelia Bisnis', '029');
INSERT INTO `t_pegawai` VALUES (340, 'X0348', 'BUHARI', 'AO Penyelamatan Kredit', '029');
INSERT INTO `t_pegawai` VALUES (341, 'X0351', 'Hj. HAJERAH, S.E.', 'Pemimpin Cabang', '029');
INSERT INTO `t_pegawai` VALUES (342, 'X0357', 'HERMANSYAH', 'Administrasi Operasional', '029');
INSERT INTO `t_pegawai` VALUES (343, 'X0398', 'ROWI ISKANDAR', 'Penyelia Penyelamatan Kredit', '029');
INSERT INTO `t_pegawai` VALUES (344, 'X0492', 'NURIKO YULIANI, S.E.', 'Kepala Kantor Kas Labuhan Jambu', '029');
INSERT INTO `t_pegawai` VALUES (345, 'X0554', 'ARISANDI KAHARUDIN', 'Analis Kredit', '029');
INSERT INTO `t_pegawai` VALUES (346, 'X0638', 'AHLUN NAZAR ', 'AO Pengembangan Kredit', '029');
INSERT INTO `t_pegawai` VALUES (347, 'X0648', 'DEWI SETIAWATI', 'Teller', '029');
INSERT INTO `t_pegawai` VALUES (348, 'X0673', 'NADYA MAULIDYA IRAWAN', 'Teller Kantor Kas Labuhan Jambu', '029');
INSERT INTO `t_pegawai` VALUES (349, 'X0342', 'NURIKHSANI', 'Penyelia Bisnis', '030');
INSERT INTO `t_pegawai` VALUES (350, 'X0356', 'ARIFUDDIN', 'Penyelia Penyelamatan Kredit', '030');
INSERT INTO `t_pegawai` VALUES (351, 'X0358', 'LENI YUNANI, S.E.', 'Penyelia Operasional', '030');
INSERT INTO `t_pegawai` VALUES (352, 'X0361', 'NURHASANAH, S.E.', 'Pemimpin Cabang', '030');
INSERT INTO `t_pegawai` VALUES (353, 'X0421', 'MUHAEMIN DEDY S., S.Kom.', 'AO Pengembangan Kredit', '030');
INSERT INTO `t_pegawai` VALUES (354, 'X0487', 'MUH. FADLAN, S.Kom.', 'Analis Kredit', '030');
INSERT INTO `t_pegawai` VALUES (355, 'X0634', 'MUHAMMAD RIZKY', 'Administrasi Operasional', '030');
INSERT INTO `t_pegawai` VALUES (356, 'X0646', 'D  ERTIN EZA PRATIWI', 'Funding Officer', '030');
INSERT INTO `t_pegawai` VALUES (357, 'X0679', 'RITA MEIANA', 'Teller', '030');
INSERT INTO `t_pegawai` VALUES (358, 'X0323', 'LITA ELVIANA, S.E.', 'AO Penyelamatan Kredit', '031');
INSERT INTO `t_pegawai` VALUES (359, 'X0332', 'RENINTA SULISTIAWATI, A.Md.', 'Penyelia Bisnis', '031');
INSERT INTO `t_pegawai` VALUES (360, 'X0353', 'YUDI DERRY CASTANA, S.E.', 'Pemimpin Cabang', '031');
INSERT INTO `t_pegawai` VALUES (361, 'X0365', 'HAMZAH SARIDIN', 'AO Penyelamatan Kredit', '031');
INSERT INTO `t_pegawai` VALUES (362, 'X0391', 'AN NISAA FITHIASARI, A.Md.', 'Analis Kredit', '031');
INSERT INTO `t_pegawai` VALUES (363, 'X0574', 'SRI HARTATI', 'AO Pengembangan Kredit', '031');
INSERT INTO `t_pegawai` VALUES (364, 'X0577', 'NINDIA YULIANA', 'Administrasi Operasional', '031');
INSERT INTO `t_pegawai` VALUES (365, 'X0626', 'RIZTA RININDA', 'Teller', '031');
INSERT INTO `t_pegawai` VALUES (366, 'X0670', 'MAYANG LESTARI', 'Funding Officer', '031');
INSERT INTO `t_pegawai` VALUES (367, 'X0367', 'NYDIA PRATIWI PUJI LESTARI, A.Md.', 'Administrasi Operasional', '032');
INSERT INTO `t_pegawai` VALUES (368, 'X0371', 'SRI SUNDARI, S.E.', 'Penyelia Bisnis', '032');
INSERT INTO `t_pegawai` VALUES (369, 'X0372', 'YANDI SURYAWAN, S.Kom.', 'Penyelia Penyelamatan Kredit', '032');
INSERT INTO `t_pegawai` VALUES (370, 'X0373', 'AZHAR ANDANI PUTRA, A.Md.', 'Penyelia Operasional', '032');
INSERT INTO `t_pegawai` VALUES (371, 'X0376', 'HERU PURWANTO, S.Pd.', 'Analis Kredit', '032');
INSERT INTO `t_pegawai` VALUES (372, 'X0379', 'DIRA MARDIANA, A.Md.', 'Funding Officer', '032');
INSERT INTO `t_pegawai` VALUES (373, 'X0664', 'KARTINI INESTI LONDA', 'Teller', '032');
INSERT INTO `t_pegawai` VALUES (374, 'X0681', 'SRI AYU DWI SANTIKA', 'AO Pengembangan Kredit', '032');
INSERT INTO `t_pegawai` VALUES (375, 'X0366', 'NOVI UTAMI, S.E.', 'Analis Kredit', '033');
INSERT INTO `t_pegawai` VALUES (376, 'X0382', 'ZULKARNAEN', 'Pemimpin Cabang', '033');
INSERT INTO `t_pegawai` VALUES (377, 'X0385', 'DAHLIA, S.E.', 'Funding Officer', '033');
INSERT INTO `t_pegawai` VALUES (378, 'X0388', 'TAUFIK HIDAYAT', 'Penyelia Bisnis', '033');
INSERT INTO `t_pegawai` VALUES (379, 'X0620', 'GILANG GINANTA', 'AO Pengembangan Kredit', '033');
INSERT INTO `t_pegawai` VALUES (380, 'X0649', 'DHEANA ANANDA DWIPUTRI', 'Administrasi Operasional', '033');
INSERT INTO `t_pegawai` VALUES (381, 'X0650', 'EDWIN BASKARA', 'AO Penyelamatan Kredit', '033');
INSERT INTO `t_pegawai` VALUES (382, 'X0652', 'FAJRIANTI DWI QURNIA', 'Teller', '033');
INSERT INTO `t_pegawai` VALUES (383, 'X0339', 'SANDI  IRAWAN, S.E.', 'Analis Kredit', '034');
INSERT INTO `t_pegawai` VALUES (384, 'X0381', 'IDA NOVIANTI', 'Penyelia Bisnis', '034');
INSERT INTO `t_pegawai` VALUES (385, 'X0387', 'NURLELA, S.E.', 'Pemimpin Cabang', '034');
INSERT INTO `t_pegawai` VALUES (386, 'X0390', 'NURHASANAH', 'Penyelia Operasional', '034');
INSERT INTO `t_pegawai` VALUES (387, 'X0392', 'SRI YULIANTI', 'Administrasi Operasional', '034');
INSERT INTO `t_pegawai` VALUES (388, 'X0395', 'KURNIA ARDIYANSYAH, S.I.P.', 'Funding Officer', '034');
INSERT INTO `t_pegawai` VALUES (389, 'X0581', 'NURRUL AN NISHA', 'AO Penyelamatan Kredit', '034');
INSERT INTO `t_pegawai` VALUES (390, 'X0631', 'RATI RAMDHA AINI', 'AO Pengembangan Kredit', '034');
INSERT INTO `t_pegawai` VALUES (391, 'X0640', 'ANDINI DAYANTRI DENDRA WARDHANA', 'Teller', '034');
INSERT INTO `t_pegawai` VALUES (392, 'X0301', 'RISAL, S.E.', 'Pemimpin Cabang', '035');
INSERT INTO `t_pegawai` VALUES (393, 'X0389', 'MUHAMMAD TOHIR', 'Penyelia Penyelamatan Kredit', '035');
INSERT INTO `t_pegawai` VALUES (394, 'X0399', 'FARIDAH, S.E.', 'Penyelia Operasional', '035');
INSERT INTO `t_pegawai` VALUES (395, 'X0400', 'NURAINI, S.H.', 'Penyelia Bisnis', '035');
INSERT INTO `t_pegawai` VALUES (396, 'X0401', 'FERRY FIRMANSYAH PUTRA, S.E.', 'Analis Kredit', '035');
INSERT INTO `t_pegawai` VALUES (397, 'X0583', 'BINTANG SABRINA', 'Teller', '035');
INSERT INTO `t_pegawai` VALUES (398, 'X0600', 'TAUFIKURRAHMAN', 'AO Pengembangan Kredit', '035');
INSERT INTO `t_pegawai` VALUES (399, 'X0601', 'DHICKY SULISTYO', 'Funding Officer', '035');
INSERT INTO `t_pegawai` VALUES (400, 'X0689', 'YULISTIA ALWASIFAH', 'Administrasi Operasional', '035');
INSERT INTO `t_pegawai` VALUES (401, 'X0317', 'HASANA SRI RAHAYU, S.E.', 'Funding Officer', '036');
INSERT INTO `t_pegawai` VALUES (402, 'X0403', 'KAHARUDDIN, S.E.', 'Pemimpin Cabang', '036');
INSERT INTO `t_pegawai` VALUES (403, 'X0404', 'SRI NANINGSIH, A.Md.', 'Penyelia Bisnis', '036');
INSERT INTO `t_pegawai` VALUES (404, 'X0405', 'IRFAN, S.E.', 'Penyelia Penyelamatan Kredit', '036');
INSERT INTO `t_pegawai` VALUES (405, 'X0406', 'NURHAFIDAH, S.E.', 'Kepala Kantor Kas Buer', '036');
INSERT INTO `t_pegawai` VALUES (406, 'X0408', 'ENI LESTARI, S.E.', 'Administrasi Operasional', '036');
INSERT INTO `t_pegawai` VALUES (407, 'X0410', 'EMA SUSILAWATI, A.Md.', 'Analis Kredit', '036');
INSERT INTO `t_pegawai` VALUES (408, 'X0411', 'HJ.MULIASNI, S.E.', 'Teller', '036');
INSERT INTO `t_pegawai` VALUES (409, 'X0674', 'NANANG APRIYANTO', 'AO Pengembangan Kredit', '036');
INSERT INTO `t_pegawai` VALUES (410, 'X0677', 'RAIHUL FIRDAUS', 'Funding Officer', '036');
INSERT INTO `t_pegawai` VALUES (411, 'X0424', 'BINTI ABUYAH, S.E.', 'AO Pengembangan Kredit', '037');
INSERT INTO `t_pegawai` VALUES (412, 'X0426', 'KHUSNUL KHATIMAH, S.Pd.', 'Teller', '037');
INSERT INTO `t_pegawai` VALUES (413, 'X0427', 'NURKAUKABAH, S.E.', 'Administrasi Operasional', '037');
INSERT INTO `t_pegawai` VALUES (414, 'X0428', 'FURKAN AKBAR, S.E.', 'Penyelia Bisnis', '037');
INSERT INTO `t_pegawai` VALUES (415, 'X0430', 'IZDIHAR MAHDIYYAH, S.H.', 'Analis Kredit', '037');
INSERT INTO `t_pegawai` VALUES (416, 'X0468', 'SALAHUDDIN', 'AO Penyelamatan Kredit', '037');
INSERT INTO `t_pegawai` VALUES (417, 'X0526', 'SUPRIADIN', 'AO Pengembangan Kredit', '037');
INSERT INTO `t_pegawai` VALUES (418, 'X0542', 'TRI SUCI WAHDINI, A.Md.', 'Penyelia Operasional', '037');
INSERT INTO `t_pegawai` VALUES (419, 'X0606', 'NIDA\' ULHASANAH', 'Funding Officer', '037');
INSERT INTO `t_pegawai` VALUES (420, 'X0422', 'SUMARNI', 'Pemimpin Cabang', '038');
INSERT INTO `t_pegawai` VALUES (421, 'X0439', 'ABDUL SALAM, S.E.', 'Penyelia Bisnis', '038');
INSERT INTO `t_pegawai` VALUES (422, 'X0441', 'NURLAILA', 'Penyelia Operasional', '038');
INSERT INTO `t_pegawai` VALUES (423, 'X0443', 'HAYINUN HANAN, A.Md.', 'Administrasi Operasional', '038');
INSERT INTO `t_pegawai` VALUES (424, 'X0445', 'NURSALAM IBRAHIM', 'AO Penyelamatan Kredit', '038');
INSERT INTO `t_pegawai` VALUES (425, 'X0446', 'LILIS JUMIARTI, S.Pd.', 'Teller', '038');
INSERT INTO `t_pegawai` VALUES (426, 'X0462', 'PUTRI FARA AULIA', 'Funding Officer', '038');
INSERT INTO `t_pegawai` VALUES (427, 'X0525', 'IMAM MULYANTO', 'Analis Kredit', '038');
INSERT INTO `t_pegawai` VALUES (428, 'X0610', 'BIMO SATRYO WICAKSONO', 'AO Pengembangan Kredit', '038');
INSERT INTO `t_pegawai` VALUES (429, 'X0416', 'QAMARAN MUNIRAN, S.E.', 'Pemimpin Cabang', '039');
INSERT INTO `t_pegawai` VALUES (430, 'X0419', 'INA HUMAIRAH, S.E.', 'Penyelia Bisnis', '039');
INSERT INTO `t_pegawai` VALUES (431, 'X0429', 'ENDANG SETIAWATI', 'Administrasi Operasional', '039');
INSERT INTO `t_pegawai` VALUES (432, 'X0447', 'EDI SURYADI', 'Penyelia Penyelamatan Kredit', '039');
INSERT INTO `t_pegawai` VALUES (433, 'X0452', 'Hj. SITI ARAFAH', 'Penyelia Operasional', '039');
INSERT INTO `t_pegawai` VALUES (434, 'X0454', 'ZULKARNAIN', 'AO Penyelamatan Kredit', '039');
INSERT INTO `t_pegawai` VALUES (435, 'X0458', 'NOVI SUPRIYANI', 'Teller', '039');
INSERT INTO `t_pegawai` VALUES (436, 'X0459', 'ANDI DIRGAHAYU, S.E.', 'Analis Kredit', '039');
INSERT INTO `t_pegawai` VALUES (437, 'X0490', 'RUSDIN, S.E.', 'AO Pengembangan Kredit', '039');
INSERT INTO `t_pegawai` VALUES (438, 'X0575', 'RESSY SAFITRATULLAH', 'Funding Officer', '039');
INSERT INTO `t_pegawai` VALUES (439, 'X0621', 'MUH ALFIAN SANGAJI', 'AO Pengembangan Kredit', '039');
INSERT INTO `t_pegawai` VALUES (440, 'X0440', 'H. ABDUL HARIS', 'Penyelia Penyelamatan Kredit', '040');
INSERT INTO `t_pegawai` VALUES (441, 'X0457', 'MUHAMMAD TRYADI, S.E.', 'Analis Kredit', '040');
INSERT INTO `t_pegawai` VALUES (442, 'X0464', 'AGUS HERI ARJATI, S.E.', 'Pemimpin Cabang', '040');
INSERT INTO `t_pegawai` VALUES (443, 'X0466', 'MARMAH SUGIARTI N., S.E.', 'Penyelia Operasional', '040');
INSERT INTO `t_pegawai` VALUES (444, 'X0470', 'FADLIN, S.Kom.', 'Penyelia Bisnis', '040');
INSERT INTO `t_pegawai` VALUES (445, 'X0530', 'KRIPTIANTI, S.E.', 'Teller', '040');
INSERT INTO `t_pegawai` VALUES (446, 'X0533', 'SUCI CAHYATI, A.Md.Kom.', 'Administrasi Operasional', '040');
INSERT INTO `t_pegawai` VALUES (447, 'X0663', 'JUMRATUL AKBAR', 'Funding Officer', '040');
INSERT INTO `t_pegawai` VALUES (448, 'X0477', 'FAIDAH', 'Penyelia Operasional', '041');
INSERT INTO `t_pegawai` VALUES (449, 'X0479', 'IHWAN, S.E.', 'Pemimpin Cabang', '041');
INSERT INTO `t_pegawai` VALUES (450, 'X0481', 'HERLINA, S.Sos.', 'Funding Officer', '041');
INSERT INTO `t_pegawai` VALUES (451, 'X0484', 'ERVINA, A.Md.', 'Penyelia Bisnis', '041');
INSERT INTO `t_pegawai` VALUES (452, 'X0485', 'SRIWAHYUNINGSIH', 'AO Penyelamatan Kredit', '041');
INSERT INTO `t_pegawai` VALUES (453, 'X0486', 'ERNI KUSRINI', 'Teller', '041');
INSERT INTO `t_pegawai` VALUES (454, 'X0489', 'ADE FARIDA WAHYU KURNIATI, S.H.', 'Analis Kredit', '041');
INSERT INTO `t_pegawai` VALUES (455, 'X0491', 'NURLATIFAH, S.Pd.', 'AO Pengembangan Kredit', '041');
INSERT INTO `t_pegawai` VALUES (456, 'X0501', 'NURADI HASAN', 'Administrasi Operasional', '041');
INSERT INTO `t_pegawai` VALUES (457, 'X0507', 'SYAFRUDDIN', 'AO Pengembangan Kredit', '041');
INSERT INTO `t_pegawai` VALUES (458, 'X0482', 'NURNANINGSIH, S.Sos.', 'AO Penyelamatan Kredit', '042');
INSERT INTO `t_pegawai` VALUES (459, 'X0488', 'NURHAYATI', 'Funding Officer', '042');
INSERT INTO `t_pegawai` VALUES (460, 'X0497', 'AMAN I,LAIDIN, S.E.', 'Pemimpin Cabang', '042');
INSERT INTO `t_pegawai` VALUES (461, 'X0500', 'M. SAHRUL', 'Penyelia Operasional', '042');
INSERT INTO `t_pegawai` VALUES (462, 'X0505', 'DUDI HARYADI', 'AO Pengembangan Kredit', '042');
INSERT INTO `t_pegawai` VALUES (463, 'X0506', 'JAMI', 'Administrasi Operasional', '042');
INSERT INTO `t_pegawai` VALUES (464, 'X0508', 'AHYANI RADHIANI, S.E.', 'Teller', '042');
INSERT INTO `t_pegawai` VALUES (465, 'X0510', 'MAEMUN, S.E.', 'Analis Kredit', '042');
INSERT INTO `t_pegawai` VALUES (466, 'X0511', 'HIDAYATULLAH, S.E.', 'Funding Officer', '042');
INSERT INTO `t_pegawai` VALUES (467, 'X0513', 'FAHMI, S.E.', 'Administrasi Umum', '042');
INSERT INTO `t_pegawai` VALUES (468, 'X0517', 'ITAM, S.E.', 'Penyelia Bisnis', '042');
INSERT INTO `t_pegawai` VALUES (469, 'X0519', 'ARIFIN', 'Penyelia Penyelamatan Kredit', '042');
INSERT INTO `t_pegawai` VALUES (470, 'X0520', 'AKHYAR', 'Kepala Kantor Kas Belo', '042');
INSERT INTO `t_pegawai` VALUES (471, 'X0545', 'SALAHUDDIN', 'AO Pengembangan Kredit', '042');
INSERT INTO `t_pegawai` VALUES (472, 'X0467', 'IMAM ACHMADDIN', 'AO Pengembangan Kredit', '043');
INSERT INTO `t_pegawai` VALUES (473, 'X0474', 'M. ARAFAH', 'Pemimpin Cabang', '043');
INSERT INTO `t_pegawai` VALUES (474, 'X0480', 'RUFIQAH, S.Pt.', 'Funding Officer', '043');
INSERT INTO `t_pegawai` VALUES (475, 'X0498', 'AMINUDDIN, S.H.', 'Penyelia Operasional', '043');
INSERT INTO `t_pegawai` VALUES (476, 'X0499', 'SITI ROSDIANAH, A.Md.', 'Kepala Kantor Kas Bajo', '043');
INSERT INTO `t_pegawai` VALUES (477, 'X0518', 'SITI ASIAH HASAN, S.H.', 'Funding Officer', '043');
INSERT INTO `t_pegawai` VALUES (478, 'X0522', 'NURMI', 'Administrasi Operasional', '043');
INSERT INTO `t_pegawai` VALUES (479, 'X0523', 'JUNAIDIN', 'Funding Officer', '043');
INSERT INTO `t_pegawai` VALUES (480, 'X0524', 'RIDWAN, S.H.', 'AO Pengembangan Kredit', '043');
INSERT INTO `t_pegawai` VALUES (481, 'X0528', 'MELATI, S.Pd.', 'Teller', '043');
INSERT INTO `t_pegawai` VALUES (482, 'X0529', 'NURWAHIDAH, A.Md.Ak.', 'Teller Kantor Kas Bajo', '043');
INSERT INTO `t_pegawai` VALUES (483, 'X0531', 'IDHAM, S.E.', 'Analis Kredit', '043');
INSERT INTO `t_pegawai` VALUES (484, 'X0532', 'MULYADIN, A.Md.', 'Penyelia Bisnis', '043');
INSERT INTO `t_pegawai` VALUES (485, 'X0536', 'SUCI SUSILAWATI, S.E.', 'Administrasi Umum', '043');
INSERT INTO `t_pegawai` VALUES (486, 'X0453', 'NAZARUDDIN', 'Penyelia Operasional', '044');
INSERT INTO `t_pegawai` VALUES (487, 'X0503', 'HERY TASMIN', 'Analis Kredit', '044');
INSERT INTO `t_pegawai` VALUES (488, 'X0539', 'SUBHAN, S.E.', 'Pemimpin Cabang', '044');
INSERT INTO `t_pegawai` VALUES (489, 'X0544', 'SUKRIN', 'Funding Officer', '044');
INSERT INTO `t_pegawai` VALUES (490, 'X0546', 'ZULKARNAIN', 'Funding Officer', '044');
INSERT INTO `t_pegawai` VALUES (491, 'X0547', 'SUHARDIN', 'Penyelia Penyelamatan Kredit', '044');
INSERT INTO `t_pegawai` VALUES (492, 'X0548', 'AHLUL ALBAB, S.Pd.', 'AO Penyelamatan Kredit', '044');
INSERT INTO `t_pegawai` VALUES (493, 'X0549', 'TAUFIK', 'AO Pengembangan Kredit', '044');
INSERT INTO `t_pegawai` VALUES (494, 'X0550', 'EKA PURNAMASARI', 'Teller', '044');
INSERT INTO `t_pegawai` VALUES (495, 'X0551', 'YEYEN RAHMADANIS, S.H.', 'AO Pengembangan Kredit', '044');
INSERT INTO `t_pegawai` VALUES (496, 'X0552', 'KINANTHI ESTI N, S.Ak.', 'Administrasi Operasional', '044');
INSERT INTO `t_pegawai` VALUES (497, 'X0553', 'SYAHRU RAMADHAN, S.Pd.', 'Penyelia Bisnis', '044');

-- ----------------------------
-- Table structure for t_peserta_ujian
-- ----------------------------
DROP TABLE IF EXISTS `t_peserta_ujian`;
CREATE TABLE `t_peserta_ujian`  (
  `id_peserta` int NOT NULL AUTO_INCREMENT,
  `tgl_ujian` date NOT NULL,
  `kd_pegawai` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jml_soal` int NOT NULL,
  `id_bidang_soal` int NOT NULL,
  `waktu_ujian` int NOT NULL COMMENT 'Satuan Waktu Dalam Menit',
  `total_nilai_ujian` int NOT NULL DEFAULT 0,
  `flag_aktif` int NOT NULL DEFAULT 1 COMMENT '0=Tidak Aktif, 1=Aktif',
  PRIMARY KEY (`id_peserta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_peserta_ujian
-- ----------------------------
INSERT INTO `t_peserta_ujian` VALUES (1, '2024-12-05', 'X0131', 10, 1, 10, 60, 0);
INSERT INTO `t_peserta_ujian` VALUES (3, '2024-12-05', 'X0216', 10, 1, 10, 60, 0);

-- ----------------------------
-- Table structure for t_sertifikat
-- ----------------------------
DROP TABLE IF EXISTS `t_sertifikat`;
CREATE TABLE `t_sertifikat`  (
  `id_sertifikat` int NOT NULL AUTO_INCREMENT,
  `no_sertifikat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_peserta` int NOT NULL,
  `tgl_terbit` date NOT NULL,
  `status_terbit` tinyint NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id_sertifikat`) USING BTREE,
  INDEX `id_peserta`(`id_peserta` ASC) USING BTREE,
  CONSTRAINT `t_sertifikat_ibfk_1` FOREIGN KEY (`id_peserta`) REFERENCES `t_peserta_ujian` (`id_peserta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sertifikat
-- ----------------------------

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_kantor` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 514 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'administrator', 'embunpagi', 'Admin', '000', 'admin', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (2, 'X0003', 'X0003', 'ISLAN HULAOLI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (3, 'X0004', 'X0004', 'SUMIATUN, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (4, 'X0005', 'X0005', 'MOH. ZUHROL FATA, S.E.I.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (5, 'X0010', 'X0010', 'IRWANSYAH, A.Md.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (6, 'X0011', 'X0011', 'UNTUNG SUNARYO, A.Md.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (7, 'X0012', 'X0012', 'HENDRO SUDIYANTO, S.T.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (8, 'X0013', 'X0013', 'SRI PUJI ASTUTI, S.Mn.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (9, 'X0014', 'X0014', 'ABDUL KARIM, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (10, 'X0015', 'X0015', 'YUSUF SA\'BAN, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (11, 'X0016', 'X0016', 'AMI BRIMAPON,S.Kom.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (12, 'X0017', 'X0017', 'LALU MUSLIHIN, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (13, 'X0018', 'X0018', 'FARIDA MUKMINA, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (14, 'X0019', 'X0019', 'SABARUDIN, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (15, 'X0020', 'X0020', 'MUH. AGISNI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (16, 'X0022', 'X0022', 'ADE PERDANA PUTRA, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (17, 'X0025', 'X0025', 'M. SARIF WAHYUDI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (18, 'X0026', 'X0026', 'SISWANTO', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (19, 'X0027', 'X0027', 'MAHYUNI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (20, 'X0028', 'X0028', 'HURAISAH', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (21, 'X0030', 'X0030', 'RUSDI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (22, 'X0035', 'X0035', 'YOGA SEPTIANDREI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (23, 'X0041', 'X0041', 'AUDITRA BELLA ASSAKHA', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (24, 'X0043', 'X0043', 'AGGIED DWI INTAN PERMATASARI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (25, 'X0045', 'X0045', 'NANA ZAFIRA', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (26, 'X0097', 'X0097', 'RAHMAWATI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (27, 'X0109', 'X0109', 'WARSITO', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (28, 'X0128', 'X0128', 'ISWANTO AGUS SANTOSO, S.Kom.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (29, 'X0129', 'X0129', 'H. SUBHAN, S.H.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (30, 'X0163', 'X0163', 'SRI UTAMI BUDIWATI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (31, 'X0165', 'X0165', 'LALU FAHRURROZI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (32, 'X0187', 'X0187', 'POPY AMALIA SAPUTRI, A.Md.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (33, 'X0213', 'X0213', 'H. LALU DIDI JANUARDI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (34, 'X0228', 'X0228', 'LALU ADI FANSYURI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (35, 'X0267', 'X0267', 'KHAIRUNNISA, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (36, 'X0276', 'X0276', 'SARINDAWAN, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (37, 'X0307', 'X0307', 'SRI HARTATI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (38, 'X0329', 'X0329', 'SUPIADI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (39, 'X0384', 'X0384', 'AKHMAD ISWANDI, S.T.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (40, 'X0418', 'X0418', 'SYAMSIAH, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (41, 'X0420', 'X0420', 'TITI SUMARTI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (42, 'X0438', 'X0438', 'NURHAYATI, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (43, 'X0448', 'X0448', 'ARUNG SAMUDRA, S.H.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (44, 'X0451', 'X0451', 'ILHAM HADISURYA, S.E.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (45, 'X0475', 'X0475', 'NURWAHIDAH, S.P.', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (46, 'X0560', 'X0560', 'AHMAD MU\'ALLAL HIFNI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (47, 'X0587', 'X0587', 'M. RAIHAN MUBARAQ', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (48, 'X0594', 'X0594', 'HUDA YATUR RAHMAN', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (49, 'X0598', 'X0598', 'MUHAMMAD YUNANI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (50, 'X0599', 'X0599', 'MUHAMMAD RIZDARAHMAN', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (51, 'X0607', 'X0607', 'IDA BAGUS WIDIANTARA', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (52, 'X0608', 'X0608', 'DWINA MEISONYA', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (53, 'X0614', 'X0614', 'SARAH AINUN PUSPANINGTIAS', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (54, 'X0686', 'X0686', 'VARIZKA SALSABILLA WULANDARI', '000', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (55, 'X0021', 'X0021', 'DELVI WULANDARI, S.E.', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (56, 'X0033', 'X0033', 'BAIQ ENDANG MAHARAWATI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (57, 'X0034', 'X0034', 'SLAMETO', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (58, 'X0037', 'X0037', 'APRIMA ROHMAYATI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (59, 'X0040', 'X0040', 'NUR AAN ROHAIDAH', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (60, 'X0071', 'X0071', 'SAMSUL HADI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (62, 'X0100', 'X0100', 'AHMAD HARMAIN, S.H.', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (63, 'X0173', 'X0173', 'ROHAYATI, A.Md.', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (64, 'X0442', 'X0442', 'LALU ATMAHADI, S.H.', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (65, 'X0564', 'X0564', 'ANNISA RAHMAWATI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (66, 'X0590', 'X0590', 'SITI MAESYARAH', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (67, 'X0593', 'X0593', 'IDA BAGUS NARARYA PRAYASCITA ADNYANA', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (68, 'X0612', 'X0612', 'NIDYA PUSPITA PRATIWI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (69, 'X0624', 'X0624', 'NANDA SETIA LESTARI', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (70, 'X0647', 'X0647', 'DESY RAHMI MARIANA', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (71, 'X0659', 'X0659', 'I PUTU CINDY ARY SUHARTHA', '001', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (72, 'X0023', 'X0023', 'NUR KAMARIA', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (73, 'X0031', 'X0031', 'KHAIRUNNISA ARIANY ZAIN', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (74, 'X0038', 'X0038', 'LALU RESKY EKA SAPUTRA', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (75, 'X0042', 'X0042', 'NURHAYATI, S.Pd.', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (76, 'X0052', 'X0052', 'URWATUL AINY, A.Md.', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (77, 'X0102', 'X0102', 'HABIBAH', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (78, 'X0111', 'X0111', 'SAEFUL HAQ', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (79, 'X0630', 'X0630', 'ARIGHI DEWANTARA', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (80, 'X0669', 'X0669', 'MAUDIANA DWI NOVITASARI', '002', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (81, 'X0032', 'X0032', 'BAIQ NURAINI', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (82, 'X0069', 'X0069', 'SARIMAH', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (83, 'X0072', 'X0072', 'BAIQ ROSIANI RAHAYU, S.E.', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (84, 'X0076', 'X0076', 'M. AMIN FAJRI, A.Md.', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (85, 'X0089', 'X0089', 'SUKRIADI', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (86, 'X0091', 'X0091', 'DATU AFRIAN SUTEJA', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (87, 'X0098', 'X0098', 'WAHYULI HARYANTI', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (88, 'X0282', 'X0282', 'BAIQ ISMAYA SUNU, S.E.', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (89, 'X0328', 'X0328', 'ABDUS SALAM, S E.', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (90, 'X0616', 'X0616', 'MUHAMMAD ANDRY KURNIAWAN', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (91, 'X0661', 'X0661', 'INGGIT YUSTIKA', '003', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (92, 'X0036', 'X0036', 'ANNISA HIDAYATI', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (93, 'X0044', 'X0044', 'SEKA PRATIA GUSNIAJAM', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (94, 'X0079', 'X0079', 'SUKRAN', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (95, 'X0080', 'X0080', 'SITI RAHMAH, S.Adm.', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (96, 'X0081', 'X0081', 'FITRIYAH, A.Md.', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (97, 'X0364', 'X0364', 'YULIANTI, S.E.', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (98, 'X0596', 'X0596', 'DIAN PANDU HIDAYAT', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (99, 'X0615', 'X0615', 'SEPTI YUNITA SARI', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (100, 'X0622', 'X0622', 'FAJRI RIADI', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (101, 'X0675', 'X0675', 'NANDYTA FRISMAYA PUTRI', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (102, 'X0682', 'X0682', 'SWARIN PUTRI SAHLYA', '004', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (103, 'X0057', 'X0057', 'ZUHRIYAH', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (104, 'X0067', 'X0067', 'ROHATI, S.Sos.', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (105, 'X0088', 'X0088', 'MARMUJAHIDIN, A.Md.', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (106, 'X0126', 'X0126', 'SAMSUL BAHRI', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (107, 'X0199', 'X0199', 'YENI NOVARINA, S.E.', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (108, 'X0220', 'X0220', 'WITYASNU HADI, S.Pd.', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (109, 'X0563', 'X0563', 'VIKA ELMIATIN', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (110, 'X0629', 'X0629', 'ST. AINUN UTAMY PUTRI', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (111, 'X0655', 'X0655', 'GEDE SUPUTRA WIJAYA DHARMA', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (112, 'X0680', 'X0680', 'SALSHABILA', '005', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (113, 'X0039', 'X0039', 'DADANG KURNIAWAN', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (114, 'X0054', 'X0054', 'LALU MUH. ZAKARIA', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (115, 'X0070', 'X0070', 'DENDA EKA FITRIANI, A.Md.', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (116, 'X0077', 'X0077', 'GUSDIANA KOMALA DEWI, S.Adm.', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (117, 'X0099', 'X0099', 'MUHAMMAD HAMZANI', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (118, 'X0101', 'X0101', 'IRFAN TAUFIQ, A.Md.', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (119, 'X0214', 'X0214', 'SUGIHARTO, S.E.', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (120, 'X0559', 'X0559', 'MADE INDRIANI RISANTI DEWI', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (121, 'X0628', 'X0628', 'GHALIB GALIHSTAN ABIMANYU', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (122, 'X0662', 'X0662', 'IZKA ARDINAVAIZURA', '006', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (123, 'X0053', 'X0053', 'LALU MUHTAR ISWADI', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (124, 'X0056', 'X0056', 'AHMAD MIZWAR, A.Md.', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (125, 'X0105', 'X0105', 'HADIJAH', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (126, 'X0106', 'X0106', 'LALU BASRI', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (127, 'X0107', 'X0107', 'SUGENG WIJANARKO', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (128, 'X0108', 'X0108', 'HAMDI', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (129, 'X0110', 'X0110', 'RIATIP, S.Pd.', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (130, 'X0595', 'X0595', 'GEDE TEGUH M. PRAYITNA', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (131, 'X0625', 'X0625', 'NANDA TUHFATUL ATQIYA', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (132, 'X0688', 'X0688', 'YADAN HAQQY', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (133, 'X0692', 'X0692', 'ZELLY ALFANY', '007', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (134, 'X0104', 'X0104', 'IDAN, S.E.', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (135, 'X0112', 'X0112', 'AYUNISASIH', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (136, 'X0115', 'X0115', 'HASANAH', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (137, 'X0116', 'X0116', 'KETUT CARIASTA', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (138, 'X0117', 'X0117', 'AHMAD EFENDI, A.Md.', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (139, 'X0118', 'X0118', 'ZAENUDIN', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (140, 'X0119', 'X0119', 'INSUN', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (141, 'X0120', 'X0120', 'BAIQ KARTINI', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (142, 'X0121', 'X0121', 'NURMAEDI', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (143, 'X0122', 'X0122', 'RADEN WIRA KARMA', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (144, 'X0604', 'X0604', 'PUJA GADUH RAKSA', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (145, 'X0668', 'X0668', 'MAS ZIBANG SUBADIL', '008', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (146, 'X0009', 'X0009', 'SUPARDI,  S.E.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (147, 'X0131', 'X0131', 'LAI\'IN MEIDIA HASTUTI, S.H.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (148, 'X0138', 'X0138', 'AHMAD TEGUH SABRI', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (149, 'X0160', 'X0160', 'IKA ROSDIANA, S.H.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (150, 'X0162', 'X0162', 'Hj. MARIATI, S.E.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (151, 'X0174', 'X0174', 'SIDIK', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (152, 'X0182', 'X0182', 'MUKIM, S.E.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (153, 'X0183', 'X0183', 'H. MOHAMMAD MAKI', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (154, 'X0216', 'X0216', 'H. MUHAMAD ZAENURI', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (155, 'X0218', 'X0218', 'ABDUL HANAN', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (156, 'X0219', 'X0219', 'ZUHAEMAH, S.E.', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (157, 'X0567', 'X0567', 'MUHAMMAD ISTIQLAL', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (158, 'X0667', 'X0667', 'M. NAUFAL MAHARDHIKA PRANANDA', '009', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (159, 'X0024', 'X0024', 'DARA SASKIA MESAYU, S.E.', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (160, 'X0135', 'X0135', 'EMI KRISNAWATI, S.E.', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (161, 'X0144', 'X0144', 'ABDUL WARIS', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (162, 'X0151', 'X0151', 'H. YUDI JANUAR WEDEN, S.E.', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (163, 'X0153', 'X0153', 'MUHAMAD BUDIARLI, S.E.', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (164, 'X0191', 'X0191', 'LALU ZAENAL ARIFIN', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (165, 'X0211', 'X0211', 'WINDY ERDITA CHANDRA, A.Md.', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (166, 'X0676', 'X0676', 'NIKMATIL AHYINI SAKURO', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (167, 'X0678', 'X0678', 'RIRIN APRIANI', '010', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (168, 'X0125', 'X0125', 'MEGA ARSIAH, S.E.', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (169, 'X0152', 'X0152', 'SUKARNAWADI', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (170, 'X0155', 'X0155', 'BAIQ PUSPA HARIANI', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (171, 'X0156', 'X0156', 'MUHAMAD AMRULLAH', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (172, 'X0157', 'X0157', 'ZAENAL ABIDIN', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (173, 'X0167', 'X0167', 'BUDI HARIANTO, S.E.', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (174, 'X0171', 'X0171', 'RINA AGUSTIANI RAIS, S.E.', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (175, 'X0206', 'X0206', 'LALU ANDRI JUNI ATMAWINATA', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (176, 'X0217', 'X0217', 'YULI RAHMA ANDRIANI, S.H.', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (177, 'X0641', 'X0641', 'ANDRE JUNIO HERMAWAN', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (178, 'X0683', 'X0683', 'TIAS JULIA ANANTA', '011', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (179, 'X0066', 'X0066', 'SRI YUNI ASTUTI', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (180, 'X0124', 'X0124', 'H. MUZAKKAR, S.P.', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (181, 'X0132', 'X0132', 'H. PADLI BADRUS, S.E.', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (182, 'X0158', 'X0158', 'NOVIA SOPIA WIJAYA', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (183, 'X0159', 'X0159', 'RAHMAT HIDAYAT', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (184, 'X0175', 'X0175', 'LALU MUHAMMAD ADNAN FAUZI, S.H.', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (185, 'X0188', 'X0188', 'Hj. MERTAYANI', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (186, 'X0200', 'X0200', 'MARZUKI', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (187, 'X0521', 'X0521', 'ERNI JUMHAR, S.E.', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (188, 'X0605', 'X0605', 'ARMAN ARI PRADANA', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (189, 'X0637', 'X0637', 'ADENTIYA YELITA WIYANTARI', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (190, 'X0656', 'X0656', 'GITA SEFA PRAYUDA', '012', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (191, 'X0060', 'X0060', 'WAHYU NAZIRIN', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (192, 'X0136', 'X0136', 'MUHIDIN, S.E.', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (193, 'X0137', 'X0137', 'AHMAD MULYADI SAPUTRA, S.H.', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (194, 'X0164', 'X0164', 'IWAN WIDARTHA, S.H.', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (195, 'X0177', 'X0177', 'Hj. BAIQ BAHRUL AINI', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (196, 'X0180', 'X0180', 'SAHENUM', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (197, 'X0205', 'X0205', 'LALU AKHMAD FAUZI, S.H.', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (198, 'X0207', 'X0207', 'MUHAMAD ABDUH', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (199, 'X0565', 'X0565', 'SITI RIZKY ANI ', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (200, 'X0618', 'X0618', 'MUHAMAD ARDHI WAHYUDI', '013', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (202, 'X0085', 'X0085', 'LALU BADRI', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (203, 'X0086', 'X0086', 'NI NYOMAN ARYATI, S.E.', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (204, 'X0095', 'X0095', 'IKRAM, S.E.', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (205, 'X0186', 'X0186', 'MURDIMAN, S.E.', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (206, 'X0208', 'X0208', 'MUHAMAD IRWAN, S.Sos.', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (207, 'X0209', 'X0209', 'LALU BAYU PUJIANDRA ATMAJA, S.E.', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (208, 'X0586', 'X0586', 'BAIQ WAHYUNI SAFITRI', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (209, 'X0644', 'X0644', 'BAIQ NOVITA DENA CAHYANI', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (210, 'X0693', 'X0693', 'ZEVANIA FARAZETA', '014', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (212, 'X0169', 'X0169', 'DEVI MIASARI, S.Kom.', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (213, 'X0170', 'X0170', 'HARY ZULKARNAEN, S.E.', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (214, 'X0179', 'X0179', 'DIRAWAT', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (215, 'X0192', 'X0192', 'QOMALA SARI DEWI, S.E.', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (216, 'X0198', 'X0198', 'BAIQ MULIANA, S.E.', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (217, 'X0215', 'X0215', 'BUDI AGUS SAHRIAL', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (218, 'X0597', 'X0597', 'GITHA LAKSMI FAHERA', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (219, 'X0639', 'X0639', 'ALDI SEFTIAN SUHAERI', '015', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (220, 'X0059', 'X0059', 'YOS SOEDARSO, S.H.', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (221, 'X0082', 'X0082', 'KAMARUDIN, A.Md.', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (222, 'X0096', 'X0096', 'SUHARDI ANSOR', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (223, 'X0143', 'X0143', 'FAHRUDIN, S.Sos.', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (224, 'X0189', 'X0189', 'ZAITUN', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (225, 'X0190', 'X0190', 'LALU MARYUNAN', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (226, 'X0202', 'X0202', 'DEWI MARIA APRISANI', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (227, 'X0210', 'X0210', 'BAIQ SITI NURBAYA', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (229, 'X0635', 'X0635', 'VIRA APRILIYANTI', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (230, 'X0660', 'X0660', 'IMA NIRWANA PUTRI', '016', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (231, 'X0051', 'X0051', 'BAIQ ENIK NURIWAYATI, S.E.', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (232, 'X0087', 'X0087', 'HILNI WIDA SAFITRI', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (233, 'X0148', 'X0148', 'KIKI MARBASELA ASRIWANI, S.E.', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (234, 'X0178', 'X0178', 'BAIQ PUJA HASTUTI', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (235, 'X0185', 'X0185', 'SAHDAN, S.E.', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (236, 'X0193', 'X0193', 'ADIPATI MASMARENG GEMANG JANUAR, S.E.', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (237, 'X0203', 'X0203', 'ALVIAN FIRDAUS, A.Md.', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (239, 'X0602', 'X0602', 'LALU MUHAMMAD ARI SAGITA DESTRINISA', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (240, 'X0617', 'X0617', 'DEDISETIADI WAHYU PRATAMA', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (241, 'X0651', 'X0651', 'ELSA IN AMIARTI', '017', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (242, 'X0134', 'X0134', 'MAYA HELVIA, S.Pd.', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (243, 'X0224', 'X0224', 'IRLAN YUNIAR, S.E.', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (244, 'X0227', 'X0227', 'ENY KUSMAYANTI, S.E.', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (245, 'X0229', 'X0229', 'SRIDIANI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (246, 'X0236', 'X0236', 'SAMSUL HADI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (248, 'X0278', 'X0278', 'DENI ISNAENI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (249, 'X0562', 'X0562', 'DEWI AZANIATUN APRIANTI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (250, 'X0623', 'X0623', 'ELSA NOVIANTI SAPUTRI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (251, 'X0632', 'X0632', 'MIFTAHUL JANNAH', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (252, 'X0653', 'X0653', 'FEBBY SAPUTRA M, M.Ak', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (253, 'X0672', 'X0672', 'MUHAMMAD ZUHAIR HAMAMI', '018', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (255, 'X0240', 'X0240', 'H. MANSYUR, S.E.', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (256, 'X0241', 'X0241', 'LANDUH ILHAM SATRIA, S.T.', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (257, 'X0242', 'X0242', 'HENDRAWAN SUSILO, S.P.', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (258, 'X0246', 'X0246', 'RACHMAT FAJAR FITRIYANTO, S.Kom.', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (259, 'X0247', 'X0247', 'BAIQ SURYANINGSIH', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (260, 'X0248', 'X0248', 'MARZUKI', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (262, 'X0287', 'X0287', 'SUKARMAN, S.E.', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (263, 'X0603', 'X0603', 'GHINA SALSABILA', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (264, 'X0684', 'X0684', 'TITISAN WAHYU NURUL LAILA', '019', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (265, 'X0239', 'X0239', 'MELANI CATUR WULANDARI', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (266, 'X0244', 'X0244', 'GUPRAN, A.Md.', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (267, 'X0253', 'X0253', 'LALU RAJENDRA GDE WIJAYA', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (268, 'X0255', 'X0255', 'BAIQ ENGGI SUMANTARI', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (269, 'X0256', 'X0256', 'BAIQ SULASTINI', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (271, 'X0271', 'X0271', 'BAIQ SUHARLINA, S.E.', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (272, 'X0582', 'X0582', 'BAIQ DIAN SUKMA LESTARI', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (273, 'X0643', 'X0643', 'BAIQ DYAH FITRIANI ASTUTI', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (274, 'X0666', 'X0666', 'M ROMZI QIZIL', '020', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (275, 'X0230', 'X0230', 'BAIQ MERY APRILIA', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (276, 'X0261', 'X0261', 'ASRINI ROSDIANA, S.E.', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (277, 'X0264', 'X0264', 'ABDILLAH', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (278, 'X0266', 'X0266', 'EMYLIA, S.E.', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (279, 'X0569', 'X0569', 'HELMY NORMANITA', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (280, 'X0627', 'X0627', 'NUR IMAMSYAH SURYADI', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (281, 'X0690', 'X0690', 'YUNITA DWI SAPUTRI', '021', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (282, 'X0225', 'X0225', 'INDAH RIZKIATHI, S.P.', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (283, 'X0233', 'X0233', 'DEVI APRIYASTUTI', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (284, 'X0252', 'X0252', 'MUHAMMAD RUSAN, S.E.', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (285, 'X0263', 'X0263', 'RIZKI PEBRINA, S.E.', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (286, 'X0273', 'X0273', 'ASMIATY', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (287, 'X0274', 'X0274', 'ABDUL MANSYUR', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (288, 'X0277', 'X0277', 'LALU MUH. FAUZI, S.H.', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (289, 'X0633', 'X0633', 'MAYA RIZKI ANZOLA', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (290, 'X0636', 'X0636', 'RANA TRI HULTAVIANA, SE', '022', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (291, 'X0251', 'X0251', 'NUR EDI PURQAN, S.E.', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (292, 'X0279', 'X0279', 'TAUFAN RIADI', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (293, 'X0280', 'X0280', 'MUH. KADERI', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (294, 'X0291', 'X0291', 'ROSPITA, S.Ag.', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (295, 'X0294', 'X0294', 'NURUL AEN, S.E.', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (296, 'X0570', 'X0570', 'M. ALVIAN NUANSA P.', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (297, 'X0611', 'X0611', 'BAIQ JULIANTI', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (298, 'X0658', 'X0658', 'HARTANTI', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (299, 'X0671', 'X0671', 'MUHAMAD BAGAS PARTAWIJAYA', '023', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (300, 'X0283', 'X0283', 'AHMAT BUKRAN, S.Kom.', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (301, 'X0286', 'X0286', 'HUSNUL HAMDI', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (302, 'X0288', 'X0288', 'MUH. LUTFI', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (303, 'X0289', 'X0289', 'LALU ANDRIAN KUSUMA ATMAJA', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (304, 'X0290', 'X0290', 'BAIQ SURIANI', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (305, 'X0584', 'X0584', 'SILFIA AZMIATUN A', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (306, 'X0585', 'X0585', 'SYAWALUDIN AKBAR ALI', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (307, 'X0613', 'X0613', 'ANGGIA MUAWWADATUL AUDINI', '024', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (308, 'X0090', 'X0090', 'IFTIKAR HARYADI, S.E.', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (309, 'X0127', 'X0127', 'MUHAMAD NUH', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (310, 'X0293', 'X0293', 'FITRIAH', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (311, 'X0295', 'X0295', 'MASTUR, S.H.', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (312, 'X0296', 'X0296', 'LALU ASMADIL WASLI, S.E.', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (313, 'X0297', 'X0297', 'MUH. RIPTO', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (314, 'X0298', 'X0298', 'NETI ASTRINA, S.E.', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (315, 'X0299', 'X0299', 'LIS SUGIARTO', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (316, 'X0645', 'X0645', 'BQ. DIANI MARDINA', '025', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (317, 'X0302', 'X0302', 'HUSAIN, S.E.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (318, 'X0303', 'X0303', 'YUYUN WULANSARI, A.Md.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (319, 'X0304', 'X0304', 'DERMAWANSYAH, S.E.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (320, 'X0306', 'X0306', 'NURHASANAH', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (321, 'X0309', 'X0309', 'RIZKA AVISAH, S.E.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (322, 'X0310', 'X0310', 'MURDANI ASTUTI', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (323, 'X0311', 'X0311', 'YULIA PARTINA, S.E.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (324, 'X0314', 'X0314', 'IRAWANSYAH, S.Pd.', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (325, 'X0619', 'X0619', 'LALU MOH HANDIKA HASYIM', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (326, 'X0665', 'X0665', 'LALU PANJI LINTANG', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (327, 'X0691', 'X0691', 'YUYAN ANGGRAINY', '026', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (328, 'X0305', 'X0305', 'SOFYAN', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (329, 'X0315', 'X0315', 'WAN IRAWAN', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (330, 'X0316', 'X0316', 'IIN NURAINI, S.E.', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (331, 'X0318', 'X0318', 'SHERLY IFTIHARI, S.Ak.', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (332, 'X0319', 'X0319', 'NASIATUL JANNAH, S.Ak.', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (333, 'X0322', 'X0322', 'MUHAMMAD YASIN, S.E.', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (334, 'X0455', 'X0455', 'TITIAN RIZKI, S.E.', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (335, 'X0469', 'X0469', 'M. ADITYA PERDANA PUTRA', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (336, 'X0657', 'X0657', 'HAFIZH ALDIANSYAH', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (337, 'X0687', 'X0687', 'VIRA AULIA RAHMAN', '027', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (338, 'X0324', 'X0324', 'SRI SASTRIANINGSIH, A.Md.', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (339, 'X0325', 'X0325', 'RUSTIATI, S.E.', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (340, 'X0330', 'X0330', 'NUNUNG AINURRAHMI', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (341, 'X0331', 'X0331', 'MASUJI', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (342, 'X0336', 'X0336', 'ERNAWATI', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (343, 'X0345', 'X0345', 'I G N NYOMAN WIYADNYANA, S.E.', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (344, 'X0380', 'X0380', 'MUHAMMAD IKHSAN, S.E.', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (345, 'X0397', 'X0397', 'SYAIFUL ANAM, S.E.', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (346, 'X0579', 'X0579', 'CHAERUNNISA', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (347, 'X0609', 'X0609', 'LALU ARYAPANJI ADIPATIWARDANA', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (348, 'X0642', 'X0642', 'AYIE REGITA CAHYANI', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (349, 'X0685', 'X0685', 'VANIA DWI ZUHRA', '028', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (350, 'X0343', 'X0343', 'SITI MUKMIN, S.E.', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (351, 'X0346', 'X0346', 'DANANG ABDAN SYAKURA, S.P.', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (352, 'X0347', 'X0347', 'SIGIT KAMSENO, S.Pd.', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (353, 'X0348', 'X0348', 'BUHARI', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (354, 'X0351', 'X0351', 'Hj. HAJERAH, S.E.', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (355, 'X0357', 'X0357', 'HERMANSYAH', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (356, 'X0398', 'X0398', 'ROWI ISKANDAR', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (357, 'X0492', 'X0492', 'NURIKO YULIANI, S.E.', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (358, 'X0554', 'X0554', 'ARISANDI KAHARUDIN', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (359, 'X0638', 'X0638', 'AHLUN NAZAR ', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (360, 'X0648', 'X0648', 'DEWI SETIAWATI', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (361, 'X0673', 'X0673', 'NADYA MAULIDYA IRAWAN', '029', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (362, 'X0342', 'X0342', 'NURIKHSANI', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (363, 'X0356', 'X0356', 'ARIFUDDIN', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (364, 'X0358', 'X0358', 'LENI YUNANI, S.E.', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (365, 'X0361', 'X0361', 'NURHASANAH, S.E.', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (366, 'X0421', 'X0421', 'MUHAEMIN DEDY S., S.Kom.', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (367, 'X0487', 'X0487', 'MUH. FADLAN, S.Kom.', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (368, 'X0634', 'X0634', 'MUHAMMAD RIZKY', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (369, 'X0646', 'X0646', 'D  ERTIN EZA PRATIWI', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (370, 'X0679', 'X0679', 'RITA MEIANA', '030', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (371, 'X0323', 'X0323', 'LITA ELVIANA, S.E.', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (372, 'X0332', 'X0332', 'RENINTA SULISTIAWATI, A.Md.', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (373, 'X0353', 'X0353', 'YUDI DERRY CASTANA, S.E.', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (374, 'X0365', 'X0365', 'HAMZAH SARIDIN', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (375, 'X0391', 'X0391', 'AN NISAA FITHIASARI, A.Md.', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (376, 'X0574', 'X0574', 'SRI HARTATI', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (377, 'X0577', 'X0577', 'NINDIA YULIANA', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (378, 'X0626', 'X0626', 'RIZTA RININDA', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (379, 'X0670', 'X0670', 'MAYANG LESTARI', '031', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (380, 'X0367', 'X0367', 'NYDIA PRATIWI PUJI LESTARI, A.Md.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (381, 'X0371', 'X0371', 'SRI SUNDARI, S.E.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (382, 'X0372', 'X0372', 'YANDI SURYAWAN, S.Kom.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (383, 'X0373', 'X0373', 'AZHAR ANDANI PUTRA, A.Md.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (384, 'X0376', 'X0376', 'HERU PURWANTO, S.Pd.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (385, 'X0379', 'X0379', 'DIRA MARDIANA, A.Md.', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (386, 'X0664', 'X0664', 'KARTINI INESTI LONDA', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (387, 'X0681', 'X0681', 'SRI AYU DWI SANTIKA', '032', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (388, 'X0366', 'X0366', 'NOVI UTAMI, S.E.', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (389, 'X0382', 'X0382', 'ZULKARNAEN', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (390, 'X0385', 'X0385', 'DAHLIA, S.E.', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (391, 'X0388', 'X0388', 'TAUFIK HIDAYAT', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (392, 'X0620', 'X0620', 'GILANG GINANTA', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (393, 'X0649', 'X0649', 'DHEANA ANANDA DWIPUTRI', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (394, 'X0650', 'X0650', 'EDWIN BASKARA', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (395, 'X0652', 'X0652', 'FAJRIANTI DWI QURNIA', '033', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (396, 'X0339', 'X0339', 'SANDI  IRAWAN, S.E.', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (397, 'X0381', 'X0381', 'IDA NOVIANTI', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (398, 'X0387', 'X0387', 'NURLELA, S.E.', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (399, 'X0390', 'X0390', 'NURHASANAH', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (400, 'X0392', 'X0392', 'SRI YULIANTI', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (401, 'X0395', 'X0395', 'KURNIA ARDIYANSYAH, S.I.P.', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (402, 'X0581', 'X0581', 'NURRUL AN NISHA', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (403, 'X0631', 'X0631', 'RATI RAMDHA AINI', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (404, 'X0640', 'X0640', 'ANDINI DAYANTRI DENDRA WARDHANA', '034', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (405, 'X0301', 'X0301', 'RISAL, S.E.', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (406, 'X0389', 'X0389', 'MUHAMMAD TOHIR', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (407, 'X0399', 'X0399', 'FARIDAH, S.E.', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (408, 'X0400', 'X0400', 'NURAINI, S.H.', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (409, 'X0401', 'X0401', 'FERRY FIRMANSYAH PUTRA, S.E.', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (410, 'X0583', 'X0583', 'BINTANG SABRINA', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (411, 'X0600', 'X0600', 'TAUFIKURRAHMAN', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (412, 'X0601', 'X0601', 'DHICKY SULISTYO', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (413, 'X0689', 'X0689', 'YULISTIA ALWASIFAH', '035', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (414, 'X0317', 'X0317', 'HASANA SRI RAHAYU, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (415, 'X0403', 'X0403', 'KAHARUDDIN, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (416, 'X0404', 'X0404', 'SRI NANINGSIH, A.Md.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (417, 'X0405', 'X0405', 'IRFAN, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (418, 'X0406', 'X0406', 'NURHAFIDAH, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (419, 'X0408', 'X0408', 'ENI LESTARI, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (420, 'X0410', 'X0410', 'EMA SUSILAWATI, A.Md.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (421, 'X0411', 'X0411', 'HJ.MULIASNI, S.E.', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (422, 'X0674', 'X0674', 'NANANG APRIYANTO', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (423, 'X0677', 'X0677', 'RAIHUL FIRDAUS', '036', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (424, 'X0424', 'X0424', 'BINTI ABUYAH, S.E.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (425, 'X0426', 'X0426', 'KHUSNUL KHATIMAH, S.Pd.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (426, 'X0427', 'X0427', 'NURKAUKABAH, S.E.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (427, 'X0428', 'X0428', 'FURKAN AKBAR, S.E.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (428, 'X0430', 'X0430', 'IZDIHAR MAHDIYYAH, S.H.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (429, 'X0468', 'X0468', 'SALAHUDDIN', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (430, 'X0526', 'X0526', 'SUPRIADIN', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (431, 'X0542', 'X0542', 'TRI SUCI WAHDINI, A.Md.', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (432, 'X0606', 'X0606', 'NIDA\' ULHASANAH', '037', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (433, 'X0422', 'X0422', 'SUMARNI', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (434, 'X0439', 'X0439', 'ABDUL SALAM, S.E.', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (435, 'X0441', 'X0441', 'NURLAILA', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (436, 'X0443', 'X0443', 'HAYINUN HANAN, A.Md.', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (437, 'X0445', 'X0445', 'NURSALAM IBRAHIM', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (438, 'X0446', 'X0446', 'LILIS JUMIARTI, S.Pd.', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (439, 'X0462', 'X0462', 'PUTRI FARA AULIA', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (440, 'X0525', 'X0525', 'IMAM MULYANTO', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (441, 'X0610', 'X0610', 'BIMO SATRYO WICAKSONO', '038', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (442, 'X0416', 'X0416', 'QAMARAN MUNIRAN, S.E.', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (443, 'X0419', 'X0419', 'INA HUMAIRAH, S.E.', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (444, 'X0429', 'X0429', 'ENDANG SETIAWATI', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (445, 'X0447', 'X0447', 'EDI SURYADI', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (446, 'X0452', 'X0452', 'Hj. SITI ARAFAH', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (447, 'X0454', 'X0454', 'ZULKARNAIN', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (448, 'X0458', 'X0458', 'NOVI SUPRIYANI', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (449, 'X0459', 'X0459', 'ANDI DIRGAHAYU, S.E.', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (450, 'X0490', 'X0490', 'RUSDIN, S.E.', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (451, 'X0575', 'X0575', 'RESSY SAFITRATULLAH', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (452, 'X0621', 'X0621', 'MUH ALFIAN SANGAJI', '039', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (453, 'X0440', 'X0440', 'H. ABDUL HARIS', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (454, 'X0457', 'X0457', 'MUHAMMAD TRYADI, S.E.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (455, 'X0464', 'X0464', 'AGUS HERI ARJATI, S.E.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (456, 'X0466', 'X0466', 'MARMAH SUGIARTI N., S.E.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (457, 'X0470', 'X0470', 'FADLIN, S.Kom.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (458, 'X0530', 'X0530', 'KRIPTIANTI, S.E.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (459, 'X0533', 'X0533', 'SUCI CAHYATI, A.Md.Kom.', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (460, 'X0663', 'X0663', 'JUMRATUL AKBAR', '040', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (461, 'X0477', 'X0477', 'FAIDAH', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (462, 'X0479', 'X0479', 'IHWAN, S.E.', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (463, 'X0481', 'X0481', 'HERLINA, S.Sos.', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (464, 'X0484', 'X0484', 'ERVINA, A.Md.', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (465, 'X0485', 'X0485', 'SRIWAHYUNINGSIH', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (466, 'X0486', 'X0486', 'ERNI KUSRINI', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (467, 'X0489', 'X0489', 'ADE FARIDA WAHYU KURNIATI, S.H.', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (468, 'X0491', 'X0491', 'NURLATIFAH, S.Pd.', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (469, 'X0501', 'X0501', 'NURADI HASAN', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (470, 'X0507', 'X0507', 'SYAFRUDDIN', '041', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (471, 'X0482', 'X0482', 'NURNANINGSIH, S.Sos.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (472, 'X0488', 'X0488', 'NURHAYATI', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (473, 'X0497', 'X0497', 'AMAN I,LAIDIN, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (474, 'X0500', 'X0500', 'M. SAHRUL', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (475, 'X0505', 'X0505', 'DUDI HARYADI', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (476, 'X0506', 'X0506', 'JAMI', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (477, 'X0508', 'X0508', 'AHYANI RADHIANI, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (478, 'X0510', 'X0510', 'MAEMUN, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (479, 'X0511', 'X0511', 'HIDAYATULLAH, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (480, 'X0513', 'X0513', 'FAHMI, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (481, 'X0517', 'X0517', 'ITAM, S.E.', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (482, 'X0519', 'X0519', 'ARIFIN', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (483, 'X0520', 'X0520', 'AKHYAR', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (484, 'X0545', 'X0545', 'SALAHUDDIN', '042', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (485, 'X0467', 'X0467', 'IMAM ACHMADDIN', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (486, 'X0474', 'X0474', 'M. ARAFAH', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (487, 'X0480', 'X0480', 'RUFIQAH, S.Pt.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (488, 'X0498', 'X0498', 'AMINUDDIN, S.H.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (489, 'X0499', 'X0499', 'SITI ROSDIANAH, A.Md.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (490, 'X0518', 'X0518', 'SITI ASIAH HASAN, S.H.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (491, 'X0522', 'X0522', 'NURMI', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (492, 'X0523', 'X0523', 'JUNAIDIN', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (493, 'X0524', 'X0524', 'RIDWAN, S.H.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (494, 'X0528', 'X0528', 'MELATI, S.Pd.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (495, 'X0529', 'X0529', 'NURWAHIDAH, A.Md.Ak.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (496, 'X0531', 'X0531', 'IDHAM, S.E.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (497, 'X0532', 'X0532', 'MULYADIN, A.Md.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (498, 'X0536', 'X0536', 'SUCI SUSILAWATI, S.E.', '043', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (499, 'X0453', 'X0453', 'NAZARUDDIN', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (500, 'X0503', 'X0503', 'HERY TASMIN', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (501, 'X0539', 'X0539', 'SUBHAN, S.E.', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (502, 'X0544', 'X0544', 'SUKRIN', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (503, 'X0546', 'X0546', 'ZULKARNAIN', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (504, 'X0547', 'X0547', 'SUHARDIN', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (505, 'X0548', 'X0548', 'AHLUL ALBAB, S.Pd.', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (506, 'X0549', 'X0549', 'TAUFIK', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (507, 'X0550', 'X0550', 'EKA PURNAMASARI', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (508, 'X0551', 'X0551', 'YEYEN RAHMADANIS, S.H.', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (509, 'X0552', 'X0552', 'KINANTHI ESTI N, S.Ak.', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (510, 'X0553', 'X0553', 'SYAHRU RAMADHAN, S.Pd.', '044', 'user', '2024-10-18 14:05:02');
INSERT INTO `t_users` VALUES (513, 'supervisor', 'supervisor', 'SDM OPERASIONAL', '000', 'admin', '2024-10-18 16:04:59');

SET FOREIGN_KEY_CHECKS = 1;
