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
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `IATA_code` char(2) DEFAULT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IATA_code` (`IATA_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (1,'Vietnam Airlines','VN','1900 1100','Vietnam'),(2,'Vietjet Air','VJ','1900 1886','Vietnam'),(3,'Bamboo Airways','QH','1900 1166','Vietnam'),(4,'Vietravel Airlines','VU','1900 6686','Vietnam'),(5,'Pacific Airlines','BL','1900 1550','Vietnam'),(6,'Vasco','0V','028 3833 3033','Vietnam'),(7,'Thai Airways','TG','+66 2356 1111','Thailand'),(8,'Singapore Airlines','SQ','+65 6223 8888','Singapore'),(9,'Cathay Pacific','CX','+852 2747 3333','Hong Kong'),(10,'Emirates','EK','+971 600 555555','UAE'),(11,'Qatar Airways','QR','+974 4023 0000','Qatar'),(12,'Korean Air','KE','+82 2 2656 2000','South Korea'),(13,'Japan Airlines','JL','+81 3 6733 3062','Japan'),(14,'All Nippon Airways','NH','+81 3 6741 1120','Japan'),(15,'China Southern Airlines','CZ','+86 400 869 5539','China'),(16,'AirAsia','AK','+60 3 8660 4333','Malaysia'),(17,'Eva Air','BR','+886 2 2501 1999','Taiwan'),(18,'Turkish Airlines','TK','+90 212 463 63 63','Turkey'),(19,'Lufthansa','LH','+49 69 86 799 799','Germany'),(20,'Qantas','QF','+61 2 9691 3636','Australia');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
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
