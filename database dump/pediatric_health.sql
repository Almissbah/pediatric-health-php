-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2019 at 10:45 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pediatric_health`
--

-- --------------------------------------------------------

--
-- Table structure for table `age_info`
--

CREATE TABLE IF NOT EXISTS `age_info` (
`id` int(11) NOT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `days` int(11) NOT NULL,
  `days_until_next` int(11) NOT NULL,
  `diet` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `length` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `age_info`
--

INSERT INTO `age_info` (`id`, `title`, `days`, `days_until_next`, `diet`, `length`, `weight`) VALUES
(1, 'At birth', 0, 42, '<<6 - 8>> Lactations', '(45.6 - 52.7) cm', '(2.5 - 4) kg'),
(2, 'At 6th weeks', 42, 28, '<<6 - 8>> Lactations', '(50.0 - 60.9) cm', '(3.2 - 6.5) kg'),
(3, 'At 10th week', 70, 28, '<<4 - 6>> Lactations', '(55.8 - 66.2) cm', '(4.6 - 8.1) kg'),
(4, 'At 14th week', 98, 172, '2 Meals & 6 Lactations', '(58.0 - 68.2) cm', '(5.1 - 8.7) kg'),
(5, 'At 9 months', 270, 0, '6 Meals & 2 Lactations', '(65.6 - 74.7) cm', '(6.6 - 10.4) kg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `baby_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `age_info_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `baby_name`, `age_info_id`, `created_at`) VALUES
(1, 'mohamed', 'ahmed', 3, '2019-01-08 23:00:25'),
(2, 'mohamed2', 'ahmed', 3, '2019-01-08 23:00:43'),
(3, 'مم', 'مم', 0, '2019-01-10 21:40:24'),
(6, 'كم', 'ك', 0, '2019-01-10 21:55:51'),
(7, 'ككك', 'منن', 0, '2019-01-10 21:57:46'),
(8, 'تتت', 'تتا', 0, '2019-01-10 21:59:59'),
(9, 'كك', 'مم', 0, '2019-01-10 22:04:26'),
(10, 'ها', 'تا', 3, '2019-01-10 22:15:39'),
(11, 'محمد', 'المصباح', 5, '2019-01-24 09:19:43'),
(12, 'no', 'jgg', 4, '2019-01-24 10:14:34'),
(13, 'lll', 'mjh', 1, '2019-01-24 10:20:49'),
(15, 'ghj', 'hhd', 1, '2019-01-24 13:19:02'),
(16, 'ohhg', 'jhg', 1, '2019-01-24 13:32:31'),
(17, 'fyhcb', 'gfdg', 1, '2019-01-24 13:40:20'),
(18, 'vcajjs', 'hgs', 1, '2019-01-24 13:58:55'),
(19, 'khgvv', 'bv', 1, '2019-01-24 14:01:30'),
(20, 'uyghh', 'jgg', 1, '2019-01-24 14:20:28'),
(21, 'mjgdj', 'hhdd', 1, '2019-01-24 14:25:05'),
(23, 'احمد', 'مودي', 1, '2019-01-24 14:37:55'),
(24, 'محمد2', 'حمود', 2, '2019-01-24 14:46:25'),
(25, 'miha', 'jhbs', 1, '2019-01-24 22:54:48'),
(26, 'mhd', 'dear', 1, '2019-03-23 14:04:29'),
(27, 'k', 'o', 1, '2019-03-23 15:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `vaccinations`
--

CREATE TABLE IF NOT EXISTS `vaccinations` (
`id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vaccinations`
--

INSERT INTO `vaccinations` (`id`, `name`) VALUES
(1, 'BCG'),
(2, 'Oral Paralysis Vaccine'),
(3, 'Five-years Polio Vaccine'),
(4, 'Measles');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_age_info`
--

CREATE TABLE IF NOT EXISTS `vaccination_age_info` (
`id` int(11) NOT NULL,
  `age_info_id` int(11) NOT NULL,
  `vaccination_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vaccination_age_info`
--

INSERT INTO `vaccination_age_info` (`id`, `age_info_id`, `vaccination_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 3, 2),
(6, 3, 3),
(7, 4, 2),
(8, 4, 3),
(9, 5, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `age_info`
--
ALTER TABLE `age_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `age_info_id` (`age_info_id`);

--
-- Indexes for table `vaccinations`
--
ALTER TABLE `vaccinations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccination_age_info`
--
ALTER TABLE `vaccination_age_info`
 ADD PRIMARY KEY (`id`), ADD KEY `age_id` (`age_info_id`,`vaccination_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `age_info`
--
ALTER TABLE `age_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `vaccinations`
--
ALTER TABLE `vaccinations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vaccination_age_info`
--
ALTER TABLE `vaccination_age_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
