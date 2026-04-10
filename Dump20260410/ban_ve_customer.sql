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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` char(12) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('ADM01','admin','admin123','Quản trị viên','0999999999','admin@kaltravel.vn'),('C10001','tuananh9x','123456','Nguyễn Tuấn Anh','0901234567','tuananh.nguyen@gmail.com'),('C10002','thuha_tran','123456','Trần Thu Hà','0987654321','hathu.tran88@yahoo.com'),('C10003','hoangbach','123456','Lê Hoàng Bách','0912345678','bach.lehoang@gmail.com'),('C10004','phuongmai','123456','Phạm Mai Phương','0933456789','maiphuong.pham@outlook.com'),('C10005','giabao_99','123456','Hoàng Gia Bảo','0351234567','giabao.99@gmail.com'),('C10006','minhtri_vu','123456','Vũ Minh Trí','0979876543','minhtri.vu@gmail.com'),('C10007','baongoc2k','123456','Đặng Bảo Ngọc','0902345678','ngocdang.2000@gmail.com'),('C10008','quanghai','123456','Bùi Quang Hải','0981234567','quanghai.bui@gmail.com'),('C10009','thanhthao','123456','Đỗ Thanh Thảo','0919876543','thanhthao.do@yahoo.com'),('C10010','vietdung','123456','Hồ Việt Dũng','0931234567','vietdung.ho@gmail.com'),('C10011','minhthu','123456','Ngô Minh Thư','0359876543','minhthu.ngo@gmail.com'),('C10012','quocdat','123456','Dương Quốc Đạt','0971234567','quocdat.duong@gmail.com'),('C10013','thuyquynh','123456','Lý Thúy Quỳnh','0909876543','thuyquynh.ly@gmail.com'),('C10014','anhkhoa','123456','Nguyễn Anh Khoa','0982345678','anhkhoa.nguyen@gmail.com'),('C10015','hoangyen','123456','Trần Hoàng Yến','0913456789','hoangyen.tran@gmail.com'),('C10016','tienphat','123456','Lê Tiến Phát','0939876543','tienphat.le@yahoo.com'),('C10017','myduyen','123456','Phạm Mỹ Duyên','0352345678','myduyen.pham@gmail.com'),('C10018','trungkien','123456','Hoàng Trung Kiên','0973456789','trungkien.hoang@gmail.com'),('C10019','haianh','123456','Vũ Hải Anh','0903456789','haianh.vu@gmail.com'),('C10020','quangvinh','123456','Đặng Quang Vinh','0983456789','quangvinh.dang@gmail.com'),('C10021','bichngoc','123456','Bùi Bích Ngọc','0914567890','bichngoc.bui@gmail.com'),('C10022','ducthinh','123456','Đỗ Đức Thịnh','0934567890','ducthinh.do@gmail.com'),('C10023','thuhuong','123456','Hồ Thu Hương','0353456789','thuhuong.ho@yahoo.com'),('C10024','trongnghia','123456','Ngô Trọng Nghĩa','0974567890','trongnghia.ngo@gmail.com'),('C10025','phuongtrinh','123456','Dương Phương Trinh','0904567890','phuongtrinh.duong@gmail.com'),('C10026','hoangnam','123456','Lý Hoàng Nam','0984567890','hoangnam.ly@gmail.com'),('C10027','kimngan','123456','Nguyễn Kim Ngân','0915678901','kimngan.nguyen@gmail.com'),('C10028','quocbao','123456','Trần Quốc Bảo','0935678901','quocbao.tran@gmail.com'),('C10029','thanhtruc','123456','Lê Thanh Trúc','0354567890','thanhtruc.le@gmail.com'),('C10030','huutho','123456','Phạm Hữu Thọ','0975678901','huutho.pham@gmail.com'),('C15768','aaaaa','1234','Nguyen Van A','0000000000','kyanhhoang078@gmail.com'),('C37650','ninhmyhoa2410','Ninhmyhoa2006','Ninh Mỹ Hoa','0812427141','ninhmyhoa03@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
