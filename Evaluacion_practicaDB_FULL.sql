-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluacion_practica
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP database IF EXISTS evaluacion_practica;
create database evaluacion_practica;
use evaluacion_practica;

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Drama|Romance'),(2,'Drama'),(3,'Comedy|Drama|Romance'),(4,'Documentary'),(5,'Comedy'),(6,'Drama'),(7,'Comedy'),(8,'Drama|Fantasy|Horror|Thriller|War'),(9,'Comedy|Romance'),(10,'Comedy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletable`
--

DROP TABLE IF EXISTS `deletable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletable`
--

LOCK TABLES `deletable` WRITE;
/*!40000 ALTER TABLE `deletable` DISABLE KEYS */;
INSERT INTO `deletable` VALUES (1,'SI'),(2,'NO');
/*!40000 ALTER TABLE `deletable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `category_id` int(10) NOT NULL,
  `deletable_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `deletable_id` (`deletable_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`deletable_id`) REFERENCES `deletable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Hider in the House','2023-03-04 03:00:00','2023-02-07 03:00:00','Down-sized encompassing alliance',1,1),(2,'Method, The (Método, El)','2022-09-25 03:00:00','2022-07-10 03:00:00','Team-oriented context-sensitive paradigm',5,2),(3,'Sorrow and Joy (Sorg og glæde)','2022-06-21 03:00:00','2022-07-07 03:00:00','Public-key transitional internet solution',3,1),(4,'Perfect','2023-04-22 03:00:00','2023-02-20 03:00:00','Reverse-engineered empowering time-frame',2,1),(5,'Stealth','2022-11-10 03:00:00','2022-05-09 03:00:00','Digitized scalable standardization',6,1),(6,'Sense of History, A','2022-07-21 03:00:00','2023-01-18 03:00:00','Persistent mission-critical knowledge user',2,1),(7,'War of the Arrows (Choi-jong-byeong-gi Hwal)','2022-06-02 03:00:00','2023-04-24 03:00:00','Vision-oriented fault-tolerant hardware',3,1),(8,'Breezy','2022-10-15 03:00:00','2022-05-08 03:00:00','Ergonomic reciprocal benchmark',2,2),(9,'Charlie Chan and the Curse of the Dragon Queen','2022-07-13 03:00:00','2022-09-11 03:00:00','Exclusive contextually-based hub',2,1),(10,'Unbearable Lightness of Being, The','2022-05-17 03:00:00','2022-05-26 03:00:00','Advanced well-modulated attitude',5,2);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notes_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_id` (`notes_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`notes_id`) REFERENCES `notes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cynthy Adderson','cadderson0@skyrock.com',4),(2,'Bernadette Clubley','bclubley1@skype.com',2),(3,'Seamus Suthworth','ssuthworth2@seattletimes.com',3),(4,'Stefania Drust','sdrust3@mozilla.com',1),(5,'Ree Pigram','rpigram4@loc.gov',6),(6,'Artair Drinkall','adrinkall5@aol.com',8),(7,'Colan Jurasz','cjurasz6@ed.gov',5),(8,'Nikkie Hanscombe','nhanscombe7@ameblo.jp',9),(9,'Jdavie Verheijden','jverheijden8@bandcamp.com',10),(10,'Biddy Klewi','bklewi9@redcross.org',7);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'evaluacion_practica'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 11:29:50
