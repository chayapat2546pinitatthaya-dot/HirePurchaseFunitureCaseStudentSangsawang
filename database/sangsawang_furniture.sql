-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 06:48 PM
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
(1, 'admin', '$2a$10$0eFk/iNLKbl0tS1sYcIL4u7vEhhl51QwZVs1Z/e9IOFqTSQWbyeA.', 'Admin', 'Sangsawang', 'admin@sangsawang.com', '02-123-4567', '2025-11-06 15:23:52', '2025-11-06 15:23:52');

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

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `customer_id`, `product_id`, `pricing_type`, `pricing_label`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(25, 6, 42, 'cashPromo', 'ซื้อสด', 1, 19000.00, '2025-11-18 15:25:01', '2025-11-18 15:25:01');

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
(1, 'สำนักงาน', 'เฟอร์นิเจอร์สำหรับสำนักงานและพื้นที่ทำงาน'),
(2, 'บ้านพักอาศัย', 'เฟอร์นิเจอร์สำหรับใช้ในบ้านและที่พักอาศัย'),
(3, 'เตียงนอน', 'เตียงนอนและอุปกรณ์สำหรับห้องนอน'),
(4, 'โซฟา', 'โซฟาและเก้าอี้นั่งสำหรับห้องนั่งเล่น'),
(5, 'ชั้นวางทีวี', 'ชั้นวางทีวีและตู้โชว์สำหรับห้องนั่งเล่น'),
(6, 'โต๊ะเครื่องแป้ง', 'โต๊ะเครื่องแป้งและโต๊ะแต่งตัว'),
(7, 'ตู้เสื้อผ้า', 'ตู้เสื้อผ้าและตู้เก็บของ'),
(8, 'ฟูกนอน/ที่นอน', 'ฟูกนอนและที่นอนคุณภาพสูง'),
(9, 'ตู้โชว์', 'ตู้โชว์และตู้แสดงของตกแต่ง'),
(10, 'หิ้งพระ', 'หิ้งพระและแท่นบูชา'),
(11, 'ตู้กับข้าว', 'ตู้กับข้าวและตู้เก็บอาหาร'),
(12, 'ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)', 'เซ็ตตู้เสื้อผ้าและโต๊ะเครื่องแป้ง');

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
(6, 'chayapat.pini', '$2a$10$YZy6Z./V2T1WZj88FXN84eU3.4ivNr5CWBR41PCkbFzwAyOP0ThV.', 'ชยพัทธ์', 'พินิตย์อัทธยา', 'chayapat.pini@bumail.net', '0944139232', '1/133', '2025-11-18 05:35:08', '2025-11-18 05:35:08', '[]', 0, NULL, NULL),
(7, 'customer3', '$2a$10$0TJOrq78r7vFVqn6VmzLE.dx2X7xfpq7q6ZQJ8dP5CwLvZoxGnupC', 'ประเสริฐ', 'ดีงาม', 'prasert@example.com', '0812345678', '123 ถนนราชดำริ แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330', '2025-11-18 05:40:23', '2025-11-18 05:40:23', '[]', 0, NULL, NULL),
(8, 'customer4', '$2a$10$/v.ZzSKSmsITbCvHXSSxReIGPPHWefgMbAvQTpcCnQPEpXBmaE4xW', 'วิไล', 'สวยงาม', 'wilai@example.com', '0823456789', '456 ถนนสีลม แขวงสีลม เขตบางรัก กรุงเทพฯ 10500', '2025-11-18 05:40:23', '2025-11-18 05:40:23', '[]', 0, NULL, NULL),
(9, 'customer5', '$2a$10$vS2LqWaWPp/QTiTjuZtAEuyXNrE2ro5qSPi5CTBz1xKc.T1nNp.2G', 'สมศักดิ์', 'รวยทรัพย์', 'somsak@example.com', '0834567890', '789 ถนนเพชรบุรี แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400', '2025-11-18 05:40:23', '2025-11-18 05:40:23', '[]', 0, NULL, NULL),
(10, 'customer6', '$2a$10$EyfTvpEMfr0vuG4WxzkdDuVL5CJ4xKN/CkyjstNTAwoGze3sjH82y', 'มาลี', 'ใจดี', 'malee@example.com', '0845678901', '321 ถนนสุขุมวิท แขวงคลองตัน เขตคลองตัน กรุงเทพฯ 10110', '2025-11-18 05:40:23', '2025-11-18 05:40:23', '[]', 0, NULL, NULL),
(11, 'customer7', '$2a$10$0/Yaw4Kk5ki92rWFEAvJ4.gZNoTQtKeJxGBS0PRH3lvU6BM4kKfwC', 'วิทยา', 'เก่งมาก', 'wittaya@example.com', '0856789012', '654 ถนนพหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900', '2025-11-18 05:40:24', '2025-11-18 05:40:24', '[]', 0, NULL, NULL),
(12, 'customer8', '$2a$10$g1AI.UTf.Lgw4A0oRlbNB.31CeeXQFs1HuzQbJIVpvV5Z7u0H6u36', 'สุภาพ', 'น่ารัก', 'supap@example.com', '0867890123', '987 ถนนรัชดาภิเษก แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพฯ 10310', '2025-11-18 05:40:24', '2025-11-18 05:40:24', '[]', 0, NULL, NULL),
(13, 'customer9', '$2a$10$fg2okNt9Hx4Mpq8g8Ib9xOwcq4m3mUq5qN1THZd8/KYmpcE7Zg9Tm', 'ชาญชัย', 'ฉลาดมาก', 'chanchai@example.com', '0878901234', '147 ถนนลาดพร้าว แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230', '2025-11-18 05:40:24', '2025-11-18 05:40:24', '[]', 0, NULL, NULL),
(14, 'customer10', '$2a$10$4H7g2yYudS5InmLlEoQ3DuYZdlUfxgvgm23rlxAoJpGwlRtrnp9AO', 'รัตนา', 'สวยใส', 'rattana@example.com', '0889012345', '258 ถนนบางนา-ตราด แขวงบางนา เขตบางนา กรุงเทพฯ 10260', '2025-11-18 05:40:24', '2025-11-18 05:40:24', '[]', 0, NULL, NULL),
(15, 'customer11', '$2a$10$CG7SjW45MMy47AphFwDs5e4aRESwAMR/79IK/vHp5YrSiQMCTOkvm', 'ธีรพงษ์', 'เก่งกาจ', 'teerapong@example.com', '0890123456', '369 ถนนรามคำแหง แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310', '2025-11-18 05:40:25', '2025-11-18 05:40:25', '[]', 0, NULL, NULL),
(16, 'customer12', '$2a$10$a/Oi2GlStQAcBc7J3fAwAusx3M/h.L.lXd/nwnJAn2qZeh1iabtAi', 'ปิยะ', 'ดีใจ', 'piya@example.com', '0901234567', '741 ถนนพระราม 2 แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140', '2025-11-18 05:40:25', '2025-11-18 05:40:25', '[]', 0, NULL, NULL),
(17, 'customer1', '$2a$10$OeuvF9AJ34ZJXrp3dxks1.jIPBtGksKafr8/iUAj0B61dFT8kvAFW', 'สมใจ', 'ดูดี', 'customer1@gmail.com', '0981234567', '{\"recipientName\":\"สมใจ\",\"recipientSurname\":\"ดูดี\",\"phone\":\"0981234567\",\"address\":\"123/45 หมู่ 6 ต.ท่าผา อ.บ้านโป่ง จ.ราชบุรี 70110\"}', '2025-11-19 08:08:34', '2025-11-27 17:30:29', '[]', 0, NULL, NULL);

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
(1, 3, 1, 13562.50, '2025-12-18', 'pending', NULL),
(2, 3, 2, 13562.50, '2026-01-18', 'pending', NULL),
(3, 3, 3, 13562.50, '2026-02-18', 'pending', NULL),
(4, 3, 4, 13562.50, '2026-03-18', 'pending', NULL),
(5, 3, 5, 13562.50, '2026-04-18', 'pending', NULL),
(6, 3, 6, 13562.50, '2026-05-18', 'pending', NULL),
(7, 3, 7, 13562.50, '2026-06-18', 'pending', NULL),
(8, 3, 8, 13562.50, '2026-07-18', 'pending', NULL),
(9, 5, 1, 16250.00, '2025-12-18', 'pending', NULL),
(10, 5, 2, 16250.00, '2026-01-18', 'pending', NULL),
(11, 5, 3, 16250.00, '2026-02-18', 'pending', NULL),
(12, 5, 4, 16250.00, '2026-03-18', 'pending', NULL),
(13, 5, 5, 16250.00, '2026-04-18', 'pending', NULL),
(14, 5, 6, 16250.00, '2026-05-18', 'pending', NULL),
(15, 5, 7, 16250.00, '2026-06-18', 'pending', NULL),
(16, 5, 8, 16250.00, '2026-07-18', 'pending', NULL),
(17, 5, 9, 16250.00, '2026-08-18', 'pending', NULL),
(18, 5, 10, 16250.00, '2026-09-18', 'pending', NULL),
(19, 5, 11, 16250.00, '2026-10-18', 'pending', NULL),
(20, 5, 12, 16250.00, '2026-11-18', 'pending', NULL),
(21, 6, 1, 9700.00, '2025-12-18', 'pending', NULL),
(22, 6, 2, 9700.00, '2026-01-18', 'pending', NULL),
(23, 6, 3, 9700.00, '2026-02-18', 'pending', NULL),
(24, 6, 4, 9700.00, '2026-03-18', 'pending', NULL),
(25, 6, 5, 9700.00, '2026-04-18', 'pending', NULL),
(26, 6, 6, 9700.00, '2026-05-18', 'pending', NULL),
(27, 6, 7, 9700.00, '2026-06-18', 'pending', NULL),
(28, 6, 8, 9700.00, '2026-07-18', 'pending', NULL),
(29, 6, 9, 9700.00, '2026-08-18', 'pending', NULL),
(30, 6, 10, 9700.00, '2026-09-18', 'pending', NULL),
(31, 8, 1, 22750.00, '2025-12-18', 'pending', NULL),
(32, 8, 2, 22750.00, '2026-01-18', 'pending', NULL),
(33, 8, 3, 22750.00, '2026-02-18', 'pending', NULL),
(34, 8, 4, 22750.00, '2026-03-18', 'pending', NULL),
(35, 8, 5, 22750.00, '2026-04-18', 'pending', NULL),
(36, 8, 6, 22750.00, '2026-05-18', 'pending', NULL),
(37, 10, 1, 27000.00, '2025-12-18', 'pending', NULL),
(38, 10, 2, 27000.00, '2026-01-18', 'pending', NULL),
(39, 10, 3, 27000.00, '2026-02-18', 'pending', NULL),
(40, 10, 4, 27000.00, '2026-03-18', 'pending', NULL),
(41, 10, 5, 27000.00, '2026-04-18', 'pending', NULL),
(42, 10, 6, 27000.00, '2026-05-18', 'pending', NULL),
(43, 10, 7, 27000.00, '2026-06-18', 'pending', NULL),
(44, 10, 8, 27000.00, '2026-07-18', 'pending', NULL),
(45, 10, 9, 27000.00, '2026-08-18', 'pending', NULL),
(46, 10, 10, 27000.00, '2026-09-18', 'pending', NULL),
(47, 10, 11, 27000.00, '2026-10-18', 'pending', NULL),
(48, 10, 12, 27000.00, '2026-11-18', 'pending', NULL),
(49, 11, 1, 18125.00, '2025-12-18', 'pending', NULL),
(50, 11, 2, 18125.00, '2026-01-18', 'pending', NULL),
(51, 11, 3, 18125.00, '2026-02-18', 'pending', NULL),
(52, 11, 4, 18125.00, '2026-03-18', 'pending', NULL),
(53, 11, 5, 18125.00, '2026-04-18', 'pending', NULL),
(54, 11, 6, 18125.00, '2026-05-18', 'pending', NULL),
(55, 11, 7, 18125.00, '2026-06-18', 'pending', NULL),
(56, 11, 8, 18125.00, '2026-07-18', 'pending', NULL),
(57, 12, 1, 21222.22, '2025-12-18', 'pending', NULL),
(58, 12, 2, 21222.22, '2026-01-18', 'pending', NULL),
(59, 12, 3, 21222.22, '2026-02-18', 'pending', NULL),
(60, 12, 4, 21222.22, '2026-03-18', 'pending', NULL),
(61, 12, 5, 21222.22, '2026-04-18', 'pending', NULL),
(62, 12, 6, 21222.22, '2026-05-18', 'pending', NULL),
(63, 12, 7, 21222.22, '2026-06-18', 'pending', NULL),
(64, 12, 8, 21222.22, '2026-07-18', 'pending', NULL),
(65, 12, 9, 21222.22, '2026-08-18', 'pending', NULL),
(66, 13, 1, 9000.00, '2025-12-18', 'pending', NULL),
(67, 13, 2, 9000.00, '2026-01-18', 'pending', NULL),
(68, 13, 3, 9000.00, '2026-02-18', 'pending', NULL),
(69, 13, 4, 9000.00, '2026-03-18', 'pending', NULL),
(70, 13, 5, 9000.00, '2026-04-18', 'pending', NULL),
(71, 13, 6, 9000.00, '2026-05-18', 'pending', NULL),
(72, 13, 7, 9000.00, '2026-06-18', 'pending', NULL),
(73, 13, 8, 9000.00, '2026-07-18', 'pending', NULL),
(74, 13, 9, 9000.00, '2026-08-18', 'pending', NULL),
(75, 13, 10, 9000.00, '2026-09-18', 'pending', NULL),
(76, 13, 11, 9000.00, '2026-10-18', 'pending', NULL),
(77, 13, 12, 9000.00, '2026-11-18', 'pending', NULL),
(78, 15, 1, 13900.00, '2025-12-18', 'pending', NULL),
(79, 15, 2, 13900.00, '2026-01-18', 'pending', NULL),
(80, 15, 3, 13900.00, '2026-02-18', 'pending', NULL),
(81, 15, 4, 13900.00, '2026-03-18', 'pending', NULL),
(82, 15, 5, 13900.00, '2026-04-18', 'pending', NULL),
(83, 15, 6, 13900.00, '2026-05-18', 'pending', NULL),
(84, 15, 7, 13900.00, '2026-06-18', 'pending', NULL),
(85, 15, 8, 13900.00, '2026-07-18', 'pending', NULL),
(86, 15, 9, 13900.00, '2026-08-18', 'pending', NULL),
(87, 15, 10, 13900.00, '2026-09-18', 'pending', NULL),
(88, 16, 1, 3642.86, '2025-12-18', 'pending', NULL),
(89, 16, 2, 3642.86, '2026-01-18', 'pending', NULL),
(90, 16, 3, 3642.86, '2026-02-18', 'pending', NULL),
(91, 16, 4, 3642.86, '2026-03-18', 'pending', NULL),
(92, 16, 5, 3642.86, '2026-04-18', 'pending', NULL),
(93, 16, 6, 3642.86, '2026-05-18', 'pending', NULL),
(94, 16, 7, 3642.86, '2026-06-18', 'pending', NULL),
(95, 17, 1, 6187.50, '2025-12-18', 'pending', NULL),
(96, 17, 2, 6187.50, '2026-01-18', 'pending', NULL),
(97, 17, 3, 6187.50, '2026-02-18', 'pending', NULL),
(98, 17, 4, 6187.50, '2026-03-18', 'pending', NULL),
(99, 17, 5, 6187.50, '2026-04-18', 'pending', NULL),
(100, 17, 6, 6187.50, '2026-05-18', 'pending', NULL),
(101, 17, 7, 6187.50, '2026-06-18', 'pending', NULL),
(102, 17, 8, 6187.50, '2026-07-18', 'pending', NULL),
(103, 18, 1, 8666.67, '2025-12-18', 'pending', NULL),
(104, 18, 2, 8666.67, '2026-01-18', 'pending', NULL),
(105, 18, 3, 8666.67, '2026-02-18', 'pending', NULL),
(106, 18, 4, 8666.67, '2026-03-18', 'pending', NULL),
(107, 18, 5, 8666.67, '2026-04-18', 'pending', NULL),
(108, 18, 6, 8666.67, '2026-05-18', 'pending', NULL),
(109, 18, 7, 8666.67, '2026-06-18', 'pending', NULL),
(110, 18, 8, 8666.67, '2026-07-18', 'pending', NULL),
(111, 18, 9, 8666.67, '2026-08-18', 'pending', NULL),
(112, 26, 1, 8500.00, '2025-12-18', 'pending', NULL),
(113, 26, 2, 8500.00, '2026-01-18', 'pending', NULL),
(114, 26, 3, 8500.00, '2026-02-18', 'pending', NULL),
(115, 29, 1, 8333.33, '2025-12-18', 'pending', NULL),
(116, 29, 2, 8333.33, '2026-01-18', 'pending', NULL),
(117, 29, 3, 8333.33, '2026-02-18', 'pending', NULL),
(118, 29, 4, 8333.33, '2026-03-18', 'pending', NULL),
(119, 29, 5, 8333.33, '2026-04-18', 'pending', NULL),
(120, 29, 6, 8333.33, '2026-05-18', 'pending', NULL),
(121, 30, 1, 18428.57, '2025-12-18', 'pending', NULL),
(122, 30, 2, 18428.57, '2026-01-18', 'pending', NULL),
(123, 30, 3, 18428.57, '2026-02-18', 'pending', NULL),
(124, 30, 4, 18428.57, '2026-03-18', 'pending', NULL),
(125, 30, 5, 18428.57, '2026-04-18', 'pending', NULL),
(126, 30, 6, 18428.57, '2026-05-18', 'pending', NULL),
(127, 30, 7, 18428.57, '2026-06-18', 'pending', NULL),
(128, 32, 1, 4090.91, '2025-12-18', 'pending', NULL),
(129, 32, 2, 4090.91, '2026-01-18', 'pending', NULL),
(130, 32, 3, 4090.91, '2026-02-18', 'pending', NULL),
(131, 32, 4, 4090.91, '2026-03-18', 'pending', NULL),
(132, 32, 5, 4090.91, '2026-04-18', 'pending', NULL),
(133, 32, 6, 4090.91, '2026-05-18', 'pending', NULL),
(134, 32, 7, 4090.91, '2026-06-18', 'pending', NULL),
(135, 32, 8, 4090.91, '2026-07-18', 'pending', NULL),
(136, 32, 9, 4090.91, '2026-08-18', 'pending', NULL),
(137, 32, 10, 4090.91, '2026-09-18', 'pending', NULL),
(138, 32, 11, 4090.91, '2026-10-18', 'pending', NULL),
(139, 33, 1, 16285.71, '2025-12-18', 'pending', NULL),
(140, 33, 2, 16285.71, '2026-01-18', 'pending', NULL),
(141, 33, 3, 16285.71, '2026-02-18', 'pending', NULL),
(142, 33, 4, 16285.71, '2026-03-18', 'pending', NULL),
(143, 33, 5, 16285.71, '2026-04-18', 'pending', NULL),
(144, 33, 6, 16285.71, '2026-05-18', 'pending', NULL),
(145, 33, 7, 16285.71, '2026-06-18', 'pending', NULL),
(146, 36, 1, 16560.00, '2025-12-18', 'pending', NULL),
(147, 36, 2, 16560.00, '2026-01-18', 'pending', NULL),
(148, 36, 3, 16560.00, '2026-02-18', 'pending', NULL),
(149, 36, 4, 16560.00, '2026-03-18', 'pending', NULL),
(150, 36, 5, 16560.00, '2026-04-18', 'pending', NULL),
(151, 40, 1, 15666.67, '2025-12-18', 'pending', NULL),
(152, 40, 2, 15666.67, '2026-01-18', 'pending', NULL),
(153, 40, 3, 15666.67, '2026-02-18', 'pending', NULL),
(154, 40, 4, 15666.67, '2026-03-18', 'pending', NULL),
(155, 40, 5, 15666.67, '2026-04-18', 'pending', NULL),
(156, 40, 6, 15666.67, '2026-05-18', 'pending', NULL),
(157, 40, 7, 15666.67, '2026-06-18', 'pending', NULL),
(158, 40, 8, 15666.67, '2026-07-18', 'pending', NULL),
(159, 40, 9, 15666.67, '2026-08-18', 'pending', NULL),
(160, 44, 1, 11500.00, '2025-12-18', 'pending', NULL),
(161, 44, 2, 11500.00, '2026-01-18', 'pending', NULL),
(162, 45, 1, 3666.67, '2025-12-18', 'pending', NULL),
(163, 45, 2, 3666.67, '2026-01-18', 'pending', NULL),
(164, 45, 3, 3666.67, '2026-02-18', 'pending', NULL),
(165, 45, 4, 3666.67, '2026-03-18', 'pending', NULL),
(166, 45, 5, 3666.67, '2026-04-18', 'pending', NULL),
(167, 45, 6, 3666.67, '2026-05-18', 'pending', NULL),
(168, 47, 1, 3833.33, '2025-12-21', 'pending', NULL),
(169, 47, 2, 3833.33, '2026-01-21', 'pending', NULL),
(170, 47, 3, 3833.33, '2026-02-21', 'pending', NULL),
(171, 47, 4, 3833.33, '2026-03-21', 'pending', NULL),
(172, 47, 5, 3833.33, '2026-04-21', 'pending', NULL),
(173, 47, 6, 3833.33, '2026-05-21', 'pending', NULL),
(174, 48, 1, 3333.33, '2025-12-21', 'pending', NULL),
(175, 48, 2, 3333.33, '2026-01-21', 'pending', NULL),
(176, 48, 3, 3333.33, '2026-02-21', 'pending', NULL),
(177, 48, 4, 3333.33, '2026-03-21', 'pending', NULL),
(178, 48, 5, 3333.33, '2026-04-21', 'pending', NULL),
(179, 48, 6, 3333.33, '2026-05-21', 'pending', NULL),
(180, 49, 1, 1916.67, '2025-12-21', 'pending', NULL),
(181, 49, 2, 1916.67, '2026-01-21', 'pending', NULL),
(182, 49, 3, 1916.67, '2026-02-21', 'pending', NULL),
(183, 49, 4, 1916.67, '2026-03-21', 'pending', NULL),
(184, 49, 5, 1916.67, '2026-04-21', 'pending', NULL),
(185, 49, 6, 1916.67, '2026-05-21', 'pending', NULL),
(186, 50, 1, 2163.64, '2025-12-27', 'pending', NULL),
(187, 50, 2, 2163.64, '2026-01-27', 'pending', NULL),
(188, 50, 3, 2163.64, '2026-02-27', 'pending', NULL),
(189, 50, 4, 2163.64, '2026-03-27', 'pending', NULL),
(190, 50, 5, 2163.64, '2026-04-27', 'pending', NULL),
(191, 50, 6, 2163.64, '2026-05-27', 'pending', NULL),
(192, 50, 7, 2163.64, '2026-06-27', 'pending', NULL),
(193, 50, 8, 2163.64, '2026-07-27', 'pending', NULL),
(194, 50, 9, 2163.64, '2026-08-27', 'pending', NULL),
(195, 50, 10, 2163.64, '2026-09-27', 'pending', NULL),
(196, 50, 11, 2163.64, '2026-10-27', 'pending', NULL);

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
(1, 7, '2025-09-12', 'cancelled', 107000.00, 'cash', 1, 107000.00, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(2, 9, '2025-09-22', 'approved', 134000.00, 'cash', 1, 134000.00, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(3, 11, '2025-09-05', 'waiting_for_delivery', 108500.00, 'installment', 8, 13562.50, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(4, 13, '2025-09-08', 'pending', 36000.00, 'cash', 1, 36000.00, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(5, 15, '2025-09-13', 'completed', 195000.00, 'installment', 12, 16250.00, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(6, 7, '2025-09-06', 'approved', 97000.00, 'installment', 10, 9700.00, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(7, 9, '2025-09-27', 'awaiting_payment', 58000.00, 'cash', 1, 58000.00, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(8, 11, '2025-09-04', 'pending', 136500.00, 'installment', 6, 22750.00, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(9, 13, '2025-09-22', 'approved', 182000.00, 'cash', 1, 182000.00, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(10, 15, '2025-09-11', 'pending', 324000.00, 'installment', 12, 27000.00, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(11, 7, '2025-09-16', 'cancelled_by_customer', 145000.00, 'installment', 8, 18125.00, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(12, 9, '2025-09-02', 'cancelled_by_customer', 191000.00, 'installment', 9, 21222.22, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(13, 11, '2025-09-10', 'awaiting_payment', 108000.00, 'installment', 12, 9000.00, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(14, 13, '2025-09-24', 'waiting_for_delivery', 52000.00, 'cash', 1, 52000.00, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(15, 15, '2025-09-12', 'pending', 139000.00, 'installment', 10, 13900.00, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(16, 7, '2025-09-01', 'completed', 25500.00, 'installment', 7, 3642.86, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(17, 9, '2025-09-27', 'completed', 49500.00, 'installment', 8, 6187.50, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(18, 14, '2025-10-13', 'approved', 78000.00, 'installment', 9, 8666.67, '{\"recipientName\":\"รัตนา\",\"recipientSurname\":\"สวยใส\",\"phone\":\"0889012345\",\"address\":\"258 ถนนสุขุมวิท แขวงบางนา เขตบางนา กรุงเทพฯ 10260\"}'),
(19, 16, '2025-10-01', 'cancelled', 60000.00, 'cash', 1, 60000.00, '{\"recipientName\":\"ปิยะ\",\"recipientSurname\":\"ดีใจ\",\"phone\":\"0901234567\",\"address\":\"741 ถนนสุขุมวิท แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140\"}'),
(20, 8, '2025-10-26', 'cancelled_by_customer', 45000.00, 'cash', 1, 45000.00, '{\"recipientName\":\"วิไล\",\"recipientSurname\":\"สวยงาม\",\"phone\":\"0823456789\",\"address\":\"456 ถนนสุขุมวิท แขวงสีลม เขตบางรัก กรุงเทพฯ 10500\"}'),
(21, 10, '2025-09-30', 'completed', 34000.00, 'cash', 1, 34000.00, '{\"recipientName\":\"มาลี\",\"recipientSurname\":\"ใจดี\",\"phone\":\"0845678901\",\"address\":\"321 ถนนสุขุมวิท แขวงคลองตัน เขตคลองเตย กรุงเทพฯ 10110\"}'),
(22, 12, '2025-10-01', 'awaiting_payment', 38000.00, 'cash', 1, 38000.00, '{\"recipientName\":\"สุภาพ\",\"recipientSurname\":\"น่ารัก\",\"phone\":\"0867890123\",\"address\":\"987 ถนนสุขุมวิท แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพฯ 10310\"}'),
(23, 14, '2025-10-08', 'approved', 104000.00, 'cash', 1, 104000.00, '{\"recipientName\":\"รัตนา\",\"recipientSurname\":\"สวยใส\",\"phone\":\"0889012345\",\"address\":\"258 ถนนสุขุมวิท แขวงบางนา เขตบางนา กรุงเทพฯ 10260\"}'),
(24, 16, '2025-10-02', 'awaiting_payment', 54000.00, 'cash', 1, 54000.00, '{\"recipientName\":\"ปิยะ\",\"recipientSurname\":\"ดีใจ\",\"phone\":\"0901234567\",\"address\":\"741 ถนนสุขุมวิท แขวงบางมด เขตทุ่งครุ กรุงเทพฯ 10140\"}'),
(25, 8, '2025-10-27', 'approved', 56000.00, 'cash', 1, 56000.00, '{\"recipientName\":\"วิไล\",\"recipientSurname\":\"สวยงาม\",\"phone\":\"0823456789\",\"address\":\"456 ถนนสุขุมวิท แขวงสีลม เขตบางรัก กรุงเทพฯ 10500\"}'),
(26, 10, '2025-10-02', 'approved', 25500.00, 'installment', 3, 8500.00, '{\"recipientName\":\"มาลี\",\"recipientSurname\":\"ใจดี\",\"phone\":\"0845678901\",\"address\":\"321 ถนนสุขุมวิท แขวงคลองตัน เขตคลองเตย กรุงเทพฯ 10110\"}'),
(27, 12, '2025-10-06', 'cancelled_by_customer', 116000.00, 'cash', 1, 116000.00, '{\"recipientName\":\"สุภาพ\",\"recipientSurname\":\"น่ารัก\",\"phone\":\"0867890123\",\"address\":\"987 ถนนสุขุมวิท แขวงห้วยขวาง เขตห้วยขวาง กรุงเทพฯ 10310\"}'),
(28, 14, '2025-10-05', 'cancelled', 6500.00, 'cash', 1, 6500.00, '{\"recipientName\":\"รัตนา\",\"recipientSurname\":\"สวยใส\",\"phone\":\"0889012345\",\"address\":\"258 ถนนสุขุมวิท แขวงบางนา เขตบางนา กรุงเทพฯ 10260\"}'),
(29, 15, '2025-11-06', 'approved', 50000.00, 'installment', 6, 8333.33, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(30, 7, '2025-11-14', 'completed', 129000.00, 'installment', 7, 18428.57, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(31, 9, '2025-11-04', 'completed', 162000.00, 'cash', 1, 162000.00, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(32, 11, '2025-11-14', 'cancelled_by_customer', 45000.00, 'installment', 11, 4090.91, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(33, 13, '2025-11-25', 'cancelled_by_customer', 114000.00, 'installment', 7, 16285.71, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(34, 15, '2025-11-22', 'awaiting_payment', 222000.00, 'cash', 1, 222000.00, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(35, 7, '2025-11-27', 'cancelled_by_customer', 48000.00, 'cash', 1, 48000.00, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(36, 9, '2025-11-27', 'awaiting_payment', 82800.00, 'installment', 5, 16560.00, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(37, 11, '2025-11-10', 'cancelled', 126000.00, 'cash', 1, 126000.00, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(38, 13, '2025-11-24', 'completed', 46500.00, 'cash', 1, 46500.00, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(39, 15, '2025-11-09', 'completed', 119700.00, 'cash', 1, 119700.00, '{\"recipientName\":\"ธีรพงษ์\",\"recipientSurname\":\"เก่งกาจ\",\"phone\":\"0890123456\",\"address\":\"369 ถนนสุขุมวิท แขวงพลับพลา เขตวังทองหลาง กรุงเทพฯ 10310\"}'),
(40, 7, '2025-11-26', 'approved', 141000.00, 'installment', 9, 15666.67, '{\"recipientName\":\"ประเสริฐ\",\"recipientSurname\":\"ดีงาม\",\"phone\":\"0812345678\",\"address\":\"123 ถนนสุขุมวิท แขวงลุมพินี เขตปทุมวัน กรุงเทพฯ 10330\"}'),
(41, 9, '2025-11-26', 'waiting_for_delivery', 75000.00, 'cash', 1, 75000.00, '{\"recipientName\":\"สมศักดิ์\",\"recipientSurname\":\"รวยทรัพย์\",\"phone\":\"0834567890\",\"address\":\"789 ถนนสุขุมวิท แขวงทุ่งพญาไท เขตราชเทวี กรุงเทพฯ 10400\"}'),
(42, 11, '2025-11-14', 'cancelled', 78000.00, 'cash', 1, 78000.00, '{\"recipientName\":\"วิทยา\",\"recipientSurname\":\"เก่งมาก\",\"phone\":\"0856789012\",\"address\":\"654 ถนนสุขุมวิท แขวงจตุจักร เขตจตุจักร กรุงเทพฯ 10900\"}'),
(43, 13, '2025-11-13', 'completed', 112000.00, 'cash', 1, 112000.00, '{\"recipientName\":\"ชาญชัย\",\"recipientSurname\":\"ฉลาดมาก\",\"phone\":\"0878901234\",\"address\":\"147 ถนนสุขุมวิท แขวงลาดพร้าว เขตลาดพร้าว กรุงเทพฯ 10230\"}'),
(44, 6, '2025-11-18', 'approved', 23000.00, 'installment', 2, 11500.00, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"1/133\"}'),
(45, 6, '2025-11-18', 'approved', 22000.00, 'installment', 6, 3666.67, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"1/133\"}'),
(46, 6, '2025-11-18', 'approved', 38000.00, 'cash', 1, 38000.00, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"1/133\"}'),
(47, 17, '2025-11-21', 'cancelled_by_customer', 23000.00, 'installment', 6, 3833.33, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/123\"}'),
(48, 17, '2025-11-21', 'approved', 20000.00, 'installment', 6, 3333.33, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/123\"}'),
(49, 17, '2025-11-21', 'pending', 11500.00, 'installment', 6, 1916.67, '{\"recipientName\":\"\",\"recipientSurname\":\"\",\"phone\":\"\",\"address\":\"123/123\"}'),
(50, 17, '2025-11-27', 'pending', 23800.00, 'installment', 11, 2163.64, '{\"recipientName\":\"สมใจ\",\"recipientSurname\":\"ดูดี\",\"phone\":\"0981234567\",\"address\":\"123/45 หมู่ 6 ต.ท่าผา อ.บ้านโป่ง จ.ราชบุรี\"}');

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
(1, 1, 1, 1, 32000.00),
(2, 1, 21, 3, 25000.00),
(3, 2, 15, 1, 29000.00),
(4, 2, 4, 1, 55000.00),
(5, 2, 21, 2, 25000.00),
(6, 3, 32, 2, 7500.00),
(7, 3, 6, 1, 18500.00),
(8, 3, 20, 3, 25000.00),
(9, 4, 26, 3, 12000.00),
(10, 5, 24, 2, 39000.00),
(11, 5, 16, 2, 21000.00),
(12, 5, 41, 3, 25000.00),
(13, 6, 21, 1, 25000.00),
(14, 6, 1, 1, 36000.00),
(15, 6, 26, 3, 12000.00),
(16, 7, 27, 3, 10000.00),
(17, 7, 20, 1, 28000.00),
(18, 8, 42, 3, 25000.00),
(19, 8, 23, 3, 9500.00),
(20, 8, 15, 1, 33000.00),
(21, 9, 15, 2, 29000.00),
(22, 9, 44, 2, 23000.00),
(23, 9, 24, 2, 39000.00),
(24, 10, 2, 3, 45000.00),
(25, 10, 42, 3, 25000.00),
(26, 10, 1, 3, 38000.00),
(27, 11, 44, 3, 23000.00),
(28, 11, 4, 1, 55000.00),
(29, 11, 16, 1, 21000.00),
(30, 12, 31, 2, 13500.00),
(31, 12, 20, 2, 25000.00),
(32, 12, 4, 2, 57000.00),
(33, 13, 15, 3, 36000.00),
(34, 14, 4, 1, 52000.00),
(35, 15, 20, 2, 32000.00),
(36, 15, 20, 3, 25000.00),
(37, 16, 27, 3, 8500.00),
(38, 17, 29, 3, 8500.00),
(39, 17, 31, 2, 12000.00),
(40, 18, 31, 2, 13500.00),
(41, 18, 33, 3, 17000.00),
(42, 19, 4, 1, 60000.00),
(43, 20, 12, 3, 15000.00),
(44, 21, 33, 2, 17000.00),
(45, 22, 1, 1, 38000.00),
(46, 23, 4, 2, 52000.00),
(47, 24, 43, 3, 18000.00),
(48, 25, 3, 2, 28000.00),
(49, 26, 29, 3, 8500.00),
(50, 27, 16, 2, 16000.00),
(51, 27, 41, 3, 28000.00),
(52, 28, 11, 1, 6500.00),
(53, 29, 28, 2, 6500.00),
(54, 29, 6, 2, 18500.00),
(55, 30, 12, 3, 15000.00),
(56, 30, 41, 3, 28000.00),
(57, 31, 2, 2, 45000.00),
(58, 31, 22, 2, 36000.00),
(59, 32, 33, 1, 15000.00),
(60, 32, 3, 1, 30000.00),
(61, 33, 25, 3, 38000.00),
(62, 34, 17, 3, 39000.00),
(63, 34, 1, 3, 35000.00),
(64, 35, 21, 2, 24000.00),
(65, 36, 12, 2, 13500.00),
(66, 36, 16, 2, 18000.00),
(67, 36, 6, 1, 19800.00),
(68, 37, 22, 3, 36000.00),
(69, 37, 16, 1, 18000.00),
(70, 38, 12, 1, 15000.00),
(71, 38, 16, 1, 18000.00),
(72, 38, 26, 1, 13500.00),
(73, 39, 3, 3, 30000.00),
(74, 39, 35, 3, 9900.00),
(75, 40, 33, 2, 13500.00),
(76, 40, 25, 3, 38000.00),
(77, 41, 20, 3, 25000.00),
(78, 42, 24, 2, 39000.00),
(79, 43, 1, 2, 32000.00),
(80, 43, 2, 1, 48000.00),
(81, 44, 44, 1, 23000.00),
(82, 45, 42, 1, 22000.00),
(83, 46, 42, 2, 19000.00),
(84, 47, 44, 1, 23000.00),
(85, 48, 43, 1, 20000.00),
(86, 49, 35, 1, 11500.00),
(87, 50, 44, 1, 23800.00);

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
(1, 'เก้าอี้ CEO หรูหรา', 'เก้าอี้บริหารระดับ CEO ทำจากหนังแท้คุณภาพสูง รองรับสรีระศาสตร์', 35000.00, 10, '[\"/images/โซฟา/532467777_755478177074795_5563060994569645827_n.jpg\",\"/images/โซฟา/532487633_755478313741448_6317967119816904744_n.jpg\",\"/images/โซฟา/532510682_755479190408027_7085474984976072956_n.jpg\",\"/images/โซฟา/532617239_755477537074859_1548190003967310270_n.jpg\"]', '2025-11-06 15:23:52', '2025-11-12 15:01:10', 1, 35000.00, 32000.00, 38000.00, 36000.00, '[\"หนังแท้เกรดพรีเมียม\",\"ปรับระดับได้ 5 จุด\",\"รับประกัน 3 ปี\"]', '[\"เก้าอี้\",\"สำนักงาน\"]'),
(2, 'โต๊ะทำงานไม้สัก', 'โต๊ะทำงานทำจากไม้สักแท้ 100% ผลิตด้วยมือจากช่างฝีมือไทย', 45000.00, 8, '[\"/images/โต๊ะเครื่องแป้ง/470481519_1340007580708887_8348065507718961374_n.jpg\",\"/images/โต๊ะเครื่องแป้ง/500328508_693421413280472_7132169144353674965_n.jpg\"]', '2025-11-06 15:23:52', '2025-11-12 15:01:10', 1, 45000.00, NULL, 48000.00, NULL, '[\"ไม้สักแท้ทั้งแผ่น\",\"เคลือบกันน้ำ\",\"ลิ้นชักซ่อนสายไฟ\"]', '[\"โต๊ะ\",\"งานไม้\"]'),
(3, 'ตู้เสื้อผ้า 5 บาน', 'ตู้เสื้อผ้าสีขาวหน้ารีด 5 บาน พื้นที่เก็บของกว้าง พร้อมกระจกบานใหญ่', 28000.00, 15, '[\"/images/ตู้เสื้อผ้า/470145725_1340007697375542_2153803416669839161_n.jpg\",\"/images/ตู้เสื้อผ้า/470169286_1340008067375505_2650488405659220088_n.jpg\",\"/images/ตู้เสื้อผ้า/470196538_1340007647375547_1448735763485967469_n.jpg\",\"/images/ตู้เสื้อผ้า/532498991_755475737075039_7611176461905116368_n.jpg\"]', '2025-11-06 15:23:52', '2025-11-12 15:15:05', 7, 28000.00, NULL, 30000.00, NULL, '[\"ราวแขวนสแตนเลส 2 ชั้น\",\"ชั้นวางของปรับระดับ\",\"กระจกเต็มบานกลาง\"]', '[\"ตู้เสื้อผ้า\",\"จัดเก็บ\"]'),
(4, 'โซฟาหนังแท้ 3 ที่นั่ง', 'โซฟาหนังสีน้ำตาล 3 ที่นั่ง พื้นที่กว้างขวาง นั่งสบาย', 55000.00, 12, '[\"/images/โซฟา/532467777_755478177074795_5563060994569645827_n.jpg\",\"/images/โซฟา/532487633_755478313741448_6317967119816904744_n.jpg\",\"/images/โซฟา/532510682_755479190408027_7085474984976072956_n.jpg\",\"/images/โซฟา/532617239_755477537074859_1548190003967310270_n.jpg\"]', '2025-11-06 15:23:52', '2025-11-12 15:15:05', 4, 55000.00, 52000.00, 60000.00, 57000.00, '[\"หนังวัวแท้ทั้งใบ\",\"โครงไม้เนื้อแข็ง\",\"รองรับได้สูงสุด 350 กก.\"]', '[\"โซฟา\",\"ห้องนั่งเล่น\"]'),
(6, 'โต๊ะกลางไม้โอ๊ค', 'โต๊ะกลางขนาด 120 ซม. สำหรับห้องนั่งเล่น เคลือบกันรอยขีดข่วน', 0.00, 0, '[\"/images/โต๊ะเครื่องแป้ง/470481519_1340007580708887_8348065507718961374_n.jpg\",\"/images/โต๊ะเครื่องแป้ง/500328508_693421413280472_7132169144353674965_n.jpg\"]', '2025-11-12 14:48:51', '2025-11-12 15:01:10', 2, 18500.00, NULL, 19800.00, NULL, '[\"ไม้โอ๊คแท้\", \"เคลือบกันน้ำ\", \"น้ำหนักเบาเคลื่อนย้ายง่าย\"]', '[\"โต๊ะ\", \"ห้องนั่งเล่น\"]'),
(8, 'ชั้นวางทีวีไม้สีขาว', 'มีประตูกระจก2ข้าง\nลิ้นชัก 3 ตัว', 0.00, 0, '/images/ชั้นวางทีวี/ชั้นวางทีวี000.jpg', '2025-11-12 15:05:21', '2025-11-12 15:37:42', 5, 20000.00, NULL, NULL, NULL, '[]', '[\"ชั้นวางทีวี\"]'),
(11, 'ชั้นวางทีวี 3 ชั้น แบบแขวน', 'ชั้นวางทีวี 3 ชั้น แบบแขวนผนัง ประหยัดพื้นที่ เหมาะสำหรับห้องขนาดเล็ก', 0.00, 0, '[\"/images/ชั้นวางทีวี/ชั้นวางทีวี008.jpg\",\"/images/ชั้นวางทีวี/ชั้นวางทีวี009.jpg\",\"/images/ชั้นวางทีวี/ชั้นวางทีวี010.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 5, 5500.00, 4900.00, 6500.00, 5900.00, '[\"แบบแขวนประหยัดพื้นที่\",\"ติดตั้งง่าย\",\"รองรับน้ำหนักดี\",\"ดีไซน์เรียบง่าย\"]', '[\"ชั้นวางทีวี\"]'),
(12, 'ชั้นวางทีวี 6 ชั้น พร้อมตู้เก็บของ', 'ชั้นวางทีวี 6 ชั้นพร้อมตู้เก็บของด้านล่าง จุของได้เยอะ ใช้งานสะดวก', 0.00, 0, '[\"/images/ชั้นวางทีวี/ชั้นวางทีวี011.jpg\",\"/images/ชั้นวางทีวี/ชั้นวางทีวี012.jpg\",\"/images/ชั้นวางทีวี/ชั้นวางทีวี013.jpg\",\"/images/ชั้นวางทีวี/ชั้นวางทีวี014.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 5, 15000.00, 13500.00, 17000.00, 15500.00, '[\"6 ชั้น + ตู้เก็บของ\",\"จุของได้เยอะ\",\"ดีไซน์สวยงาม\",\"คุณภาพสูง\"]', '[\"ชั้นวางทีวี\"]'),
(15, 'โซฟาหนังแท้ 2+1 ที่นั่ง', 'โซฟาหนังแท้ 2+1 ที่นั่ง พร้อมเก้าอี้แยก ดีไซน์สวยงาม นั่งสบาย', 0.00, 0, '[\"/images/โซฟา/533067303_755479407074672_2108742994701862251_n.jpg\",\"/images/โซฟา/533079728_755479377074675_1309675682671213937_n.jpg\",\"/images/โซฟา/533130431_755477817074831_3319588098584254917_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 4, 32000.00, 29000.00, 36000.00, 33000.00, '[\"ชุดโซฟา 2+1\",\"หนังแท้คุณภาพสูง\",\"นั่งสบาย\",\"ดีไซน์สวยงาม\"]', '[\"โซฟา\"]'),
(16, 'โซฟาไม้สัก 3 ที่นั่ง', 'โซฟาไม้สัก 3 ที่นั่ง พร้อมเบาะนั่งสบาย ดีไซน์คลาสสิก เหมาะสำหรับห้องนั่งเล่น', 0.00, 0, '[\"/images/โซฟา/533289245_755478490408097_8369782019503238314_n.jpg\",\"/images/โซฟา/533484649_755478423741437_571759288273111877_n.jpg\",\"/images/โซฟา/533488065_755477853741494_6307307288933942693_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 4, 18000.00, 16000.00, 21000.00, 19000.00, '[\"ไม้สักแท้\",\"เบาะนั่งสบาย\",\"ดีไซน์คลาสสิก\",\"ทนทาน\"]', '[\"โซฟา\"]'),
(17, 'โซฟาโค้ง 4 ที่นั่ง', 'โซฟาโค้ง 4 ที่นั่ง ดีไซน์โมเดิร์น นั่งสบาย เหมาะสำหรับห้องนั่งเล่นขนาดใหญ่', 0.00, 0, '[\"/images/โซฟา/533742581_755478103741469_2568124521183562965_n.jpg\",\"/images/โซฟา/533948573_755479453741334_358985813184744199_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 4, 35000.00, 32000.00, 39000.00, 36000.00, '[\"โซฟาโค้ง 4 ที่นั่ง\",\"นั่งสบาย\",\"ดีไซน์โมเดิร์น\",\"คุณภาพสูง\"]', '[\"โซฟา\"]'),
(20, 'ตู้เสื้อผ้า 5 บาน ', 'ตู้เสื้อผ้า 5 บาน ทำจาก จุเสื้อผ้าได้เยอะ มีระแนงแขวนผ้า', 0.00, 0, '[\"/images/532606156_755475667075046_8687318870573676900_n.jpg\",\"/images/ตู้เสื้อผ้า/470169286_1340008067375505_2650488405659220088_n.jpg\",\"/images/ตู้เสื้อผ้า/470196538_1340007647375547_1448735763485967469_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 16:09:55', 7, 28000.00, 25000.00, 32000.00, 29000.00, '[\"5 บาน\",\"จุเสื้อผ้าได้เยอะ\",\"มีระแนงแขวนผ้า\"]', '[\"ตู้เสื้อผ้า\"]'),
(21, 'ตู้เสื้อผ้า 4 บาน พร้อมกระจก', 'ตู้เสื้อผ้า 4 บาน พร้อมกระจก ดีไซน์สวยงาม ใช้งานสะดวก', 0.00, 0, '[\"/images/ตู้เสื้อผ้า/532498991_755475737075039_7611176461905116368_n.jpg\",\"/images/ตู้เสื้อผ้า/532606156_755475667075046_8687318870573676900_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 7, 24000.00, 22000.00, 27000.00, 25000.00, '[\"4 บาน\",\"มีกระจก\",\"ดีไซน์สวยงาม\",\"ใช้งานสะดวก\"]', '[\"ตู้เสื้อผ้า\"]'),
(22, 'ตู้เสื้อผ้า 6 บาน แบบสูง', 'ตู้เสื้อผ้า 6 บาน แบบสูง จุเสื้อผ้าได้เยอะมาก เหมาะสำหรับห้องนอนขนาดใหญ่', 0.00, 0, '[\"/images/ตู้เสื้อผ้า/533155572_755475593741720_8556778935977969861_n.jpg\",\"/images/ตู้เสื้อผ้า/533166789_755475697075043_6932633184305003945_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 7, 35000.00, 32000.00, 39000.00, 36000.00, '[\"6 บาน\",\"แบบสูง\",\"จุเสื้อผ้าได้เยอะ\",\"คุณภาพสูง\"]', '[\"ตู้เสื้อผ้า\"]'),
(23, 'โต๊ะเครื่องแป้ง ไม้สัก พร้อมกระจก', 'โต๊ะเครื่องแป้ง ไม้สัก พร้อมกระจก ดีไซน์สวยงาม เหมาะสำหรับห้องนอน', 0.00, 0, '[\"/images/โต๊ะเครื่องแป้ง/470481519_1340007580708887_8348065507718961374_n.jpg\",\"/images/โต๊ะเครื่องแป้ง/500328508_693421413280472_7132169144353674965_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 6, 8500.00, 7500.00, 9500.00, 8500.00, '[\"ไม้สักแท้\",\"มีกระจก\",\"ดีไซน์สวยงาม\",\"ใช้งานสะดวก\"]', '[\"โต๊ะเครื่องแป้ง\"]'),
(24, 'เซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง', 'เซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง ดีไซน์เข้ากัน ไม้สักแท้ คุณภาพสูง', 0.00, 0, '[\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/470137872_1340007660708879_5378345004137986165_n.jpg\",\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/504726616_702210915734855_3721012233829444368_n.jpg\",\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/504807606_702211062401507_7400162802669165228_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 12, 35000.00, 32000.00, 39000.00, 36000.00, '[\"เซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง\",\"ไม้สักแท้\",\"ดีไซน์เข้ากัน\",\"คุณภาพสูง\"]', '[\"ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)\"]'),
(25, 'เซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง พร้อมกระจก', 'เซ็ตตู้เสื้อผ้า + โต๊ะเครื่องแป้ง พร้อมกระจก ดีไซน์สวยงาม ใช้งานสะดวก', 0.00, 0, '[\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/504825672_702211025734844_8385283034607899920_n.jpg\",\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/504952094_702210995734847_3349277752656922426_n.jpg\",\"/images/เซ็ต(ตู้เสื้อผ้า+โต๊ะเครื่องแป้ง)/505054693_702210952401518_2354118781236786181_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 12, 38000.00, 35000.00, 42000.00, 39000.00, '[\"เซ็ตพร้อมกระจก\",\"ดีไซน์สวยงาม\",\"ไม้สักแท้\",\"ใช้งานสะดวก\"]', '[\"ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)\"]'),
(26, 'ตู้โชว์ 3 ชั้น ไม้สัก', 'ตู้โชว์ 3 ชั้น ไม้สัก ดีไซน์สวยงาม เหมาะสำหรับแสดงของตกแต่ง', 0.00, 0, '[\"/images/ตู้โชว์/470176783_1340007544042224_7217264071920822377_n.jpg\",\"/images/ตู้โชว์/470186901_1340008060708839_1116742180263621542_n.jpg\",\"/images/ตู้โชว์/470206321_1340008094042169_3002049694231011769_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 9, 12000.00, 11000.00, 13500.00, 12500.00, '[\"ไม้สักแท้\",\"3 ชั้น\",\"ดีไซน์สวยงาม\",\"เหมาะสำหรับแสดงของตกแต่ง\"]', '[\"ตู้โชว์\"]'),
(27, 'ตู้กับข้าว ไม้สัก 4 ชั้น', 'ตู้กับข้าว ไม้สัก 4 ชั้น จุของได้เยอะ ใช้งานสะดวก เหมาะสำหรับห้องครัว', 0.00, 0, '/images/ตู้กับข้าว/470241173_1340007680708877_7248500554360607986_n.jpg', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 11, 9500.00, 8500.00, 11000.00, 10000.00, '[\"ไม้สักแท้\",\"4 ชั้น\",\"จุของได้เยอะ\",\"ใช้งานสะดวก\"]', '[\"ตู้กับข้าว\"]'),
(28, 'หิ้งพระ ไม้สัก 3 ชั้น', 'หิ้งพระ ไม้สัก 3 ชั้น ดีไซน์สวยงาม เหมาะสำหรับตั้งพระในบ้าน', 0.00, 0, '[\"/images/หิ้งพระ/504679672_702210455734901_1807811510338530256_n.jpg\",\"/images/หิ้งพระ/504796264_702210369068243_7935261268138154552_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 10, 6500.00, 5900.00, 7500.00, 6900.00, '[\"ไม้สักแท้\",\"3 ชั้น\",\"ดีไซน์สวยงาม\",\"เหมาะสำหรับตั้งพระ\"]', '[\"หิ้งพระ\"]'),
(29, 'หิ้งพระ ไม้สัก 5 ชั้น', 'หิ้งพระ ไม้สัก 5 ชั้น ดีไซน์สวยงาม จุพระได้เยอะ', 0.00, 0, '[\"/images/หิ้งพระ/504960712_702210419068238_3339692166990212473_n.jpg\",\"/images/หิ้งพระ/505092126_702210325734914_5625310244093492026_n.jpg\",\"/images/หิ้งพระ/511321754_713674661255147_8252590881737923476_n.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 10, 8500.00, 7500.00, 9500.00, 8500.00, '[\"ไม้สักแท้\",\"5 ชั้น\",\"จุพระได้เยอะ\",\"ดีไซน์สวยงาม\"]', '[\"หิ้งพระ\"]'),
(30, 'ฟูกนอน 6 ฟุต ฟองน้ำ', 'ฟูกนอน 6 ฟุต ทำจากฟองน้ำคุณภาพสูง นอนสบาย รองรับสรีระ', 0.00, 0, '[\"/images/ฟูกนอน/0c148028-b9d6-4ff2-a7ce-3b590876ac39.jpg\",\"/images/ฟูกนอน/144823fc-4844-4ccf-8c70-e5deb8280d11.jpg\",\"/images/ฟูกนอน/18b38104-f4cc-4008-8c11-732c248e79bb.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 8500.00, 7500.00, 9500.00, 8500.00, '[\"ฟองน้ำคุณภาพสูง\",\"ขนาด 6 ฟุต\",\"นอนสบาย\",\"รองรับสรีระ\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(31, 'ฟูกนอน 6 ฟุต สปริง', 'ฟูกนอน 6 ฟุต สปริงคุณภาพสูง นอนสบาย ทนทาน', 0.00, 0, '[\"/images/ฟูกนอน/199286ff-f155-4613-8c8e-439f8f409def.jpg\",\"/images/ฟูกนอน/1a4e6cd2-f34d-4acb-9191-34ce13b6e800.jpg\",\"/images/ฟูกนอน/2cde5ab1-ecc6-4f9c-83e7-f7f4d27aff16.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 12000.00, 11000.00, 13500.00, 12500.00, '[\"สปริงคุณภาพสูง\",\"ขนาด 6 ฟุต\",\"นอนสบาย\",\"ทนทาน\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(32, 'ฟูกนอน 5 ฟุต ฟองน้ำ', 'ฟูกนอน 5 ฟุต ทำจากฟองน้ำคุณภาพสูง เหมาะสำหรับห้องนอนขนาดเล็ก', 0.00, 0, '[\"/images/ฟูกนอน/6038b850-789e-49c7-b43a-0096c7165445.jpg\",\"/images/ฟูกนอน/6de46d7f-6b6c-49e9-888a-04b28bec4737.jpg\",\"/images/ฟูกนอน/785be53e-3b5a-45f0-8774-7a5e5b8e5285.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 6500.00, 5900.00, 7500.00, 6900.00, '[\"ฟองน้ำคุณภาพสูง\",\"ขนาด 5 ฟุต\",\"นอนสบาย\",\"เหมาะสำหรับห้องนอนขนาดเล็ก\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(33, 'ฟูกนอน King Size ฟองน้ำ', 'ฟูกนอน King Size ทำจากฟองน้ำคุณภาพสูง นอนสบาย เหมาะสำหรับคู่รัก', 0.00, 0, '[\"/images/ฟูกนอน/7c3cbea2-aab9-4cfb-8a6a-f69a1596e484.jpg\",\"/images/ฟูกนอน/91a2a52f-a9b8-4e13-89b8-137694cdc983.jpg\",\"/images/ฟูกนอน/a4816de7-5f46-4f30-b21e-446eb5cfa0b3.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 15000.00, 13500.00, 17000.00, 15500.00, '[\"ฟองน้ำคุณภาพสูง\",\"ขนาด King Size\",\"นอนสบาย\",\"เหมาะสำหรับคู่รัก\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(34, 'ฟูกนอน Queen Size สปริง', 'ฟูกนอน Queen Size สปริงคุณภาพสูง นอนสบาย ทนทาน', 0.00, 0, '[\"/images/ฟูกนอน/aed64240-b80f-4d58-828e-50c8e336f629.jpg\",\"/images/ฟูกนอน/b199cca3-e143-400e-9e6a-cee72450bbf9.jpg\",\"/images/ฟูกนอน/bbe0f2fb-d338-4408-825c-23fb47743f5a.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 13000.00, 12000.00, 14500.00, 13500.00, '[\"สปริงคุณภาพสูง\",\"ขนาด Queen Size\",\"นอนสบาย\",\"ทนทาน\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(35, 'ฟูกนอน 6 ฟุต ฟองน้ำพิเศษ', 'ฟูกนอน 6 ฟุต ฟองน้ำพิเศษ นอนสบาย รองรับสรีระดีเยี่ยม', 0.00, 0, '[\"/images/ฟูกนอน/d7f697d4-500a-408e-957f-d5680b453c77.jpg\",\"/images/ฟูกนอน/dc67c33a-e29a-4e04-ac56-1ea6db19de10.jpg\",\"/images/ฟูกนอน/f721de74-4da9-4081-a7ba-cf2c1ad60cda.jpg\"]', '2025-11-12 15:14:09', '2025-11-12 15:15:05', 8, 11000.00, 9900.00, 12500.00, 11500.00, '[\"ฟองน้ำพิเศษ\",\"ขนาด 6 ฟุต\",\"นอนสบาย\",\"รองรับสรีระดีเยี่ยม\"]', '[\"ฟูกนอน/ที่นอน\"]'),
(41, 'เตียงนอน 6 ฟุตสีไม้', 'เตียงนอนขนาด 6 ฟุต ทำจากไม้สักแท้คุณภาพสูง ดีไซน์โมเดิร์น เรียบหรู ทนทาน แข็งแรง พร้อมหัวเตียงสวยงาม เหมาะสำหรับห้องนอนทุกสไตล์', 0.00, 0, '[\"/images/เตียงนอน/537909707_764179556204657_8884610700763867807_n.jpg\",\"/images/เตียงนอน/537909707_764179556204657_8884610700763867807_n.jpg\",\"/images/เตียงนอน/537909707_764179556204657_8884610700763867807_n.jpg\",\"/images/เตียงนอน/537909707_764179556204657_8884610700763867807_n.jpg\"]', '2025-11-12 16:02:56', '2025-11-12 16:07:25', 3, 25000.00, 22000.00, 28000.00, 25000.00, '[\"ไม้สักแท้คุณภาพสูง\",\"ขนาด 6 ฟุต\",\"ดีไซน์โมเดิร์นเรียบหรู\",\"หัวเตียงสวยงาม\",\"แข็งแรงทนทาน\"]', '[\"เตียงนอน\"]'),
(42, 'เตียงนอน 5 ฟุต', 'เตียงนอนขนาด 5 ฟุต ทำจากไม้โอ๊คคุณภาพสูง ดีไซน์คลาสสิก สวยงาม ใช้งานสะดวก แข็งแรง ทนทาน เหมาะสำหรับห้องนอนขนาดเล็ก', 0.00, 0, '[\"/images/เตียงนอน/538061180_764179446204668_2337783818620409913_n.jpg\",\"/images/เตียงนอน/538061180_764179446204668_2337783818620409913_n.jpg\",\"/images/เตียงนอน/538061180_764179446204668_2337783818620409913_n.jpg\",\"/images/เตียงนอน/538061180_764179446204668_2337783818620409913_n.jpg\"]', '2025-11-12 16:02:56', '2025-11-12 16:07:12', 3, 22000.00, 19000.00, 25000.00, 22000.00, '[\"ไม้โอ๊คคุณภาพสูง\",\"ขนาด 5 ฟุต\",\"ดีไซน์คลาสสิก\",\"ใช้งานสะดวก\",\"เหมาะสำหรับห้องนอนขนาดเล็ก\"]', '[\"เตียงนอน\"]'),
(43, 'เตียงนอน 6 ฟุต ', 'เตียงนอนขนาด 6 ฟุต แบบไม่มีหัวเตียง ทำจากไม้คุณภาพสูง ดีไซน์เรียบง่าย สะอาดตา ใช้งานสะดวก เหมาะสำหรับห้องนอนสไตล์มินิมอล', 0.00, 0, '[\"/images/เตียงนอน/538293666_764178386204774_8874850852933323502_n.jpg\",\"/images/เตียงนอน/538293666_764178386204774_8874850852933323502_n.jpg\",\"/images/เตียงนอน/538293666_764178386204774_8874850852933323502_n.jpg\",\"/images/เตียงนอน/538293666_764178386204774_8874850852933323502_n.jpg\"]', '2025-11-12 16:02:56', '2025-11-12 16:07:04', 3, 18000.00, NULL, 20000.00, NULL, '[\"ไม้คุณภาพสูง\",\"ขนาด 6 ฟุต\",\"ดีไซน์เรียบง่าย\",\"เหมาะสำหรับห้องนอนสไตล์มินิมอล\",\"ราคาประหยัด\"]', '[\"เตียงนอน\"]'),
(44, 'เตียงนอน 5 ฟุต แบบมีหัวเตียง', 'เตียงนอนขนาด 5 ฟุต แบบมีหัวเตียง ทำจากไม้สักแท้ หัวเตียงสวยงาม ดีไซน์โมเดิร์น ใช้งานสะดวก แข็งแรง ทนทาน เหมาะสำหรับห้องนอนทุกสไตล์', 0.00, 0, '[\"/images/เตียงนอน/539413130_764179352871344_1449733920269793689_n.jpg\",\"/images/เตียงนอน/539413130_764179352871344_1449733920269793689_n.jpg\",\"/images/เตียงนอน/539413130_764179352871344_1449733920269793689_n.jpg\",\"/images/เตียงนอน/539413130_764179352871344_1449733920269793689_n.jpg\"]', '2025-11-12 16:02:56', '2025-11-12 16:06:26', 3, 23000.00, 20000.00, 26000.00, 23000.00, '[\"ไม้สักแท้\",\"ขนาด 5 ฟุต\",\"หัวเตียงสวยงาม\",\"ดีไซน์โมเดิร์น\",\"แข็งแรงทนทาน\"]', '[\"เตียงนอน\"]');

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
(1, 'สำนักงาน'),
(1, 'เก้าอี้'),
(2, 'งานไม้'),
(2, 'โต๊ะ'),
(3, 'จัดเก็บ'),
(3, 'ตู้เสื้อผ้า'),
(4, 'ห้องนั่งเล่น'),
(4, 'โซฟา'),
(6, 'ห้องนั่งเล่น'),
(6, 'โต๊ะ'),
(8, 'ชั้นวางทีวี'),
(11, 'ชั้นวางทีวี'),
(12, 'ชั้นวางทีวี'),
(15, 'โซฟา'),
(16, 'โซฟา'),
(17, 'โซฟา'),
(20, 'ตู้เสื้อผ้า'),
(21, 'ตู้เสื้อผ้า'),
(22, 'ตู้เสื้อผ้า'),
(23, 'โต๊ะเครื่องแป้ง'),
(24, 'ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)'),
(25, 'ตู้เสื้อผ้า + โต๊ะเครื่องแป้ง (เซ็ต)'),
(26, 'ตู้โชว์'),
(27, 'ตู้กับข้าว'),
(28, 'หิ้งพระ'),
(29, 'หิ้งพระ'),
(30, 'ฟูกนอน/ที่นอน'),
(31, 'ฟูกนอน/ที่นอน'),
(32, 'ฟูกนอน/ที่นอน'),
(33, 'ฟูกนอน/ที่นอน'),
(34, 'ฟูกนอน/ที่นอน'),
(35, 'ฟูกนอน/ที่นอน'),
(41, 'เตียงนอน'),
(42, 'เตียงนอน'),
(43, 'เตียงนอน'),
(44, 'เตียงนอน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

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
