-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 02:10 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_appointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `invited_user_id` text,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `title`, `creator_id`, `invited_user_id`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 'Meeting with client', 1, 'null', '2024-12-16 10:00:00', '2024-12-16 12:00:00', '2024-12-16 03:52:04', '2024-12-16 03:52:04'),
(2, 'Project discussion', 2, 'null', '2024-12-16 14:00:00', '2024-12-16 16:00:00', '2024-12-16 03:52:04', '2024-12-16 03:52:04'),
(3, 'Meeting Monthly Evaluation', 1, '[\"3\",\"2\"]', '2024-12-17 10:54:00', '2024-12-17 16:54:00', '2024-12-15 20:56:39', '2024-12-15 20:56:39'),
(7, 'Evaluation System RS', 1, '[\"3\"]', '2024-12-18 09:19:00', '2024-12-18 13:19:00', '2024-12-15 21:20:27', '2024-12-15 21:20:27'),
(8, 'Meeting Project Tahunan', 1, '[\"6\",\"7\"]', '2024-12-18 08:24:00', '2024-12-19 16:24:00', '2024-12-16 12:24:44', '2024-12-16 12:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('Manager','Staff') NOT NULL,
  `preferred_timezone` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`, `preferred_timezone`, `created_at`, `updated_at`) VALUES
(1, 'Asep', 'asep', '$2a$12$wA7WxRNOq3sVCKpbq/MQ6.XOHXbCcFEuJTLnPdolhCfI1W6iXeOVq', 'Staff', 'Asia/Jakarta', '2024-12-16 11:25:13', '2024-12-16 11:25:13'),
(2, 'Agus', 'agus', '$2a$12$wA7WxRNOq3sVCKpbq/MQ6.XOHXbCcFEuJTLnPdolhCfI1W6iXeOVq', 'Staff', 'Asia/Jayapura', '2024-12-16 11:25:13', '2024-12-16 11:25:13'),
(3, 'Ujang', 'ujang', '$2a$12$wA7WxRNOq3sVCKpbq/MQ6.XOHXbCcFEuJTLnPdolhCfI1W6iXeOVq', 'Manager', 'Pacific/Auckland', '2024-12-16 11:25:13', '2024-12-16 11:25:13'),
(4, 'ruper', 'ruly', '$2y$10$pe3I.iIJOKQeK1JpoK7.VuPgJjRnS0MpyQar7dTzjXbpzG6vNBVp2', 'Manager', 'UTC', '2024-12-16 11:26:02', '2024-12-16 11:26:02'),
(5, 'rizki', 'rizki', '$2y$10$HAlpNu3KIDIx2gtxeBohauPn60nyQfkCbCx.vdtc.vdHMppdrk8UC', 'Manager', 'Asia', '2024-12-16 11:30:59', '2024-12-16 11:30:59'),
(6, 'rohim', 'rohim', '$2y$10$WuStCWu7jDQiz/5B.Q52AOeY3anBFBhkaGntxzYSXihToUAHBCvO6', 'Manager', 'Asia', '2024-12-16 11:31:23', '2024-12-16 11:31:23'),
(7, 'abi', 'abi', '$2y$10$lXoWL3dpDjyljyrtJnhrxeLhUoGiQVi.FOh9kF.2M0xNhgpcIJTqO', 'Staff', 'Asia/Jakarta', '2024-12-16 11:35:06', '2024-12-16 11:35:06'),
(14, 'admin123', 'admin123', '$2y$10$If5.UGSAUs1S4zMI0jfIfu6Zq7qwj8xXnbFpaCHSs3p6u0eGpx.ru', 'Staff', 'asia', '2024-12-16 12:03:35', '2024-12-16 12:03:35'),
(15, 'admin12345', 'admin12345', '$2y$10$Jm8/cajuNENjEYugVIy0Iun2nAR65Or7gBp988hrGUDSybEPZYzb2', 'Staff', 'Asia/Jakarta', '2024-12-16 12:09:47', '2024-12-16 12:09:47'),
(16, 'cobalagi', 'cobalagi', '$2y$10$vznKc691f89pvu3yola3oOFPO6F74VvpI90.n6JUMGv3Hvgwflvem', 'Staff', 'asia/jakarta', '2024-12-16 12:14:03', '2024-12-16 12:14:03'),
(17, 'testtoast', 'testtoast', '$2y$10$Cn5x4I8PNRSQziMx36PjvOzkZv93yM54zykTcT6b3Oi29A6HZPH4q', 'Manager', 'Asia/Jakarta', '2024-12-16 12:20:17', '2024-12-16 12:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_appointments`
--

CREATE TABLE `user_appointments` (
  `user_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_appointments`
--

INSERT INTO `user_appointments` (`user_id`, `appointment_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-12-16 04:20:22', '2024-12-16 04:20:22'),
(1, 3, '2024-12-16 04:20:22', '2024-12-16 04:20:22'),
(1, 7, '2024-12-15 21:20:27', '2024-12-15 21:20:27'),
(1, 8, '2024-12-16 12:24:44', '2024-12-16 12:24:44'),
(2, 2, '2024-12-16 04:20:22', '2024-12-16 04:20:22'),
(3, 1, '2024-12-16 04:20:22', '2024-12-16 04:20:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_appointments`
--
ALTER TABLE `user_appointments`
  ADD PRIMARY KEY (`user_id`,`appointment_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_appointments`
--
ALTER TABLE `user_appointments`
  ADD CONSTRAINT `user_appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
