-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 05:27 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(64) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by_user_id` int(10) UNSIGNED NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `type`, `node_id`, `created_on`, `created_by_user_id`) VALUES
(1, 1, NULL, '2023-11-03 16:47:57', 1),
(2, 2, NULL, '2023-11-03 16:51:29', 1),
(3, 1, NULL, '2023-11-03 16:53:34', 2),
(4, 2, NULL, '2023-11-03 17:22:33', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nodes`
--

CREATE TABLE `nodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `url` varchar(256) NOT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by_user_id` int(10) UNSIGNED NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nodes`
--

INSERT INTO `nodes` (`id`, `name`, `url`, `enabled`, `created_on`, `created_by_user_id`, `updated_on`, `updated_by_user_id`) VALUES
(8, 'لپتاپ 2023', 'از جدید ترین محصولات وارد شده به افغانستان', 1, '2023-11-03 17:06:32', 2, NULL, NULL),
(9, 's23 ultra', 'this is Samsung\'s best mobile', 1, '2023-11-03 17:07:12', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'all');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `permission_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(64) DEFAULT NULL,
  `enabled` tinyint(3) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `login_session` char(32) DEFAULT NULL,
  `login_expiration` datetime DEFAULT NULL,
  `logged_on` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by_user_id` int(10) UNSIGNED NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `enabled`, `role_id`, `login_session`, `login_expiration`, `logged_on`, `created_on`, `created_by_user_id`, `updated_on`, `updated_by_user_id`) VALUES
(1, 'admin', 'admin', 'Administrator', 1, 1, '', '0000-00-00 00:00:00', '2023-11-03 16:47:57', '2017-09-28 23:24:10', 1, '2017-12-04 20:38:38', 1),
(2, 'bahman', '123', 'Bahman Ali', 1, 1, '', '0000-00-00 00:00:00', '2023-11-03 16:53:34', '2017-09-28 23:24:10', 1, '2023-11-03 16:49:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_nodes`
--

CREATE TABLE `users_nodes` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`) USING BTREE;

--
-- Indexes for table `nodes`
--
ALTER TABLE `nodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `users_nodes`
--
ALTER TABLE `users_nodes`
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `node_id` (`node_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nodes`
--
ALTER TABLE `nodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_logs_created_by_user_id` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `fk_rp_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `fk_rp_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users_nodes`
--
ALTER TABLE `users_nodes`
  ADD CONSTRAINT `fk_un_node_id` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`),
  ADD CONSTRAINT `fk_un_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
