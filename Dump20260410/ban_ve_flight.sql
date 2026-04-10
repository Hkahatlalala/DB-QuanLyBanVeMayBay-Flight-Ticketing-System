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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scheduled_departure` datetime NOT NULL,
  `scheduled_arrival` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `airline_id` int DEFAULT NULL,
  `aircraft_id` int DEFAULT NULL,
  `departs_airport_id` int DEFAULT NULL,
  `arrives_airport_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aircraft_id` (`aircraft_id`),
  KEY `airline_id` (`airline_id`),
  KEY `departs_airport_id` (`departs_airport_id`),
  KEY `arrives_airport_id` (`arrives_airport_id`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`departs_airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`arrives_airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'2026-04-01 06:00:00','2026-04-01 08:15:00','scheduled',1,1,1,3),(2,'2026-04-01 09:00:00','2026-04-01 11:15:00','scheduled',1,2,3,1),(3,'2026-04-01 07:30:00','2026-04-01 09:45:00','scheduled',2,5,1,3),(4,'2026-04-01 10:00:00','2026-04-01 11:15:00','scheduled',2,6,3,5),(5,'2026-04-01 08:00:00','2026-04-01 10:00:00','scheduled',3,9,1,9),(6,'2026-04-01 11:30:00','2026-04-01 13:30:00','scheduled',3,10,9,1),(7,'2026-04-01 12:00:00','2026-04-01 15:00:00','scheduled',8,17,3,23),(8,'2026-04-01 17:00:00','2026-04-01 20:00:00','scheduled',8,18,23,3),(9,'2026-04-01 23:55:00','2026-04-02 04:30:00','scheduled',10,19,3,25),(10,'2026-04-02 00:30:00','2026-04-02 07:00:00','scheduled',12,23,1,27),(11,'2026-04-02 01:00:00','2026-04-02 08:30:00','scheduled',13,25,3,29),(12,'2026-04-02 08:00:00','2026-04-02 09:15:00','scheduled',16,27,3,13),(13,'2026-04-02 10:00:00','2026-04-02 11:30:00','scheduled',1,3,1,7),(14,'2026-04-02 12:45:00','2026-04-02 14:15:00','scheduled',2,7,7,3),(15,'2026-04-02 14:00:00','2026-04-02 15:00:00','scheduled',1,4,3,15),(16,'2026-04-03 06:00:00','2026-04-03 08:15:00','scheduled',1,1,1,3),(17,'2026-04-03 07:30:00','2026-04-03 09:45:00','scheduled',2,5,1,3),(18,'2026-04-03 09:00:00','2026-04-03 11:15:00','scheduled',3,9,1,3),(19,'2026-04-03 12:00:00','2026-04-03 14:15:00','scheduled',1,2,3,1),(20,'2026-04-03 14:30:00','2026-04-03 16:45:00','scheduled',2,8,3,1),(21,'2026-04-03 18:00:00','2026-04-03 20:15:00','scheduled',3,12,3,1),(22,'2026-04-04 06:30:00','2026-04-04 07:45:00','scheduled',1,3,1,5),(23,'2026-04-04 08:45:00','2026-04-04 10:00:00','scheduled',1,3,5,1),(24,'2026-04-04 07:00:00','2026-04-04 08:15:00','scheduled',2,5,3,5),(25,'2026-04-04 09:15:00','2026-04-04 10:30:00','scheduled',2,5,5,3),(26,'2026-04-04 11:00:00','2026-04-04 13:00:00','scheduled',3,10,1,11),(27,'2026-04-04 14:00:00','2026-04-04 16:00:00','scheduled',3,10,11,1),(28,'2026-04-04 15:30:00','2026-04-04 17:30:00','scheduled',4,13,3,11),(29,'2026-04-05 08:00:00','2026-04-05 09:50:00','scheduled',5,15,1,17),(30,'2026-04-05 11:00:00','2026-04-05 12:50:00','scheduled',1,2,17,1),(31,'2026-04-05 10:30:00','2026-04-05 11:30:00','scheduled',2,6,3,17),(32,'2026-04-05 12:30:00','2026-04-05 13:30:00','scheduled',2,6,17,3),(33,'2026-04-06 09:00:00','2026-04-06 10:40:00','scheduled',1,1,1,19),(34,'2026-04-06 11:40:00','2026-04-06 13:20:00','scheduled',1,1,19,1),(35,'2026-04-06 14:00:00','2026-04-06 15:10:00','scheduled',2,7,3,19),(36,'2026-04-06 16:10:00','2026-04-06 17:20:00','scheduled',2,7,19,3),(37,'2026-04-07 07:00:00','2026-04-07 08:10:00','scheduled',3,11,1,21),(38,'2026-04-07 09:10:00','2026-04-07 10:20:00','scheduled',3,11,21,1),(39,'2026-04-07 15:00:00','2026-04-07 16:40:00','scheduled',1,3,3,21);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
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
