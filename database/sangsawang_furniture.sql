-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2025 at 10:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sangsawang_furniture`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_fname` varchar(50) NOT NULL,
  `admin_lname` varchar(50) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_tel` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_password`, `admin_fname`, `admin_lname`, `admin_email`, `admin_tel`, `created_at`, `updated_at`) VALUES
(1, 'admin1', '$2a$10$DdRQg5Hitc83f1A7sFesHuriwzWuFV8fBTWwRwnvGp/SMab/cTR9W', 'ชยพัทธ์', 'พินิตย์อัทธยา', 'admin1@example.com', NULL, '2025-12-15 16:32:58', '2025-12-15 16:32:58'),
(2, 'Admin1', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'สมชาย', 'ใจดี', 'Admin1@example.com', '0812345678', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(3, 'Admin2', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'สมหญิง', 'รักดี', 'Admin2@example.com', '0823456789', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(4, 'Admin3', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'วิชัย', 'สุขใจ', 'Admin3@example.com', '0834567890', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(5, 'Admin4', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'วิไล', 'ใสใจ', 'Admin4@example.com', '0845678901', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(6, 'Admin5', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ประเสริฐ', 'ดีงาม', 'Admin5@example.com', '0856789012', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(7, 'Admin6', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ประภา', 'สวยงาม', 'Admin6@example.com', '0867890123', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(8, 'Admin7', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'วิทยา', 'เจริญ', 'Admin7@example.com', '0878901234', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(9, 'Admin8', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'วิมล', 'รุ่งเรือง', 'Admin8@example.com', '0889012345', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(10, 'Admin9', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'สมศักดิ์', 'มั่นคง', 'Admin9@example.com', '0890123456', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(11, 'Admin10', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'สมศรี', 'สุขสันต์', 'Admin10@example.com', '0901234567', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(12, 'Admin11', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ชาญชัย', 'เก่งกล้า', 'Admin11@example.com', '0912345678', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(13, 'Admin12', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ชาญชล', 'รุ่งโรจน์', 'Admin12@example.com', '0923456789', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(14, 'Admin13', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ธนพล', 'มั่งคั่ง', 'Admin13@example.com', '0934567890', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(15, 'Admin14', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ธนพร', 'รวยทรัพย์', 'Admin14@example.com', '0945678901', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(16, 'Admin15', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'อานนท์', 'สุขสม', 'Admin15@example.com', '0956789012', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(17, 'Admin16', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'อารยา', 'สวยใส', 'Admin16@example.com', '0967890123', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(18, 'Admin17', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'กิตติ', 'เจริญก้าวหน้า', 'Admin17@example.com', '0978901234', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(19, 'Admin18', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'กิตติยา', 'รุ่งเรือง', 'Admin18@example.com', '0989012345', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(20, 'Admin19', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ณัฐพล', 'มั่นคง', 'Admin19@example.com', '0990123456', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(21, 'Admin20', '$2a$10$oa0f2hgIkSCge8qQmKbsXea86CLEnQBb.WJxxGqX68hhNkFVYqzkG', 'ณัฐพร', 'สุขใจ', 'Admin20@example.com', '0901234567', '2025-12-16 20:50:00', '2025-12-16 20:50:00'),
(0, 'admin000', '$2a$10$aGJ9YGN5bblGkYoXcqJYx.KmRgLR/fMyXq4jvtCZrcJ8nGEFqkI5m', 'admin1 ', 'chayapat', 'admin000@example.com', NULL, '2025-12-16 20:54:00', '2025-12-16 20:54:00'),
(0, 'admin111', '$2a$10$XBtYEMwfT.7y3Nm511cFYupqaSft1gt479bKHUWXt9.aOvhHVWN5C', 'ชยพัทธ์', 'พินิตย์อัทธยา', 'admin111@example.com', NULL, '2025-12-16 21:37:17', '2025-12-16 21:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pricing_type` varchar(32) NOT NULL,
  `pricing_label` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `category_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`) VALUES
(3, 'เตียง', 'เตียงนอนทุกขนาด ตั้งแต่เตียงเดี่ยว 3.5 ฟุต จนถึงเตียง King Size 6 ฟุต'),
(4, 'โซฟา', 'โซฟาทุกประเภท ทั้งโซฟาผ้า โซฟาหนัง โซฟาเข้ามุม และโซฟาเบด'),
(5, 'ชั้นวางทีวี', 'ชั้นวางทีวีหลากหลายขนาดและดีไซน์ เหมาะกับทุกห้องนั่งเล่น'),
(6, 'โต๊ะเครื่องแป้ง', 'โต๊ะเครื่องแป้งพร้อมกระจก เหมาะสำหรับห้องนอน'),
(7, 'ตู้เสื้อผ้า', 'ตู้เสื้อผ้าทุกขนาด ตั้งแต่ตู้เล็กสำหรับห้องเด็กจนถึงตู้ใหญ่ 5 บาน'),
(8, 'ฟูกนอน', 'ฟูกนอนคุณภาพดี ทั้งฟูกโฟมและฟูกสปริง ทุกขนาด'),
(9, 'ตู้โชว์', 'ตู้โชว์กระจกสำหรับโชว์ของสะสมและของตกแต่ง'),
(10, 'หิ้งพระ', 'หิ้งพระไม้สักคุณภาพดี ทั้งแบบติดผนังและตั้งพื้น'),
(11, 'ตู้กับข้าว', 'ตู้กับข้าวไม้สักสำหรับเก็บอาหารแห้งและของใช้ในครัว'),
(12, 'ชุดเฟอร์นิเจอร์', 'ชุดเฟอร์นิเจอร์เซ็ตพร้อมใช้ เหมาะสำหรับแต่งห้องใหม่');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_fname` varchar(50) NOT NULL,
  `customer_lname` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_tel` varchar(20) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `customer_alt_addresses` text DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification_token` varchar(255) DEFAULT NULL,
  `email_verification_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_username`, `customer_password`, `customer_fname`, `customer_lname`, `customer_email`, `customer_tel`, `customer_address`, `created_at`, `updated_at`, `customer_alt_addresses`, `email_verified`, `email_verification_token`, `email_verification_expires`) VALUES
(19, 'customer1', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'สมชาย', 'ใจดี', 'customer1@example.com', '0812345678', '123/45 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(20, 'customer2', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'สมหญิง', 'รักดี', 'customer2@example.com', '0823456789', '456/78 ถนนพหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(21, 'customer3', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'วิชัย', 'สุขใจ', 'customer3@example.com', '0834567890', '789/12 ถนนรัชดาภิเษก แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพมหานคร 10310', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(22, 'customer4', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'วิไล', 'ใสใจ', 'customer4@example.com', '0845678901', '321/65 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(23, 'customer5', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ประเสริฐ', 'ดีงาม', 'customer5@example.com', '0856789012', '654/98 ถนนเพชรบุรี แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพมหานคร 10400', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(24, 'customer6', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ประภา', 'สวยงาม', 'customer6@example.com', '0867890123', '987/32 ถนนลาดพร้าว แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพมหานคร 10230', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(25, 'customer7', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'วิทยา', 'เจริญ', 'customer7@example.com', '0878901234', '147/85 ถนนบางนา แขวงบางนา เขตบางนา กรุงเทพมหานคร 10260', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(26, 'customer8', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'วิมล', 'รุ่งเรือง', 'customer8@example.com', '0889012345', '258/96 ถนนอโศก แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(27, 'customer9', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'สมศักดิ์', 'มั่นคง', 'customer9@example.com', '0890123456', '369/74 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(28, 'customer10', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'สมศรี', 'สุขสันต์', 'customer10@example.com', '0901234567', '741/52 ถนนพหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(29, 'customer11', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ชาญชัย', 'เก่งกล้า', 'customer11@example.com', '0912345678', '852/41 ถนนรัชดาภิเษก แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพมหานคร 10310', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(30, 'customer12', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ชาญชล', 'รุ่งโรจน์', 'customer12@example.com', '0923456789', '963/28 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(31, 'customer13', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ธนพล', 'มั่งคั่ง', 'customer13@example.com', '0934567890', '159/63 ถนนเพชรบุรี แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพมหานคร 10400', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(32, 'customer14', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ธนพร', 'รวยทรัพย์', 'customer14@example.com', '0945678901', '357/47 ถนนลาดพร้าว แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพมหานคร 10230', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(33, 'customer15', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'อานนท์', 'สุขสม', 'customer15@example.com', '0956789012', '468/39 ถนนบางนา แขวงบางนา เขตบางนา กรุงเทพมหานคร 10260', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(34, 'customer16', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'อารยา', 'สวยใส', 'customer16@example.com', '0967890123', '579/26 ถนนอโศก แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(35, 'customer17', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'กิตติ', 'เจริญก้าวหน้า', 'customer17@example.com', '0978901234', '680/58 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(36, 'customer18', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'กิตติยา', 'รุ่งเรือง', 'customer18@example.com', '0989012345', '791/84 ถนนพหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(37, 'customer19', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ณัฐพล', 'มั่นคง', 'customer19@example.com', '0990123456', '802/15 ถนนรัชดาภิเษก แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพมหานคร 10310', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(38, 'customer20', '$2a$10$8lKnAesFUpMZ2jkW7oalyupe/Tfhd5vA6yGVid6/BL/eyU7kT6tnq', 'ณัฐพร', 'สุขใจ', 'customer20@example.com', '0901234567', '913/72 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500', '2025-12-16 20:50:00', '2025-12-16 20:50:00', '[]', 0, NULL, NULL),
(39, 'testuser999', '$2a$10$QQPkbypWtVNNA4a/DfbWjOP1fabHlhBF5kgA.T4UcnrQU2x2gw.vi', 'Test', 'User', 'testuser999@test.com', '0812345678', '123/456', '2025-12-16 21:30:51', '2025-12-16 21:30:51', '[]', 0, NULL, NULL),
(41, 'chayapat.pini', '$2a$10$6c7mLmREsUKivs8AbNTy1u4PYx1.bjBOiw1g6ujAydOtOYmVbgVR6', 'ชยพัทธ์', 'พินิตย์อัทธยา', 'chayapat.pini@bumail.net', '0944139232', '123/123', '2025-12-16 21:34:20', '2025-12-16 21:34:20', '[]', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `installment_payments`
--

CREATE TABLE `installment_payments` (
  `installment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `installment_number` int(11) NOT NULL,
  `installment_amount` decimal(10,2) NOT NULL,
  `payment_due_date` date NOT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `installment_payments`
--

INSERT INTO `installment_payments` (`installment_id`, `order_id`, `installment_number`, `installment_amount`, `payment_due_date`, `payment_status`, `payment_date`) VALUES
(1, 52, 1, 980.00, '2026-01-16', 'paid', '2025-12-16'),
(2, 52, 2, 980.00, '2026-02-16', 'pending', NULL),
(3, 52, 3, 980.00, '2026-03-16', 'pending', NULL),
(4, 52, 4, 980.00, '2026-04-16', 'pending', NULL),
(5, 52, 5, 980.00, '2026-05-16', 'pending', NULL),
(6, 52, 6, 980.00, '2026-06-16', 'pending', NULL),
(7, 52, 7, 980.00, '2026-07-16', 'pending', NULL),
(8, 52, 8, 980.00, '2026-08-16', 'pending', NULL),
(9, 52, 9, 980.00, '2026-09-16', 'pending', NULL),
(10, 52, 10, 980.00, '2026-10-16', 'pending', NULL),
(11, 52, 11, 980.00, '2026-11-16', 'pending', NULL),
(12, 52, 12, 980.00, '2026-12-16', 'pending', NULL),
(13, 54, 1, 5390.00, '2026-01-16', 'paid', '2025-12-16'),
(14, 54, 2, 5390.00, '2026-02-16', 'paid', '2025-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `installment_periods` int(11) NOT NULL,
  `monthly_payment` decimal(10,2) NOT NULL,
  `shipping_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `order_date`, `order_status`, `total_amount`, `payment_method`, `installment_periods`, `monthly_payment`, `shipping_address`) VALUES
(52, 19, '2025-12-17', 'pending', 11760.00, 'installment', 12, 980.00, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/45 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110\"}'),
(53, 19, '2025-12-17', 'completed', 4000.00, 'cash', 1, 4000.00, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/45 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพมหานคร 10110\"}'),
(54, 41, '2025-12-17', 'completed', 10780.00, 'installment', 2, 5390.00, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/123\"}');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(3, 53, 41, 1, 4000.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_stock` int(11) NOT NULL DEFAULT 0,
  `product_image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_id` int(11) DEFAULT NULL,
  `price_cash` decimal(10,2) DEFAULT NULL,
  `price_cash_promo` decimal(10,2) DEFAULT NULL,
  `price_installment` decimal(10,2) DEFAULT NULL,
  `price_installment_promo` decimal(10,2) DEFAULT NULL,
  `product_highlights` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_highlights`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_price`, `product_stock`, `product_image`, `created_at`, `updated_at`, `category_id`, `price_cash`, `price_cash_promo`, `price_installment`, `price_installment_promo`, `product_highlights`, `tags`) VALUES
(1, 'ชั้นวางทีวี 150 ซม. สีขาว รุ่นคลาสสิก', 'ชั้นวางทีวีไม้สีขาว ขนาดประมาณ กว้าง 150 ซม. x ลึก 40 ซม. รองรับทีวีได้ถึง 55 นิ้ว มีชั้นเก็บของด้านล่าง', 7500.00, 10, '/images/ชั้นวางทีวี/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7500.00, 7000.00, 8000.00, 7500.00, '[\"ขนาดประมาณ 150 x 40 ซม.\",\"รองรับทีวี 55 นิ้ว\",\"ชั้นเก็บของด้านล่าง\"]', '[\"ชั้นวางทีวี\"]'),
(2, 'ชั้นวางทีวี 160 ซม. ลายไม้ธรรมชาติ', 'ชั้นวางทีวีลายไม้ธรรมชาติ ขนาดประมาณ กว้าง 160 ซม. x ลึก 40 ซม. มีช่องเก็บของปิด-เปิดได้', 7800.00, 10, '/images/ชั้นวางทีวี/__002.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7800.00, 7300.00, 8300.00, 7800.00, '[\"ขนาดประมาณ 160 x 40 ซม.\",\"ดีไซน์ลายไม้\",\"บานตู้เก็บของ 2 ฝั่ง\"]', '[\"ชั้นวางทีวี\",\"ห้องนั่งเล่น\"]'),
(3, 'ชั้นวางทีวี 180 ซม. พร้อมชั้นโชว์', 'ชั้นวางทีวีขนาดใหญ่ กว้างประมาณ 180 ซม. x ลึก 40 ซม. มีชั้นโชว์ของด้านข้างและลิ้นชักเก็บของ', 8200.00, 8, '/images/ชั้นวางทีวี/__003.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 8200.00, 7700.00, 8700.00, 8200.00, '[\"ขนาดประมาณ 180 x 40 ซม.\",\"ชั้นโชว์ของด้านข้าง\",\"ลิ้นชักเก็บของ\"]', '[\"ชั้นวางทีวี\"]'),
(4, 'ชั้นวางทีวีลอยผนัง 120 ซม.', 'ชั้นวางทีวีแบบแขวนผนัง ขนาดประมาณ กว้าง 120 ซม. x ลึก 30 ซม. ประหยัดพื้นที่ เหมาะกับคอนโด', 7300.00, 10, '/images/ชั้นวางทีวี/__004.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7300.00, 6800.00, 7700.00, 7200.00, '[\"แบบแขวนผนัง\",\"ประหยัดพื้นที่\",\"ซ่อนสายไฟง่าย\"]', '[\"ชั้นวางทีวี\",\"แขวนผนัง\"]'),
(5, 'ชั้นวางทีวี 140 ซม. สไตล์มินิมอล', 'ชั้นวางทีวีสไตล์มินิมอล กว้างประมาณ 140 ซม. x ลึก 40 ซม. หน้าท็อปเรียบ เคลือบกันรอยขีดข่วน', 7400.00, 9, '/images/ชั้นวางทีวี/__005.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7400.00, 6900.00, 7900.00, 7400.00, '[\"สไตล์มินิมอล\",\"หน้าท็อปกันรอย\",\"เข้าได้กับหลายสไตล์ห้อง\"]', '[\"ชั้นวางทีวี\",\"มินิมอล\"]'),
(6, 'ชั้นวางทีวี 160 ซม. มีตู้เก็บของล่าง', 'ชั้นวางทีวีพร้อมตู้เก็บของด้านล่าง กว้างประมาณ 160 ซม. x ลึก 40 ซม. แบ่งช่องเก็บเป็นสัดส่วน', 7600.00, 10, '/images/ชั้นวางทีวี/__006.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7600.00, 7100.00, 8100.00, 7600.00, '[\"ตู้เก็บของด้านล่าง\",\"แบ่งช่องเก็บของ\",\"ขนาด 160 x 40 ซม. (ประมาณ)\"]', '[\"ชั้นวางทีวี\"]'),
(7, 'ชั้นวางทีวี 180 ซม. พร้อมตู้ข้าง', 'ชุดชั้นวางทีวีพร้อมตู้ข้าง 2 ฝั่ง กว้างประมาณ 180 ซม. x ลึก 40 ซม. เหมาะกับผนังใหญ่ในห้องรับแขก', 8300.00, 7, '/images/ชั้นวางทีวี/__007.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 8300.00, 7800.00, 8800.00, 8300.00, '[\"ชุดพร้อมตู้ข้าง\",\"เก็บของได้เยอะ\",\"เหมาะกับผนังใหญ่\"]', '[\"ชั้นวางทีวี\",\"ชุดผนัง\"]'),
(8, 'ชั้นวางทีวี 120 ซม. สำหรับห้องเล็ก', 'ชั้นวางทีวีขนาดกะทัดรัด กว้างประมาณ 120 ซม. x ลึก 35 ซม. เหมาะสำหรับห้องนั่งเล่นหรือคอนโดขนาดเล็ก', 7200.00, 10, '/images/ชั้นวางทีวี/__008.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 5, 7200.00, 6700.00, 7600.00, 7100.00, '[\"ขนาดกะทัดรัด\",\"เหมาะคอนโด\",\"จัดวางง่าย\"]', '[\"ชั้นวางทีวี\"]'),
(9, 'โซฟาผ้า 2 ที่นั่ง สีเทาอ่อน', 'โซฟาผ้าขนาด 2 ที่นั่ง กว้างประมาณ 150 ซม. x ลึก 85 ซม. เบาะนุ่ม รองรับสรีระ เหมาะกับห้องเล็ก', 8000.00, 10, '/images/โซฟา/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 8000.00, 7500.00, 8600.00, 8100.00, '[\"รองรับ 2–3 ที่นั่ง\",\"เบาะฟูกหนานุ่ม\",\"ผ้าระบายอากาศดี\"]', '[\"โซฟา\",\"ห้องนั่งเล่น\"]'),
(10, 'โซฟาหนังเทียม 3 ที่นั่ง', 'โซฟาหนังเทียมสีเข้ม กว้างประมาณ 190 ซม. x ลึก 90 ซม. ทำความสะอาดง่าย ทนต่อรอยขีดข่วน', 8500.00, 8, '/images/โซฟา/__002.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 8500.00, 8000.00, 9000.00, 8500.00, '[\"กว้างประมาณ 190 x 90 ซม.\",\"หนังเทียมเช็ดทำความสะอาดง่าย\",\"ดีไซน์เรียบหรู\"]', '[\"โซฟา\"]'),
(11, 'โซฟาเข้ามุมรูปตัว L', 'โซฟาเข้ามุมตัว L ด้านยาวประมาณ 230 ซม. ด้านสั้น 160 ซม. เหมาะสำหรับห้องนั่งเล่นหลักของบ้าน', 9800.00, 5, '/images/โซฟา/__005.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 9800.00, 9200.00, 10500.00, 9900.00, '[\"โซฟาเข้ามุมตัว L\",\"รองรับได้หลายที่นั่ง\",\"เหมาะสำหรับห้องรับแขก\"]', '[\"โซฟาเข้ามุม\"]'),
(12, 'โซฟาเดี่ยวปรับเอนได้', 'โซฟาเดี่ยวปรับเอนนอนได้ กว้างประมาณ 80 ซม. x ลึก 100 ซม. เหมาะสำหรับมุมนั่งอ่านหนังสือ', 7200.00, 6, '/images/โซฟา/__011.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 7200.00, 6700.00, 7700.00, 7200.00, '[\"ปรับเอนได้หลายระดับ\",\"เบาะรองนั่งรองรับสรีระ\",\"เหมาะกับมุมพักผ่อน\"]', '[\"โซฟาเดี่ยว\"]'),
(13, 'โซฟาผ้า 3 ที่นั่ง พร้อมหมอนอิง', 'โซฟาผ้า 3 ที่นั่ง กว้างประมาณ 200 ซม. x ลึก 90 ซม. มาพร้อมหมอนอิงเข้าชุด', 8700.00, 7, '/images/โซฟา/__008.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 8700.00, 8200.00, 9300.00, 8800.00, '[\"รองรับ 3 ที่นั่ง\",\"หมอนอิงเข้าชุด\",\"ดีไซน์โมเดิร์น\"]', '[\"โซฟา\"]'),
(14, 'โซฟาเบดปรับนอนได้', 'โซฟาเบดปรับนอนได้ กางออกเป็นเตียงเดี่ยวขนาด 3.5 ฟุต เหมาะสำหรับห้องอเนกประสงค์', 8900.00, 6, '/images/โซฟา/__009.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 8900.00, 8400.00, 9500.00, 9000.00, '[\"ปรับเป็นเตียงได้\",\"เหมาะห้องอเนกประสงค์\",\"โครงสร้างแข็งแรง\"]', '[\"โซฟาเบด\"]'),
(15, 'โซฟาผ้า 2 ที่นั่ง สีครีม', 'โซฟาผ้าสีครีม กว้างประมาณ 145 ซม. x ลึก 80 ซม. ให้บรรยากาศอบอุ่นในห้องนั่งเล่น', 7900.00, 9, '/images/โซฟา/__003.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 7900.00, 7400.00, 8400.00, 7900.00, '[\"สีครีมโทนอุ่น\",\"ขนาดกระทัดรัด\",\"เข้ากับเฟอร์นิเจอร์ได้ง่าย\"]', '[\"โซฟา\"]'),
(16, 'โซฟาหนัง 2+1 ที่นั่ง', 'ชุดโซฟาหนัง 2+1 ที่นั่ง สำหรับห้องรับแขก ขนาดตัวหลักประมาณ 170 ซม. x ลึก 90 ซม.', 9200.00, 5, '/images/โซฟา/__006.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 4, 9200.00, 8700.00, 9800.00, 9300.00, '[\"ชุด 2+1 ที่นั่ง\",\"หนังคุณภาพดี\",\"เหมาะใช้รับแขก\"]', '[\"โซฟา\",\"ชุดรับแขก\"]'),
(17, 'ตู้กับข้าวไม้สัก 3 บาน', 'ตู้กับข้าวไม้สัก กว้างประมาณ 90 ซม. x ลึก 40 ซม. มีบานกระจกด้านบนและตู้เก็บของด้านล่าง', 6200.00, 10, '/images/ตู้กับข้าว/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 11, 6200.00, 5800.00, 6700.00, 6300.00, '[\"โครงสร้างไม้สัก\",\"บานกระจกโชว์อาหารแห้ง\",\"ตู้เก็บของด้านล่าง\"]', '[\"ตู้กับข้าว\"]'),
(18, 'ตู้โชว์กระจก 3 ชั้น สูง 180 ซม.', 'ตู้โชว์กระจกเต็มบาน กว้างประมาณ 80 ซม. x ลึก 35 ซม. x สูง 180 ซม. เหมาะสำหรับโชว์ของสะสม', 8000.00, 8, '/images/ตู้โชว์/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 9, 8000.00, 7500.00, 8600.00, 8100.00, '[\"ความสูงประมาณ 180 ซม.\",\"ชั้นกระจก 3 ชั้น\",\"โชว์ของสะสมได้ชัดเจน\"]', '[\"ตู้โชว์\"]'),
(19, 'ตู้โชว์มุมห้อง ทรงโค้ง', 'ตู้โชว์เข้ามุมทรงโค้ง ด้านหน้าประมาณ 60 ซม. เหมาะสำหรับวางมุมห้องประหยัดพื้นที่', 8300.00, 5, '/images/ตู้โชว์/__002.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 9, 8300.00, 7800.00, 8800.00, 8300.00, '[\"ดีไซน์เข้ามุม\",\"ประหยัดพื้นที่\",\"กระจกโค้งสวยงาม\"]', '[\"ตู้โชว์\",\"เข้ามุม\"]'),
(20, 'ตู้โชว์บานไม้กระจกผสม', 'ตู้โชว์บานไม้ผสมกระจก กว้างประมาณ 90 ซม. x ลึก 40 ซม. เหมาะวางห้องรับแขก', 8200.00, 7, '/images/ตู้โชว์/__003.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 9, 8200.00, 7700.00, 8700.00, 8200.00, '[\"บานไม้ผสมกระจก\",\"ชั้นปรับระดับได้\",\"โชว์ของและเก็บของได้พร้อมกัน\"]', '[\"ตู้โชว์\"]'),
(21, 'ตู้เสื้อผ้า 3 บาน สีขาว', 'ตู้เสื้อผ้า 3 บาน กว้างประมาณ 120 ซม. x ลึก 55 ซม. มีราวแขวนและชั้นเก็บผ้า', 8500.00, 10, '/images/ตู้เสื้อผ้า/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 8500.00, 8000.00, 9100.00, 8600.00, '[\"3 บานเปิด\",\"มีราวแขวนและชั้นวาง\",\"สีขาวเข้ากับทุกสไตล์ห้อง\"]', '[\"ตู้เสื้อผ้า\"]'),
(22, 'ตู้เสื้อผ้า 4 บาน พร้อมกระจกกลาง', 'ตู้เสื้อผ้า 4 บาน กว้างประมาณ 160 ซม. x ลึก 55 ซม. มีกระจกเต็มตัวตรงกลาง', 9200.00, 8, '/images/ตู้เสื้อผ้า/__004.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 9200.00, 8700.00, 9800.00, 9300.00, '[\"4 บานเปิด\",\"กระจกเต็มตัว\",\"เหมาะกับห้องนอนคู่\"]', '[\"ตู้เสื้อผ้า\",\"กระจก\"]'),
(23, 'ตู้เสื้อผ้า 2 บาน แบบสูง', 'ตู้เสื้อผ้า 2 บานสูงเพดาน กว้างประมาณ 100 ซม. x ลึก 55 ซม. เน้นแขวนเสื้อผ้าเป็นหลัก', 7800.00, 9, '/images/ตู้เสื้อผ้า/__003.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 7800.00, 7300.00, 8300.00, 7800.00, '[\"สูงเกือบเต็มเพดาน\",\"ราวแขวนยาว\",\"เก็บเสื้อผ้าได้เยอะ\"]', '[\"ตู้เสื้อผ้า\"]'),
(24, 'ตู้เสื้อผ้าลายไม้ธรรมชาติ 3 บาน', 'ตู้เสื้อผ้าลายไม้ธรรมชาติ กว้างประมาณ 130 ซม. x ลึก 55 ซม. มีลิ้นชักด้านล่าง 2 ช่อง', 8900.00, 7, '/images/ตู้เสื้อผ้า/__006.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 8900.00, 8400.00, 9500.00, 9000.00, '[\"ลายไม้ธรรมชาติ\",\"ลิ้นชักด้านล่าง\",\"ดีไซน์อบอุ่น\"]', '[\"ตู้เสื้อผ้า\",\"ลายไม้\"]'),
(25, 'ตู้เสื้อผ้า 5 บาน ชุดใหญ่', 'ตู้เสื้อผ้า 5 บาน กว้างประมาณ 220 ซม. x ลึก 60 ซม. เหมาะสำหรับครอบครัวหรือห้องแต่งตัว', 12500.00, 5, '/images/ตู้เสื้อผ้า/__007.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 12500.00, 11800.00, 13500.00, 12800.00, '[\"ขนาดใหญ่ 5 บาน\",\"แบ่งช่องเก็บเป็นสัดส่วน\",\"เหมาะกับ Walk-in Closet\"]', '[\"ตู้เสื้อผ้า\",\"ชุดใหญ่\"]'),
(26, 'ตู้เสื้อผ้าเล็กสำหรับห้องเด็ก', 'ตู้เสื้อผ้า 2 บาน กว้างประมาณ 80 ซม. x ลึก 50 ซม. เหมาะสำหรับห้องเด็กหรือหอพัก', 6500.00, 10, '/images/ตู้เสื้อผ้า/__002.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 6500.00, 6100.00, 7000.00, 6600.00, '[\"ขนาดกะทัดรัด\",\"เหมาะกับห้องเด็ก\",\"จัดวางง่าย\"]', '[\"ตู้เสื้อผ้า\",\"ห้องเด็ก\"]'),
(27, 'ตู้เสื้อผ้า 3 บาน พร้อมช่องใส่ของด้านข้าง', 'ตู้เสื้อผ้า 3 บาน กว้างประมาณ 140 ซม. x ลึก 55 ซม. มีช่องใส่ของด้านข้างสำหรับวางของตกแต่ง', 8800.00, 7, '/images/ตู้เสื้อผ้า/__005.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 7, 8800.00, 8300.00, 9400.00, 8900.00, '[\"มีช่องวางของด้านข้าง\",\"จัดเก็บเป็นสัดส่วน\",\"ดีไซน์ทันสมัย\"]', '[\"ตู้เสื้อผ้า\"]'),
(28, 'ชุดเซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง', 'ชุดเฟอร์นิเจอร์เซ็ตตู้เสื้อผ้าพร้อมโต๊ะเครื่องแป้ง เข้าชุดกัน เหมาะสำหรับห้องนอนใหม่', 15500.00, 5, '/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 12, 15500.00, 14500.00, 16800.00, 15800.00, '[\"ชุดเซ็ตพร้อมใช้\",\"เข้ากันทั้งตู้และโต๊ะเครื่องแป้ง\",\"เหมาะเริ่มต้นแต่งห้อง\"]', '[\"ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)\"]'),
(29, 'เตียงเดี่ยว 3.5 ฟุต โครงเหล็ก', 'เตียงโครงเหล็กขนาด 3.5 ฟุต ขนาดประมาณ กว้าง 110 ซม. x ยาว 200 ซม. แข็งแรง ดูแลง่าย', 4500.00, 12, '/images/เตียง/__001.jpg', '2025-12-15 17:26:21', '2025-12-16 20:52:30', NULL, 4500.00, 4200.00, 5400.00, 5040.00, '[\"ขนาด 3.5 ฟุต\",\"โครงเหล็กแข็งแรง\",\"เหมาะกับหอพัก\"]', '[\"เตียงนอน\"]'),
(31, 'เตียงคู่ 5 ฟุต หัวเตียงเรียบหรู', 'เตียงไม้ 5 ฟุต ขนาดประมาณ กว้าง 150 ซม. x ยาว 200 ซม. หัวเตียงออกแบบเรียบหรู', 6500.00, 10, '/images/เตียง/__002.jpg', '2025-12-15 17:26:21', '2025-12-16 20:52:28', NULL, 6500.00, 6100.00, 7800.00, 7320.00, '[\"ขนาด 5 ฟุต\",\"หัวเตียงเรียบหรู\",\"เข้ากับหลายสไตล์ห้อง\"]', '[\"เตียงนอน\"]'),
(33, 'เตียง King Size 6 ฟุต หัวเตียงสูง', 'เตียงไม้ 6 ฟุต ขนาดประมาณ กว้าง 180 ซม. x ยาว 200 ซม. หัวเตียงสูง ดูหรูหรา', 7500.00, 8, '/images/เตียง/__003.jpg', '2025-12-15 17:26:21', '2025-12-16 20:52:45', NULL, 7500.00, 7000.00, 9000.00, 8400.00, '[\"ขนาด 6 ฟุต\",\"หัวเตียงสูง\",\"สไตล์โมเดิร์น\"]', '[\"เตียงนอน\"]'),
(35, 'เตียงเดี่ยว 3.5 ฟุต ขาไม้เตี้ย', 'เตียงไม้เตี้ยขนาด 3.5 ฟุต ขนาดประมาณ กว้าง 110 ซม. x ยาว 200 ซม. ให้ความรู้สึกโปร่งในห้อง', 4600.00, 9, '/images/เตียงนอน/__001.jpg', '2025-12-15 17:26:21', '2025-12-16 20:52:26', NULL, 4600.00, 4300.00, 5520.00, 5160.00, '[\"เตียงเตี้ย\",\"สไตล์มินิมอล\",\"ขนาด 3.5 ฟุต\"]', '[\"เตียงนอน\"]'),
(36, 'เตียงคู่ 5 ฟุต หัวเตียงบุนวม', 'เตียง 5 ฟุต หัวเตียงบุนวม กว้างประมาณ 150 ซม. x ยาว 200 ซม. นั่งพิงอ่านหนังสือได้สบาย', 6700.00, 7, '/images/เตียงนอน/__006.jpg', '2025-12-15 17:26:21', '2025-12-16 20:52:23', NULL, 6700.00, 6300.00, 8040.00, 7560.00, '[\"หัวเตียงบุนวม\",\"นั่งพิงสบาย\",\"ขนาด 5 ฟุต\"]', '[\"เตียงนอน\"]'),
(37, 'โต๊ะเครื่องแป้งขนาด 80 ซม. พร้อมเก้าอี้', 'โต๊ะเครื่องแป้งกว้างประมาณ 80 ซม. x ลึก 40 ซม. มีกระจกบานกลางและลิ้นชักเก็บของ พร้อมเก้าอี้เข้าชุด', 6500.00, 10, '/images/โต๊ะเครื่องแป้ง/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 6, 6500.00, 6100.00, 7000.00, 6600.00, '[\"มีกระจกบานกลาง\",\"ลิ้นชักเก็บของ\",\"มีเก้าอี้เข้าชุด\"]', '[\"โต๊ะเครื่องแป้ง\"]'),
(38, 'โต๊ะเครื่องแป้งทรงสูง กระจกเต็มตัว', 'โต๊ะเครื่องแป้งทรงสูงพร้อมกระจกเต็มตัว ฐานกว้างประมาณ 70 ซม. x ลึก 40 ซม. ประหยัดพื้นที่', 6700.00, 8, '/images/โต๊ะเครื่องแป้ง/__002.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 6, 6700.00, 6300.00, 7200.00, 6800.00, '[\"กระจกเต็มตัว\",\"ทรงสูงประหยัดพื้นที่\",\"เหมาะกับคอนโด\"]', '[\"โต๊ะเครื่องแป้ง\"]'),
(39, 'ฟูกนอนโฟม 3.5 ฟุต หนา 6 นิ้ว', 'ฟูกนอนโฟมขนาด 3.5 ฟุต ประมาณ 110 x 200 ซม. หนา 6 นิ้ว รองรับสรีระ นอนสบาย', 3500.00, 15, '/images/ฟูกนอน/__001.jpg', '2025-12-15 17:26:21', '2025-12-16 20:51:55', NULL, 3500.00, 3200.00, 4200.00, 3840.00, '[\"ขนาด 3.5 ฟุต (ประมาณ 110 x 200 ซม.)\",\"หนา 6 นิ้ว\",\"โฟมแน่นกำลังดี\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(40, 'ฟูกนอนสปริง 3.5 ฟุต', 'ฟูกนอนสปริงขนาด 3.5 ฟุต รองรับน้ำหนักดี เหมาะใช้กับเตียงเดี่ยว', 3800.00, 10, '/images/ฟูกนอน/__002.jpg', '2025-12-15 17:26:21', '2025-12-16 20:51:44', NULL, 3800.00, 3500.00, 4560.00, 4200.00, '[\"สปริงเสริมโฟม\",\"รองรับสรีระ\",\"เหมาะกับเตียงเดี่ยว\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(41, 'ฟูกนอนโฟม 5 ฟุต', 'ฟูกนอนโฟมขนาด 5 ฟุต ประมาณ 150 x 200 ซม. รองรับคู่รัก นอนสบาย', 5000.00, 15, '/images/ฟูกนอน/__004.jpg', '2025-12-15 17:26:21', '2025-12-15 18:09:05', 8, 5000.00, 4000.00, 6000.00, 4800.00, '[\"ขนาด 5 ฟุต\",\"โฟมแน่น\",\"หุ้มผ้าระบายอากาศ\"]', '[\"เตียงนอน\"]'),
(42, 'ฟูกนอนโฟม 6 ฟุต', 'ฟูกนอนโฟมขนาด 6 ฟุต ประมาณ 180 x 200 ซม. เหมาะกับเตียง King Size', 6500.00, 12, '/images/ฟูกนอน/__007.jpg', '2025-12-15 17:26:21', '2025-12-15 18:04:23', 8, 6500.00, 6000.00, 7800.00, 7200.00, '[\"ขนาด 6 ฟุต\",\"โฟมความยืดหยุ่นดี\",\"เหมาะกับเตียงใหญ่\"]', '[\"เตียงนอน\"]'),
(43, 'หิ้งพระไม้สักติดผนัง 80 ซม.', 'หิ้งพระไม้สักสำหรับติดผนัง ขนาดประมาณ กว้าง 80 ซม. x ลึก 35 ซม. ดีไซน์เรียบหรู', 10000.00, 8, '/images/หิ้งพระ/__001.jpg', '2025-12-15 17:26:21', '2025-12-15 17:26:21', 10, 10000.00, 9500.00, 10800.00, 10300.00, '[\"ไม้สักแท้\",\"ติดผนังประหยัดพื้นที่\",\"ขนาด 80 x 35 ซม. (ประมาณ)\"]', '[\"หิ้งพระ\"]');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `tag` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag`) VALUES
(29, 'เตียงนอน'),
(31, 'เตียงนอน'),
(33, 'เตียงนอน'),
(35, 'เตียงนอน'),
(36, 'เตียงนอน'),
(39, 'ฟูกนอน/ที่นอน'),
(40, 'ฟูกนอน/ที่นอน'),
(41, 'เตียงนอน'),
(42, 'เตียงนอน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `unique_cart_item` (`customer_id`,`product_id`,`pricing_type`),
  ADD KEY `fk_cart_item_product` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_username` (`customer_username`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`installment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_payment_due_date` (`payment_due_date`),
  ADD KEY `idx_payment_status` (`payment_status`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_order_date` (`order_date`),
  ADD KEY `idx_order_status` (`order_status`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `fk_cart_item_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD CONSTRAINT `installment_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
