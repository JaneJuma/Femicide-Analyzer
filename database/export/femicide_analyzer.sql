-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2025 at 09:17 AM
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
-- Database: `femicide_analyzer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `victim_id` bigint(20) UNSIGNED NOT NULL,
  `perpetrator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `method` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `ob_number` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `victim_id`, `perpetrator_id`, `date`, `method`, `description`, `ob_number`, `user_id`, `created_at`, `updated_at`, `location_id`) VALUES
(1, 1, 1, '2025-06-20', 'Strangulation', 'The victim was strangled to death at their home', 'OB001', 1, '2025-07-31 16:57:36', '2025-07-31 16:57:36', 0),
(2, 9, 9, '2025-08-04', 'Strangulation', 'Killed', 'OB002', 1, '2025-08-07 11:22:38', '2025-08-07 11:22:38', 5),
(3, 10, 10, '2025-08-05', 'Machete', 'Hacked to death', 'OB003', 1, '2025-08-07 11:24:39', '2025-08-07 11:24:39', 6),
(4, 11, 11, '2025-08-05', 'Machete', 'Hacked to death', 'OB004', 1, '2025-08-07 14:57:59', '2025-08-07 14:57:59', 54),
(5, 12, 12, '2025-07-28', 'Machete', 'killed', 'OB005', 1, '2025-08-07 15:20:50', '2025-08-07 15:20:50', 55),
(6, 13, 13, '2025-07-29', 'Machete', 'Killed', 'OB006', 1, '2025-08-12 14:57:16', '2025-08-12 14:57:16', 195),
(7, 14, 14, '2025-07-16', 'Strangulation', 'Strangled to death', 'OB007', 1, '2025-08-21 10:42:44', '2025-08-21 10:42:44', 196),
(8, 15, 15, '2025-08-06', 'Strangulation', 'Strangled to death', 'OB008', 1, '2025-08-21 10:58:05', '2025-08-21 10:58:05', 197),
(9, 16, 16, '2025-08-11', 'Hacked', 'The victim was hacked to death', 'OB009', 1, '2025-08-21 11:21:06', '2025-08-21 11:21:06', 198);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `county` varchar(100) DEFAULT NULL,
  `location_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `county`, `location_type`, `created_at`, `updated_at`) VALUES
(7, 'Mombasa', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(8, 'Kwale', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(9, 'Kilifi', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(10, 'Tana River', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(11, 'Lamu', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(12, 'Taita Taveta', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(13, 'Garissa', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(14, 'Wajir', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(15, 'Mandera', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(16, 'Marsabit', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(17, 'Isiolo', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(18, 'Meru', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(19, 'Tharaka-Nithi', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(20, 'Embu', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(21, 'Kitui', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(22, 'Machakos', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(23, 'Makueni', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(24, 'Nyandarua', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(25, 'Nyeri', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(26, 'Kirinyaga', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(27, 'Murang’a', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(28, 'Kiambu', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(29, 'Turkana', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(30, 'West Pokot', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(31, 'Samburu', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(32, 'Trans Nzoia', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(33, 'Uasin Gishu', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(34, 'Elgeyo-Marakwet', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(35, 'Nandi', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(36, 'Baringo', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(37, 'Laikipia', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(38, 'Nakuru', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(39, 'Narok', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(40, 'Kajiado', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(41, 'Kericho', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(42, 'Bomet', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(43, 'Kakamega', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(44, 'Vihiga', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(45, 'Bungoma', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(46, 'Busia', 'Rural', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(47, 'Siaya', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(48, 'Kisumu', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(49, 'Homa Bay', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(50, 'Migori', 'Slum', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(51, 'Kisii', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(52, 'Nyamira', 'Urban', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(53, 'Nairobi', 'Estate', '2025-08-07 14:44:04', '2025-08-07 14:44:04'),
(54, 'Tana River', 'rural', '2025-08-07 14:57:59', '2025-08-07 14:57:59'),
(55, 'Mombasa', 'urban', '2025-08-07 15:20:50', '2025-08-07 15:20:50'),
(56, 'Mombasa', 'Rural', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(57, 'Mombasa', 'Estate', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(58, 'Kwale', 'Urban', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(59, 'Kwale', 'Rural', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(60, 'Kwale', 'Slum', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(61, 'Kilifi', 'Rural', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(62, 'Kilifi', 'Slum', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(63, 'Kilifi', 'Estate', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(64, 'Tana River', 'Urban', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(65, 'Tana River', 'Slum', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(66, 'Lamu', 'Rural', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(67, 'Lamu', 'Slum', '2025-08-07 15:43:43', '2025-08-07 15:43:43'),
(68, 'Lamu', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(69, 'Taita Taveta', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(70, 'Taita Taveta', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(71, 'Taita Taveta', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(72, 'Garissa', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(73, 'Garissa', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(74, 'Garissa', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(75, 'Wajir', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(76, 'Wajir', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(77, 'Wajir', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(78, 'Mandera', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(79, 'Mandera', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(80, 'Mandera', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(81, 'Marsabit', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(82, 'Marsabit', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(83, 'Marsabit', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(84, 'Isiolo', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(85, 'Isiolo', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(86, 'Isiolo', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(87, 'Meru', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(88, 'Meru', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(89, 'Meru', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(90, 'Tharaka-Nithi', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(91, 'Tharaka-Nithi', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(92, 'Tharaka-Nithi', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(93, 'Embu', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(94, 'Embu', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(95, 'Embu', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(96, 'Kitui', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(97, 'Kitui', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(98, 'Kitui', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(99, 'Machakos', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(100, 'Machakos', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(101, 'Machakos', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(102, 'Makueni', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(103, 'Makueni', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(104, 'Makueni', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(105, 'Nyandarua', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(106, 'Nyandarua', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(107, 'Nyandarua', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(108, 'Nyeri', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(109, 'Nyeri', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(110, 'Nyeri', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(111, 'Kirinyaga', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(112, 'Kirinyaga', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(113, 'Kirinyaga', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(114, 'Murang’a', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(115, 'Murang’a', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(116, 'Murang’a', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(117, 'Kiambu', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(118, 'Kiambu', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(119, 'Kiambu', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(120, 'Turkana', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(121, 'Turkana', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(122, 'Turkana', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(123, 'West Pokot', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(124, 'West Pokot', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(125, 'West Pokot', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(126, 'Samburu', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(127, 'Samburu', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(128, 'Samburu', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(129, 'Trans Nzoia', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(130, 'Trans Nzoia', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(131, 'Trans Nzoia', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(132, 'Uasin Gishu', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(133, 'Uasin Gishu', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(134, 'Uasin Gishu', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(135, 'Elgeyo-Marakwet', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(136, 'Elgeyo-Marakwet', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(137, 'Elgeyo-Marakwet', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(138, 'Nandi', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(139, 'Nandi', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(140, 'Nandi', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(141, 'Baringo', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(142, 'Baringo', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(143, 'Baringo', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(144, 'Laikipia', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(145, 'Laikipia', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(146, 'Laikipia', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(147, 'Nakuru', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(148, 'Nakuru', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(149, 'Nakuru', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(150, 'Narok', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(151, 'Narok', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(152, 'Narok', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(153, 'Kajiado', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(154, 'Kajiado', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(155, 'Kajiado', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(156, 'Kericho', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(157, 'Kericho', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(158, 'Kericho', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(159, 'Bomet', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(160, 'Bomet', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(161, 'Bomet', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(162, 'Kakamega', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(163, 'Kakamega', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(164, 'Kakamega', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(165, 'Vihiga', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(166, 'Vihiga', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(167, 'Vihiga', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(168, 'Bungoma', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(169, 'Bungoma', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(170, 'Bungoma', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(171, 'Busia', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(172, 'Busia', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(173, 'Busia', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(174, 'Siaya', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(175, 'Siaya', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(176, 'Siaya', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(177, 'Kisumu', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(178, 'Kisumu', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(179, 'Kisumu', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(180, 'Homa Bay', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(181, 'Homa Bay', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(182, 'Homa Bay', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(183, 'Migori', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(184, 'Migori', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(185, 'Migori', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(186, 'Kisii', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(187, 'Kisii', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(188, 'Kisii', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(189, 'Nyamira', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(190, 'Nyamira', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(191, 'Nyamira', 'Estate', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(192, 'Nairobi', 'Urban', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(193, 'Nairobi', 'Rural', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(194, 'Nairobi', 'Slum', '2025-08-07 15:43:44', '2025-08-07 15:43:44'),
(195, 'Makueni', 'Rural', '2025-08-12 14:57:16', '2025-08-12 14:57:16'),
(196, 'Machakos', 'Urban', '2025-08-21 10:42:44', '2025-08-21 10:42:44'),
(197, 'Machakos', 'Rural', '2025-08-21 10:58:05', '2025-08-21 10:58:05'),
(198, 'Machakos', 'Rural', '2025-08-21 11:21:06', '2025-08-21 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_29_124129_create_victims_table', 1),
(5, '2025_07_31_132607_create_locations_table', 1),
(6, '2025_07_31_134235_create_perpetrators_table', 1),
(7, '2025_07_31_193632_create_cases_table', 1),
(8, '2025_08_07_115617_add_location_id_to_cases', 2),
(9, '2025_08_07_115823_drop_county_from_cases', 2),
(10, '2025_08_07_115848_drop_location_type_from_cases', 2),
(11, '2025_08_07_121719_drop_county_from_cases', 3),
(12, '2025_07_31_132608_add_location_id_to_cases', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perpetrators`
--

CREATE TABLE `perpetrators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perpetrator_name` varchar(255) DEFAULT NULL,
  `perpetrator_age` int(11) DEFAULT NULL,
  `relationship_to_victim` varchar(100) DEFAULT NULL,
  `perpetrator_occupation` text DEFAULT NULL,
  `known_to_victim` text DEFAULT NULL,
  `perpetrator_status` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perpetrators`
--

INSERT INTO `perpetrators` (`id`, `perpetrator_name`, `perpetrator_age`, `relationship_to_victim`, `perpetrator_occupation`, `known_to_victim`, `perpetrator_status`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 35, 'Husband', 'Teacher', '1', 'arrested', '2025-07-31 16:57:36', '2025-07-31 16:57:36'),
(2, 'Peter Doe', 50, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 09:25:19', '2025-08-07 09:25:19'),
(3, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 09:54:10', '2025-08-07 09:54:10'),
(4, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 10:09:38', '2025-08-07 10:09:38'),
(5, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 10:34:21', '2025-08-07 10:34:21'),
(6, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'arrested', '2025-08-07 10:38:52', '2025-08-07 10:38:52'),
(7, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 10:48:28', '2025-08-07 10:48:28'),
(8, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'at_large', '2025-08-07 10:56:47', '2025-08-07 10:56:47'),
(9, 'John Doe', 33, 'Boyfriend', 'Plumber', '1', 'at_large', '2025-08-07 11:22:38', '2025-08-07 11:22:38'),
(10, 'Peter Doe', 55, 'Husband', 'Engineer', '1', 'arrested', '2025-08-07 11:24:39', '2025-08-07 11:24:39'),
(11, 'John Doe', 32, 'Unknown', NULL, '0', 'at_large', '2025-08-07 14:57:59', '2025-08-07 14:57:59'),
(12, 'Peter Doe', 54, 'Husband', 'Teacher', '1', 'arrested', '2025-08-07 15:20:50', '2025-08-07 15:20:50'),
(13, 'Peter Doe', 34, 'Boyfriend', NULL, '1', 'arrested', '2025-08-12 14:57:16', '2025-08-12 14:57:16'),
(14, 'John Doe', 45, 'Husband', 'Plumber', '1', 'charged', '2025-08-21 10:42:44', '2025-08-21 10:42:44'),
(15, 'John Doe', 40, 'Husband', 'Engineer', '1', 'at_large', '2025-08-21 10:58:05', '2025-08-21 10:58:05'),
(16, 'John Doe', 30, 'Boyfriend', 'Plumber', '1', 'at_large', '2025-08-21 11:21:06', '2025-08-21 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CrXfiJSmyfWq6kQ4SBBsm0oz9xKqCKbZwTfdxDrS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNXNUOXdGaTRrT0VJSWVxS05uN3RIZXhibkZ5S2t0YUdxdmJ0WU5RaSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1755869601),
('dJ02v4eTnOx4fTP90rgWRrWXnPDK7UMI6zZ6VmH0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVU40OENRVVZJWDdoaWlTWExGYlVpUGV0ZUVBcDFVT0RFTkMxelFLMSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1755854456);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jane Juma', 'jaynejumah@gmail.com', NULL, '$2y$12$9fIsOJtzNH97TfBzzPOpZ.PQNA.jbAxD44y5LMWZB1ax2wgqtPzwK', NULL, '2025-07-31 16:32:28', '2025-07-31 16:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `victims`
--

CREATE TABLE `victims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `victim_name` varchar(255) DEFAULT NULL,
  `victim_age` int(11) DEFAULT NULL,
  `victim_occupation` varchar(255) DEFAULT NULL,
  `victim_marital_status` varchar(100) DEFAULT NULL,
  `victim_education_level` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `victims`
--

INSERT INTO `victims` (`id`, `victim_name`, `victim_age`, `victim_occupation`, `victim_marital_status`, `victim_education_level`, `created_at`, `updated_at`) VALUES
(1, 'Mary Doe', 25, 'Nurse', 'Married', 'Graduate', '2025-07-31 16:57:36', '2025-07-31 16:57:36'),
(2, 'Mary Doe', 40, 'Mum', 'Married', 'Graduate', '2025-08-07 09:25:19', '2025-08-07 09:25:19'),
(3, 'Lucy Doe', 40, 'Mum', 'Married', 'Graduate', '2025-08-07 09:54:10', '2025-08-07 09:54:10'),
(4, 'Lucy Doe', 30, 'Mum', 'Married', 'Graduate', '2025-08-07 10:09:38', '2025-08-07 10:09:38'),
(5, 'Lucy Doe', 33, 'Mum', 'Married', 'Graduate', '2025-08-07 10:34:21', '2025-08-07 10:34:21'),
(6, 'Lucy Doe', 33, 'Mum', 'Married', 'Graduate', '2025-08-07 10:38:52', '2025-08-07 10:38:52'),
(7, 'Lucy Doe', 33, 'Mum', 'Married', 'Graduate', '2025-08-07 10:48:28', '2025-08-07 10:48:28'),
(8, 'Lucy Doe', 33, 'Mum', 'Married', 'Graduate', '2025-08-07 10:56:47', '2025-08-07 10:56:47'),
(9, 'Ivy Kemunto', 23, 'Doctor', 'Single', 'Graduate', '2025-08-07 11:22:38', '2025-08-07 11:22:38'),
(10, 'Lucy Doe', 33, 'Nurse', 'Married', 'Graduate', '2025-08-07 11:24:39', '2025-08-07 11:24:39'),
(11, 'Rose', 23, 'Nurse', 'Single', 'Graduate', '2025-08-07 14:57:59', '2025-08-07 14:57:59'),
(12, 'Rose', 34, 'Mum', 'Married', 'Graduate', '2025-08-07 15:20:50', '2025-08-07 15:20:50'),
(13, 'Ivy Kemunto', 24, 'Doctor', 'Single', 'Graduate', '2025-08-12 14:57:16', '2025-08-12 14:57:16'),
(14, 'Lucy Doe', 36, 'Nurse', 'Married', 'Graduate', '2025-08-21 10:42:44', '2025-08-21 10:42:44'),
(15, 'Rose', 26, 'Mum', 'Married', 'Graduate', '2025-08-21 10:58:05', '2025-08-21 10:58:05'),
(16, 'Elizabeth John', 24, 'Nurse', 'Single', 'Graduate', '2025-08-21 11:21:06', '2025-08-21 11:21:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cases_victim_id_foreign` (`victim_id`),
  ADD KEY `cases_perpetrator_id_foreign` (`perpetrator_id`),
  ADD KEY `cases_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `perpetrators`
--
ALTER TABLE `perpetrators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `victims`
--
ALTER TABLE `victims`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `perpetrators`
--
ALTER TABLE `perpetrators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `victims`
--
ALTER TABLE `victims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `cases_perpetrator_id_foreign` FOREIGN KEY (`perpetrator_id`) REFERENCES `perpetrators` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cases_victim_id_foreign` FOREIGN KEY (`victim_id`) REFERENCES `victims` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
