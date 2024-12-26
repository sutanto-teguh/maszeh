-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table maszeh.outlets
DROP TABLE IF EXISTS `outlets`;
CREATE TABLE IF NOT EXISTS `outlets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_outlet` varchar(20) NOT NULL,
  `alamat_outlet` varchar(35) DEFAULT NULL,
  `tipe_outlet` varchar(12) NOT NULL,
  `status_outlet` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table maszeh.outlets: ~13 rows (approximately)
DELETE FROM `outlets`;
INSERT INTO `outlets` (`id`, `nama_outlet`, `alamat_outlet`, `tipe_outlet`, `status_outlet`) VALUES
	(1, 'Meteor', NULL, 'reg', 1),
	(2, 'Dine In', NULL, 'reg', 1),
	(3, 'Kp. Malang ', NULL, 'reg', 1),
	(4, 'Plemahan', NULL, 'reg', 1),
	(5, 'B. Urip', NULL, 'reg', 1),
	(6, 'Nitnet', NULL, 'reg', 1),
	(7, 'Petemon', NULL, 'reg', 1),
	(8, 'Simorejo', NULL, 'reg', 1),
	(9, 'Girilaya', NULL, 'reg', 1),
	(10, 'Simo Hilir', NULL, 'reg', 1),
	(11, 'Simo', NULL, 'reg', 1),
	(12, 'Putat', NULL, 'reg', 1),
	(13, 'Pakis', NULL, 'reg', 1);

-- Dumping structure for table maszeh.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(12) NOT NULL,
  `harga_barang` int NOT NULL,
  `gambar_barang` varchar(35) DEFAULT NULL,
  `keterangan` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table maszeh.products: ~3 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `nama_barang`, `harga_barang`, `gambar_barang`, `keterangan`, `status`) VALUES
	(1, 'Ayam Pass', 9000, NULL, NULL, NULL),
	(2, 'Ayam Hemat', 8000, NULL, NULL, NULL),
	(3, 'Ayam Jumbo', 13000, NULL, NULL, NULL);

-- Dumping structure for table maszeh.products_inventory
DROP TABLE IF EXISTS `products_inventory`;
CREATE TABLE IF NOT EXISTS `products_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` timestamp NOT NULL,
  `id_product` int NOT NULL,
  `id_outlet` int NOT NULL,
  `quantity` int NOT NULL,
  `keterangan` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`),
  KEY `id_outlet` (`id_outlet`),
  CONSTRAINT `products_inventory_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `products_inventory_ibfk_2` FOREIGN KEY (`id_outlet`) REFERENCES `outlets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table maszeh.products_inventory: ~0 rows (approximately)
DELETE FROM `products_inventory`;

-- Dumping structure for table maszeh.products_quantity
DROP TABLE IF EXISTS `products_quantity`;
CREATE TABLE IF NOT EXISTS `products_quantity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `id_outlet` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_barang` (`id_product`),
  KEY `id_outlet` (`id_outlet`),
  CONSTRAINT `products_quantity_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `products_quantity_ibfk_3` FOREIGN KEY (`id_outlet`) REFERENCES `outlets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table maszeh.products_quantity: ~52 rows (approximately)
DELETE FROM `products_quantity`;
INSERT INTO `products_quantity` (`id`, `id_product`, `id_outlet`, `quantity`) VALUES
	(53, 1, 1, 0),
	(54, 1, 2, 0),
	(55, 1, 3, 0),
	(56, 1, 4, 0),
	(57, 1, 5, 0),
	(58, 1, 6, 0),
	(59, 1, 7, 0),
	(60, 1, 8, 0),
	(61, 1, 9, 0),
	(62, 1, 10, 0),
	(63, 1, 11, 0),
	(64, 1, 12, 0),
	(65, 1, 13, 0),
	(66, 2, 1, 0),
	(67, 2, 2, 0),
	(68, 2, 3, 0),
	(69, 2, 4, 0),
	(70, 2, 5, 0),
	(71, 2, 6, 0),
	(72, 2, 7, 0),
	(73, 2, 8, 0),
	(74, 2, 9, 0),
	(75, 2, 10, 0),
	(76, 2, 11, 0),
	(77, 2, 12, 0),
	(78, 2, 13, 0),
	(79, 3, 1, 0),
	(80, 3, 2, 0),
	(81, 3, 3, 0),
	(82, 3, 4, 0),
	(83, 3, 5, 0),
	(84, 3, 6, 0),
	(85, 3, 7, 0),
	(86, 3, 8, 0),
	(87, 3, 9, 0),
	(88, 3, 10, 0),
	(89, 3, 11, 0),
	(90, 3, 12, 0),
	(91, 3, 13, 0),
	(92, 3, 1, 0),
	(93, 3, 2, 0),
	(94, 3, 3, 0),
	(95, 3, 4, 0),
	(96, 3, 5, 0),
	(97, 3, 6, 0),
	(98, 3, 7, 0),
	(99, 3, 8, 0),
	(100, 3, 9, 0),
	(101, 3, 10, 0),
	(102, 3, 11, 0),
	(103, 3, 12, 0),
	(104, 3, 13, 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
