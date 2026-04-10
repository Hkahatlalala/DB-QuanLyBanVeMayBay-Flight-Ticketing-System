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
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `passport_no` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_no` (`passport_no`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Nguyễn Tuấn Anh','001201004567','1995-05-15','Hà Nội','0901234567','tuananh.nguyen@gmail.com','Việt Nam'),(2,'Trần Thị Bích','079185001234','1988-10-20','TP.HCM','0987654321','bich.tran88@yahoo.com','Việt Nam'),(3,'Lê Hoàng Bách','048200009876','2000-02-28','Đà Nẵng','0912345678','bach.lehoang@gmail.com','Việt Nam'),(4,'Phạm Mai Phương','031192003456','1992-07-10','Hải Phòng','0933456789','maiphuong.pham@outlook.com','Việt Nam'),(5,'Hoàng Gia Bảo','001205007890','2005-12-05','Hà Nội','0351234567','giabao.99@gmail.com','Việt Nam'),(6,'Vũ Minh Trí','079190002345','1990-04-18','TP.HCM','0979876543','minhtri.vu@gmail.com','Việt Nam'),(7,'Đặng Bảo Ngọc','048202006789','2002-09-22','Đà Nẵng','0902345678','ngocdang.2000@gmail.com','Việt Nam'),(8,'Bùi Quang Hải','031185001928','1985-11-30','Hải Phòng','0981234567','quanghai.bui@gmail.com','Việt Nam'),(9,'Đỗ Thanh Thảo','001198005432','1998-08-14','Hà Nội','0919876543','thanhthao.do@yahoo.com','Việt Nam'),(10,'Hồ Việt Dũng','079195008765','1995-01-25','TP.HCM','0931234567','vietdung.ho@gmail.com','Việt Nam'),(11,'Ngô Minh Thư','048201004321','2001-06-08','Đà Nẵng','0359876543','minhthu.ngo@gmail.com','Việt Nam'),(12,'Dương Quốc Đạt','031190009876','1990-12-12','Hải Phòng','0971234567','quocdat.duong@gmail.com','Việt Nam'),(13,'Lý Thúy Quỳnh','001193002109','1993-03-05','Hà Nội','0909876543','thuyquynh.ly@gmail.com','Việt Nam'),(14,'Nguyễn Anh Khoa','079188006543','1988-08-20','TP.HCM','0982345678','anhkhoa.nguyen@gmail.com','Việt Nam'),(15,'Trần Hoàng Yến','048197001098','1997-02-14','Đà Nẵng','0913456789','hoangyen.tran@gmail.com','Việt Nam'),(16,'Lê Tiến Phát','031204005432','2004-10-28','Hải Phòng','0939876543','tienphat.le@yahoo.com','Việt Nam'),(17,'Phạm Mỹ Duyên','001191008765','1991-05-10','Hà Nội','0352345678','myduyen.pham@gmail.com','Việt Nam'),(18,'Hoàng Trung Kiên','079199003210','1999-11-22','TP.HCM','0973456789','trungkien.hoang@gmail.com','Việt Nam'),(19,'Vũ Hải Anh','048186007654','1986-04-05','Đà Nẵng','0903456789','haianh.vu@gmail.com','Việt Nam'),(20,'Đặng Quang Vinh','031196002109','1996-09-18','Hải Phòng','0983456789','quangvinh.dang@gmail.com','Việt Nam'),(21,'Bùi Bích Ngọc','001203006543','2003-01-30','Hà Nội','0914567890','bichngoc.bui@gmail.com','Việt Nam'),(22,'Đỗ Đức Thịnh','079192001098','1992-07-12','TP.HCM','0934567890','ducthinh.do@gmail.com','Việt Nam'),(23,'Hồ Thu Hương','048198005432','1998-12-25','Đà Nẵng','0353456789','thuhuong.ho@yahoo.com','Việt Nam'),(24,'Ngô Trọng Nghĩa','031189008765','1989-05-08','Hải Phòng','0974567890','trongnghia.ngo@gmail.com','Việt Nam'),(25,'Dương Phương Trinh','001200003210','2000-10-20','Hà Nội','0904567890','phuongtrinh.duong@gmail.com','Việt Nam'),(26,'Lý Hoàng Nam','079187007654','1987-03-05','TP.HCM','0984567890','hoangnam.ly@gmail.com','Việt Nam'),(27,'Nguyễn Kim Ngân','048194002109','1994-08-18','Đà Nẵng','0915678901','kimngan.nguyen@gmail.com','Việt Nam'),(28,'Trần Quốc Bảo','031201006543','2001-01-30','Hải Phòng','0935678901','quocbao.tran@gmail.com','Việt Nam'),(29,'Lê Thanh Trúc','001195001098','1995-07-12','Hà Nội','0354567890','thanhtruc.le@gmail.com','Việt Nam'),(30,'Phạm Hữu Thọ','079190005432','1990-12-25','TP.HCM','0975678901','huutho.pham@gmail.com','Việt Nam'),(31,'Hành Khách Bé 1','001215008765','2015-05-08','Hà Nội','','','Việt Nam'),(32,'Hành Khách Bé 2','079218003210','2018-10-20','TP.HCM','','','Việt Nam'),(33,'Ông Nội Nguyễn','048150007654','1950-03-05','Đà Nẵng','0912233445','','Việt Nam'),(34,'Bà Ngoại Trần','031155002109','1955-08-18','Hải Phòng','0987766554','','Việt Nam'),(35,'John Smith','US987654321','1985-11-11','New York','+1987654321','john.smith@gmail.com','Mỹ'),(36,'Emma Watson','UK123456789','1992-04-22','London','+44123456789','emma.watson@gmail.com','Anh'),(37,'Lee Min Ho','KR456789123','1988-06-15','Seoul','+82456789123','leeminho@gmail.com','Hàn Quốc'),(38,'Wang Wei','CN789123456','1995-09-08','Beijing','+86789123456','wangwei@gmail.com','Trung Quốc'),(39,'Tanaka Yuki','JP321654987','1990-02-14','Tokyo','+81321654987','tanakayuki@gmail.com','Nhật Bản'),(40,'Maria Garcia','ES654987321','1982-08-30','Madrid','+34654987321','mariagarcia@gmail.com','Tây Ban Nha');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
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
