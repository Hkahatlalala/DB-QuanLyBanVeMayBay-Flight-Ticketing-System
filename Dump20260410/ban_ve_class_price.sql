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
-- Table structure for table `class_price`
--

DROP TABLE IF EXISTS `class_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_price` (
  `cprice_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`cprice_id`,`flight_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `class_price_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_price`
--

LOCK TABLES `class_price` WRITE;
/*!40000 ALTER TABLE `class_price` DISABLE KEYS */;
INSERT INTO `class_price` VALUES (1,9,'Economy',1200000),(2,10,'Economy',1200000),(3,11,'Economy',1200000),(4,9,'Premium',1800000),(5,10,'Premium',1800000),(6,11,'Premium',1800000),(7,9,'Business',3500000),(8,10,'Business',3500000),(9,11,'Business',3500000),(10,9,'First',7000000),(11,10,'First',7000000),(12,11,'First',7000000),(16,1,'Economy',1500000),(17,3,'Economy',1500000),(18,5,'Economy',1500000),(19,12,'Economy',1500000),(20,16,'Economy',1500000),(21,17,'Economy',1500000),(22,22,'Economy',1500000),(23,24,'Economy',1500000),(24,31,'Economy',1500000),(25,37,'Economy',1500000),(26,1,'Premium',2250000),(27,3,'Premium',2250000),(28,5,'Premium',2250000),(29,12,'Premium',2250000),(30,16,'Premium',2250000),(31,17,'Premium',2250000),(32,22,'Premium',2250000),(33,24,'Premium',2250000),(34,31,'Premium',2250000),(35,37,'Premium',2250000),(36,1,'Business',4500000),(37,3,'Business',4500000),(38,5,'Business',4500000),(39,12,'Business',4500000),(40,16,'Business',4500000),(41,17,'Business',4500000),(42,22,'Business',4500000),(43,24,'Business',4500000),(44,31,'Business',4500000),(45,37,'Business',4500000),(46,1,'First',9000000),(47,3,'First',9000000),(48,5,'First',9000000),(49,12,'First',9000000),(50,16,'First',9000000),(51,17,'First',9000000),(52,22,'First',9000000),(53,24,'First',9000000),(54,31,'First',9000000),(55,37,'First',9000000),(79,33,'Economy',2100000),(80,34,'Economy',2100000),(81,2,'Economy',2100000),(82,19,'Economy',2100000),(83,30,'Economy',2100000),(84,13,'Economy',2100000),(85,23,'Economy',2100000),(86,25,'Economy',2100000),(87,4,'Economy',2100000),(88,14,'Economy',2100000),(89,18,'Economy',2100000),(90,6,'Economy',2100000),(91,26,'Economy',2100000),(92,38,'Economy',2100000),(93,29,'Economy',2100000),(94,33,'Premium',3150000),(95,34,'Premium',3150000),(96,2,'Premium',3150000),(97,19,'Premium',3150000),(98,30,'Premium',3150000),(99,13,'Premium',3150000),(100,23,'Premium',3150000),(101,25,'Premium',3150000),(102,4,'Premium',3150000),(103,14,'Premium',3150000),(104,18,'Premium',3150000),(105,6,'Premium',3150000),(106,26,'Premium',3150000),(107,38,'Premium',3150000),(108,29,'Premium',3150000),(109,33,'Business',5500000),(110,34,'Business',5500000),(111,2,'Business',5500000),(112,19,'Business',5500000),(113,30,'Business',5500000),(114,13,'Business',5500000),(115,23,'Business',5500000),(116,25,'Business',5500000),(117,4,'Business',5500000),(118,14,'Business',5500000),(119,18,'Business',5500000),(120,6,'Business',5500000),(121,26,'Business',5500000),(122,38,'Business',5500000),(123,29,'Business',5500000),(124,33,'First',11000000),(125,34,'First',11000000),(126,2,'First',11000000),(127,19,'First',11000000),(128,30,'First',11000000),(129,13,'First',11000000),(130,23,'First',11000000),(131,25,'First',11000000),(132,4,'First',11000000),(133,14,'First',11000000),(134,18,'First',11000000),(135,6,'First',11000000),(136,26,'First',11000000),(137,38,'First',11000000),(138,29,'First',11000000),(142,7,'Economy',2800000),(143,8,'Economy',2800000),(144,15,'Economy',2800000),(145,20,'Economy',2800000),(146,21,'Economy',2800000),(147,27,'Economy',2800000),(148,28,'Economy',2800000),(149,32,'Economy',2800000),(150,35,'Economy',2800000),(151,36,'Economy',2800000),(152,39,'Economy',2800000),(153,7,'Premium',4200000),(154,8,'Premium',4200000),(155,15,'Premium',4200000),(156,20,'Premium',4200000),(157,21,'Premium',4200000),(158,27,'Premium',4200000),(159,28,'Premium',4200000),(160,32,'Premium',4200000),(161,35,'Premium',4200000),(162,36,'Premium',4200000),(163,39,'Premium',4200000),(164,7,'Business',7200000),(165,8,'Business',7200000),(166,15,'Business',7200000),(167,20,'Business',7200000),(168,21,'Business',7200000),(169,27,'Business',7200000),(170,28,'Business',7200000),(171,32,'Business',7200000),(172,35,'Business',7200000),(173,36,'Business',7200000),(174,39,'Business',7200000),(175,7,'First',14400000),(176,8,'First',14400000),(177,15,'First',14400000),(178,20,'First',14400000),(179,21,'First',14400000),(180,27,'First',14400000),(181,28,'First',14400000),(182,32,'First',14400000),(183,35,'First',14400000),(184,36,'First',14400000),(185,39,'First',14400000);
/*!40000 ALTER TABLE `class_price` ENABLE KEYS */;
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
