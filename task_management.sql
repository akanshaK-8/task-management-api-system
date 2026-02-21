-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2026 at 08:44 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
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
(4, '2026_02_20_125850_create_personal_access_tokens_table', 2),
(5, '2026_02_20_130130_create_tasks_table', 3),
(6, '2026_02_21_074148_add_indexes_to_tasks_table', 4);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 1, 'auth_token', '67365210747907a1477d9c1737c76ec64cbb5a2c14f6667146b5215e62b628b4', '[\"*\"]', '2026-02-20 14:38:38', NULL, '2026-02-20 13:40:11', '2026-02-20 14:38:38'),
(5, 'App\\Models\\User', 2, 'auth_token', 'b9155cfa1315928b30239c5040104a39bc6cc5682be52bf32d193bf5256d8752', '[\"*\"]', NULL, NULL, '2026-02-20 13:53:32', '2026-02-20 13:53:32'),
(6, 'App\\Models\\User', 3, 'auth_token', '4866549d93f3dd3fa75016ed52e98fd8e6310fb372588444059a8153c7f7a164', '[\"*\"]', NULL, NULL, '2026-02-20 13:55:12', '2026-02-20 13:55:12'),
(11, 'App\\Models\\User', 4, 'auth_token', '17a40620ded31fe0db13afd40962060e3e2d479dca9e1ac2cb476c2568bcc051', '[\"*\"]', '2026-02-21 02:08:10', NULL, '2026-02-21 01:59:48', '2026-02-21 02:08:10');

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
('rMomq11UOWVTGzVYCBx892dzODPJBZWEz1vxbznW', NULL, '127.0.0.1', 'PostmanRuntime/7.49.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU9jSDlPd0x3VkdvZVo0RWxBMjR2RGg4Y2M1SHBIVTIzNGduZlZ3bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771620546),
('ZBW4xbzv5Z8xmfmSVlhW2kKBqpHGP8IE6tlgOsp5', NULL, '127.0.0.1', 'PostmanRuntime/7.49.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3p6NXVJZzZzNkFzakVLM0JnNXJLTUxCV3dqMzRNYlZuWUd2dnk5ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771600433);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','in-progress','completed') NOT NULL DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `due_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Finish Laravel API', 'Complete authentication and task CRUD endpoints', 'pending', '2026-02-25', '2026-02-20 12:52:43', '2026-02-20 13:23:26', NULL),
(2, 1, 'Design Dashboard UI update', 'Create Figma mockups', 'completed', '2026-03-05', '2026-02-20 12:53:52', '2026-02-20 13:40:28', '2026-02-20 13:40:28'),
(3, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 12:55:20', '2026-02-20 12:59:46', '2026-02-20 12:59:46'),
(4, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 13:42:34', '2026-02-20 13:42:34', NULL),
(5, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 13:44:49', '2026-02-20 13:44:49', NULL),
(6, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 13:47:36', '2026-02-20 13:47:36', NULL),
(7, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 13:48:18', '2026-02-20 13:48:18', NULL),
(8, 1, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 14:03:54', '2026-02-20 14:03:54', NULL),
(9, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-02-28', '2026-02-20 14:53:14', '2026-02-20 15:05:38', '2026-02-20 15:05:38'),
(10, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'completed', NULL, '2026-02-20 14:53:53', '2026-02-20 15:13:43', NULL),
(11, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 14:55:18', '2026-02-21 02:03:40', '2026-02-21 02:03:40'),
(12, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 14:57:01', '2026-02-20 14:57:01', NULL),
(13, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 15:15:11', '2026-02-20 15:15:11', NULL),
(14, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 15:15:13', '2026-02-20 15:15:13', NULL),
(15, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 15:15:14', '2026-02-20 15:15:14', NULL),
(16, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 15:15:16', '2026-02-20 15:15:16', NULL),
(17, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', NULL, '2026-02-20 15:18:30', '2026-02-20 15:18:30', NULL),
(18, 4, 'Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-15', '2026-02-20 15:19:48', '2026-02-20 15:19:48', NULL),
(19, 5, 'New Design Dashboard UI for mobile', 'Create Figma mockups for mobile', 'pending', '2026-03-25', '2026-02-21 01:51:26', '2026-02-21 01:51:26', NULL);

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
(1, 'Jane', 'janeEx@gmail.com', NULL, '$2y$12$IVZwjMK4c5Syn1N3KJ/pwODFWaRET2VxpTRjeFp6k36t7WjCis1NG', NULL, '2026-02-20 12:47:29', '2026-02-20 12:47:29'),
(2, 'Kim James', 'kim34@gmail.com', NULL, '$2y$12$VAFr7WnX3TE0/m4PCNzunu.FoXLPg.AwfhH7QL3DV1WmYQpRHt4sa', NULL, '2026-02-20 13:53:32', '2026-02-20 13:53:32'),
(3, 'Kim Pik', 'kimoop@gmail.com', NULL, '$2y$12$ENqETOA4PpuCTMb7aZp/TuU120aRWBsO2XxyieVKqjWmZuDnfDp5S', NULL, '2026-02-20 13:55:12', '2026-02-20 13:55:12'),
(4, 'Kim Pik', 'testop@gmail.com', NULL, '$2y$12$58eInwuVZPVS3SYTZ60g2.ZbDhCcOOeuJ3KZMxY4ui4kXXqiMoxq2', NULL, '2026-02-20 14:51:26', '2026-02-20 14:51:26'),
(5, 'Test user', 'testPPp@gmail.com', NULL, '$2y$12$uzMSQ5vdvtPN/hZmdxBvNOZ7skdY2PVYqnepMoKKjOzpKfbJRBXiK', NULL, '2026-02-21 01:50:42', '2026-02-21 01:50:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_status_index` (`status`),
  ADD KEY `tasks_due_date_index` (`due_date`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
