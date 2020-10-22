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
INSERT INTO `departments` VALUES (1,'Software Development','2020-06-22 10:07:06'),(2,'Accounts','2020-06-22 10:07:06'),(3,'Marketing','2020-06-22 10:07:06'),(4,'Business development','2020-06-22 10:07:06');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_dpt_roles`
--

DROP TABLE IF EXISTS `emp_dpt_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_dpt_roles` (
  `e_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`e_id`,`d_id`,`r_id`),
  KEY `d_id` (`d_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `emp_dpt_roles_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_dpt_roles_ibfk_3` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_dpt_roles`
--

LOCK TABLES `emp_dpt_roles` WRITE;
/*!40000 ALTER TABLE `emp_dpt_roles` DISABLE KEYS */;
INSERT INTO `emp_dpt_roles` VALUES (1,1,4,'2020-10-21 21:07:09'),(1,4,6,'2020-10-21 21:07:09'),(2,1,7,'2020-10-21 21:07:09'),(3,1,7,'2020-10-21 21:07:09'),(3,2,1,'2020-10-21 21:07:09'),(4,3,1,'2020-10-21 21:07:09'),(4,4,1,'2020-10-21 21:07:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Alan P. Blane','AlanPBlane@jourrapide.com','$2y$10$hQW3FNE6coEssYZ0XBfCqeXmJNGw.OIDJW9WuS3kKkUW.EtNTuKTe','2020-06-22 10:07:06'),(2,'Cinda K. Manley','CindaKManley@dayrep.com','$2y$10$hQW3FNE6coEssYZ0XBfCqeXmJNGw.OIDJW9WuS3kKkUW.EtNTuKTe','2020-06-22 10:15:57'),(3,'Nicholas B. Novello','NicholasBNovello@armyspy.com','$2y$10$hQW3FNE6coEssYZ0XBfCqeXmJNGw.OIDJW9WuS3kKkUW.EtNTuKTe','2020-06-22 11:33:26'),(4,'Yvette J. McRae','YvetteJMcRae@jourrapide.com','$2y$10$hQW3FNE6coEssYZ0XBfCqeXmJNGw.OIDJW9WuS3kKkUW.EtNTuKTe','2020-06-22 11:33:26');
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
INSERT INTO `roles` VALUES (1,'CEO',1,'2020-10-21 19:36:55'),(2,'COO',2,'2020-10-21 19:36:55'),(3,'GENERAL MANAGER',3,'2020-10-21 19:38:08'),(4,'MANAGER',4,'2020-10-21 19:38:08'),(5,'SUPERVISOR',5,'2020-10-21 19:38:08'),(6,'STAFF',6,'2020-10-21 19:38:08'),(7,'DEVELOPER',7,'2020-10-21 20:18:31');
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

-- Dump completed on 2020-10-22  3:28:25
