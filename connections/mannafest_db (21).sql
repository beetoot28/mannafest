-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2023 at 08:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mannafest_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `user_type` varchar(40) NOT NULL,
  `vcode` varchar(40) DEFAULT NULL,
  `date_registered` date NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `birthdate` date NOT NULL,
  `address` text NOT NULL,
  `postal` int(11) DEFAULT NULL,
  `d_address` text NOT NULL,
  `cardname` text NOT NULL,
  `cardnumber` text NOT NULL,
  `cvv` int(11) NOT NULL,
  `ipaddress` text NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`user_id`, `name`, `lastname`, `email`, `user_type`, `vcode`, `date_registered`, `password`, `mobile_number`, `photo`, `birthdate`, `address`, `postal`, `d_address`, `cardname`, `cardnumber`, `cvv`, `ipaddress`, `status`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', 'admin', NULL, '2022-01-31', 'eldwUUFNbnlSUWZEYjVrUjhrTmRBUT09', NULL, NULL, '0000-00-00', '', NULL, '', '', '', 0, '', '1'),
(24, 'Courier', 'Number 1', 'courier@mail.com', 'courier', NULL, '2022-10-06', 'eldwUUFNbnlSUWZEYjVrUjhrTmRBUT09', '0935223232', '', '0000-00-00', '', NULL, '', '', '', 0, '', NULL),
(56, 'Test', 'Abby', 'abby@gmail.com', 'client', NULL, '2022-12-13', 'SW5GcnNoSWlEUVpnQ0VmTGlOTE50QT09', '+639352232051', NULL, '2022-12-13', 'Southcom Village', NULL, 'Southcom Village', '', '', 0, '::1', '1'),
(59, 'Walk-in', 'Customer', 'walkin@walkin.com', 'walkin', NULL, '2023-01-05', 'N25RNHZNWkNINExELzMyeTJDMGIyQT09', '123', '', '0000-00-00', '', NULL, '', '', '', 0, '', NULL),
(60, 'Distributor', 'Distributor', 'distributor@distributor.com', 'client', NULL, '2023-01-10', 'Distributor', NULL, '', '0000-00-00', '', NULL, '', '', '', 0, '', NULL),
(61, 'Distributor', 'Distributor', 'abbyquintos@gmail.com', 'client', NULL, '2023-01-13', 'eEl6bTBVd3hWOUJZMXUxSHlRdE1VQT09', '09352232051', NULL, '0000-00-00', '', NULL, '', '', '', 0, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_ship_address`
--

CREATE TABLE `account_ship_address` (
  `ship_id` int(11) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_ship_address`
--

INSERT INTO `account_ship_address` (`ship_id`, `contact_name`, `phone_number`, `address`, `postal_code`, `user_id`, `status`, `address_1`, `address_2`) VALUES
(22, 'Test Abby', '09456517431', 'Southcom Village', '7000', 56, 0, NULL, NULL),
(30, 'Distributor Test', '3433333', 'Brgy. Maganda, 777, Zamboanga del Sur', '7302', 56, 1, 'Brgy. Maganda', '777');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `itemprice` float NOT NULL,
  `total` float NOT NULL,
  `user_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `datecreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `category_name`, `datecreated`) VALUES
(1, 'Bread', '2023-01-12 21:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `chat_acc`
--

CREATE TABLE `chat_acc` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('Guest','Operator') NOT NULL,
  `secret` varchar(255) NOT NULL DEFAULT '',
  `last_seen` datetime NOT NULL,
  `status` enum('Occupied','Waiting','Idle') NOT NULL DEFAULT 'Idle'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `account_sender_id` int(11) NOT NULL,
  `account_receiver_id` int(11) NOT NULL,
  `submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `courier_trans`
--

CREATE TABLE `courier_trans` (
  `courier_trans_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `total_remit` varchar(255) DEFAULT NULL,
  `total_cash_onhand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courier_trans`
--

INSERT INTO `courier_trans` (`courier_trans_id`, `user_id`, `date`, `total_amount`, `total_remit`, `total_cash_onhand`) VALUES
(1, 24, '2023-01-12', '25', '0', '25'),
(2, 24, '2023-01-13', '100', '0', '100');

-- --------------------------------------------------------

--
-- Table structure for table `distributor_details`
--

CREATE TABLE `distributor_details` (
  `dis_id` int(11) NOT NULL,
  `distributor_name` varchar(255) NOT NULL,
  `distributor_contact` varchar(255) DEFAULT NULL,
  `distributor_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `submit_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `otp-sms`
--

CREATE TABLE `otp-sms` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reset_token` varchar(255) NOT NULL,
  `is_valid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `p_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`p_id`, `prod_id`, `photo`) VALUES
(2, 2, '284238989_3174659762819240_2901586592051694305_n.jpg'),
(3, 3, 'HONDA-BEAT-110-STREET-STD-1-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `stockAlert` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `barcode`, `name`, `description`, `cat_id`, `cost`, `price`, `datecreated`, `ingredients`, `stockAlert`) VALUES
(2, '2111160017', 'Distributor Distributor', '', 1, 20, 25, '2023-01-12 22:51:52', ',', NULL),
(3, '4324512', 'Burger Buns', '', 1, 20, 25, '2023-01-14 00:42:16', ',', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `production_log`
--

CREATE TABLE `production_log` (
  `log_id` int(11) NOT NULL,
  `production_code` varchar(255) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `qty_added` int(11) DEFAULT NULL,
  `qty_remaining` int(11) DEFAULT NULL,
  `prod_date` varchar(255) DEFAULT NULL,
  `exp_date` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `production_log`
--

INSERT INTO `production_log` (`log_id`, `production_code`, `prod_id`, `qty_added`, `qty_remaining`, `prod_date`, `exp_date`, `price`, `cost`, `status`) VALUES
(2, 'P2023001', 2, 1000, 998, '2023-01-12', '2023-01-13', NULL, NULL, 'EXPIRED'),
(3, 'P2023002', 2, 500, 498, '2023-01-14', '2023-01-15', NULL, NULL, 'ACTIVE'),
(4, 'P2023003', 3, 1000, 999, '2023-01-14', '2023-01-21', NULL, NULL, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `product_quantity`
--

CREATE TABLE `product_quantity` (
  `prod_qty_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `promo_id` int(11) NOT NULL,
  `code` text NOT NULL,
  `minvalue_toavail` float NOT NULL,
  `discount` float NOT NULL,
  `datecreated` datetime NOT NULL,
  `expiration-date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `returnrequest`
--

CREATE TABLE `returnrequest` (
  `return_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `return_request`
--

CREATE TABLE `return_request` (
  `return_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `selected_prod` varchar(255) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `proof_img` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_ordered` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `reason_select` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `return_request`
--

INSERT INTO `return_request` (`return_id`, `user_id`, `selected_prod`, `transaction_id`, `proof_img`, `reason`, `remarks`, `decision`, `status`, `date_ordered`, `payment_type`, `reason_select`) VALUES
(2, 56, '2,3', 4, 'HONDA-BEAT-110-STREET-STD-1-removebg-preview.png', 'asdasdsa', NULL, NULL, 'Pending', 'Date Test', 'COD', '');

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `review_id` int(11) NOT NULL,
  `user_rating` int(1) NOT NULL,
  `user_review` text NOT NULL,
  `datetime` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `autoReceived` int(11) DEFAULT NULL,
  `minTotalOrder` int(11) DEFAULT NULL,
  `minMaxOrder` int(11) DEFAULT NULL,
  `deliveryMessage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tempuser`
--

CREATE TABLE `tempuser` (
  `temp_id` int(11) NOT NULL,
  `ipaddress` text NOT NULL,
  `datecreated` datetime NOT NULL,
  `lastname` text NOT NULL,
  `firstname` text NOT NULL,
  `birthdate` date NOT NULL,
  `address` text NOT NULL,
  `deliveryaddr` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `postal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempuser`
--

INSERT INTO `tempuser` (`temp_id`, `ipaddress`, `datecreated`, `lastname`, `firstname`, `birthdate`, `address`, `deliveryaddr`, `email`, `password`, `mobile_number`, `postal`) VALUES
(1, '::1', '2023-01-12 21:10:17', '', '', '0000-00-00', '', '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_log`
--

CREATE TABLE `traffic_log` (
  `traffic_id` int(11) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `traffic_log`
--

INSERT INTO `traffic_log` (`traffic_id`, `device_type`, `date`) VALUES
(1, 'computer', '2023-01-12 14:11:46'),
(2, 'computer', '2023-01-12 14:22:58'),
(3, 'computer', '2023-01-12 15:28:54'),
(4, 'computer', '2023-01-12 15:51:57'),
(5, 'computer', '2023-01-12 15:52:28'),
(6, 'computer', '2023-01-12 16:28:07'),
(7, 'computer', '2023-01-12 16:29:00'),
(8, 'computer', '2023-01-12 16:29:30'),
(9, 'computer', '2023-01-12 16:30:18'),
(10, 'computer', '2023-01-12 16:30:42'),
(11, 'computer', '2023-01-12 17:22:03'),
(12, 'computer', '2023-01-12 17:22:12'),
(13, 'computer', '2023-01-12 18:01:40'),
(14, 'computer', '2023-01-12 19:28:28'),
(15, 'computer', '2023-01-12 19:32:06'),
(16, 'computer', '2023-01-13 14:16:53'),
(17, 'computer', '2023-01-13 14:23:26'),
(18, 'computer', '2023-01-13 14:34:39'),
(19, 'computer', '2023-01-13 14:36:44'),
(20, 'computer', '2023-01-13 15:39:33'),
(21, 'computer', '2023-01-13 15:47:32'),
(22, 'computer', '2023-01-13 15:56:48'),
(23, 'computer', '2023-01-13 16:32:53'),
(24, 'computer', '2023-01-13 16:34:16'),
(25, 'computer', '2023-01-13 16:51:20'),
(26, 'computer', '2023-01-13 16:51:39'),
(27, 'computer', '2023-01-13 17:40:47'),
(28, 'computer', '2023-01-13 17:41:29'),
(29, 'computer', '2023-01-13 17:41:51'),
(30, 'computer', '2023-01-13 17:42:18'),
(31, 'computer', '2023-01-13 17:42:33'),
(32, 'computer', '2023-01-13 17:43:19'),
(33, 'computer', '2023-01-13 17:45:16'),
(34, 'computer', '2023-01-13 17:45:40'),
(35, 'computer', '2023-01-13 17:46:22'),
(36, 'computer', '2023-01-13 17:46:29'),
(37, 'computer', '2023-01-13 17:50:19'),
(38, 'computer', '2023-01-13 18:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paymentmethod` text NOT NULL,
  `datecreated` datetime NOT NULL,
  `photo_proof` text DEFAULT NULL,
  `status` text NOT NULL,
  `ship_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `prod_log_id` int(11) DEFAULT NULL,
  `dis_id` int(11) DEFAULT NULL,
  `delivery_rider` varchar(255) DEFAULT NULL,
  `delivery_rider_id` int(11) DEFAULT NULL,
  `trans_changes` int(11) DEFAULT NULL,
  `trans_pay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tid`, `user_id`, `paymentmethod`, `datecreated`, `photo_proof`, `status`, `ship_id`, `type`, `prod_log_id`, `dis_id`, `delivery_rider`, `delivery_rider_id`, `trans_changes`, `trans_pay`) VALUES
(3, 56, 'cod', '2023-01-13 21:23:18', 'png-clipart-congratulations-illustration-prize-award-united-states-award-wish-text-removebg-preview.png', 'completed', NULL, 'online', 3, NULL, '24,Courier Number 1 | Contact : 0935223232', 24, NULL, NULL),
(4, 56, 'cod', '2023-01-14 00:44:57', '6055.png_300.png', 'delivered', NULL, 'online', 4, NULL, '24,Courier Number 1 | Contact : 0935223232', 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_record`
--

CREATE TABLE `trans_record` (
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `disc` double DEFAULT NULL,
  `dfee` double DEFAULT NULL,
  `date_ordered` date NOT NULL,
  `total` float NOT NULL,
  `pm` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trans_record`
--

INSERT INTO `trans_record` (`order_id`, `prod_id`, `transaction_id`, `quantity`, `price`, `disc`, `dfee`, `date_ordered`, `total`, `pm`, `user_id`) VALUES
(4, 2, 3, 1, 25, 0, 100, '2023-01-13', 25, 'pending', 56),
(5, 2, 4, 2, 25, 0, 100, '2023-01-14', 50, 'pending', 56),
(6, 3, 4, 1, 25, 0, 100, '2023-01-14', 25, 'pending', 56);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wish_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `user_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `account_ship_address`
--
ALTER TABLE `account_ship_address`
  ADD PRIMARY KEY (`ship_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `chat_acc`
--
ALTER TABLE `chat_acc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courier_trans`
--
ALTER TABLE `courier_trans`
  ADD PRIMARY KEY (`courier_trans_id`);

--
-- Indexes for table `distributor_details`
--
ALTER TABLE `distributor_details`
  ADD PRIMARY KEY (`dis_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp-sms`
--
ALTER TABLE `otp-sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `production_log`
--
ALTER TABLE `production_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `product_quantity`
--
ALTER TABLE `product_quantity`
  ADD PRIMARY KEY (`prod_qty_id`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `return_request`
--
ALTER TABLE `return_request`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempuser`
--
ALTER TABLE `tempuser`
  ADD PRIMARY KEY (`temp_id`);

--
-- Indexes for table `traffic_log`
--
ALTER TABLE `traffic_log`
  ADD PRIMARY KEY (`traffic_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `trans_record`
--
ALTER TABLE `trans_record`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wish_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `account_ship_address`
--
ALTER TABLE `account_ship_address`
  MODIFY `ship_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_acc`
--
ALTER TABLE `chat_acc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courier_trans`
--
ALTER TABLE `courier_trans`
  MODIFY `courier_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `distributor_details`
--
ALTER TABLE `distributor_details`
  MODIFY `dis_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp-sms`
--
ALTER TABLE `otp-sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `production_log`
--
ALTER TABLE `production_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_quantity`
--
ALTER TABLE `product_quantity`
  MODIFY `prod_qty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_request`
--
ALTER TABLE `return_request`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tempuser`
--
ALTER TABLE `tempuser`
  MODIFY `temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `traffic_log`
--
ALTER TABLE `traffic_log`
  MODIFY `traffic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trans_record`
--
ALTER TABLE `trans_record`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trans_record`
--
ALTER TABLE `trans_record`
  ADD CONSTRAINT `trans_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_record_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
