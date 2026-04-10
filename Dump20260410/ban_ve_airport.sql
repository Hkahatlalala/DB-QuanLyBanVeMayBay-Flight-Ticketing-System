-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ban_ve
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `IATA_code` char(3) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IATA_code` (`IATA_code`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Nội Bài International','HAN',1),(2,'Gia Lâm',NULL,1),(3,'Tân Sơn Nhất International','SGN',2),(4,'Long Thành International',NULL,2),(5,'Đà Nẵng International','DAD',3),(6,'Chu Lai',NULL,3),(7,'Cam Ranh International','CXR',4),(8,'Nha Trang Old',NULL,4),(9,'Phú Quốc International','PQC',5),(10,'Dương Đông',NULL,5),(11,'Cát Bi International','HPH',6),(12,'Hải Phòng Heliport',NULL,6),(13,'Phú Bài International','HUI',7),(14,'Gia Hội',NULL,7),(15,'Trà Nóc (Cần Thơ) International','VCA',8),(16,'Cần Thơ Port',NULL,8),(17,'Liên Khương','DLI',9),(18,'Cam Ly',NULL,9),(19,'Phù Cát','UIH',10),(20,'Quy Nhơn Port',NULL,10),(21,'Vinh International','VII',11),(22,'Quân khu 4',NULL,11),(23,'Changi International','SIN',12),(24,'Seletar','XSP',12),(25,'Suvarnabhumi','BKK',13),(26,'Don Mueang International','DMK',13),(27,'Incheon International','ICN',14),(28,'Gimpo International','GMP',14),(29,'Narita International','NRT',15),(30,'Haneda International','HND',15);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 10:14:22
