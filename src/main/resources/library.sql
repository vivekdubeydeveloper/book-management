-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.17 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for library
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;

-- Dumping structure for table library.author
DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.author: ~9 rows (approximately)
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`id`, `author_name`) VALUES
	(1, 'Premchand'),
	(2, 'Valmiki'),
	(3, 'Kalidas'),
	(5, 'Dharamveer Bharti'),
	(11, 'Dinkar'),
	(12, 'Me'),
	(13, 'Jaishanker Prasad'),
	(16, 'Shelly'),
	(17, 'Keats'),
	(22, 'Milton');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;

-- Dumping structure for table library.author_test
DROP TABLE IF EXISTS `author_test`;
CREATE TABLE IF NOT EXISTS `author_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.author_test: ~1 rows (approximately)
/*!40000 ALTER TABLE `author_test` DISABLE KEYS */;
INSERT INTO `author_test` (`id`, `author_name`) VALUES
	(6, 'Kalidas');
/*!40000 ALTER TABLE `author_test` ENABLE KEYS */;

-- Dumping structure for table library.book
DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_book_author_id_author_id` (`author_id`),
  CONSTRAINT `FK1_book_author_id_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.book: ~9 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id`, `name`, `created_on`, `author_id`) VALUES
	(1, 'Gaban', '2022-11-04 23:36:41', 1),
	(2, 'Ramayan', '2022-11-04 23:36:41', 2),
	(3, 'Meghdoot', '2022-11-04 23:36:41', 3),
	(4, 'Godan', '2022-11-04 23:36:41', 1),
	(5, 'Gunaho Ke Devta', '2022-11-05 23:03:26', 5),
	(11, 'Rashmirathi', '2022-11-05 23:01:52', 11),
	(13, 'Kamayani', '2022-11-06 22:54:27', 13),
	(16, 'Ode to Autumn', '2022-11-07 22:07:25', 16),
	(17, 'Ode to Nightanlge', '2022-11-07 22:11:42', 17),
	(24, 'Paradise Lost', '2022-11-08 23:31:20', 22),
	(25, 'Paradise Gain', '2022-11-08 23:31:20', 22);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table library.book_2
DROP TABLE IF EXISTS `book_2`;
CREATE TABLE IF NOT EXISTS `book_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.book_2: ~9 rows (approximately)
/*!40000 ALTER TABLE `book_2` DISABLE KEYS */;
INSERT INTO `book_2` (`id`, `name`, `author_name`, `created_on`) VALUES
	(1, 'Geeta', 'Ved Vyas', '2022-10-31 23:36:32'),
	(2, 'Ramayan', 'Valmiki', '2022-10-31 23:36:32'),
	(3, 'Gaban', 'Premchand', '2022-10-31 23:36:32'),
	(4, 'Godan', 'Premchand', '2022-10-31 23:36:32'),
	(5, 'Head First Java', 'Kathy', '2022-10-31 23:36:32'),
	(6, 'Let US C', 'Yashwant', '2022-10-31 23:36:32'),
	(11, 'OS', 'Galwin', '2022-10-31 23:36:32'),
	(12, 'Nirmala', 'Premchand', '2022-10-31 23:40:08'),
	(13, 'Meghdoot', 'Kalidas', '2022-10-31 23:57:03'),
	(14, 'Raghuvansh', 'Kalidas', '2022-10-31 23:58:30');
/*!40000 ALTER TABLE `book_2` ENABLE KEYS */;

-- Dumping structure for table library.book_test
DROP TABLE IF EXISTS `book_test`;
CREATE TABLE IF NOT EXISTS `book_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_author_id_id` (`author_id`),
  CONSTRAINT `FK1_author_id_id` FOREIGN KEY (`author_id`) REFERENCES `author_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.book_test: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_test` DISABLE KEYS */;
INSERT INTO `book_test` (`id`, `name`, `author_id`, `created_on`) VALUES
	(7, 'Meghdoot', 6, '2022-11-02 17:30:57');
/*!40000 ALTER TABLE `book_test` ENABLE KEYS */;

-- Dumping structure for table library.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `salary` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table library.employee: ~2 rows (approximately)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`, `name`, `salary`) VALUES
	(1, 'Rajiv', 7000),
	(2, 'Mahesh', 9000),
	(3, 'Rajesh', 20000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
