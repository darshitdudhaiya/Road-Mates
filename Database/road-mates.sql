-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 08:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `road-mates`
--

-- --------------------------------------------------------

--
-- Table structure for table `create_ride`
--

CREATE TABLE `create_ride` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `to_place` longtext NOT NULL,
  `from_place` longtext NOT NULL,
  `date` date NOT NULL,
  `time_to_leave` bigint(20) NOT NULL,
  `expected_time_to_reach` bigint(20) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `vehicle_name` longtext NOT NULL,
  `seats_available` bigint(20) NOT NULL,
  `start_ride` tinyint(1) NOT NULL,
  `stop_ride` tinyint(1) NOT NULL,
  `paid_after` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `create_ride`
--

INSERT INTO `create_ride` (`id`, `user_id`, `to_place`, `from_place`, `date`, `time_to_leave`, `expected_time_to_reach`, `price`, `vehicle_name`, `seats_available`, `start_ride`, `stop_ride`, `paid_after`) VALUES
(1, 8, 'Jamnagar', 'Rajkot', '2023-11-18', 1, 3, 70, 'Fortuner', 6, 1, 0, 1),
(2, 11, 'Jamnagar', 'Surat', '2023-11-18', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(3, 11, 'Anand', 'Surat', '2023-11-18', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(4, 11, 'Anand', 'Surat', '2023-11-22', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(5, 8, 'Jamnagar', 'Surat', '2023-11-22', 1, 3, 70, 'Fortuner', 6, 1, 0, 1),
(6, 11, 'Jamnagar', 'Surat', '2023-11-26', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(7, 11, 'Jamnagar', 'Surat', '2023-12-03', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(8, 11, 'Jamnagar', 'Rajkot', '2023-12-03', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(9, 8, 'Jamnagar', 'Surat', '2023-11-22', 1, 3, 70, 'Fortuner', 6, 1, 0, 1),
(10, 11, 'Jamnagar', 'Rajkot', '2023-12-02', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(11, 11, 'Jamnagar', 'Rajkot', '2023-12-12', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(12, 11, 'Jamnagar', 'Rajkot', '2023-12-12', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(13, 11, 'Jamnagar', 'gandhinagar', '2023-12-12', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(14, 11, 'Jamnagar', 'gandhinagar', '2023-02-15', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(15, 11, 'Jamnagar', 'gandhinagar', '2023-02-15', 1, 9, 700, 'Porche', 1, 0, 0, 1),
(16, 11, 'Jamnagar', 'gandhinagar', '0000-00-00', 1, 9, 700, 'Porche', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `joined_ride`
--

CREATE TABLE `joined_ride` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `review` longtext DEFAULT NULL,
  `rating` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memory`
--

CREATE TABLE `memory` (
  `id` int(11) NOT NULL,
  `image` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `permission_for_joined_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `ride_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `create_user_id`, `ride_id`, `description`, `status`) VALUES
(1, 8, 11, 4, 'Hello I Want Come With You.', 0),
(2, 12, 11, 4, 'Hello I Want Come With You.', 0),
(3, 13, 11, 4, 'Hello I Want Come With You.', 0),
(4, 13, 11, 4, ' I Want Come With You.', 1),
(5, 13, 11, 6, 'Hello I Want Come With You.', 0),
(6, 13, 11, 7, 'Hello I Want Come With You.', 0),
(7, 13, 11, 8, 'Hello I Want Come With You.', 0),
(8, 13, 11, 9, 'Hello I Want Come With You.', 0),
(9, 13, 11, 10, 'Hello I Want Come With You.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `fcm_token` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `password` longtext NOT NULL,
  `email` longtext NOT NULL,
  `mo_number` bigint(20) NOT NULL,
  `alternate_mo_number` bigint(20) NOT NULL,
  `gender` mediumtext NOT NULL,
  `age` mediumint(9) NOT NULL,
  `instagram` longtext NOT NULL,
  `whatsapp` longtext NOT NULL,
  `facebook` longtext NOT NULL,
  `x` longtext NOT NULL,
  `threads` longtext NOT NULL,
  `discord` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mo_number`, `alternate_mo_number`, `gender`, `age`, `instagram`, `whatsapp`, `facebook`, `x`, `threads`, `discord`) VALUES
(8, 'abc', '123', 'abc@gmail.com', 8200498892, 9428315276, 'male', 19, 'abc', 'abc', 'abc', 'abc', 'abc', 'abc'),
(11, 'efg', '123', 'abc@gmail.com', 8200498892, 9428315276, 'male', 19, 'abc', 'abc', 'abc', 'abc', 'abc', 'abc'),
(12, 'efg', '123', 'abc@gmail.com', 8200498892, 9428315276, 'male', 19, 'abc', 'abc', 'abc', 'abc', 'abc', 'abc'),
(13, 'Darshit', '123', 'abc@gmail.com', 8200498892, 9428315276, 'male', 19, 'abc', 'abc', 'abc', 'abc', 'abc', 'abc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `create_ride`
--
ALTER TABLE `create_ride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ride_id` (`ride_id`);

--
-- Indexes for table `joined_ride`
--
ALTER TABLE `joined_ride`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_user_id` (`create_user_id`),
  ADD KEY `ride_id` (`ride_id`);

--
-- Indexes for table `memory`
--
ALTER TABLE `memory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_id` (`ride_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `create_user_id` (`create_user_id`),
  ADD KEY `ride_id` (`ride_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `create_ride`
--
ALTER TABLE `create_ride`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `joined_ride`
--
ALTER TABLE `joined_ride`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memory`
--
ALTER TABLE `memory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `create_ride`
--
ALTER TABLE `create_ride`
  ADD CONSTRAINT `create_ride_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`ride_id`) REFERENCES `create_ride` (`id`);

--
-- Constraints for table `joined_ride`
--
ALTER TABLE `joined_ride`
  ADD CONSTRAINT `joined_ride_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `joined_ride_ibfk_2` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `joined_ride_ibfk_3` FOREIGN KEY (`ride_id`) REFERENCES `create_ride` (`id`);

--
-- Constraints for table `memory`
--
ALTER TABLE `memory`
  ADD CONSTRAINT `memory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `memory_ibfk_2` FOREIGN KEY (`ride_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `memory_ibfk_3` FOREIGN KEY (`ride_id`) REFERENCES `create_ride` (`id`),
  ADD CONSTRAINT `memory_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`create_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`ride_id`) REFERENCES `create_ride` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
