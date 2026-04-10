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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(100) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `total_seats` int DEFAULT NULL,
  `status` enum('active','maintenance','retired') DEFAULT 'active',
  `airline_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `airline_id` (`airline_id`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Airbus A350-900','VN-A886',305,'active',1),(2,'Boeing 787-10','VN-A873',367,'active',1),(3,'Airbus A321neo','VN-A501',203,'active',1),(4,'ATR 72','VN-B214',68,'active',1),(5,'Airbus A321ceo','VN-A667',230,'active',2),(6,'Airbus A330-300','VN-A811',377,'active',2),(7,'Airbus A320neo','VN-A600',186,'active',2),(8,'Airbus A321neo','VN-A601',240,'active',2),(9,'Boeing 787-9','VN-A818',294,'active',3),(10,'Airbus A321neo','VN-A222',223,'active',3),(11,'Embraer E190','VN-A261',98,'active',3),(12,'Airbus A320','VN-A588',170,'active',3),(13,'Airbus A321ceo','VN-A352',220,'active',4),(14,'Airbus A321ceo','VN-A353',220,'active',4),(15,'Airbus A320','VN-A599',180,'active',5),(16,'Airbus A320','VN-A602',180,'active',5),(17,'Boeing 777-300ER','9V-SNA',264,'active',8),(18,'Airbus A380-800','9V-SKU',471,'active',8),(19,'Airbus A380-800','A6-EEU',517,'active',10),(20,'Boeing 777-200LR','A6-EGO',302,'active',10),(21,'Boeing 777-300ER','A7-ANA',354,'active',11),(22,'Airbus A350-1000','A7-BBI',327,'active',11),(23,'Boeing 747-8I','HL7630',368,'active',12),(24,'Airbus A330-200','HL8080',218,'active',12),(25,'Boeing 787-8','JA845J',186,'active',13),(26,'Boeing 767-300ER','JA611J',199,'active',13),(27,'Airbus A320-200','9M-AGB',180,'active',16),(28,'Airbus A321neo','9M-AQC',236,'active',16),(29,'Boeing 777-300ER','B-16701',323,'active',17),(30,'Airbus A330-300','B-16333',309,'active',17),(31,'Airbus A330-200','TC-JOG',289,'active',18),(32,'Boeing 787-9','TC-LLC',300,'active',18),(33,'Airbus A320neo','D-AINK',180,'active',19),(34,'Boeing 747-400','D-ABTK',371,'active',19),(35,'Airbus A330-200','VH-EBN',255,'active',20),(36,'Boeing 787-9','VH-ZNK',236,'active',20),(37,'Airbus A321neo','VN-A502',203,'active',1),(38,'Airbus A321neo','VN-A607',240,'active',2),(39,'Airbus A321neo','VN-A225',223,'active',3),(40,'Airbus A350-900','9V-SMF',253,'active',8);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 10:14:23
