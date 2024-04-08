-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 10:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `ip_client` varchar(100) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `role_id`, `user_id`, `username`, `password`, `status`, `ip_client`, `last_login`, `last_logout`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'vanh21', 'vanh123', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `slug`, `department_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'java', 'java', 33, 1, '2024-04-06 21:54:19', '2024-04-08 11:17:29', NULL),
(2, 'BUSINESS', 'business', 17, 1, '2024-04-07 16:50:19', NULL, '2024-04-07 16:50:22'),
(3, 'WEB DEVELOPMENT', 'web-development', 34, 1, '2024-04-07 18:01:41', '2024-04-08 11:18:11', NULL),
(4, 'WEB DEVELOPMENT', 'web-development', 21, 1, '2024-04-08 07:26:40', NULL, NULL),
(5, 'hhhh', 'hhhh', 34, 1, '2024-04-08 07:27:42', '2024-04-08 11:18:56', NULL),
(6, 'WEB DEVELOPMENT', 'web-development', 12, 1, '2024-04-08 09:48:20', NULL, NULL),
(7, 'springgg', 'springgg', 31, 1, '2024-04-08 11:11:03', NULL, NULL),
(8, 'summer 2024', 'summer-2024', 35, 1, '2024-04-08 22:04:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `leader` varchar(60) NOT NULL,
  `date_beginning` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `logo` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `slug`, `leader`, `date_beginning`, `status`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thanh Triều', '2024-03-22', 1, NULL, '2024-03-22 17:57:43', NULL, '0000-00-00 00:00:00'),
(5, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thị Vân Anh', '2024-03-25', 1, '111.png', '2024-03-25 02:58:46', NULL, '0000-00-00 00:00:00'),
(6, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thị Vân Anh', '2024-03-25', 1, '21.png', '2024-03-25 03:12:15', NULL, '0000-00-00 00:00:00'),
(7, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thanh Triều', '2024-03-25', 1, 'hoa bó.jpg', '2024-03-25 04:20:20', NULL, '0000-00-00 00:00:00'),
(8, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thanh Triều', '2024-03-25', 1, '319395053_5698310930286818_1444937280294929993_n.jpg', '2024-03-25 04:21:03', NULL, '0000-00-00 00:00:00'),
(9, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thị Vân Anh', '2024-03-25', 1, '1.jpg', '2024-03-25 10:30:55', NULL, '0000-00-00 00:00:00'),
(10, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thanh Triều', '2024-03-25', 1, '420642754_809829797825367_9152962329903276215_n.jpg', '2024-03-25 10:31:11', NULL, '0000-00-00 00:00:00'),
(11, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'nnnnn', '2024-03-25', 1, '319395053_5698310930286818_1444937280294929993_n.jpg', '2024-03-25 10:41:47', NULL, '0000-00-00 00:00:00'),
(12, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thanh Triều1', '2024-03-25', 1, 'hue.png', '2024-03-25 10:45:48', '2024-04-04 23:10:33', '2024-04-08 11:12:56'),
(13, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thị Vân Anh', '2024-03-25', 1, '318882633_5698309763620268_1579079136790573818_n.jpg', '2024-03-25 10:49:44', NULL, '0000-00-00 00:00:00'),
(14, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thị Vân Anh', '2024-03-25', 1, '318882633_5698309763620268_1579079136790573818_n.jpg', '2024-03-25 10:49:44', NULL, '0000-00-00 00:00:00'),
(15, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thị Vân Anh', '2024-03-29', 1, '319395053_5698310930286818_1444937280294929993_n.jpg', '2024-03-25 10:51:55', NULL, '2024-03-25 10:57:11'),
(16, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thanh Triều', '2024-03-25', 1, '330825494_931850101332484_5291911887596260967_n.jpg', '2024-03-25 10:57:24', NULL, '2024-03-25 10:57:26'),
(17, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thị Vân Anh', '2024-03-26', 1, 'z5063806065041_951eb8f4e6578229ee08076e1cad2af7.jpg', '2024-03-26 16:51:14', NULL, '2024-04-08 11:12:56'),
(18, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thị Vân Anh', '2024-03-26', 1, 'z5183950934878_e3bd81521b259ef87ece301bbad015f3.jpg', '2024-03-26 16:53:38', NULL, '2024-04-08 11:12:56'),
(19, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thị Vân Anh', '2024-03-26', 1, 'z5183950934878_e3bd81521b259ef87ece301bbad015f3.jpg', '2024-03-26 16:55:39', NULL, '2024-04-08 11:12:56'),
(20, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thanh Triều1', '2024-03-26', 1, 'z5183950934878_e3bd81521b259ef87ece301bbad015f3.jpg', '2024-03-26 16:57:33', NULL, '2024-04-08 11:12:57'),
(21, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thanh Triều', '2024-03-26', 1, 'z5063806065041_951eb8f4e6578229ee08076e1cad2af7.jpg', '2024-03-26 16:58:05', '2024-03-26 17:43:31', '2024-04-08 11:12:57'),
(22, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'nnnnn', '2024-04-01', 1, 'hue.png', '2024-04-01 10:39:09', NULL, '2024-04-08 11:12:57'),
(23, 'Hồ Xuân Đăng', 'ho-xuan-dang', 'Nguyễn Thanh Triều1', '2004-12-11', 0, 'hue.png', '2024-04-04 23:23:28', NULL, '2024-04-08 11:12:58'),
(24, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'nnnnn', '2024-04-19', 0, NULL, '2024-04-04 23:24:06', NULL, '2024-04-04 23:24:55'),
(25, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'nnnnn', '2024-05-02', 1, 'hue.png', '2024-04-04 23:24:26', NULL, '2024-04-04 23:24:50'),
(26, 'NGUYỄN THỊ VÂN ANH', 'nguyen-thi-van-anh', 'Nguyễn Thanh Triều', '2111-02-11', 1, 'z5183950934878_e3bd81521b259ef87ece301bbad015f3.jpg', '2024-04-04 23:25:40', NULL, '2024-04-08 11:12:58'),
(27, 'hhhh', 'hhhh', 'qqqq', '1970-01-01', 1, NULL, '2024-04-07 18:02:05', NULL, '2024-04-07 18:02:17'),
(28, 'WEB DEVELOPMENT', 'web-development', 'qqqq', '1970-01-01', 1, NULL, '2024-04-07 18:03:16', NULL, '2024-04-07 18:03:27'),
(29, 'hhhh', 'hhhh', 'qqqq', '1970-01-01', 0, NULL, '2024-04-07 18:07:03', NULL, '2024-04-07 18:07:19'),
(30, 'hhhh', 'hhhh', 'qqqq', '2024-04-07', 1, NULL, '2024-04-07 18:07:33', NULL, '2024-04-07 18:09:18'),
(31, 'WEB DEVELOPMENT', 'web-development', 'qqqq', '2024-04-07', 0, 'hue.png', '2024-04-07 18:09:06', NULL, '2024-04-08 11:13:01'),
(32, 'hhhh', 'hhhh', 'qqqq', '2024-04-07', 1, '1.jpg', '2024-04-07 18:09:35', NULL, '2024-04-08 11:13:02'),
(33, 'WEB DEVELOPMENT', 'web-development', 'qqqq', '2024-04-07', 1, '319395053_5698310930286818_1444937280294929993_n.jpg', '2024-04-07 18:09:59', NULL, NULL),
(34, 'CNTT', 'cntt', 'qqqq', '2024-04-08', 1, '319395053_5698310930286818_1444937280294929993_n.jpg', '2024-04-08 11:17:58', NULL, NULL),
(35, 'hhhh', 'hhhh', 'qqqq', '2024-04-23', 1, 'hue.png', '2024-04-08 21:51:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` int(10) UNSIGNED NOT NULL,
  `derpartment_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `student_number` int(10) UNSIGNED NOT NULL,
  `teacher` varchar(100) DEFAULT NULL,
  `caption` varchar(60) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', NULL, 'admin', 1, '2024-03-11 08:30:56', NULL, NULL),
(2, 'student', NULL, 'student', 1, '2024-03-11 08:32:04', NULL, NULL),
(3, 'teacher', NULL, 'teacher', 1, '2024-03-11 08:32:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) UNSIGNED NOT NULL,
  `teacher_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `absent` tinyint(4) NOT NULL DEFAULT 1,
  `present` tinyint(4) NOT NULL DEFAULT 1,
  `learning_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tem`
--

CREATE TABLE `tem` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tem`
--

INSERT INTO `tem` (`id`, `name`, `slug`, `year`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Spring12', 'spring12', 2022, 1, '2024-01-01 08:06:18', '2024-04-08 11:08:56', NULL),
(2, 'summmm21', 'summmm21', 2024, 1, '2024-04-08 09:53:16', '2024-04-08 11:21:28', NULL),
(3, 'springgg21', 'springgg21', 0, 1, '2024-04-08 09:56:58', '2024-04-08 11:07:58', NULL),
(4, 'hhhh', 'hhhh', 2024, 1, '2024-04-08 10:12:46', NULL, NULL),
(5, 'WWW', 'www', 2021, 1, '2024-04-08 10:36:15', '2024-04-08 11:01:54', '2024-04-08 11:02:00'),
(6, 'spring2222', 'spring2222', 2024, 1, '2024-04-08 11:08:44', NULL, '2024-04-08 11:21:04'),
(7, 'spring2', 'spring2', 2022, 1, '2024-04-08 11:20:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `extra_code` varchar(100) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `fisrt_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `birthday` date NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `avatar` varchar(200) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `extra_code`, `role_id`, `fisrt_name`, `last_name`, `full_name`, `email`, `phone`, `address`, `birthday`, `gender`, `avatar`, `information`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BH1', 2, 'Van A', 'Nguyen', 'Nguyen Van A', 'A@gmail.com', '0123456789', 'HN', '2014-03-04', 1, NULL, NULL, 1, '2024-03-11 08:37:24', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `derpartment_id` (`derpartment_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_group`
--
ALTER TABLE `student_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `tem`
--
ALTER TABLE `tem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tem`
--
ALTER TABLE `tem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `group_ibfk_1` FOREIGN KEY (`term_id`) REFERENCES `tem` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `group_ibfk_2` FOREIGN KEY (`derpartment_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `student_group_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_group_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_group_ibfk_4` FOREIGN KEY (`teacher_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
