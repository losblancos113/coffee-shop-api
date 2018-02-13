-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.20 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cfthu_db
DROP DATABASE IF EXISTS `cfthu_db`;
CREATE DATABASE IF NOT EXISTS `cfthu_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cfthu_db`;

-- Dumping structure for table cfthu_db.accesstoken
DROP TABLE IF EXISTS `accesstoken`;
CREATE TABLE IF NOT EXISTS `accesstoken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `scopes` text,
  `created` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.accesstoken: ~6 rows (approximately)
DELETE FROM `accesstoken`;
/*!40000 ALTER TABLE `accesstoken` DISABLE KEYS */;
INSERT INTO `accesstoken` (`id`, `ttl`, `scopes`, `created`, `userId`) VALUES
	('0AQjHDcFJyIS3k1LvRDfNp9DC27VsIffiw5XhPJtwYC4UQR9Gp7YQwHf1F5sW3bv', 1209600, NULL, '2018-01-31 09:50:01', 1),
	('9ALsuScssy0OmiJbTRLtRIBE1R9IWJ8cXXgIlk7EEzW1aJCE4dCh7QGNrKFOFDxg', 1209600, NULL, '2018-02-01 02:43:15', 1),
	('bO4ZmAYZzACihKP07wsuzwql06oZIZLqp00DdaGHiFc98IbzLeqXrmb0i89wb7w3', 1209600, NULL, '2018-01-31 04:16:15', 1),
	('e4VaDu20bdGc20rFOdgXgGfFdGvtLNFQ6q5wl3opr60cAPLfDaoidmBcc3yFpQni', 1209600, NULL, '2018-01-31 07:22:42', 1),
	('O9UocrYZRZJF1dWQlQyJsE02vtTfeAQaqKHCPfvUjSxYGFqN2AGuWE27Cjlj0Z8A', 1209600, NULL, '2018-01-31 10:25:03', 1),
	('OhN9yahChnRESwTB0zHYwknt4CyfXZ1nrT38oAk9A13b2DhxzUa1O4VEc2X0ZZ7j', 1209600, NULL, '2018-01-31 08:27:50', 1),
	('ve6SbRZWSrnLlSLfGBEgD4Omzs14CBvzTyv1RRsAQAv69yzgSOxExebX1NzjEt3y', 1209600, NULL, '2018-01-31 10:26:12', 1),
	('x4vsvAQlow37ItR5rvDbjXO01lTBjDAuAECnpMl9pOBOeyFgcX4EpV317vrHVMNj', 1209600, NULL, '2018-01-31 09:51:40', 1);
/*!40000 ALTER TABLE `accesstoken` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.acl
DROP TABLE IF EXISTS `acl`;
CREATE TABLE IF NOT EXISTS `acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(512) DEFAULT NULL,
  `property` varchar(512) DEFAULT NULL,
  `accessType` varchar(512) DEFAULT NULL,
  `permission` varchar(512) DEFAULT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.acl: ~0 rows (approximately)
DELETE FROM `acl`;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.category: ~5 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Cà Phê'),
	(2, 'Sinh tố'),
	(3, 'Trà'),
	(4, 'Ăn vặt'),
	(5, 'Ăn vặt zz'),
	(6, 'Ăn vặt 1234'),
	(7, 'dm 23');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.order
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_completed` tinyint(1) NOT NULL,
  `username` varchar(512) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.order: ~0 rows (approximately)
DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.orderdetail
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `product_name` varchar(512) NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_order`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.orderdetail: ~0 rows (approximately)
DELETE FROM `orderdetail`;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `id_cate` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.product: ~2 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `id_cate`, `price`, `image_path`, `description`) VALUES
	(1, 'Cà phê đen', 1, 20, 'string', 'string'),
	(2, 'Sinh tố bơ', 2, 25, 'string', 'string'),
	(3, 'Trà Bạc Hà', 3, 20, 'string', 'string');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.role: ~0 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.rolemapping
DROP TABLE IF EXISTS `rolemapping`;
CREATE TABLE IF NOT EXISTS `rolemapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principalId` (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.rolemapping: ~0 rows (approximately)
DELETE FROM `rolemapping`;
/*!40000 ALTER TABLE `rolemapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolemapping` ENABLE KEYS */;

-- Dumping structure for table cfthu_db.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table cfthu_db.user: ~0 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `realm`, `username`, `password`, `email`, `emailVerified`, `verificationToken`) VALUES
	(1, NULL, NULL, '$2a$10$TQZz1q41B5jzZ3PppqLeQ.GHa8B6rn01EBmzI6bMia.W/Tk/ZmZFW', 'tri.hoang@nttdata.com', NULL, NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
