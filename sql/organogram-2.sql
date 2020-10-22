/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.21-0ubuntu0.20.04.4 : Database - organogram
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`organogram` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `organogram`;

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `departments` */

insert  into `departments`(`id`,`name`,`created_at`) values 
(1,'Software Development','2020-06-22 16:07:06'),
(2,'Accounts','2020-06-22 16:07:06'),
(3,'Marketing','2020-06-22 16:07:06'),
(4,'Business development','2020-06-22 16:07:06');

/*Table structure for table `emp_dpt_roles` */

DROP TABLE IF EXISTS `emp_dpt_roles`;

CREATE TABLE `emp_dpt_roles` (
  `e_id` int NOT NULL,
  `d_id` int NOT NULL,
  `r_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`e_id`,`d_id`,`r_id`),
  KEY `d_id` (`d_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `emp_dpt_roles_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_3` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_dpt_roles` */

insert  into `emp_dpt_roles`(`e_id`,`d_id`,`r_id`,`created_at`) values 
(1,1,4,'2020-10-22 03:07:09'),
(1,4,6,'2020-10-22 03:07:09'),
(2,1,7,'2020-10-22 03:07:09'),
(3,1,7,'2020-10-22 03:07:09'),
(3,2,1,'2020-10-22 03:07:09'),
(4,3,1,'2020-10-22 03:07:09'),
(4,4,1,'2020-10-22 03:07:09');

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

insert  into `employees`(`id`,`name`,`email`,`password`,`created_at`) values 
(1,'Alan P. Blane','test-1@test.com','123456','2020-06-22 16:07:06'),
(2,'Cinda K. Manley','test-2@test.com','123456','2020-06-22 16:15:57'),
(3,'Nicholas B. Novello','test-3@test.com','123456','2020-06-22 17:33:26'),
(4,'Yvette J. McRae','test-4@test.com','123456','2020-06-22 17:33:26');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hierarchy_level` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hierarchy_level_UNIQUE` (`hierarchy_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`hierarchy_level`,`created_at`) values 
(1,'CEO',1,'2020-10-22 01:36:55'),
(2,'COO',2,'2020-10-22 01:36:55'),
(3,'GENERAL MANAGER',3,'2020-10-22 01:38:08'),
(4,'MANAGER',4,'2020-10-22 01:38:08'),
(5,'SUPERVISOR',5,'2020-10-22 01:38:08'),
(6,'STAFF',6,'2020-10-22 01:38:08'),
(7,'DEVELOPER',7,'2020-10-22 02:18:31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
