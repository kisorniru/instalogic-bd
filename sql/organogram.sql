-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: organogram
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Development -- A','2020-06-22 10:07:06'),(2,'Development -- B','2020-06-22 10:07:06'),(3,'Development -- C','2020-06-22 10:07:06'),(4,'Development -- D','2020-06-22 10:07:06');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_dpt_roles`
--

DROP TABLE IF EXISTS `emp_dpt_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_dpt_roles` (
  `emp_id` int(11) NOT NULL,
  `dpt_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_id`,`dpt_id`,`role_id`),
  KEY `d_id` (`dpt_id`),
  KEY `r_id` (`role_id`),
  CONSTRAINT `emp_dpt_roles_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_2` FOREIGN KEY (`dpt_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_dpt_roles`
--

LOCK TABLES `emp_dpt_roles` WRITE;
/*!40000 ALTER TABLE `emp_dpt_roles` DISABLE KEYS */;
INSERT INTO `emp_dpt_roles` VALUES (1,1,1,'2020-10-24 13:43:06'),(1,2,6,'2020-10-24 13:56:12'),(1,3,6,'2020-10-24 14:07:46'),(2,1,2,'2020-10-24 13:43:42'),(2,2,6,'2020-10-24 14:04:36'),(2,3,6,'2020-10-24 14:07:46'),(3,1,2,'2020-10-24 13:43:42'),(3,2,5,'2020-10-24 14:04:36'),(3,4,6,'2020-10-24 14:07:46'),(4,1,3,'2020-10-24 13:43:42'),(4,2,4,'2020-10-24 14:04:36'),(4,3,1,'2020-10-24 14:07:46'),(5,1,3,'2020-10-24 13:49:03'),(5,2,4,'2020-10-24 14:04:36'),(5,4,6,'2020-10-24 14:07:46'),(6,1,4,'2020-10-24 13:49:03'),(6,2,4,'2020-10-24 14:04:36'),(6,4,6,'2020-10-24 14:07:46'),(7,1,4,'2020-10-24 13:49:03'),(7,2,5,'2020-10-24 14:04:36'),(7,3,6,'2020-10-24 14:07:46'),(8,1,4,'2020-10-24 13:49:03'),(8,2,5,'2020-10-24 14:04:36'),(8,4,4,'2020-10-24 14:07:46'),(9,1,5,'2020-10-24 13:49:03'),(9,2,4,'2020-10-24 14:04:36'),(9,3,2,'2020-10-24 14:07:46'),(10,1,5,'2020-10-24 13:49:03'),(10,2,5,'2020-10-24 14:04:36'),(10,4,1,'2020-10-24 14:07:46'),(11,1,6,'2020-10-24 13:56:12'),(11,2,3,'2020-10-24 14:04:36'),(11,4,5,'2020-10-24 14:07:46'),(12,1,6,'2020-10-24 13:56:12'),(12,2,3,'2020-10-24 14:04:36'),(12,4,3,'2020-10-24 14:07:46'),(13,1,6,'2020-10-24 13:56:12'),(13,2,2,'2020-10-24 14:04:36'),(13,4,2,'2020-10-24 14:07:46'),(14,1,6,'2020-10-24 13:56:12'),(14,2,2,'2020-10-24 14:04:36'),(15,1,6,'2020-10-24 13:56:12'),(15,2,1,'2020-10-24 14:04:36');
/*!40000 ALTER TABLE `emp_dpt_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Alan P. Blane','emp-1@test.com','123456','2020-06-22 10:07:06'),(2,'Cinda K. Manley','emp-2@test.com','123456','2020-06-22 10:15:57'),(3,'Nicholas B. Novello','emp-3@test.com','123456','2020-06-22 11:33:26'),(4,'Yvette J. McRae','emp-4@test.com','123456','2020-06-22 11:33:26'),(5,'Blane Alan P.','emp-5@test.com','123456','2020-06-22 11:33:26'),(6,'Manley Cinda K.','emp-6@test.com','123456','2020-06-22 11:33:26'),(7,'Novello Nicholas B.','emp-7@test.com','123456','2020-06-22 11:33:26'),(8,'McRae Yvette J.','emp-8@test.com','123456','2020-06-22 11:33:26'),(9,'J. McRae Yvette','emp-9@test.com','123456','2020-06-22 11:33:26'),(10,'B. Novello Nicholas','emp-10@test.com','123456','2020-06-22 11:33:26'),(11,'K. Manley Cinda','emp-11@test.com','123456','2020-06-22 11:33:26'),(12,'P. Blane Alan','emp-12@test.com','123456','2020-06-22 11:33:26'),(13,'Blane Cinda','emp-13@test.com','123456','2020-06-22 11:33:26'),(14,'McRae  Nicholas','emp-14@test.com','123456','2020-06-22 11:33:26'),(15,'Nicholas Blane','emp-15@test.com','123456','2020-06-22 11:33:26');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hierarchy_level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hierarchy_level_UNIQUE` (`hierarchy_level`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'CEO',1,'2020-10-21 19:36:55'),(2,'COO',2,'2020-10-21 19:36:55'),(3,'GENERAL MANAGER',3,'2020-10-21 19:38:08'),(4,'MANAGER',4,'2020-10-21 19:38:08'),(5,'SUPERVISOR',5,'2020-10-21 19:38:08'),(6,'STAFF',6,'2020-10-21 19:38:08');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-24 20:10:48
