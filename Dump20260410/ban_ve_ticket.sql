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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seat_no` varchar(5) DEFAULT NULL,
  `seat_class` enum('economy','premium_economy','business','first') DEFAULT NULL,
  `type` enum('one_way','round_trip','multi_city') DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` enum('booked','completed','cancelled') DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  `passenger_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flight_id` (`flight_id`,`seat_no`),
  KEY `reservation_id` (`reservation_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'1A','economy','round_trip',1750000.00,'completed',1,1,1),(2,'1A','economy','round_trip',1750000.00,'completed',1,1,2),(3,'2B','business','one_way',2600000.00,'completed',2,2,3),(4,'2C','business','one_way',2600000.00,'completed',2,31,3),(5,'12D','economy','one_way',1800000.00,'booked',3,3,1),(6,NULL,'premium_economy','one_way',2250000.00,'cancelled',4,4,4),(7,NULL,'premium_economy','one_way',2250000.00,'cancelled',4,32,4),(8,'1C','business','one_way',2100000.00,'booked',5,5,2),(9,'15A','economy','one_way',1700000.00,'booked',6,6,3),(10,'15B','economy','one_way',1700000.00,'booked',6,33,3),(11,'15C','economy','one_way',1700000.00,'booked',6,34,3),(12,'15D','economy','one_way',1700000.00,'booked',6,7,3),(13,'4E','premium_economy','one_way',3200000.00,'booked',7,35,5),(14,NULL,'economy','one_way',1600000.00,'booked',8,8,1),(15,'2A','business','round_trip',2050000.00,'booked',9,36,4),(16,'3B','business','round_trip',2050000.00,'booked',9,36,5),(17,NULL,'economy','one_way',2500000.00,'cancelled',10,10,2),(18,'18F','economy','one_way',5500000.00,'booked',11,11,3),(19,NULL,'economy','one_way',1400000.00,'booked',12,12,1),(20,'5A','economy','one_way',1900000.00,'booked',13,13,4),(21,'5B','economy','one_way',3600000.00,'booked',14,14,2),(22,'6C','business','one_way',4800000.00,'booked',15,15,5),(23,NULL,'economy','one_way',2200000.00,'cancelled',16,16,1),(24,NULL,'economy','one_way',1500000.00,'booked',17,17,3),(25,'3A','premium_economy','one_way',7500000.00,'booked',18,18,4),(26,'19A','economy','one_way',3100000.00,'booked',19,19,2),(27,NULL,'economy','one_way',1650000.00,'booked',20,20,1),(28,'7D','business','one_way',4200000.00,'booked',21,21,5),(29,NULL,'economy','one_way',2800000.00,'cancelled',22,22,3),(30,'8B','premium_economy','one_way',5900000.00,'booked',23,23,4),(31,NULL,'economy','one_way',1350000.00,'booked',24,24,1),(32,'21E','economy','one_way',1700000.00,'booked',25,25,2),(33,'11A','business','one_way',3400000.00,'booked',26,26,5),(34,NULL,'economy','one_way',4900000.00,'cancelled',27,27,3),(35,NULL,'economy','one_way',1850000.00,'booked',28,28,1),(36,'22C','economy','one_way',2300000.00,'booked',29,29,4),(37,'9F','premium_economy','one_way',6200000.00,'booked',30,30,2);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
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
