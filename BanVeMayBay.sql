-- 1. THIẾT LẬP HỆ THỐNG & TẠO DATABASE
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

DROP SCHEMA IF EXISTS `ban_ve`;
CREATE SCHEMA `ban_ve` DEFAULT CHARACTER SET utf8mb4;
USE `ban_ve`;

-- 2. CÁC BẢNG DANH MỤC (CƠ SỞ)
CREATE TABLE `airline` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `IATA_code` CHAR(2) UNIQUE NOT NULL,
  `contact_info` VARCHAR(100),
  `country` VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE `city` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE `aircraft` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `model` VARCHAR(100) NOT NULL,
  `number` VARCHAR(20) UNIQUE,
  `total_seats` INT NOT NULL,
  `status` ENUM('active', 'maintenance', 'retired') DEFAULT 'active',
  `airline_id` INT,
  FOREIGN KEY (`airline_id`) REFERENCES `airline`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `airport` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `IATA_code` CHAR(3) UNIQUE NOT NULL,
  `city_id` INT,
  FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. QUẢN LÝ NGƯỜI DÙNG & HÀNH KHÁCH
CREATE TABLE `customer` (
  `id` CHAR(12) PRIMARY KEY,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL, -- Tăng độ dài để lưu BCrypt password sau này
  `name` VARCHAR(100) NOT NULL,
  `phone_no` VARCHAR(15),
  `email` VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE `passenger` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `passport_no` VARCHAR(20) UNIQUE NOT NULL,
  `DOB` DATE,
  `address` VARCHAR(255),
  `phone_no` VARCHAR(15),
  `email` VARCHAR(100),
  `nationality` VARCHAR(50)
) ENGINE=InnoDB;

-- 4. QUẢN LÝ CHUYẾN BAY & GIÁ VÉ
CREATE TABLE `flight` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `scheduled_departure` DATETIME NOT NULL,
  `scheduled_arrival` DATETIME NOT NULL,
  `status` VARCHAR(50) DEFAULT 'Scheduled',
  `airline_id` INT,
  `aircraft_id` INT,
  `departs_airport_id` INT,
  `arrives_airport_id` INT,
  FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft`(`id`),
  FOREIGN KEY (`airline_id`) REFERENCES `airline`(`id`),
  FOREIGN KEY (`departs_airport_id`) REFERENCES `airport`(`id`),
  FOREIGN KEY (`arrives_airport_id`) REFERENCES `airport`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `flight_class_price` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `flight_id` INT NOT NULL,
  `seat_class` VARCHAR(50) NOT NULL,
  `price` DECIMAL(12,2) NOT NULL, -- Chuyển sang Decimal để tính toán tiền chính xác
  FOREIGN KEY (`flight_id`) REFERENCES `flight`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. QUẢN LÝ ĐẶT VÉ & THANH TOÁN
CREATE TABLE `reservation` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
  `customer_id` CHAR(12),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `payment` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `payment_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `amount` DECIMAL(15,2) NOT NULL,
  `method` ENUM('transfer', 'card', 'cash') DEFAULT 'transfer',
  `status` TINYINT(1) DEFAULT 0, -- 0: Thất bại, 1: Thành công, 2: Đã hoàn tiền
  `reservation_id` INT,
  FOREIGN KEY (`reservation_id`) REFERENCES `reservation`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `ticket` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `seat_no` VARCHAR(10),
  `seat_class` VARCHAR(50), 
  `type` ENUM('one_way', 'round_trip', 'multi_city') DEFAULT 'one_way',
  `price` DECIMAL(12,2) NOT NULL,
  `status` ENUM('booked', 'completed', 'cancelled') DEFAULT 'booked',
  `reservation_id` INT,
  `passenger_id` INT,
  `flight_id` INT,
  UNIQUE INDEX `flight_seat_idx` (`flight_id`, `seat_no`), -- Chặn việc đặt trùng ghế trên 1 chuyến
  FOREIGN KEY (`reservation_id`) REFERENCES `reservation`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`passenger_id`) REFERENCES `passenger`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`flight_id`) REFERENCES `flight`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 6. HOÀN TẤT
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;