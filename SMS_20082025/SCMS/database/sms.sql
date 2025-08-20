-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 20, 2025 at 04:41 PM
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
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `section` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `paid_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(4, '2025_08_11_182736_update_student_table', 1),
(5, '2025_08_04_163303_update_users_table', 2),
(6, '2025_08_17_142546_create__students_table', 3),
(7, '2025_08_17_162610_create_teachers_table', 4),
(8, '2025_08_17_162808_create_classes_table', 5),
(9, '2025_08_17_162937_create_subjects_table', 6),
(10, '2025_08_17_164530_create_students_table', 7),
(11, '2025_08_17_165242_create_enrollments_table', 8),
(12, '2025_08_17_165630_create_results_table', 9),
(13, '2025_08_17_165824_create_attendance_table', 10),
(14, '2025_08_17_165955_create_fees_table', 11),
(15, '2025_08_17_190220_create_admins_table', 12);

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
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) NOT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stud_name` varchar(255) NOT NULL,
  `stud_email` varchar(255) NOT NULL,
  `stud_phone` varchar(255) DEFAULT NULL,
  `stud_dob` date DEFAULT NULL,
  `stud_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `role` enum('admin','teacher','parent','student') NOT NULL DEFAULT 'student',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$g.roLrI0rvjq.ys0yM0Iu.r7WJHblG2vRbKjjaVZ0yDRHr1XqItFW', NULL, 'admin', '2025-08-15 09:40:32', '2025-08-15 09:40:32'),
(2, 'Mauricio Schowalter', 'lonnie34@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'bhHFar9W2z', 'admin', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(3, 'Dr. Wilber Anderson PhD', 'pat07@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Z0d6ts3ThD', 'admin', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(4, 'Cesar Gerhold', 'fmarquardt@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '1X1LkCxAhE', 'admin', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(5, 'Ciara Cassin II', 'areichert@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ds23yBmCKZ', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(6, 'Pink Torp', 'aufderhar.milan@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'FRzHlcYiDB', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(7, 'Janae Towne', 'cheyanne.homenick@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '3tw1iDf0fa', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(8, 'Josue Wintheiser', 'kcarroll@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'NgFdc6wbFg', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(9, 'Kira Moen', 'nicolas.wilson@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'YE4s5NYVDX', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(10, 'Colt Glover', 'edd.berge@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '094GquXihA', 'teacher', '2025-08-17 14:22:13', '2025-08-17 14:22:13'),
(11, 'Gaetano Leffler', 'arippin@example.com', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Qe4W9idklR', 'teacher', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(12, 'Mr. Glen Hammes DDS', 'franecki.nicole@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'qVeOtztJ23', 'teacher', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(13, 'Mr. Geovanny Hessel', 'ruby.shanahan@example.net', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'gPDfpNx7Gs', 'teacher', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(14, 'Mauricio Sauer', 'ewaters@example.org', '2025-08-17 14:22:13', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'IhCBbA5m6H', 'teacher', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(15, 'Mr. Hilario Heathcote', 'kaleigh70@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'K6tl7dVQIx', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(16, 'Paul Pfeffer', 'zoie.hegmann@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'wPR4kfEYHO', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(17, 'Alfred Schroeder', 'gisselle.harvey@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Ag9uEeut7L', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(18, 'Arnulfo Schroeder', 'njacobs@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'P1JPRJLttq', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(19, 'Delmer Weissnat', 'dickens.jarret@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'oEXfZU1IiJ', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(20, 'Mr. Myles Yost', 'gschowalter@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '9Ws0ZLq4HJ', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(21, 'Lyda Stoltenberg', 'hkris@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'N11T46Ahj2', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(22, 'Marcelo Hayes', 'caleb56@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'NVzE1UTyMx', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(23, 'Miss Abagail Cartwright Jr.', 'xhartmann@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'G7qFZOwKv0', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(24, 'Chaya Goyette', 'igutmann@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'zeE11Z5GmE', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(25, 'Miss Drew Reichel', 'jade.yost@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '9vSfmO9OEX', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(26, 'Floyd Fisher PhD', 'paucek.mattie@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Cz4IMpFKRu', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(27, 'Lorenzo Mohr', 'gerlach.kailyn@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Kbljxdr0vM', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(28, 'Miss Nora Daniel', 'monahan.oliver@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '0O55TXtKgl', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(29, 'Gregg Corkery', 'cassidy.becker@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'nWofprrOYh', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(30, 'Cortez Mertz', 'brady18@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '6oFbS2bTpw', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(31, 'Mr. Mohammad Quitzon', 'karl01@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'z7cDY0hjZm', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(32, 'Prof. Glennie Nader II', 'dschneider@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'NBnUXrIKQD', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(33, 'Verona Kutch', 'amedhurst@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'SU5kJWNTeH', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(34, 'Prof. Rodrigo Nicolas Jr.', 'vbergnaum@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'oIYx8MrOn1', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(35, 'Colten Jaskolski Sr.', 'block.vallie@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'VpF44Ypbbf', 'parent', '2025-08-17 14:22:14', '2025-08-17 14:22:14'),
(36, 'Sunny Brakus', 'jhowe@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'W3liy3NSpg', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(37, 'Mafalda Lubowitz', 'thyatt@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'jwKrVLYX8o', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(38, 'Dr. Janae Kunde', 'hanna.rempel@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'gtCaw4HttT', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(39, 'Marina King', 'aylin31@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '6VF6gcoGOu', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(40, 'Griffin Schmeler', 'wswaniawski@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'DT0DKOmZxH', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(41, 'Prof. Xander Hahn Jr.', 'cquitzon@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'KRa0VdGiN9', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(42, 'Tabitha Hodkiewicz', 'esmeralda31@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'jNXXUiqTl9', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(43, 'Elena Kshlerin', 'eleanora.fay@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'rGhtCXH5ma', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(44, 'Hans Fisher', 'grady.adrianna@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'n5UHX2U9BJ', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(45, 'Westley Morar DDS', 'dooley.ally@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'k7TVA33q0k', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(46, 'Kolby Strosin', 'pink38@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'TsXlD0Gbol', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(47, 'Furman Fisher MD', 'beth05@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ylsWlB5eqk', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(48, 'Dr. Maurice Williamson Sr.', 'tre16@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'mayq39y6oE', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(49, 'Laura Stehr', 'maxine.morar@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ifm97hNUk0', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(50, 'Brandon Farrell', 'nchamplin@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ui7VaVgqPU', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(51, 'Dr. Eleazar Tillman IV', 'mcclure.viviane@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'anQc5NvPJb', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(52, 'Johanna Bruen', 'judy59@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'YAiQi7DxZY', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(53, 'Ezekiel Ledner', 'addie.wisozk@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'nn1fKqLmZH', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(54, 'Patricia Heidenreich Sr.', 'virginia41@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'A9Kd15OyRJ', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(55, 'Mr. Alejandrin Terry DVM', 'armando.cole@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'uFBmuEWXlz', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(56, 'Billy Waters', 'koss.kali@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'uXrFsByGB7', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(57, 'May Murazik', 'dach.lexus@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'DWLd42ZLE7', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(58, 'Aurelia Douglas', 'cody84@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'wPw9lC0ofD', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(59, 'Prof. Jeanie Carter II', 'penelope.altenwerth@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'odf0bynobl', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(60, 'Dr. Anya Luettgen MD', 'rempel.kiel@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Ql0sqS9NGh', 'parent', '2025-08-17 14:22:15', '2025-08-17 14:22:15'),
(61, 'Marcia Labadie DDS', 'jstamm@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '46OqjdyD2x', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(62, 'Sasha Casper', 'adalberto.nienow@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'tfN62DYxD6', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(63, 'Prof. Myrl Torphy', 'yessenia.schuster@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'O6AKn7TnQQ', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(64, 'Dr. Pamela Labadie III', 'lilliana60@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'olsgCcTCDf', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(65, 'Clyde Cummerata', 'flossie.goodwin@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'oIynK6tAq2', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(66, 'Dr. Verla Satterfield', 'gleason.zaria@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'nl78XOkh1S', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(67, 'Prof. Sean Schowalter', 'hickle.zaria@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'CqyVVPKc4u', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(68, 'Jarrett Nienow', 'hansen.kennedi@example.org', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'u4l42Wnra8', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(69, 'Alycia Pfeffer', 'spencer.monte@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'dVoSTjZBcH', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(70, 'Brennan McGlynn', 'herbert52@example.com', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'N69n3Gd0vd', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(71, 'Miss Vivienne Kerluke', 'norene.lueilwitz@example.net', '2025-08-17 14:22:14', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '4Wbe9er74c', 'parent', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(72, 'Prof. Cooper Schultz', 'maureen93@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'rUxXKWonaw', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(73, 'Ethyl Wilderman', 'ehaag@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'cI2Emd5ZZC', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(74, 'Gina Larson', 'keeley.klein@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'xghlAYGvmP', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(75, 'Mrs. Claudia Mraz PhD', 'alexzander.braun@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'vCg5SL7PnY', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(76, 'Hellen Kassulke', 'marina31@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'jEQqat0Q3I', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(77, 'Leland Bashirian', 'rolfson.rhoda@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 's46jmYS2wE', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(78, 'Cleo Bosco', 'romaguera.marcos@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'qit1TVvR83', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(79, 'Marjory Hansen', 'elarkin@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '3ZbtlopRwj', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(80, 'Prof. Layla Shields Sr.', 'ckilback@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'dBi9bDsjwk', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(81, 'Uriel Rippin', 'pframi@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'M6fizBOVMf', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(82, 'Prof. Cicero Weber', 'leopold49@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ooL3oJfHZz', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(83, 'Alessandro Hermiston IV', 'isabella61@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'wv0ADhsexi', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(84, 'Judson Quigley', 'tania86@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'iOONRs1BFN', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(85, 'Dr. Casper Kerluke II', 'ziemann.hazel@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'jXNJYBEKEP', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(86, 'Miss Katelyn Bartell', 'pbayer@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'p5lZitt4J2', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(87, 'Aleen Rogahn', 'antwan.towne@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'h3enR49trb', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(88, 'Dr. Thomas Macejkovic', 'jbosco@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ebxNaEDvu5', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(89, 'Chelsey Zemlak', 'clyde.rodriguez@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'AIBSFaLeI7', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(90, 'Barton Padberg', 'lehner.linnea@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'o2uuiVZs1v', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(91, 'Keyon Berge', 'geovanny.torphy@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'ghaF0wwmgg', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(92, 'Maryse Gorczany', 'deckow.sandrine@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '3Iz8UhovGq', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(93, 'Mr. Candido Cormier MD', 'jermaine29@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '9cjofZaFB4', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(94, 'Terrill Kuvalis', 'mabbott@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'JAjLcRL6Xb', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(95, 'Luciano Jacobson', 'damore.desiree@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Fi3BIZwSVP', 'student', '2025-08-17 14:22:16', '2025-08-17 14:22:16'),
(96, 'Hoyt Upton', 'zgerhold@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'KWIag2xNwm', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17'),
(97, 'Sabryna Pagac', 'eula51@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'Yir077Oemc', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17'),
(98, 'Andreanne Block', 'liza.ferry@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'j1ffm3XhpL', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17'),
(99, 'Chyna Powlowski', 'ryley.lemke@example.net', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', '5tscAromhZ', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17'),
(100, 'Trent Hackett', 'justina17@example.com', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'hSjQlZf9PV', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17'),
(101, 'Celine Schoen', 'cynthia48@example.org', '2025-08-17 14:22:16', '$2y$12$4aboNdCtoKY2LZ49401vyuqpRm0SIew33fe48t5KYJ1WXkdTPm2fy', 'CUAgDXYYn7', 'student', '2025-08-17 14:22:17', '2025-08-17 14:22:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_student_id_foreign` (`student_id`),
  ADD KEY `enrollments_class_id_foreign` (`class_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_student_id_foreign` (`student_id`);

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
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_student_id_foreign` (`student_id`),
  ADD KEY `results_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_stud_email_unique` (`stud_email`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
