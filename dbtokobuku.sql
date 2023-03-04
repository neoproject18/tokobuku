/*
SQLyog Professional v12.5.1 (32 bit)
MySQL - 10.4.27-MariaDB : Database - tokobuku
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokobuku` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokobuku`;

/*Table structure for table `auth_activation_attempts` */

DROP TABLE IF EXISTS `auth_activation_attempts`;

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_activation_attempts` */

insert  into `auth_activation_attempts`(`id`,`ip_address`,`user_agent`,`token`,`created_at`) values 
(1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36','50f8dff240e592020e0b6a270d44ca95','2022-05-13 01:55:34');

/*Table structure for table `auth_groups` */

DROP TABLE IF EXISTS `auth_groups`;

CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_groups` */

insert  into `auth_groups`(`id`,`name`,`description`) values 
(1,'Admin',''),
(2,'Karyawan','');

/*Table structure for table `auth_groups_permissions` */

DROP TABLE IF EXISTS `auth_groups_permissions`;

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_groups_permissions` */

insert  into `auth_groups_permissions`(`group_id`,`permission_id`) values 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(2,1),
(2,2),
(2,3),
(2,6);

/*Table structure for table `auth_groups_users` */

DROP TABLE IF EXISTS `auth_groups_users`;

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_groups_users` */

insert  into `auth_groups_users`(`group_id`,`user_id`) values 
(1,1),
(2,2),
(2,3),
(2,4);

/*Table structure for table `auth_logins` */

DROP TABLE IF EXISTS `auth_logins`;

CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_logins` */

insert  into `auth_logins`(`id`,`ip_address`,`email`,`user_id`,`date`,`success`) values 
(1,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 00:45:38',1),
(2,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 01:02:45',1),
(3,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 11:11:53',1),
(4,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 11:22:20',1),
(5,'::1','naruto@mail.com',3,'2022-01-28 11:42:44',1),
(6,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 18:40:39',1),
(7,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 18:42:12',1),
(8,'::1','naruto@mail.com',3,'2022-01-28 18:46:13',1),
(9,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 18:46:26',1),
(10,'::1','naruto@mail.com',3,'2022-01-28 18:51:05',1),
(11,'::1','dharma.bekti16696@gmail.com',1,'2022-01-28 18:51:22',1),
(12,'::1','dharma.bekti16696@gmail.com',1,'2022-01-29 07:29:43',1),
(13,'::1','naruto@mail.com',3,'2022-01-29 09:09:27',1),
(14,'::1','dharma.bekti16696@gmail.com',1,'2022-01-30 09:32:48',1),
(15,'::1','dharma.bekti16696@gmail.com',1,'2022-01-31 09:33:27',1),
(16,'::1','dharma.bekti16696@gmail.com',1,'2022-01-31 09:53:22',1),
(17,'::1','dharma.bekti16696@gmail.com',1,'2022-01-31 21:03:17',1),
(18,'::1','dharma.bekti16696@gmail.com',1,'2022-02-02 09:03:03',1),
(19,'::1','dharma.bekti16696@gmail.com',1,'2022-02-03 01:58:10',1),
(20,'::1','dharma.bekti16696@gmail.com',1,'2022-02-03 07:15:52',1),
(21,'::1','admin',NULL,'2022-02-03 22:27:24',0),
(22,'::1','dharma.bekti16696@gmail.com',1,'2022-02-03 22:27:32',1),
(23,'::1','dharma.bekti16696@gmail.com',1,'2022-02-04 09:23:34',1),
(24,'::1','dharma.bekti16696@gmail.com',1,'2022-02-04 23:12:00',1),
(25,'::1','dharma.bekti16696@gmail.com',1,'2022-02-06 09:06:49',1),
(26,'::1','dharma.bekti16696@gmail.com',1,'2022-02-07 20:19:34',1),
(27,'::1','dharma.bekti16696@gmail.com',1,'2022-02-08 19:42:10',1),
(28,'::1','dharma.bekti16696@gmail.com',1,'2022-02-09 20:31:39',1),
(29,'::1','dharma.bekti16696@gmail.com',1,'2022-02-10 01:46:15',1),
(30,'::1','dharma.bekti16696@gmail.com',1,'2022-02-14 22:38:43',1),
(31,'::1','dharma.bekti16696@gmail.com',1,'2022-02-21 02:51:40',1),
(32,'::1','dharma.bekti16696@gmail.com',1,'2022-04-24 21:50:06',1),
(33,'::1','agus@mail.com',4,'2022-04-24 22:23:35',1),
(34,'::1','dharma.bekti16696@gmail.com',1,'2022-04-24 22:23:46',1),
(35,'::1','dharma.bekti16696@gmail.com',1,'2022-04-25 00:55:04',1),
(36,'::1','dharma.bekti16696@gmail.com',1,'2022-05-09 23:52:43',1),
(37,'::1','dharma.bekti16696@gmail.com',1,'2022-05-10 23:05:58',1),
(38,'::1','dharma.bekti16696@gmail.com',1,'2022-05-11 21:11:27',1),
(39,'::1','dharma.bekti16696@gmail.com',1,'2022-05-11 21:11:51',1),
(40,'::1','dharma.bekti16696@gmail.com',1,'2022-05-12 02:43:59',1),
(41,'::1','dharma.bekti16696@gmail.com',1,'2022-05-12 03:38:21',1),
(42,'::1','dharma.bekti16696@gmail.com',1,'2022-05-12 03:42:25',1),
(43,'::1','dharma.bekti16696@gmail.com',1,'2022-05-12 21:32:58',1),
(44,'::1','dharma123',9,'2022-05-13 01:54:50',0),
(45,'::1','dharmabekti@gmail.com',9,'2022-05-13 01:55:49',1),
(46,'::1','dharma.bekti16696@gmail.com',1,'2022-05-13 03:23:10',1),
(47,'::1','dharma.bekti16696@gmail.com',1,'2022-05-16 23:52:37',1),
(48,'::1','dharma.bekti16696@gmail.com',1,'2022-05-18 03:02:16',1),
(49,'::1','dharma.bekti16696@gmail.com',1,'2022-05-18 23:36:18',1),
(50,'::1','dharma.bekti16696@gmail.com',1,'2022-05-19 02:56:17',1),
(51,'::1','dharma.bekti16696@gmail.com',1,'2022-05-19 20:39:22',1),
(52,'::1','dharma.bekti16696@gmail.com',1,'2022-05-26 21:32:10',1),
(53,'::1','dharma.bekti16696@gmail.com',1,'2022-05-28 01:10:29',1),
(54,'::1','admin',NULL,'2023-03-03 22:27:26',0),
(55,'::1','admin',NULL,'2023-03-03 22:27:34',0),
(56,'::1','admin',NULL,'2023-03-03 22:27:49',0),
(57,'::1','dharma',NULL,'2023-03-03 22:28:20',0),
(58,'::1','dharma',NULL,'2023-03-03 22:28:25',0),
(59,'::1','agus',NULL,'2023-03-03 22:29:08',0),
(60,'::1','agus',NULL,'2023-03-03 22:29:14',0),
(61,'::1','admin',NULL,'2023-03-03 22:29:20',0),
(62,'::1','admin',NULL,'2023-03-03 22:31:10',0),
(63,'::1','admin',NULL,'2023-03-03 22:31:19',0),
(64,'::1','admin',NULL,'2023-03-03 22:31:25',0),
(65,'::1','admin',NULL,'2023-03-04 00:13:42',0),
(66,'::1','admin',NULL,'2023-03-04 00:13:48',0),
(67,'::1','anomadmin',NULL,'2023-03-04 00:14:34',0),
(68,'::1','dharma.bekti16696@gmail.com',1,'2023-03-04 00:14:41',1);

/*Table structure for table `auth_permissions` */

DROP TABLE IF EXISTS `auth_permissions`;

CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_permissions` */

insert  into `auth_permissions`(`id`,`name`,`description`) values 
(1,'data-buku',''),
(2,'data-customer',''),
(3,'data-kategori-buku',''),
(4,'data-supplier',''),
(5,'data-users',''),
(6,'profil','');

/*Table structure for table `auth_reset_attempts` */

DROP TABLE IF EXISTS `auth_reset_attempts`;

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_reset_attempts` */

/*Table structure for table `auth_tokens` */

DROP TABLE IF EXISTS `auth_tokens`;

CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_tokens` */

/*Table structure for table `auth_users_permissions` */

DROP TABLE IF EXISTS `auth_users_permissions`;

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `auth_users_permissions` */

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `release_year` smallint(4) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` decimal(4,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `book_category_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `book` */

insert  into `book`(`book_id`,`title`,`slug`,`release_year`,`author`,`price`,`discount`,`stock`,`cover`,`book_category_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Mencari Cahaya','mencari-cahaya',2014,'Ki Anom',55000,0.99,43,'1642905669_62bc358b26beb9f760b9.png',2,'2022-01-20 10:29:16','2022-05-18 03:45:22','0000-00-00 00:00:00'),
(2,'Mahabharata','mahabharata',2016,'Ramajuana',85000,0.99,47,'1642998412_baebf6418de657607c9b.jpg',2,'2022-01-20 10:29:43','2022-05-18 03:45:22','0000-00-00 00:00:00'),
(3,'Mencari Cahaya 2','mencari-cahaya-2',2015,'',60000,0.00,100,'default.jpg',2,'2022-01-20 22:56:02','2022-01-23 21:52:21','2022-01-23 21:52:21'),
(4,'Cahaya Bulan','cahaya-bulan',2016,'',89000,0.00,50,'default.jpg',2,'2022-01-21 00:14:10','2022-01-21 03:30:46','2022-01-21 03:30:46'),
(5,'Hujan Tanpa Pelangi','hujan-tanpa-pelangi',2015,'Ki Anom',55000,0.00,97,'1642865725_2628da0ab411f42d8e4a.jpg',2,'2022-01-22 09:35:25','2022-05-18 03:45:22','0000-00-00 00:00:00'),
(6,'36 Jam Jago Coding','36-jam-jago-coding',2021,'Prodi SI',70000,0.00,5,'default.jpg',1,'2022-01-23 21:55:30','2022-01-23 21:55:30','0000-00-00 00:00:00'),
(7,'Ayah','ayah',2013,'Andrea Hirata',55000,30.00,100,'default.jpg',2,'2022-02-08 03:32:10','2022-02-08 03:32:10','0000-00-00 00:00:00'),
(8,'Laskar Pelangi','laskar-pelangi',2007,'Andrea Hirata',55000,0.00,100,'default.jpg',2,'2022-02-08 03:32:10','2022-02-08 03:32:10','0000-00-00 00:00:00'),
(9,'Sang Pemimpi','sang-pemimpi',2008,'Andrea Hirata',55000,0.00,100,'default.jpg',2,'2022-02-08 03:32:10','2022-02-08 03:32:10','0000-00-00 00:00:00'),
(10,'Renbulan Terbenam Di Wajahmu','renbulan-terbenam-di-wajahmu',2015,'Tere Liye',75000,20.00,50,'default.jpg',2,'2022-02-08 03:32:10','2022-05-11 01:58:10','2022-05-11 01:58:10'),
(11,'','',0,'',0,0.00,0,'',1,'2022-02-14 22:40:27','2022-02-14 22:40:34','2022-02-14 22:40:34'),
(12,'1','1',1,'1',1,1.00,1,'',1,'2022-02-14 22:41:05','2022-02-15 04:09:45','2022-02-15 04:09:45'),
(13,'23','23',1,'1',1,0.00,1,'',1,'2022-02-15 03:11:09','2022-02-15 03:30:28','2022-02-15 03:30:28'),
(14,'22','22',22,'22',22,0.00,0,'1644919759_c4bd7d2af038e1ec2ab4.jpg',1,'2022-02-15 03:55:25','2022-02-15 04:09:23','2022-02-15 04:09:23'),
(15,'Rain Story','rain-story',2021,'Dharma Bekti',95000,10.00,100,'1652256290_1f7046848e5497846767.jpeg',2,'2022-05-11 02:36:51','2022-05-12 22:01:23','0000-00-00 00:00:00'),
(16,'Naruto 1','naruto-1',2000,'Kisimoto',50000,2.00,100,'default.jpg',2,'2022-05-19 20:42:16','2022-05-19 20:42:16','0000-00-00 00:00:00'),
(17,'Naruto 2','naruto-2',2000,'Kisimoto',50000,2.00,100,'default.jpg',2,'2022-05-19 20:42:16','2022-05-19 20:42:16','0000-00-00 00:00:00'),
(18,'Naruto 3','naruto-3',2000,'Kisimoto',50000,2.00,100,'default.jpg',2,'2022-05-19 20:42:16','2022-05-19 20:42:16','0000-00-00 00:00:00'),
(19,'Pemulihan Jiwa','pemulihan-jiwa',2013,'Dedy Susanto',55000,30.00,100,'default.jpg',2,'2022-05-28 01:25:24','2022-05-28 01:25:24','0000-00-00 00:00:00'),
(20,'Pemulihan Jiwa 2','pemulihan-jiwa-2',2007,'Dedy Susanto',55000,0.00,100,'default.jpg',2,'2022-05-28 01:25:24','2022-05-28 01:25:24','0000-00-00 00:00:00'),
(21,'Pemulihan Jiwa 3','pemulihan-jiwa-3',2008,'Dedy Susanto',55000,0.00,100,'default.jpg',2,'2022-05-28 01:25:24','2022-05-28 01:25:24','0000-00-00 00:00:00'),
(22,'Pemulihan Jiwa 4','pemulihan-jiwa-4',2015,'Dedy Susanto',75000,20.00,50,'default.jpg',2,'2022-05-28 01:25:24','2022-05-28 01:25:24','0000-00-00 00:00:00');

/*Table structure for table `book_category` */

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
  `book_category_id` int(5) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(50) NOT NULL,
  PRIMARY KEY (`book_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `book_category` */

insert  into `book_category`(`book_category_id`,`name_category`) values 
(1,'Buku Pelajaran'),
(2,'Novel'),
(3,'Komik');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `no_customer` varchar(30) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`name`,`no_customer`,`gender`,`address`,`email`,`phone`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Wulandari Candra Purnama','1707903007043427','L','Ki. Yap Tjwan Bing No. 567, Binjai 56045, Sumbar','aryani.jamalia@mangunsong.web.id','0307 8389 5148','1980-12-24 08:37:07','1988-10-23 05:10:43',NULL),
(2,'Olga Darijan Maryadi','1501301311027424','L','Ki. Sudiarto No. 267, Mojokerto 17445, Kalteng','tampubolon.tira@gmail.co.id','(+62) 345 7642 8227','1991-09-26 00:31:59','2005-09-16 12:52:04',NULL),
(3,'Farhunnisa Salwa Uyainah S.IP','1502700308940645','L','Kpg. Adisumarmo No. 901, Bogor 44959, Jateng','setiawan.vanya@gmail.com','0703 9733 355','2021-10-03 11:32:24','1998-12-12 10:25:59',NULL),
(4,'Cengkir Anggriawan','7404256203017032','L','Gg. Sunaryo No. 405, Administrasi Jakarta Selatan 35486, Aceh','among.melani@gmail.co.id','(+62) 425 8679 858','2009-06-24 22:55:19','1989-06-21 06:18:45',NULL),
(5,'Raditya Gunawan','3522280809117887','L','Ki. Salam No. 102, Pangkal Pinang 80860, Bengkulu','ellis60@sitorus.biz','(+62) 418 0458 044','1971-06-19 23:44:03','2003-04-22 18:43:24',NULL),
(6,'Bella Winarsih','9205626606169254','L','Ki. Sentot Alibasa No. 481, Probolinggo 56639, Bengkulu','dabukke.genta@yahoo.co.id','0788 3550 3237','2020-07-01 20:37:12','1985-11-29 10:34:58',NULL),
(7,'Nrima Raharja Suryono S.H.','1806802802073022','L','Psr. Elang No. 823, Mojokerto 41952, DKI','kawaya53@yahoo.com','0292 8505 1004','2016-01-22 22:50:20','1984-02-11 16:37:26',NULL),
(8,'Garda Adriansyah','1223405107061692','L','Jr. Yogyakarta No. 462, Magelang 16326, Sumbar','damu.rajasa@wibowo.tv','(+62) 547 9075 754','1994-11-03 00:45:58','1978-01-09 13:59:52',NULL),
(9,'Daruna Ramadan','1203194606104773','L','Gg. Sutarto No. 322, Palembang 55640, DIY','maya09@gmail.com','0605 5405 0927','1996-06-21 12:25:16','2012-07-20 05:02:02',NULL),
(10,'Patricia Yuliarti M.Farm','7104412603995177','L','Psr. Urip Sumoharjo No. 596, Tomohon 68922, Jambi','adriansyah.siska@yahoo.co.id','025 3096 8106','2011-09-06 23:37:12','2004-04-24 06:22:25',NULL),
(11,'Wardaya Dadi Megantara','3373446107979201','L','Psr. Otto No. 423, Tarakan 51051, Kalbar','fmaryati@gmail.com','0220 4241 911','1992-04-15 15:14:46','1999-01-30 07:34:24',NULL),
(12,'Bala Napitupulu S.IP','1608515308123651','L','Jln. Babadan No. 647, Madiun 31550, Sultra','gamblang.novitasari@yahoo.co.id','0485 2061 029','2000-11-01 07:00:47','2017-02-28 06:11:22',NULL),
(13,'Maria Rahayu','9112934503153592','L','Psr. Bakaru No. 746, Salatiga 50499, Jambi','silvia40@pradana.id','(+62) 679 0626 927','1995-05-03 17:51:15','1987-12-04 03:10:04',NULL),
(14,'Laila Mardhiyah','1101770409953937','L','Jln. Ujung No. 571, Pangkal Pinang 14499, Sulbar','inajmudin@yahoo.com','(+62) 765 0795 330','2008-05-19 12:04:22','1972-02-03 02:34:06',NULL),
(15,'Mala Juli Pudjiastuti S.H.','9211004210033033','L','Gg. Jambu No. 385, Gunungsitoli 78958, Jabar','prima67@adriansyah.desa.id','(+62) 495 0247 682','1998-09-05 01:55:24','1982-04-23 17:33:19',NULL),
(16,'Lidya Riyanti','6105060202072107','L','Kpg. Baladewa No. 919, Kendari 54726, Kalsel','rina.agustina@mandasari.name','(+62) 836 0151 498','2018-06-13 05:37:30','1980-02-23 00:07:54',NULL),
(17,'Cecep Mustofa','1571791111963362','L','Psr. Elang No. 774, Tegal 71500, Lampung','warji14@gmail.co.id','0398 8006 0226','1970-03-24 07:45:12','2017-12-22 02:14:12',NULL),
(18,'Novi Oktaviani','1605141004925550','L','Gg. Jaksa No. 421, Tangerang Selatan 58646, Papua','iriana.saragih@lazuardi.sch.id','0419 2182 5956','1984-03-17 04:12:21','1974-05-05 02:06:13',NULL),
(19,'Teddy Gandi Haryanto S.E.','1273102808154816','L','Jr. Baiduri No. 189, Administrasi Jakarta Barat 32333, Maluku','kusmawati.warta@yahoo.com','(+62) 220 6470 5768','1972-02-17 07:53:51','1984-01-19 04:45:50',NULL),
(20,'Unggul Galih Megantara M.Farm','6210592611098081','L','Ki. Yap Tjwan Bing No. 586, Administrasi Jakarta Pusat 96158, Riau','nprastuti@prasetya.my.id','0455 0310 0364','2010-11-24 16:55:18','1992-08-05 03:09:55',NULL),
(21,'Baktiono Hutagalung','3216995603117516','L','Gg. Bah Jaya No. 376, Banjar 62382, Sultra','ulva52@hakim.mil.id','(+62) 920 5490 9555','1990-12-14 11:07:07','1978-07-20 07:10:22',NULL),
(22,'Diah Nadia Yuliarti S.Ked','6201464204963106','L','Kpg. Ahmad Dahlan No. 742, Sukabumi 54896, Sulsel','namaga.carla@yahoo.com','(+62) 29 9970 337','2006-11-09 10:26:13','2015-04-02 18:25:51',NULL),
(23,'Uli Ade Laksita M.Farm','1503142605124770','L','Jr. Abdul Muis No. 15, Ternate 66336, NTB','prasasta.ismail@siregar.id','0615 6619 7789','2001-10-18 16:01:45','2000-03-23 15:22:24',NULL),
(24,'Laras Hartati','6411161603034553','L','Ki. Dahlia No. 428, Parepare 93655, Kepri','kenari13@astuti.go.id','(+62) 693 1155 5941','2018-02-11 10:23:37','2003-12-15 03:37:29',NULL),
(25,'Vicky Zamira Melani','3215030410950106','L','Kpg. Gegerkalong Hilir No. 198, Solok 87630, Pabar','mandala.vivi@gmail.co.id','(+62) 430 1409 584','1973-04-06 06:38:56','1990-11-05 12:58:08',NULL),
(26,'Marsudi Natsir S.E.I','9207705102092850','L','Jr. Villa No. 380, Ternate 20371, Pabar','ilsa84@prabowo.co','0231 2647 0706','1993-07-09 22:45:29','1977-07-28 10:03:44',NULL),
(27,'Cagak Pradipta','3204066010002075','L','Jr. Laksamana No. 913, Binjai 99921, Kalteng','nbudiyanto@yahoo.com','0515 2530 390','2021-05-08 17:45:03','1995-09-16 18:56:59',NULL),
(28,'Manah Sitorus','7605340110116378','L','Kpg. Acordion No. 553, Solok 23703, Sumbar','najwa72@hastuti.biz.id','(+62) 995 2926 389','1975-12-31 03:50:11','2014-10-16 15:24:13',NULL),
(29,'Zelaya Mayasari','3574794607940305','L','Psr. Bagonwoto  No. 10, Madiun 83190, NTB','bzulaika@gmail.co.id','0285 0757 1792','2000-06-27 08:32:11','2008-05-02 05:02:33',NULL),
(30,'Wulan Paramita Lestari','7202441312210327','L','Ki. Antapani Lama No. 682, Bau-Bau 39681, Sulteng','wasita.yessi@susanti.mil.id','028 8645 8104','1984-12-12 07:31:47','1980-08-11 19:27:43',NULL),
(31,'Kamila Usamah S.I.Kom','5201150406012623','L','Dk. Wahidin Sudirohusodo No. 38, Padang 51732, Sumut','ida18@aryani.biz','(+62) 402 4173 0021','1981-02-19 22:53:06','1984-02-02 11:09:54',NULL),
(32,'Zamira Nasyidah','9209316604072954','L','Gg. Basket No. 354, Cimahi 61904, Kalsel','nfarida@nuraini.sch.id','(+62) 640 4066 132','1988-05-26 17:03:35','1972-12-12 04:14:40',NULL),
(33,'Kania Lestari','6407132907048956','L','Gg. Ujung No. 488, Lubuklinggau 77841, Gorontalo','uyainah.gamanto@gmail.com','0918 7066 119','2021-04-20 20:05:37','1983-03-08 09:28:55',NULL),
(34,'Prima Elon Prasetya','3521785305961862','L','Jln. Achmad No. 181, Pontianak 49176, Gorontalo','priyanti@yahoo.com','(+62) 911 1117 3321','1970-04-20 19:12:50','2012-09-09 15:57:53',NULL),
(35,'Hendra Harsanto Firmansyah','1671371309021802','L','Kpg. Urip Sumoharjo No. 514, Kupang 29373, Sumbar','utama.oktaviani@safitri.my.id','(+62) 741 6389 4814','2002-11-09 12:58:02','1996-08-08 07:14:41',NULL),
(36,'Jessica Febi Kusmawati M.M.','7106430306150606','L','Psr. Antapani Lama No. 351, Pagar Alam 77592, Kalteng','ganjaran.wibisono@gmail.co.id','022 8147 194','1994-09-09 12:07:48','2003-12-02 20:58:38',NULL),
(37,'Ana Lailasari S.H.','6408606406095789','L','Dk. Gajah No. 500, Pekanbaru 62440, Bengkulu','vera65@megantara.co','0430 0737 359','1996-03-05 00:49:48','1992-07-11 08:26:55',NULL),
(38,'Oliva Fitria Winarsih','6111006103983978','L','Ki. Kiaracondong No. 68, Kupang 85353, Kalbar','jumadi98@yolanda.net','024 4805 281','1995-01-02 02:46:32','1987-08-13 01:43:01',NULL),
(39,'Luis Waluyo','9171895201135880','L','Jln. Bagis Utama No. 636, Banjar 15336, Babel','gsuryatmi@yahoo.com','(+62) 419 6541 945','1981-06-24 10:21:33','1997-07-19 15:28:46',NULL),
(40,'Cinthia Nadine Hassanah S.IP','3310524408077774','L','Kpg. Suryo Pranoto No. 871, Serang 27481, Maluku','luthfi.hutasoit@yahoo.co.id','(+62) 453 3813 611','1977-08-06 16:43:51','1997-02-26 14:12:49',NULL),
(41,'Tiara Suryatmi M.Pd','7605574608216420','L','Ki. Acordion No. 560, Sorong 37511, Sulut','restu.lailasari@yahoo.com','(+62) 29 4507 958','1976-04-24 22:49:37','2015-10-22 18:04:20',NULL),
(42,'Respati Prasetyo','9103093004180082','L','Dk. Orang No. 153, Administrasi Jakarta Utara 73523, Kaltim','karna.adriansyah@yahoo.co.id','(+62) 266 8889 8425','1982-09-28 18:21:47','2005-04-04 00:25:48',NULL),
(43,'Genta Riyanti','7406515608029844','L','Ds. Pahlawan No. 951, Padangpanjang 13413, DIY','rahayu.hairyanto@kurniawan.co.id','0627 7775 6560','2003-09-02 00:25:09','1988-03-30 06:19:08',NULL),
(44,'Zizi Andriani M.Ak','5271191701034622','L','Dk. Ujung No. 881, Gorontalo 78529, Sulteng','utami.mala@yahoo.co.id','(+62) 759 7840 8902','2006-03-30 19:47:33','2002-01-11 17:46:52',NULL),
(45,'Paramita Hasanah','3273975810015285','L','Jln. Gedebage Selatan No. 605, Sungai Penuh 29062, Banten','daruna.hasanah@prabowo.biz.id','0770 0982 969','1986-08-14 17:03:08','2017-08-16 11:24:55',NULL),
(46,'Lembah Adriansyah','6308446311108193','L','Dk. Baan No. 775, Malang 41597, Jateng','juli.salahudin@prakasa.go.id','(+62) 321 6524 179','2004-01-10 10:36:01','1981-02-13 05:58:37',NULL),
(47,'Aslijan Jamal Hutagalung S.Sos','6311940110967965','L','Kpg. Baranang Siang Indah No. 441, Sorong 61906, Kalbar','jailani.ella@halimah.desa.id','(+62) 611 0735 8231','2010-04-27 17:20:26','1973-08-05 10:03:35',NULL),
(48,'Ade Pratiwi','6401240701088996','L','Gg. Pacuan Kuda No. 424, Sorong 74342, Kalsel','gabriella.agustina@gmail.co.id','(+62) 307 2323 0182','1995-11-01 01:52:01','2001-12-26 14:20:47',NULL),
(49,'Hendri Darijan Saragih','5311082012142836','L','Kpg. Bahagia  No. 101, Jambi 26358, Maluku','devi62@gmail.com','(+62) 984 9633 4714','2010-03-18 17:12:43','1993-01-09 08:06:50',NULL),
(50,'Daliono Putra S.Farm','2172544105200530','L','Ds. Ikan No. 947, Prabumulih 65014, Papua','ksihombing@gmail.co.id','(+62) 27 7473 2904','1988-07-08 19:03:02','1971-02-20 08:53:50',NULL),
(51,'Eli Zulaika','8108800401162306','L','Ki. Gegerkalong Hilir No. 649, Sungai Penuh 23626, Sulsel','viktor51@hutagalung.asia','0365 3721 1941','1985-03-31 05:10:44','2021-12-26 10:11:19',NULL),
(52,'Banara Hardiansyah','7205121705209100','L','Ds. Casablanca No. 336, Tarakan 18972, Sulteng','marbun.darsirah@yahoo.co.id','0797 6441 0279','1971-10-29 18:28:30','1983-03-08 14:45:30',NULL),
(53,'Mariadi Wibisono','7101164110046249','L','Jr. Suprapto No. 645, Bukittinggi 76613, Sumbar','marpaung.elvina@wahyudin.co','0870 057 503','2015-04-12 17:51:37','2011-11-27 08:06:29',NULL),
(54,'Ajiman Mansur','3218114409965543','L','Jr. Bass No. 687, Sukabumi 87195, Bali','bmaryadi@laksita.info','(+62) 556 6698 978','1988-01-17 11:58:26','2008-12-12 01:19:03',NULL),
(55,'Mahdi Nugraha Latupono','3371161609004268','L','Ki. Baan No. 153, Tangerang 18563, Maluku','qori23@pradana.go.id','(+62) 819 251 473','2004-03-18 07:48:29','1991-01-08 19:03:24',NULL),
(56,'Elma Ayu Susanti S.Pd','1673824909927529','L','Ds. Ciumbuleuit No. 829, Denpasar 99149, Sulteng','ghabibi@rajata.desa.id','0543 5430 3148','1971-10-18 15:52:11','1993-05-18 08:42:27',NULL),
(57,'Kezia Melani','6203960504009389','L','Ds. Basmol Raya No. 142, Palangka Raya 54102, Sulteng','pardi.nuraini@rahmawati.com','0396 5952 132','2017-01-03 02:27:30','1991-07-20 09:48:43',NULL),
(58,'Titi Rahmawati S.E.I','3278612801972085','L','Ki. Pattimura No. 271, Parepare 66717, Kalsel','himawan92@wastuti.my.id','(+62) 592 8726 6040','1987-04-29 14:14:32','1991-10-02 19:31:06',NULL),
(59,'Upik Maheswara S.IP','5272794106045040','L','Psr. Madiun No. 423, Gunungsitoli 99823, Sumsel','kayla92@uyainah.com','(+62) 894 9966 581','1999-06-02 02:23:00','2012-11-29 22:26:11',NULL),
(60,'Reza Budiman M.M.','3513337008148961','L','Gg. Ujung No. 841, Denpasar 42829, Bengkulu','febi87@safitri.mil.id','023 6583 126','1993-03-29 17:32:05','1985-04-13 11:41:57',NULL),
(61,'Yance Uli Fujiati M.Pd','3512464801013126','L','Kpg. Abdul No. 58, Tarakan 62789, Bali','fujiati.putri@pudjiastuti.in','(+62) 529 7491 223','1979-06-30 22:19:38','2010-05-10 22:09:35',NULL),
(62,'Ani Farida','3372550203190718','L','Psr. Suniaraja No. 264, Jambi 84602, Pabar','ylazuardi@siregar.go.id','(+62) 709 6390 0395','1970-10-21 06:29:53','2010-12-05 04:22:57',NULL),
(63,'Ida Kiandra Utami','7107861712956044','L','Jln. Baan No. 257, Probolinggo 60938, Jambi','nsuartini@gmail.com','0467 1043 6668','1997-01-11 11:37:17','1990-09-08 01:56:37',NULL),
(64,'Atma Kuswoyo','9205030202949010','L','Gg. Gajah No. 712, Ternate 24758, NTB','gaduh38@gmail.co.id','(+62) 615 9033 4684','1981-03-12 05:12:50','2010-05-28 16:28:18',NULL),
(65,'Hartana Marpaung M.M.','1404725202174761','L','Psr. Dipatiukur No. 831, Tomohon 43777, Sultra','puspasari.tania@nasyiah.org','0785 3926 609','2009-04-25 21:57:59','1977-10-19 13:09:11',NULL),
(66,'Genta Hasanah','1273652806007918','L','Dk. Bhayangkara No. 29, Bau-Bau 73837, Sulut','mmandasari@gmail.com','(+62) 885 4318 465','2003-02-27 06:30:14','2003-02-24 12:52:12',NULL),
(67,'Cahyanto Habibi','2104075912072685','L','Dk. K.H. Wahid Hasyim (Kopo) No. 531, Banda Aceh 23944, Banten','tomi.agustina@latupono.ac.id','(+62) 992 2088 5351','1973-03-10 08:09:46','1982-01-14 19:04:09',NULL),
(68,'Calista Mardhiyah','1101425207106894','L','Psr. Hang No. 877, Tidore Kepulauan 95771, Kepri','hsaptono@anggraini.com','(+62) 622 2729 4464','1993-01-11 03:45:46','1970-06-08 02:47:27',NULL),
(69,'Halima Laksita','1707234912981327','L','Kpg. Ikan No. 343, Batu 37672, Sulbar','cinta35@hutasoit.info','(+62) 812 467 887','2009-04-24 22:43:11','2002-11-08 04:56:55',NULL),
(70,'Farhunnisa Ana Widiastuti M.Kom.','6202585905170648','L','Ds. R.E. Martadinata No. 968, Bengkulu 22500, Jatim','hwaluyo@yahoo.co.id','(+62) 360 7985 580','1996-02-24 06:50:23','2014-11-03 11:49:46',NULL),
(71,'Dina Lidya Susanti','7601311912070337','L','Jr. Imam Bonjol No. 665, Sorong 91770, Babel','emardhiyah@gmail.com','(+62) 483 8555 017','1987-06-23 00:38:04','1987-01-27 16:54:11',NULL),
(72,'Malika Rachel Mulyani S.H.','1809040812156789','L','Ki. Bambu No. 775, Palopo 60013, Babel','karimah29@yahoo.com','0294 6668 0510','1987-05-18 04:06:39','1976-07-04 09:44:11',NULL),
(73,'Prasetyo Maulana','1504781307049706','L','Ki. Jagakarsa No. 834, Administrasi Jakarta Selatan 19320, NTT','halimah.calista@yahoo.co.id','(+62) 430 1529 524','1988-12-12 01:22:45','1998-11-30 03:52:36',NULL),
(74,'Lantar Waskita','7604766711124612','L','Ds. S. Parman No. 992, Solok 90123, Kaltara','qrajasa@waskita.go.id','0590 6309 7067','1998-09-18 02:38:04','1992-07-08 02:36:51',NULL),
(75,'Luis Utama M.M.','9104972912010023','L','Jln. Kalimantan No. 926, Bima 43128, Sulut','hafshah.novitasari@gmail.com','(+62) 20 3496 5689','2016-04-08 02:48:45','1970-04-09 21:27:19',NULL),
(76,'Latif Uwais','7373321508148925','L','Jr. Baladewa No. 574, Cimahi 41570, Papua','permata.bakidin@latupono.or.id','(+62) 338 6288 9380','1975-11-04 00:47:12','1979-07-01 13:22:43',NULL),
(77,'Bambang Mitra Gunawan','3521356707942410','L','Ki. Veteran No. 454, Tangerang Selatan 71174, Lampung','fmangunsong@thamrin.co','023 3565 467','2003-03-15 02:47:50','2007-11-05 23:14:46',NULL),
(78,'Nadine Rahayu S.H.','1306491609000627','L','Dk. Gajah Mada No. 112, Tebing Tinggi 22484, Jabar','karma.pudjiastuti@prasetyo.my.id','(+62) 328 0956 9835','1976-11-24 13:54:51','1981-06-29 06:09:36',NULL),
(79,'Wulan Astuti','7371841810968935','L','Psr. Peta No. 737, Kediri 87427, Sultra','daru46@gmail.co.id','0589 1236 1269','1975-09-09 19:24:14','2007-08-18 05:29:58',NULL),
(80,'Kairav Sihombing','3604640510107680','L','Ki. Sunaryo No. 850, Blitar 55484, Jatim','wawan.waluyo@yolanda.asia','0775 7560 328','2002-10-18 17:48:49','2012-11-24 08:48:35',NULL),
(81,'Kartika Maria Hassanah M.TI.','1217034303022370','L','Gg. Sam Ratulangi No. 464, Tual 41182, Sulteng','johan63@yahoo.com','0867 6297 2538','1999-03-20 22:40:38','1983-09-16 00:41:50',NULL),
(82,'Liman Gandewa Maulana','1371356110185593','L','Kpg. Otista No. 233, Padangpanjang 92487, Babel','vanggraini@putra.co','(+62) 548 9535 8887','1978-01-22 17:34:48','2016-09-18 05:20:41',NULL),
(83,'Vanesa Usada','1373344301934284','L','Dk. Otto No. 318, Pekalongan 13680, Aceh','zelaya.nasyidah@wacana.web.id','(+62) 661 6802 421','1999-08-15 14:23:50','1993-08-13 07:43:14',NULL),
(84,'Ellis Winarsih','7401534903107228','L','Jr. Setiabudhi No. 619, Tegal 39855, Riau','zsuryono@yahoo.co.id','0450 7833 908','1982-06-18 16:51:41','2009-04-26 14:08:55',NULL),
(85,'Purwa Marbun S.Farm','7410953101938754','L','Dk. Yap Tjwan Bing No. 840, Makassar 64675, Banten','rajata.nova@hariyah.mil.id','(+62) 831 5799 993','2014-05-02 02:14:38','2004-02-01 21:07:00',NULL),
(86,'Siska Mandasari','6104215307167167','L','Gg. Ekonomi No. 781, Palembang 99886, Banten','sabrina63@kusmawati.id','029 7058 9101','1975-06-30 17:29:40','2000-01-27 13:28:02',NULL),
(87,'Mulya Galiono Siregar','1606024508211792','L','Dk. Bass No. 169, Magelang 73265, Kalteng','qrahmawati@gmail.co.id','0679 1610 084','2002-05-20 13:58:37','1971-02-09 17:22:33',NULL),
(88,'Rachel Padmasari','3504401409163947','L','Psr. Laswi No. 914, Palu 17592, Sultra','qfarida@yahoo.com','0695 2927 3627','2003-04-02 18:26:29','2005-03-20 23:57:53',NULL),
(89,'Kenzie Panji Gunarto S.Pt','5303270801981722','L','Ds. Pasir Koja No. 69, Payakumbuh 80861, Babel','danang51@lazuardi.tv','0584 1474 2939','1978-01-19 10:28:55','1981-11-21 23:28:57',NULL),
(90,'Cahyono Jaka Putra','3329234210214196','L','Ds. Baja Raya No. 637, Sungai Penuh 22971, Sulbar','daru55@maulana.info','0398 3512 1567','1985-02-02 19:00:13','1977-04-22 10:00:18',NULL),
(91,'Yunita Laksita','3274065401085964','L','Ki. Ciumbuleuit No. 272, Padang 28972, Lampung','psudiati@yahoo.com','0810 956 717','1979-10-16 00:39:25','1990-04-15 10:09:57',NULL),
(92,'Juli Yani Astuti','7211394710153604','L','Psr. Ters. Pasir Koja No. 235, Bukittinggi 30587, NTT','ymaheswara@pertiwi.biz.id','(+62) 403 6210 9461','1987-09-11 11:07:35','2014-03-28 09:19:48',NULL),
(93,'Mumpuni Nugroho','6306360512112706','L','Dk. Diponegoro No. 19, Sorong 55089, Jatim','luwar02@yahoo.co.id','0490 3581 142','2019-02-04 02:16:40','1974-10-21 23:58:55',NULL),
(94,'Hamima Nuraini','7209850506155722','L','Gg. Haji No. 307, Surabaya 49438, Sumbar','clara.susanti@oktaviani.biz','(+62) 425 0925 3158','2008-10-12 12:08:10','2015-06-09 10:59:07',NULL),
(95,'Opan Nugroho','7405556611027682','L','Gg. Baha No. 326, Semarang 25260, Bali','gunarto.salwa@hutagalung.or.id','(+62) 743 3312 725','1988-01-27 11:38:46','2006-08-15 00:25:39',NULL),
(96,'Cagak Thamrin','9112072609033694','L','Psr. Tentara Pelajar No. 912, Padangpanjang 42542, Sumut','alika.prastuti@iswahyudi.id','0713 6183 9630','1973-09-07 02:19:59','2021-08-11 20:30:53',NULL),
(97,'Opan Daniswara Sitompul M.M.','5321281609142825','L','Dk. Raden No. 943, Semarang 17225, Lampung','warsa.agustina@agustina.web.id','0968 2445 3253','2003-12-14 10:25:31','2019-05-23 14:38:29',NULL),
(98,'Lulut Tamba S.IP','9117504209122452','L','Kpg. Kusmanto No. 987, Mojokerto 27663, Lampung','gada18@haryanti.my.id','0552 9475 954','1980-05-30 00:04:51','1970-06-06 09:43:36',NULL),
(99,'Eli Yessi Anggraini M.Pd','3375304610181057','L','Ds. Bhayangkara No. 334, Singkawang 79413, Kaltara','amelia.susanti@waskita.co','(+62) 27 5236 4801','2011-11-19 11:07:33','2017-01-14 10:44:29',NULL),
(100,'Vivi Zulaika','7308460404934975','L','Jln. Bambon No. 606, Tarakan 63350, NTT','gandi90@gmail.com','0973 5406 1758','1994-09-09 22:25:18','2005-03-18 07:30:06',NULL),
(102,'Anom','','L','','','',NULL,NULL,NULL),
(104,'Bekti Suratmanto','','L','','','',NULL,NULL,NULL);

/*Table structure for table `log_customer` */

DROP TABLE IF EXISTS `log_customer`;

CREATE TABLE `log_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `no_customer` varchar(30) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `log_customer` */

insert  into `log_customer`(`id`,`customer_id`,`name`,`no_customer`,`gender`,`address`,`email`,`phone`,`created_at`) values 
(1,100,'Vivi Zulaika','7308460404934975','L','Jln. Bambon No. 606, Tarakan 63350, NTT','gandi90@gmail.com','0973 5406 1758','1994-09-09 22:25:18'),
(2,100,'Vivi Zulaika 2','7308460404934975','L','Jln. Bambon No. 606, Tarakan 63350, NTT','gandi90@gmail.com','0973 5406 1758','1994-09-09 22:25:18'),
(3,1,'Wulan Ciaobella Widiastuti','1707903007043427','L','Ki. Yap Tjwan Bing No. 567, Binjai 56045, Sumbar','aryani.jamalia@mangunsong.web.id','0307 8389 5148','1980-12-24 08:37:07'),
(4,1,'Wulan Candra','1707903007043427','L','Ki. Yap Tjwan Bing No. 567, Binjai 56045, Sumbar','aryani.jamalia@mangunsong.web.id','0307 8389 5148','1980-12-24 08:37:07'),
(5,1,'Wulan Candra','1707903007043427','L','Ki. Yap Tjwan Bing No. 567, Binjai 56045, Sumbar','aryani.jamalia@mangunsong.web.id','0307 8389 5148','1980-12-24 08:37:07');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values 
(3,'2017-11-20-223112','Myth\\Auth\\Database\\Migrations\\CreateAuthTables','default','Myth\\Auth',1643341141,1);

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `purchase_id` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `purchase` */

/*Table structure for table `purchase_detail` */

DROP TABLE IF EXISTS `purchase_detail`;

CREATE TABLE `purchase_detail` (
  `purchase_id` varchar(15) NOT NULL,
  `book_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `purchase_detail` */

/*Table structure for table `sale` */

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `sale_id` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `sale` */

insert  into `sale`(`sale_id`,`user_id`,`customer_id`,`created_at`,`updated_at`) values 
('J1643860456',1,9,'2022-02-02 21:54:16','2022-02-02 21:54:16'),
('J1643860564',1,3,'2022-02-02 21:56:04','2022-02-02 21:56:04'),
('J1643910031',1,0,'2022-02-03 11:40:31','2022-02-03 11:40:31'),
('J1643910106',1,0,'2022-02-03 11:41:46','2022-02-03 11:41:46'),
('J1644216274',1,0,'2022-02-07 00:44:34','2022-02-07 00:44:34'),
('J1652863509',1,0,'2022-05-18 03:45:09','2022-05-18 03:45:09'),
('J1652863521',1,0,'2022-05-18 03:45:21','2022-05-18 03:45:21');

/*Table structure for table `sale_detail` */

DROP TABLE IF EXISTS `sale_detail`;

CREATE TABLE `sale_detail` (
  `sale_id` varchar(15) NOT NULL,
  `book_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `sale_detail` */

insert  into `sale_detail`(`sale_id`,`book_id`,`amount`,`price`,`discount`,`total_price`) values 
('J1643860456',1,2,55000,1089,108911),
('J1643860564',1,2,55000,1089,108911),
('J1643910031',1,1,55000,841.5,54158.5),
('J1643910031',2,1,85000,841.5,84158.5),
('J1643910106',1,1,55000,841.5,54158.5),
('J1643910106',2,1,85000,841.5,84158.5),
('J1644216274',5,2,55000,0,110000),
('J1652863509',1,1,55000,544.5,54455.5),
('J1652863509',2,1,85000,841.5,84158.5),
('J1652863521',1,1,55000,544.5,54455.5),
('J1652863521',2,1,85000,841.5,84158.5),
('J1652863521',5,1,55000,0,55000);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `supplier` */

insert  into `supplier`(`supplier_id`,`name`,`address`,`email`,`phone`,`created_at`,`updated_at`) values 
(1,'Mangunsastro','Jrakah, Bayan','msastro@gmail.com','08536526566','2022-02-04 01:24:45','2022-02-04 01:24:45');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`firstname`,`lastname`,`email`,`username`,`password_hash`,`reset_hash`,`reset_at`,`reset_expires`,`activate_hash`,`status`,`status_message`,`active`,`force_pass_reset`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Dharma','Bekti','dharma.bekti16696@gmail.com','admin','$2y$10$q1aw/qauvnybCKaKkSTv6uY9poPBdW031feDfTiorFUUoP1n9NuvG','a5a8b64651243d8633ecfbce8edecc8f',NULL,'2023-03-03 23:43:00',NULL,NULL,NULL,1,0,'2022-01-27 21:39:53','2023-03-03 22:43:00',NULL),
(2,'Bekti','Suratmanto','45uvb261216@gmail.com','dharma','$2y$10$WmQN9TjQ4kNKSJ6pOnbjwuMQma/4fY3jufvD6RUpzZiR8.yv41E6K',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2022-01-27 21:45:29','2022-01-27 21:45:29',NULL),
(3,'Naruto','Namikaze','naruto@mail.com','naruto','$2y$10$OizhPPiO3XYFnZIsM6o6Mu13Efq5Et3XAOr3fG2IMeiGfVTUrpgoy',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2022-01-28 11:35:35','2022-01-29 09:02:05',NULL),
(4,'Agus123','Waluyo','agus@mail.com','agus','$2y$10$oC8M1bGGeMYfNSww/8sNaOnXyHbE.zjEbmMF..AmqDNxAk0XdpXhS',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2022-04-24 22:22:14','2022-04-25 01:16:46','2022-04-25 01:16:46');

/* Trigger structure for table `customer` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_customer` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_customer` BEFORE UPDATE ON `customer` FOR EACH ROW 
BEGIN
    insert into log_customer(customer_id, NAME, no_customer, gender, address, email, phone, created_at)
    select customer_id, name, no_customer, gender, address, email, phone, created_at from customer where customer_id = old.customer_id;
END */$$


DELIMITER ;

/* Function  structure for function  `CalcIncome` */

/*!50003 DROP FUNCTION IF EXISTS `CalcIncome` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `CalcIncome`(starting_value INT ) RETURNS int(11)
BEGIN
   DECLARE income INT;
   SET income = 0;
   label1: WHILE income <= 3000 DO
     SET income = income + starting_value;
   END WHILE label1;
   RETURN income;
END */$$
DELIMITER ;

/* Function  structure for function  `CustomerLevel` */

/*!50003 DROP FUNCTION IF EXISTS `CustomerLevel` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `CustomerLevel`(credit DECIMAL(10,2)
) RETURNS varchar(20) CHARSET latin1 COLLATE latin1_swedish_ci
    DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);
    IF credit > 20 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit <= 20 AND 
			credit >= 15) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 15 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END */$$
DELIMITER ;

/* Procedure structure for procedure `coba` */

/*!50003 DROP PROCEDURE IF EXISTS  `coba` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `coba`()
select * from customer */$$
DELIMITER ;

/* Procedure structure for procedure `dataCustomer` */

/*!50003 DROP PROCEDURE IF EXISTS  `dataCustomer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `dataCustomer`()
BEGIN
    SELECT * FROM customer;
END */$$
DELIMITER ;

/* Procedure structure for procedure `detailCustomer` */

/*!50003 DROP PROCEDURE IF EXISTS  `detailCustomer` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `detailCustomer`(
idCustomer int(11)
)
BEGIN
    SELECT address FROM customer where customer_id = idCustomer union
    SELECT email FROM customer WHERE customer_id = idCustomer;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
