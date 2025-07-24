-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2025 at 06:56 AM
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
-- Database: `laravel_inertia`
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'test', 5, '2025-06-27 01:27:22', '2025-06-27 01:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'Mohammad100', 'didarul198111@gmail.com', '01552404682100', 5, '2025-07-06 06:41:35', '2025-07-06 06:41:35'),
(4, 'Kaden Mitchell', 'dudeheloj@mailinator.com', '+1 (561) 478-9394', 4, '2025-07-08 13:42:18', '2025-07-08 13:42:18');

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(100) NOT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `Payable` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `customer_id`, `total`, `discount`, `vat`, `Payable`, `created_at`, `updated_at`) VALUES
(6, 5, 2, '200', '50', '10', '160', '2025-07-10 14:16:32', '2025-07-10 14:16:32'),
(7, 5, 2, '200', '70', '10', '140', '2025-07-10 14:17:54', '2025-07-10 14:17:54'),
(8, 5, 2, '200', '20', '10', '190', '2025-07-10 14:25:51', '2025-07-10 14:25:51'),
(10, 5, 2, '200', '0', '10', '210', '2025-07-10 14:41:18', '2025-07-10 14:41:18'),
(11, 5, 2, '600', '0', '30', '630', '2025-07-10 14:42:19', '2025-07-10 14:42:19'),
(12, 5, 2, '600', '180', '30', '450', '2025-07-10 14:43:45', '2025-07-10 14:43:45'),
(13, 5, 2, '1300', '200', '65', '1165', '2025-07-10 14:51:23', '2025-07-10 14:51:23'),
(14, 5, 2, '400', '30', '20', '390', '2025-07-11 06:42:54', '2025-07-11 06:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(100) NOT NULL,
  `sale_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`user_id`, `invoice_id`, `product_id`, `qty`, `sale_price`, `created_at`, `updated_at`) VALUES
(5, 6, 5, '1', '100', '2025-07-10 14:16:32', '2025-07-10 14:16:32'),
(5, 6, 8, '1', '100', '2025-07-10 14:16:32', '2025-07-10 14:16:32'),
(5, 7, 3, '1', '100', '2025-07-10 14:17:54', '2025-07-10 14:17:54'),
(5, 7, 5, '1', '100', '2025-07-10 14:17:54', '2025-07-10 14:17:54'),
(5, 8, 4, '1', '100', '2025-07-10 14:25:51', '2025-07-10 14:25:51'),
(5, 8, 5, '1', '100', '2025-07-10 14:25:51', '2025-07-10 14:25:51'),
(5, 10, 4, '1', '100', '2025-07-10 14:41:18', '2025-07-10 14:41:18'),
(5, 10, 5, '1', '100', '2025-07-10 14:41:18', '2025-07-10 14:41:18'),
(5, 11, 4, '1', '100', '2025-07-10 14:42:19', '2025-07-10 14:42:19'),
(5, 11, 5, '4', '100', '2025-07-10 14:42:19', '2025-07-10 14:42:19'),
(5, 11, 8, '1', '100', '2025-07-10 14:42:19', '2025-07-10 14:42:19'),
(5, 12, 4, '1', '100', '2025-07-10 14:43:45', '2025-07-10 14:43:45'),
(5, 12, 5, '4', '100', '2025-07-10 14:43:45', '2025-07-10 14:43:45'),
(5, 12, 8, '1', '100', '2025-07-10 14:43:45', '2025-07-10 14:43:45'),
(5, 13, 3, '4', '100', '2025-07-10 14:51:23', '2025-07-10 14:51:23'),
(5, 13, 4, '4', '100', '2025-07-10 14:51:23', '2025-07-10 14:51:23'),
(5, 13, 5, '3', '100', '2025-07-10 14:51:23', '2025-07-10 14:51:23'),
(5, 13, 8, '2', '100', '2025-07-10 14:51:23', '2025-07-10 14:51:23'),
(5, 14, 4, '2', '100', '2025-07-11 06:42:54', '2025-07-11 06:42:54'),
(5, 14, 8, '2', '100', '2025-07-11 06:42:54', '2025-07-11 06:42:54');

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
(4, '2025_06_27_064222_create_categories_table', 2),
(5, '2025_07_02_134921_create_products_table', 3),
(6, '2025_07_05_194415_create_customers_table', 4),
(7, '2025_07_06_054918_create_invoices_table', 5),
(8, '2025_07_06_061745_create_invoice_products_table', 6),
(9, '2025_07_13_054545_create_suplayers_table', 7),
(10, '2025_07_15_113812_create_product_names_table', 8);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `unit`, `image`, `created_at`, `updated_at`) VALUES
(3, 5, 1, 'testion01', '100', '7', 'uploads/producs/1751802215.png', '2025-07-06 05:43:35', '2025-07-10 14:51:23'),
(4, 5, 1, '1 testion01', '100', '184', 'uploads/producs/1751802560.png', '2025-07-06 05:49:20', '2025-07-11 06:42:54'),
(5, 5, 1, '01 testion010', '100', '183', 'uploads/producs/1751802630.png', '2025-07-06 05:50:30', '2025-07-10 14:51:23'),
(8, 5, 1, 'Brittany test 100', '100', '90', 'uploads/producs/1752068474.png', '2025-07-09 07:01:48', '2025-07-11 06:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_names`
--

CREATE TABLE `product_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_names`
--

INSERT INTO `product_names` (`id`, `user_id`, `category_id`, `name`, `type`, `image`, `created_at`, `updated_at`) VALUES
(3, 5, 1, 'testion', 'cap', 'uploads/productNames/1752583969.png', '2025-07-15 06:52:49', '2025-07-15 06:52:49'),
(4, 5, 1, 'Jemima Mcdaniel', '40', 'uploads/productNames/1752608831.png', '2025-07-15 13:47:11', '2025-07-15 13:47:11'),
(6, 5, 1, 'Baker', 'Minus', 'uploads/productNames/1752614388.png', '2025-07-15 15:07:14', '2025-07-15 15:19:48'),
(7, 5, 1, 'Maya Hoffman', 'Minus nisi ut dolor', 'uploads/productNames/1752614501.png', '2025-07-15 15:21:41', '2025-07-15 15:21:41'),
(8, 5, 1, 'Jeanette Cardenas', 'Expedita ab sit omni', 'uploads/productNames/1752672355.png', '2025-07-16 07:25:55', '2025-07-16 07:25:55');

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
('HiQsNQfOz46fLKzPcQZIVeSUR5rkWkUhvFfJbTLp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ3lOSU9qM29kNFc4UnJ5STNjWTR4V2wxQVR1UFZGZ2tETWNtZFpzeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1OiJlbWFpbCI7czoyMzoiZGlkYXJ1bDE5ODExMUBnbWFpbC5jb20iO3M6NzoidXNlcl9pZCI7aTo1O3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvQ2F0ZWdvcnlQYWdlIjt9fQ==', 1752684933),
('Vhio3jXg5VBm672jI9qCPF0YZOzxuvyGx58OCYJg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSWlMUjdHOENFaHYzUzZFT0pWMnNHSkhhTlNHR2MyWWRzbll0anZvRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9Qcm9kdWN0TmFtZVBhZ2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YToyOntpOjA7czoxMDoiX29sZF9pbnB1dCI7aToxO3M6NjoiZXJyb3JzIjt9czozOiJuZXciO2E6MDp7fX1zOjU6ImVtYWlsIjtzOjIzOiJkaWRhcnVsMTk4MTExQGdtYWlsLmNvbSI7czo3OiJ1c2VyX2lkIjtpOjU7czoxMDoiX29sZF9pbnB1dCI7YTo1OntzOjQ6Im5hbWUiO3M6ODoiQ2FyZGVuYXMiO3M6NDoidHlwZSI7czoyMDoiRXhwZWRpdGEgYWIgc2l0IG9tbmkiO3M6MTE6ImNhdGVnb3J5X2lkIjtpOjE7czo1OiJpbWFnZSI7czozNToidXBsb2Fkcy9wcm9kdWN0TmFtZXMvMTc1MjY3MjM1NS5wbmciO3M6MjoiaWQiO2k6ODt9czo2OiJlcnJvcnMiO086MzE6IklsbHVtaW5hdGVcU3VwcG9ydFxWaWV3RXJyb3JCYWciOjE6e3M6NzoiACoAYmFncyI7YToxOntzOjc6ImRlZmF1bHQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxNZXNzYWdlQmFnIjoyOntzOjExOiIAKgBtZXNzYWdlcyI7YToxOntzOjU6ImltYWdlIjthOjI6e2k6MDtzOjMzOiJUaGUgaW1hZ2UgZmllbGQgbXVzdCBiZSBhbiBpbWFnZS4iO2k6MTtzOjcxOiJUaGUgaW1hZ2UgZmllbGQgbXVzdCBiZSBhIGZpbGUgb2YgdHlwZToganBlZywgcG5nLCBqcGcsIGdpZiwgc3ZnLCB3ZWJwLiI7fX1zOjk6IgAqAGZvcm1hdCI7czo4OiI6bWVzc2FnZSI7fX19fQ==', 1752673704);

-- --------------------------------------------------------

--
-- Table structure for table `suplayers`
--

CREATE TABLE `suplayers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suplayers`
--

INSERT INTO `suplayers` (`id`, `name`, `email`, `mobile`, `companyName`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Mohammad100', 'didarul198111@gmail.com', '01552404682100', 'pharmacitical', 5, '2025-07-13 00:42:53', '2025-07-13 00:42:53'),
(3, 'Nero Noble', 'gygypowa@mailinator.com', '+1 (475) 548-6473', 'Ortega Guy Associates', 5, '2025-07-14 00:35:20', '2025-07-14 00:35:20'),
(4, 'Melinda Kane', 'vovi@mailinator.com', '+1 (205) 197-3596', 'Simpson Riddle Co', 5, '2025-07-14 00:35:30', '2025-07-14 00:35:30'),
(5, 'Ronan Kinney', 'wydixo@mailinator.com', '+1 (389) 475-9358', 'Strong and Fry Inc', 5, '2025-07-14 00:45:25', '2025-07-14 00:45:25'),
(6, 'Sean Hill', 'kicivulot@mailinator.com', '+1 (377) 207-4494', 'Cotton and Nguyen Inc', 5, '2025-07-14 10:10:07', '2025-07-14 10:10:07'),
(7, 'Zia Weiss', 'giragyfok@mailinator.com', '+1 (601) 797-2016', 'Madden and Short Inc', 5, '2025-07-14 10:10:44', '2025-07-14 10:10:44'),
(8, 'Jenette Ewing', 'jige@mailinator.com', '+1 (638) 507-6233', 'Savage Sosa Co', 5, '2025-07-14 10:20:49', '2025-07-14 10:20:49'),
(9, 'Nehru Sullivan', 'xobihu@mailinator.com', '+1 (789) 905-6324', 'Vaughan Hickman Plc', 5, '2025-07-14 10:30:00', '2025-07-14 10:30:00'),
(17, '2333 Mohammad100', 'didarul198111@gmail.com', '01552404682100', 'pharmacitical', 5, '2025-07-14 14:18:44', '2025-07-14 14:18:44'),
(19, 'test=======Shaeleigh Sheppard', 'test=======xofexo@mailinator.com', '+1 (433) 618-8347', 'test=======Baldwin and Leblanc Trading', 5, '2025-07-14 14:19:50', '2025-07-14 15:28:44'),
(20, 'Joshua Cannon', 'cuseva@mailinator.com', '+1 (375) 657-1502', 'Boyd Mason Trading', 5, '2025-07-14 14:33:57', '2025-07-14 14:33:57'),
(22, 'Farrah Benton', 'kihetodu@mailinator.com', '+1 (105) 156-3002', 'Dejesus and Bowers Plc', 5, '2025-07-14 14:37:35', '2025-07-14 14:37:35'),
(23, 'Nyssa Booth', 'kowijeve@mailinator.com', '+1 (524) 428-2598', 'Fernandez and Mcintyre LLC', 5, '2025-07-14 15:25:48', '2025-07-14 15:25:48'),
(24, 'Melodie Carney', 'leseqilut@mailinator.com', '+1 (607) 827-7673', 'Gentry and Underwood Inc', 5, '2025-07-14 15:26:29', '2025-07-14 15:26:29'),
(26, 'Hadassah Lawrence', 'zejezedab@mailinator.com', '+1 (763) 937-5278', 'Stone and Norman LLC', 5, '2025-07-14 15:28:57', '2025-07-14 15:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `otp`, `password`, `mobile`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '0', '$2y$12$rM9HfGYYauvu72jaMpJT5udA8d4hmPlKtoZyMT0Lr6xJnrIC2oUOe', '01234567890', NULL, '2025-06-10 08:54:06', '2025-06-10 08:54:06'),
(4, 'Mohammad1', 'didarul1981@gmail.com', NULL, '0', '12345678', '015524046821', NULL, '2025-06-12 06:07:34', '2025-07-08 01:37:43'),
(5, 'TEST Mohammad100', 'didarul198111@gmail.com', NULL, '0', '198109889', '0155240468210011', NULL, '2025-06-26 00:19:48', '2025-07-12 00:13:29'),
(7, 'Maya Hoffman', 'admin@example.com', NULL, '0', '12345678', '01552404583', NULL, '2025-07-07 14:40:08', '2025-07-07 14:40:08'),
(8, 'Carolyn Mack', 'tavyzihely@mailinator.com', NULL, '0', 'Pa$$w0rd!', 'Consequat In aliqui', NULL, '2025-07-07 14:44:55', '2025-07-07 14:44:55'),
(9, 'Solomon Hale', 'bobez@mailinator.com', NULL, '0', 'Pa$$w0rd!', 'Optio id adipisicin', NULL, '2025-07-07 14:46:17', '2025-07-07 14:46:17');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD KEY `invoice_products_user_id_foreign` (`user_id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_names`
--
ALTER TABLE `product_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_names_user_id_foreign` (`user_id`),
  ADD KEY `product_names_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suplayers`
--
ALTER TABLE `suplayers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suplayers_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_names`
--
ALTER TABLE `product_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `suplayers`
--
ALTER TABLE `suplayers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_names`
--
ALTER TABLE `product_names`
  ADD CONSTRAINT `product_names_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_names_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `suplayers`
--
ALTER TABLE `suplayers`
  ADD CONSTRAINT `suplayers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
