-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 18, 2022 at 12:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Coffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `max_table` int(11) DEFAULT 1,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `name`, `max_table`, `status`) VALUES
(3, 'Tầng 1', 25, 0),
(4, 'Tầng 2', 30, 0),
(5, 'Tầng 3', 40, 0),
(6, 'Khu Vực A', 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date_order` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `reason` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `date_order`, `id_user`, `reason`, `total_price`, `status`) VALUES
(1, '2022-06-14 05:47:51', 1, NULL, '10000', 1),
(2, '2022-06-14 07:42:27', 1, NULL, '110000', 1),
(4, '2022-06-14 13:44:45', 1, NULL, '11000', 1),
(5, '2022-06-14 13:48:03', 1, NULL, '1000', 1),
(6, '2022-06-14 13:51:51', 1, NULL, '15000', 1),
(7, '2022-06-14 14:42:02', 1, NULL, '500000', 1),
(8, '2022-06-14 14:42:26', 1, NULL, '15000', 1),
(9, '2022-06-14 15:24:25', 1, NULL, '500000', 1),
(10, '2022-06-14 15:49:42', 1, NULL, '15000', 1),
(11, '2022-06-14 15:52:45', 1, 'ngu', NULL, 2),
(12, '2022-06-14 16:07:09', 1, NULL, '15000', 1),
(13, '2022-06-15 17:07:37', 1, 'Khách đổi lý', NULL, 2),
(14, '2022-06-15 17:18:14', 1, NULL, '15000', 1),
(15, '2022-06-15 17:48:05', 1, NULL, '37300', 1),
(24, '2022-06-15 22:34:07', 1, NULL, '520000', 1),
(25, '2022-06-15 22:43:11', 1, NULL, '22300', 1),
(26, '2022-06-16 00:03:18', 1, 'Chuyển từ  Tầng 1  Bàn :1Đến Khu Vực A  Bàn: 2', '15000', 1),
(29, '2022-06-16 00:25:54', 1, NULL, '1020000', 1),
(30, '2022-06-16 00:30:56', 1, NULL, '52300', 1),
(31, '2022-06-16 13:30:35', 1, 'Chuyển từ  Tầng 1  Bàn :1Đến Tầng 1  Bàn: 2', '22300', 1),
(32, '2022-06-16 13:32:25', 8, NULL, '22300', 1),
(33, '2022-06-16 13:41:16', 8, 'Khách đổi lý', NULL, 2),
(34, '2022-06-16 13:45:01', 8, 'Khách đổi lý', NULL, 2),
(35, '2022-06-16 13:47:46', 8, 'Chuyển từ  Tầng 1  Bàn :3Đến Tầng 1  Bàn: 4', '30000', 1),
(36, '2022-06-16 14:21:32', 1, NULL, '15000', 1),
(37, '2022-06-16 14:24:38', 1, 'Chuyển từ  Tầng 1  Bàn :1Đến Tầng 1  Bàn: 2', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_water` int(11) DEFAULT NULL,
  `id_table` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `note` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `reason` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_order`, `id_water`, `id_table`, `quantity`, `note`, `reason`, `status`) VALUES
(1, 1, 23, 12, 1, NULL, NULL, 0),
(2, 1, 26, 12, 1, NULL, NULL, 0),
(3, 2, 23, 13, 1, NULL, NULL, 0),
(5, 4, 27, 15, 2, NULL, NULL, 0),
(6, 5, 28, 14, 1, NULL, NULL, 0),
(7, 6, 23, 12, 1, NULL, NULL, 0),
(8, 7, 24, 13, 2, NULL, NULL, 0),
(9, 8, 23, 14, 2, NULL, NULL, 0),
(10, 9, 24, 14, 2, NULL, NULL, 0),
(11, 10, 23, 12, 2, NULL, NULL, 0),
(12, 11, 29, 11, 1, NULL, NULL, 0),
(13, 12, 23, 12, 3, NULL, NULL, 0),
(14, 13, 23, 15, 2, NULL, NULL, 0),
(29, 24, 25, 13, 1, 'Trần Văn Thành Time update: 15-06-2022 10:34:07 PM', NULL, 0),
(30, 24, 29, 13, 1, 'Trần Văn Thành Time update: 15-06-2022 10:34:07 PM', NULL, 0),
(31, 25, 26, 12, 1, 'Trần Văn Thành Time order: 15-06-2022 10:43:11 PM', NULL, 0),
(32, 26, 23, 58, 1, 'Trần Văn Thành Time order: 16-06-2022 12:03:19 AM', NULL, 0),
(33, 29, 24, 59, 2, 'Trần Văn Thành Time order: 16-06-2022 12:13:00 AM', 'Gộp từ Tầng 1  Bàn :4Đến Khu Vực A  Bàn: 3', 0),
(34, 29, 28, 59, 1, 'Trần Văn Thành Time order: 16-06-2022 12:18:15 AM', 'Gộp từ Tầng 1  Bàn :4Đến Khu Vực A  Bàn: 3', 0),
(35, 29, 25, 59, 1, 'Trần Văn Thành Time order: 16-06-2022 12:25:54 AM', NULL, 0),
(36, 30, 23, 12, 1, 'Trần Văn Thành Time order: 16-06-2022 12:30:56 AM', NULL, 0),
(37, 30, 27, 12, 1, 'Trần Văn Thành Time Update: 16-06-2022 12:32:31 AM', NULL, 0),
(38, 30, 23, 12, 1, 'Trần Văn Thành Time Update: 16-06-2022 12:32:31 AM', NULL, 0),
(39, 31, 26, 13, 1, 'Trần Văn Thành Time order: 16-06-2022 01:30:35 PM', NULL, 0),
(40, 32, 24, 13, 1, 'Phạm Đức Mạnh Time order: 16-06-2022 01:32:25 PM', 'Phạm Đức Mạnh Time: Thu Jun 16 13:37:31 EDT 2022\nReason :Khách đổi lý', 1),
(41, 32, 27, 13, 1, 'Phạm Đức Mạnh Time order: 16-06-2022 01:32:25 PM', NULL, 0),
(42, 33, 29, 13, 1, 'Phạm Đức Mạnh Time order: 16-06-2022 01:41:16 PM', NULL, 0),
(43, 33, 28, 13, 1, 'Phạm Đức Mạnh Time Update: 16-06-2022 01:44:38 PM', 'Phạm Đức MạnhTime cancel: 16-06-2022 02:21:59 PM\nReason :Khách đổi lý', 1),
(44, 34, 24, 14, 1, 'Phạm Đức Mạnh Time order: 16-06-2022 01:45:01 PM', NULL, 0),
(45, 35, 23, 14, 1, 'Phạm Đức Mạnh Time order: 16-06-2022 01:47:46 PM', NULL, 0),
(46, 35, 29, 14, 1, 'Phạm Đức Mạnh Time Update: 16-06-2022 01:49:53 PM', 'Phạm Đức MạnhTime cancel: 16-06-2022 01:56:33 PM\nReason :Khách đổi lý', 1),
(47, 34, 29, 14, 1, 'Phạm Đức Mạnh Time Update: 16-06-2022 01:53:03 PM', NULL, 0),
(48, 36, 23, 12, 2, 'Trần Văn Thành Time order: 16-06-2022 02:21:32 PM', NULL, 0),
(49, 35, 23, 14, 3, 'Phạm Đức Mạnh Time Update: 16-06-2022 02:23:54 PM', NULL, 0),
(50, 37, 27, 13, 1, 'Trần Văn Thành Time order: 16-06-2022 02:24:38 PM', NULL, 0),
(51, 37, 26, 13, 1, 'Trần Văn Thành Time order: 16-06-2022 02:25:33 PM', 'Gộp từ Tầng 1  Bàn :3Đến Tầng 1  Bàn: 2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `name_size` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `name_size`) VALUES
(3, 'X'),
(4, 'L'),
(5, 'Xl');

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

CREATE TABLE `table` (
  `id` int(11) NOT NULL,
  `location` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `table_group` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `is_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `table`
--

INSERT INTO `table` (`id`, `location`, `status`, `id_area`, `table_group`, `is_activity`) VALUES
(11, 10, 0, 3, NULL, 0),
(12, 1, 0, 3, NULL, 0),
(13, 2, 0, 3, NULL, 1),
(14, 4, 0, 3, NULL, 0),
(15, 3, 0, 3, NULL, 0),
(26, 1, 0, 4, NULL, 0),
(27, 2, 0, 4, NULL, 0),
(28, 1, 0, 5, NULL, 0),
(29, 2, 0, 5, NULL, 0),
(30, 3, 0, 5, NULL, 0),
(31, 4, 0, 5, NULL, 0),
(53, 5, 0, 5, NULL, 0),
(54, 6, 0, 5, NULL, 0),
(55, 7, 0, 5, NULL, 0),
(56, 8, 0, 5, NULL, 0),
(57, 1, 0, 6, NULL, 0),
(58, 2, 0, 6, NULL, 0),
(59, 3, 0, 6, NULL, 0),
(60, 4, 0, 6, NULL, 0),
(61, 5, 0, 6, NULL, 0),
(62, 6, 0, 6, NULL, 0),
(63, 7, 0, 6, NULL, 0),
(64, 8, 0, 6, NULL, 0),
(65, 9, 0, 6, NULL, 0),
(66, 10, 0, 6, NULL, 0),
(67, 11, 0, 6, NULL, 0),
(68, 12, 0, 6, NULL, 0),
(69, 13, 0, 6, NULL, 0),
(70, 14, 0, 6, NULL, 0),
(71, 15, 0, 6, NULL, 0),
(72, 16, 0, 6, NULL, 0),
(73, 17, 0, 6, NULL, 0),
(74, 18, 0, 6, NULL, 0),
(75, 19, 0, 6, NULL, 0),
(76, 20, 0, 6, NULL, 0),
(77, 21, 0, 6, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `birthday`, `address`, `sex`, `image`, `email`, `password`, `status`, `is_admin`) VALUES
(1, 'Trần Văn Thành', '0385613085', '2002-01-01', 'Nghệ An', 0, '1.png', 'vanthanh10012k@gmail.com', '$2a$10$7Abz4hpryOcSlOIqGlZwTODZrJEjn6uC1ma.fr.rvmqa1WKkCUDo.', 0, 0),
(8, 'Phạm Đức Mạnh', '0385613087', '2022-06-16', 'Quảng Ninh', 1, 'ok.png', 'sang@gmail.com', '$2a$10$2NDdWhSLJ98Lu8///OpP6O1VshnKpomaorqqTYGVu/Kvc5LUUfVoO', 0, 1),
(9, 'Phạm Đức Mạnh 3', '0385613088', '2022-06-08', 'Quảng Ninh', 1, NULL, 'thanhtvph15016@fpt.edu.vn', '$2a$10$scckSEXo0tVn2XN7F5poee1cK2mjPx6qdZ0B6aNMzP2uB05dxU01C', NULL, 2),
(10, 'Phạm Đức Mạnh 2', '0385613088', '2022-06-08', 'Quảng Ninh', 0, NULL, 'thanhtvph15014@gmail.com', '$2a$10$ZwWCnHpzWsT4ipI7eC8YX.UHT0vT5YG6bBCe8m9YXdIkIKNOMTnlm', 0, 2),
(11, 'Phạm Đức Mạnh 2', '0385613089', '2022-06-25', 'Quảng Ninh', 0, NULL, 'thanhtvph15015@gmail.com', '$2a$10$PWynWvI.5xO4qo3YPYvT1eaYQ/xuGzWzcaKfA19/xmudWqVlkIYQi', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `water`
--

CREATE TABLE `water` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `image` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `id_size` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `water`
--

INSERT INTO `water` (`id`, `name`, `price`, `image`, `status`, `id_size`, `id_type`, `create_date`) VALUES
(23, 'Sữa đá', '15000', 'cofesua.jpeg', 0, 4, 1, '2022-06-13'),
(24, 'Nâu', '500000', 'cofeenau.jpeg', 0, 3, 1, '2022-06-13'),
(25, 'Đen', '20000', 'cofe1.jpg', 0, 4, 1, '2022-06-14'),
(26, '1', '22300', 'coffe.jpg', 0, 5, 1, '2022-06-14'),
(27, 'Cam sả', '22300', 'tradao1.jpeg', 0, 5, 2, '2022-06-14'),
(28, 'Lớn', '500000', 'tradao2.jpeg', 0, 5, 2, '2022-06-14'),
(29, 'Sả Tắt', '500000', 'tradaocamsa.jpeg', 0, 5, 2, '2022-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `water_type`
--

CREATE TABLE `water_type` (
  `id` int(11) NOT NULL,
  `name_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `water_type`
--

INSERT INTO `water_type` (`id`, `name_type`) VALUES
(1, 'Coffee'),
(2, 'Trà Đào'),
(3, 'Trà Chanh'),
(4, 'Trà Đá');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_fk` (`id_user`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_order_id_fk` (`id_order`),
  ADD KEY `order_detail_table_id_fk` (`id_table`),
  ADD KEY `order_detail_water_id_fk` (`id_water`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_area_id_fk` (`id_area`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `water`
--
ALTER TABLE `water`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKki3a5gys1qp6lfwxanl4vu4x3` (`id_size`),
  ADD KEY `FKjnavkoass3f8t4me1tvfavo3b` (`id_type`);

--
-- Indexes for table `water_type`
--
ALTER TABLE `water_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table`
--
ALTER TABLE `table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `water`
--
ALTER TABLE `water`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `water_type`
--
ALTER TABLE `water_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_user_id_fk` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_order_id_fk` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_table_id_fk` FOREIGN KEY (`id_table`) REFERENCES `table` (`id`),
  ADD CONSTRAINT `order_detail_water_id_fk` FOREIGN KEY (`id_water`) REFERENCES `water` (`id`);

--
-- Constraints for table `table`
--
ALTER TABLE `table`
  ADD CONSTRAINT `table_area_id_fk` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`);

--
-- Constraints for table `water`
--
ALTER TABLE `water`
  ADD CONSTRAINT `FKjnavkoass3f8t4me1tvfavo3b` FOREIGN KEY (`id_type`) REFERENCES `water_type` (`id`),
  ADD CONSTRAINT `FKki3a5gys1qp6lfwxanl4vu4x3` FOREIGN KEY (`id_size`) REFERENCES `size` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
