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
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT NULL,
  `customer_id` char(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2026-03-25 08:30:00','confirmed','C10001'),(2,'2026-03-26 09:15:00','confirmed','C10002'),(3,'2026-03-27 10:45:00','confirmed','C10003'),(4,'2026-03-28 14:20:00','cancelled','C10004'),(5,'2026-03-29 16:10:00','confirmed','C10005'),(6,'2026-03-30 11:05:00','confirmed','C10006'),(7,'2026-04-01 07:50:00','confirmed','C10007'),(8,'2026-04-02 13:40:00','pending','C10008'),(9,'2026-04-03 15:25:00','confirmed','C10009'),(10,'2026-04-04 18:30:00','cancelled','C10010'),(11,'2026-04-05 09:00:00','confirmed','C10011'),(12,'2026-04-06 10:15:00','pending','C10012'),(13,'2026-04-07 14:45:00','confirmed','C10013'),(14,'2026-04-08 16:20:00','confirmed','C10014'),(15,'2026-04-09 08:10:00','confirmed','C10015'),(16,'2026-04-09 11:35:00','cancelled','C10016'),(17,'2026-04-10 07:20:00','pending','C10017'),(18,'2026-04-10 09:40:00','confirmed','C10018'),(19,'2026-04-11 15:55:00','confirmed','C10019'),(20,'2026-04-12 18:00:00','pending','C10020'),(21,'2026-04-13 08:45:00','confirmed','C10021'),(22,'2026-04-14 10:30:00','cancelled','C10022'),(23,'2026-04-15 14:15:00','confirmed','C10023'),(24,'2026-04-16 16:50:00','pending','C10024'),(25,'2026-04-17 09:25:00','confirmed','C10025'),(26,'2026-04-18 11:10:00','confirmed','C10026'),(27,'2026-04-19 15:40:00','cancelled','C10027'),(28,'2026-04-20 18:15:00','pending','C10028'),(29,'2026-04-21 08:00:00','confirmed','C10029'),(30,'2026-04-22 10:45:00','confirmed','C10030');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 10:14:21
