CREATE DATABASE  IF NOT EXISTS `python_belt_exam_2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `python_belt_exam_2`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: python_belt_exam_2
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_friends_user_idx` (`user_id`),
  CONSTRAINT `fk_friends_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,'2016-09-27 15:44:53','2016-09-27 15:44:53',1,2),(2,'2016-09-27 16:04:30','2016-09-27 16:04:30',5,2),(3,'2016-09-27 16:04:30','2016-09-27 16:04:30',2,5),(8,'2016-09-27 17:13:25','2016-09-27 17:13:25',5,1),(9,'2016-09-27 17:13:25','2016-09-27 17:13:25',1,5);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `alias_UNIQUE` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ken','kenkoolio','ken@koolio.com','$2b$12$kYD02rs3.PKhZYSST2/edOSez60dCs4CLCVukIzYqYYKXExxM/gJW','08/15/2016','2016-09-27 14:43:31','2016-09-27 14:43:31'),(2,'andrew','andrew','andrew@koolio.com','$2b$12$vkH3NpvjWcpW8pTQkhELV.xf8cH7Dtr0BgKLkbj5K3nIiV58WjXWC','09/02/2016','2016-09-27 14:59:54','2016-09-27 14:59:54'),(3,'randy','randy','randy@koolio.com','$2b$12$36GSsOJuFHr6gf5mWqWLH.AmTKZNZhg98QTLZMu3hSNji9eLE3qWO','09/03/2016','2016-09-27 15:00:11','2016-09-27 15:00:11'),(4,'jessica','jessicaco','jessica@koolio.com','$2b$12$1eBoMy9ICwT4H9getqQkjOT1bKCK61ZeymKDYepRcOWQm52z9yEKK','09/09/2016','2016-09-27 16:01:12','2016-09-27 16:01:12'),(5,'tom','tom','tom@koolio.com','$2b$12$Q5TADkfyN3/6.UGX5gZaYOSHBpPRkF4gZFmKjVAlaEs/eLd.CPyo2','09/10/2016','2016-09-27 16:01:31','2016-09-27 16:01:31');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27 17:55:21
