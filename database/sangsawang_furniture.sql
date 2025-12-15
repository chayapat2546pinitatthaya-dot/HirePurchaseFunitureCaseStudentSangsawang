-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2025 at 09:11 PM
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
(1, 52, 1, 1480.00, '2026-01-15', 'pending', NULL),
(2, 52, 2, 1480.00, '2026-02-15', 'pending', NULL),
(3, 52, 3, 1480.00, '2026-03-15', 'pending', NULL),
(4, 53, 1, 1580.00, '2026-01-15', 'pending', NULL),
(5, 53, 2, 1580.00, '2026-02-15', 'pending', NULL),
(6, 53, 3, 1580.00, '2026-03-15', 'pending', NULL),
(7, 53, 4, 1580.00, '2026-04-15', 'pending', NULL),
(8, 53, 5, 1580.00, '2026-05-15', 'pending', NULL),
(9, 53, 6, 1562.00, '2026-06-15', 'pending', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`installment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_payment_due_date` (`payment_due_date`),
  ADD KEY `idx_payment_status` (`payment_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD CONSTRAINT `installment_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
