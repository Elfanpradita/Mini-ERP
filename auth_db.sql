/*
 Navicat Premium Data Transfer

 Source Server         : Jas
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44-0ubuntu0.22.04.1)
 Source Host           : 192.168.0.80:3306
 Source Schema         : auth_db

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 12/01/2026 17:11:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `details` text,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
BEGIN;
INSERT INTO `alembic_version` (`version_num`) VALUES ('323c41f1388b');
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL,
  `posisi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (1, 'Elfan', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (2, 'Andi', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (3, 'Budi', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (4, 'Siti', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (5, 'Rina', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (6, 'Dedi', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (7, 'Fajar', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (8, 'Lina', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (9, 'Agus', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (10, 'Nina', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (11, 'Rudi', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (12, 'Dewi', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (13, 'Asep', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (14, 'Wulan', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (15, 'Yudi', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (16, 'Maya', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (17, 'Bayu', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (18, 'Indah', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (19, 'Rizky', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (20, 'Nur', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (21, 'Toni', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (22, 'Ayu', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (23, 'Dian', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (24, 'Tika', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (25, 'Hendra', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (26, 'Sari', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (27, 'Yoga', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (28, 'Putri', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (29, 'Ilham', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (30, 'Ratna', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (31, 'Arif', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (32, 'Desi', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (33, 'Reza', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (34, 'Fitri', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (35, 'Bagus', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (36, 'Yuliana', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (37, 'Kevin', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (38, 'Monica', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (39, 'Samsul', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (40, 'Olivia', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (41, 'Farhan', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (42, 'Amanda', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (43, 'Hakim', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (44, 'Silvia', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (45, 'Dimas', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (46, 'Laras', 'Finance');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (47, 'Eko', 'HRD');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (48, 'Angel', 'Marketing');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (49, 'Naufal', 'IT');
INSERT INTO `employee` (`id`, `nama`, `posisi`) VALUES (50, 'Kartika', 'Finance');
COMMIT;

-- ----------------------------
-- Table structure for payroll
-- ----------------------------
DROP TABLE IF EXISTS `payroll`;
CREATE TABLE `payroll` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `tanggal_gaji` datetime NOT NULL,
  `gaji_harian` decimal(10,2) DEFAULT NULL,
  `gaji_kali` int DEFAULT NULL,
  `lembur` decimal(10,2) DEFAULT NULL,
  `insentif` decimal(10,2) DEFAULT NULL,
  `gaji_lainnya` text,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of payroll
-- ----------------------------
BEGIN;
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (1, 1, '2026-01-12 05:10:41', 100000.00, 6, 10000.00, 125000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (2, 2, '2026-01-12 05:12:10', 120000.00, 4, 10000.00, 160000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (3, 3, '2026-01-12 05:14:02', 90000.00, 5, 9000.00, 135000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (4, 4, '2026-01-12 05:15:45', 110000.00, 3, 12000.00, 146000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (5, 5, '2026-01-12 05:18:11', 95000.00, 2, 10000.00, 115000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (6, 6, '2026-01-12 05:20:30', 130000.00, 6, 15000.00, 220000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (7, 7, '2026-01-12 05:22:14', 100000.00, 5, 10000.00, 150000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (8, 8, '2026-01-12 05:25:01', 125000.00, 4, 12000.00, 173000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (9, 9, '2026-01-12 05:27:40', 105000.00, 3, 10000.00, 135000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (10, 10, '2026-01-12 05:30:10', 115000.00, 6, 15000.00, 205000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (11, 11, '2026-01-12 05:32:44', 90000.00, 2, 10000.00, 110000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (12, 12, '2026-01-12 05:35:18', 120000.00, 5, 12000.00, 180000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (13, 13, '2026-01-12 05:38:01', 95000.00, 4, 10000.00, 135000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (14, 14, '2026-01-12 05:40:22', 130000.00, 6, 15000.00, 220000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (15, 15, '2026-01-12 05:42:55', 100000.00, 3, 10000.00, 130000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (16, 16, '2026-01-12 05:45:30', 110000.00, 4, 12000.00, 158000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (17, 17, '2026-01-12 05:48:10', 125000.00, 5, 15000.00, 200000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (18, 18, '2026-01-12 05:50:45', 90000.00, 2, 10000.00, 110000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (19, 19, '2026-01-12 05:53:20', 105000.00, 3, 10000.00, 135000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (20, 20, '2026-01-12 05:55:59', 120000.00, 6, 12000.00, 192000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (21, 21, '2026-01-12 05:58:40', 95000.00, 4, 10000.00, 135000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (22, 22, '2026-01-12 06:01:15', 130000.00, 5, 15000.00, 205000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (23, 23, '2026-01-12 06:03:50', 100000.00, 2, 10000.00, 120000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (24, 24, '2026-01-12 06:06:25', 110000.00, 3, 12000.00, 146000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (25, 25, '2026-01-12 06:08:59', 125000.00, 6, 15000.00, 215000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (26, 26, '2026-01-12 06:11:33', 90000.00, 4, 10000.00, 130000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (27, 27, '2026-01-12 06:14:12', 105000.00, 5, 10000.00, 155000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (28, 28, '2026-01-12 06:16:45', 120000.00, 3, 12000.00, 156000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (29, 29, '2026-01-12 06:19:18', 95000.00, 2, 10000.00, 115000.00, NULL);
INSERT INTO `payroll` (`id`, `employee_id`, `tanggal_gaji`, `gaji_harian`, `gaji_kali`, `lembur`, `insentif`, `gaji_lainnya`) VALUES (30, 30, '2026-01-12 06:22:01', 130000.00, 6, 15000.00, 220000.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of transaction
-- ----------------------------
BEGIN;
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (1, '2025-12-23', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (2, '2025-01-25', 'Bensin', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (3, '2025-02-26', 'Belanja', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (4, '2025-08-30', 'Transport', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (5, '2025-05-24', 'Livin\' by Mandiri', 75000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (6, '2025-03-13', 'Listrik', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (7, '2025-09-12', 'Makan', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (8, '2025-08-13', 'Listrik', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (9, '2025-02-04', 'Transport', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (10, '2025-06-30', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (11, '2025-01-17', 'Internet', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (12, '2025-05-01', 'Bensin', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (13, '2025-03-06', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (14, '2025-06-15', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (15, '2025-07-09', 'Pulsa', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (16, '2025-08-06', 'Transport', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (17, '2025-10-03', 'Belanja', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (18, '2025-07-27', 'Makan', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (19, '2025-03-25', 'Internet', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (20, '2025-02-26', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (21, '2025-05-03', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (22, '2025-03-17', 'Makan', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (23, '2025-12-12', 'Pulsa', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (24, '2025-06-20', 'Internet', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (25, '2025-06-21', 'Pulsa', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (26, '2025-06-04', 'Internet', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (27, '2025-10-14', 'Kopi', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (28, '2025-10-31', 'Listrik', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (29, '2025-02-21', 'Pulsa', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (30, '2025-05-11', 'Internet', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (31, '2025-02-23', 'Livin\' by Mandiri', 75000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (32, '2025-04-21', 'Isi Saldo', 300000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (33, '2025-09-07', 'Bensin', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (34, '2025-03-13', 'Listrik', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (35, '2025-02-07', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (36, '2025-05-15', 'Transport', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (37, '2025-04-06', 'Isi Saldo', 350000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (38, '2025-09-10', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (39, '2025-07-19', 'Transport', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (40, '2025-05-16', 'Transport', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (41, '2025-04-05', 'Pulsa', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (42, '2025-09-09', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (43, '2025-02-11', 'Livin\' by Mandiri', 50000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (44, '2025-10-07', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (45, '2025-02-08', 'Internet', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (46, '2025-06-20', 'Kopi', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (47, '2025-05-15', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (48, '2025-10-02', 'Kopi', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (49, '2025-03-23', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (50, '2025-06-18', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (51, '2025-02-08', 'Kopi', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (52, '2025-03-16', 'Listrik', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (53, '2025-02-13', 'Pulsa', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (54, '2025-09-25', 'Bensin', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (55, '2025-01-05', 'Listrik', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (56, '2025-10-15', 'Kopi', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (57, '2025-07-10', 'Kopi', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (58, '2025-10-02', 'Listrik', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (59, '2025-03-23', 'Internet', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (60, '2025-08-26', 'Listrik', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (61, '2025-10-23', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (62, '2025-05-19', 'Livin\' by Mandiri', 150000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (63, '2025-04-18', 'Internet', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (64, '2025-07-29', 'Listrik', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (65, '2025-01-26', 'Kopi', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (66, '2025-09-24', 'Internet', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (67, '2025-11-26', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (68, '2025-08-19', 'Listrik', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (69, '2025-07-28', 'Listrik', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (70, '2025-09-24', 'Bensin', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (71, '2025-10-24', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (72, '2025-03-09', 'Transport', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (73, '2025-12-15', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (74, '2025-07-11', 'Pulsa', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (75, '2025-05-27', 'Internet', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (76, '2025-02-27', 'Bensin', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (77, '2025-08-21', 'Internet', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (78, '2025-01-09', 'Transport', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (79, '2025-10-14', 'Internet', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (80, '2025-02-24', 'Makan', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (81, '2025-10-26', 'Isi Saldo', 350000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (82, '2025-11-13', 'Kopi', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (83, '2025-05-02', 'Transport', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (84, '2025-05-05', 'Transport', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (85, '2025-07-04', 'Pulsa', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (86, '2025-10-04', 'Transport', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (87, '2025-02-16', 'Belanja', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (88, '2025-10-16', 'Belanja', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (89, '2025-04-28', 'Isi Saldo', 300000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (90, '2025-10-08', 'Internet', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (91, '2025-11-04', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (92, '2025-09-13', 'Kopi', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (93, '2025-08-23', 'Pulsa', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (94, '2025-06-16', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (95, '2025-04-26', 'Makan', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (96, '2025-12-21', 'Listrik', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (97, '2025-09-12', 'Transport', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (98, '2025-04-04', 'Transport', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (99, '2025-03-15', 'Transport', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (100, '2025-11-24', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (101, '2025-10-28', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (102, '2025-07-17', 'Pulsa', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (103, '2025-02-08', 'Transport', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (104, '2025-12-23', 'Pulsa', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (105, '2025-10-29', 'Internet', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (106, '2025-05-28', 'Pulsa', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (107, '2025-04-23', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (108, '2025-04-15', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (109, '2025-02-14', 'Listrik', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (110, '2025-03-07', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (111, '2025-08-20', 'Makan', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (112, '2025-08-24', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (113, '2025-10-21', 'Listrik', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (114, '2025-02-21', 'Bensin', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (115, '2025-12-12', 'Isi Saldo', 150000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (116, '2025-11-27', 'Transport', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (117, '2025-04-05', 'Isi Saldo', 250000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (118, '2025-08-19', 'Pulsa', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (119, '2025-11-07', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (120, '2025-11-15', 'Kopi', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (121, '2025-06-19', 'Transport', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (122, '2025-08-17', 'Belanja', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (123, '2025-07-14', 'Livin\' by Mandiri', 50000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (124, '2025-07-16', 'Listrik', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (125, '2025-05-27', 'Internet', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (126, '2025-05-06', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (127, '2025-11-14', 'Bensin', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (128, '2025-10-31', 'Isi Saldo', 150000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (129, '2025-11-05', 'Isi Saldo', 300000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (130, '2025-02-18', 'Makan', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (131, '2025-12-02', 'Kopi', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (132, '2025-08-28', 'Isi Saldo', 150000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (133, '2025-02-20', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (134, '2025-06-22', 'Makan', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (135, '2025-08-01', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (136, '2025-08-14', 'Livin\' by Mandiri', 75000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (137, '2025-04-20', 'Bensin', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (138, '2025-01-19', 'Pulsa', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (139, '2025-05-07', 'Transport', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (140, '2025-01-30', 'Transport', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (141, '2025-06-24', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (142, '2025-05-20', 'Internet', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (143, '2025-04-09', 'Belanja', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (144, '2025-03-22', 'Transport', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (145, '2025-11-22', 'Transport', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (146, '2025-12-22', 'Belanja', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (147, '2025-06-29', 'Pulsa', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (148, '2025-06-11', 'Makan', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (149, '2025-03-07', 'Transport', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (150, '2025-01-29', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (151, '2025-04-15', 'Bensin', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (152, '2025-02-26', 'Pulsa', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (153, '2025-05-02', 'Pulsa', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (154, '2025-10-07', 'Belanja', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (155, '2025-08-30', 'Listrik', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (156, '2025-07-10', 'Kopi', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (157, '2025-12-15', 'Listrik', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (158, '2025-04-07', 'Transport', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (159, '2025-08-16', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (160, '2025-12-25', 'Livin\' by Mandiri', 45000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (161, '2025-10-26', 'Kopi', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (162, '2025-10-01', 'Belanja', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (163, '2025-08-12', 'Livin\' by Mandiri', 30000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (164, '2025-04-12', 'Belanja', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (165, '2025-05-21', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (166, '2025-05-30', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (167, '2025-07-08', 'Makan', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (168, '2025-09-04', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (169, '2025-07-26', 'Belanja', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (170, '2025-02-12', 'Makan', 60000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (171, '2025-10-13', 'Makan', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (172, '2025-05-17', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (173, '2025-01-01', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (174, '2025-01-07', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (175, '2025-05-20', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (176, '2025-08-25', 'Bensin', 50000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (177, '2025-12-10', 'Isi Saldo', 150000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (178, '2025-07-29', 'Transport', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (179, '2025-09-15', 'Internet', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (180, '2025-03-22', 'Listrik', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (181, '2025-10-25', 'Internet', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (182, '2025-07-12', 'Internet', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (183, '2025-10-10', 'Pulsa', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (184, '2025-10-06', 'Belanja', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (185, '2025-09-09', 'Makan', 30000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (186, '2025-03-25', 'Livin\' by Mandiri', 30000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (187, '2025-01-21', 'Isi Saldo', 300000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (188, '2025-05-08', 'Isi Saldo', 400000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (189, '2025-04-10', 'Makan', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (190, '2025-08-18', 'Makan', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (191, '2025-05-31', 'Listrik', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (192, '2025-12-05', 'Listrik', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (193, '2025-03-07', 'Makan', 200000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (194, '2025-06-28', 'Internet', 75000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (195, '2025-06-22', 'Listrik', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (196, '2025-03-19', 'Bensin', 150000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (197, '2025-11-26', 'Isi Saldo', 200000.00, 'debet', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (198, '2025-11-11', 'Livin\' by Mandiri', 200000.00, 'kredit', 'gemini_scan');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (199, '2025-05-27', 'Bensin', 100000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (200, '2025-07-17', 'Belanja', 45000.00, 'kredit', 'manual');
INSERT INTO `transaction` (`id`, `tanggal`, `keterangan`, `amount`, `jenis`, `source`) VALUES (201, '2026-01-12', 'Livin\' by Mandiri', 100000.00, 'kredit', 'gemini_scan');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `username`, `password_hash`, `role`) VALUES (1, 'admin@admin.com', '$2b$12$Y0kE9rmykpOygAT5vriduef9YafLkQBYpLjXf6c96G9pyNQRb6yee', 'superadmin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
