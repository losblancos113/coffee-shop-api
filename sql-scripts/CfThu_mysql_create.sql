DROP DATABASE cfthu_db;
CREATE DATABASE cfthu_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cfthu_db;
CREATE TABLE `user` (
	`username` varchar(20) NOT NULL UNIQUE,
	`name` TEXT NOT NULL,
	`password` varchar(50) NOT NULL,
	`email` varchar(200),
	`level` int NOT NULL,
	PRIMARY KEY (`username`)
);

CREATE TABLE `product` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	`id_cate` int NOT NULL,
	`price` double NOT NULL,
	`image_path` TEXT NOT NULL,
	`description` TEXT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `category` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order` (
	`id` int NOT NULL AUTO_INCREMENT,
	`is_completed` bool NOT NULL,
	`username` varchar(20) NOT NULL,
	`date_created` DATETIME NOT NULL,
	`date_modified` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_detail` (
	`id_order` int NOT NULL,
	`id_product` int NOT NULL,
	`product_name` TEXT NOT NULL,
	`quantity` int NOT NULL,
	`note` TEXT,
	PRIMARY KEY (`id_order`,`id_product`)
);

ALTER TABLE `product` ADD CONSTRAINT `product_fk0` FOREIGN KEY (`id_cate`) REFERENCES `category`(`id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`username`) REFERENCES `user`(`username`);

ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk0` FOREIGN KEY (`id_order`) REFERENCES `order`(`id`);

ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk1` FOREIGN KEY (`id_product`) REFERENCES `product`(`id`);

