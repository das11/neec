-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 24, 2019 at 01:25 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `knap`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_id`, `text`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Seeder created user <strong>Admin</strong> successfully', '::1', '2019-02-04 02:56:08', '2019-02-04 02:56:08'),
(2, NULL, 'Seeder created user <strong>Kabir Das</strong> successfully', '::1', '2019-02-04 02:56:49', '2019-02-04 02:56:49'),
(3, 2, 'Kabir Das updated user <strong>Kabir Das</strong> successfully', '::1', '2019-02-04 03:10:11', '2019-02-04 03:10:11'),
(4, 2, 'Kabir Das updated user <strong>Kabir Das</strong> successfully', '::1', '2019-02-12 00:55:19', '2019-02-12 00:55:19'),
(5, NULL, 'Seeder created user <strong>Amit</strong> successfully', '::1', '2019-02-13 02:34:07', '2019-02-13 02:34:07'),
(6, 3, 'Amit updated user <strong>Amit</strong> successfully', '::1', '2019-02-13 02:34:24', '2019-02-13 02:34:24'),
(7, 2, 'Kabir Das updated user <strong>Kabir Das</strong> successfully', '::1', '2019-02-13 02:34:49', '2019-02-13 02:34:49'),
(8, 3, 'Amit updated user <strong>Amit</strong> successfully', '::1', '2019-02-13 02:35:03', '2019-02-13 02:35:03'),
(9, 1, 'Admin updated user <strong>Admin</strong> successfully', '::1', '2019-02-13 02:35:34', '2019-02-13 02:35:34'),
(10, NULL, 'Seeder created user <strong>John</strong> successfully', '::1', '2019-02-13 02:44:06', '2019-02-13 02:44:06'),
(11, 4, 'John updated user <strong>John</strong> successfully', '::1', '2019-02-13 02:44:45', '2019-02-13 02:44:45'),
(12, 1, 'Admin updated user <strong>Admin</strong> successfully', '::1', '2019-04-04 03:04:01', '2019-04-04 03:04:01'),
(13, 1, 'Admin updated user <strong>Admin</strong> successfully', '::1', '2019-04-04 03:19:17', '2019-04-04 03:19:17'),
(14, 1, 'Admin updated user <strong>Admin</strong> successfully', '::1', '2019-04-04 03:20:20', '2019-04-04 03:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `values` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(10000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `name`, `model`) VALUES
(1, 'User', 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `variables` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_id`, `subject`, `body`, `variables`, `created_at`, `updated_at`) VALUES
(1, 'FORGET_PASSWORD', 'Reset Password', 'Dear ##USERNAME##,\nHere are your password reset instructions.\n\nA request to reset your Admin password has been made. If you did not make this request, simply ignore this email. If you did make this request, please reset your password\n##URL##\nIf the button above does not work, try copying and pasting the URL into your browser. If you continue to have problems, please feel free to contact us \n', '[\"##USERNAME##\", \"##URL##\"]', NULL, NULL),
(2, 'RESET_SUCCESS', 'Reset success', 'Dear ##USERNAME##,\nYou have successfully reset yours password. Please click the below link to login\n##URL##\nIf the button above does not work, try copying and pasting the URL into your browser. If you continue to have problems, please feel free to contact us\n', '[\"##USERNAME##\"]', NULL, NULL),
(3, 'USER_REGISTRATION', 'Register success', 'Dear ##USERNAME##,\nThank you for registration. Please click the below link to login\n##URL##\nIf the button above does not work, try copying and pasting the URL into your browser. If you continue to have problems, please feel free to contact us \n', '[\"##USERNAME##\",\"##URL##\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_08_25_172600_create_settings_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_20_112951_create_user_chat_table', 1),
(6, '2017_02_23_090329_entrust_setup_tables', 1),
(7, '2017_03_08_100810_create_activity_log_table', 1),
(8, '2017_03_09_065817_create_custom_fields_table', 1),
(9, '2017_03_09_065954_create_custom_fields_data_table', 1),
(10, '2017_03_10_192253_update_users_table', 1),
(11, '2017_03_15_101900_add_reset_token_to_users_table', 1),
(12, '2017_03_16_102017_create_email_templates_table', 1),
(13, '2017_03_20_043054_add_fields_to_settings_table', 1),
(14, '2017_03_23_083220_add_recptcha_keys_to_settings_table', 1),
(15, '2017_03_26_180921_create_sessions_table', 1),
(16, '2017_04_04_064349_add_locale_to_settings_table', 1),
(17, '2017_04_06_105922_update_settings_add_rtl_table', 1),
(18, '2017_05_02_062929_alter_user_chat_table', 1),
(19, '2017_05_30_105444_create_socials_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'view-dashboard', 'View Dashboard', 'Allow to view dashboard', NULL, NULL),
(2, 'view-users', 'View Users', 'Allow to view users details', NULL, NULL),
(3, 'add-user', 'Add User', 'Allow to add user details', NULL, NULL),
(4, 'edit-user', 'Edit User', 'Allow to edit user details', NULL, NULL),
(5, 'delete-user', 'Delete User', 'Allow to delete user', NULL, NULL),
(6, 'csv-import', 'Csv Import', 'Allow to csv import', NULL, NULL),
(7, 'add-role', 'Add Role', 'Allow to View role', NULL, NULL),
(8, 'edit-role', 'Edit Role', 'Allow to edit Role', NULL, NULL),
(9, 'delete-role', 'Delete Role', 'Allow to delete Role', NULL, NULL),
(10, 'view-role', 'View Roles', 'Allow to view role', NULL, NULL),
(11, 'add-permission', 'Add Permission', 'Allow to add permission', NULL, NULL),
(12, 'edit-permission', 'edit Permission', 'Allow to edit permission', NULL, NULL),
(13, 'delete-permission', 'Delete Permission', 'Allow to delete permission', NULL, NULL),
(14, 'view-activity-log', 'View Activity Log', 'Allow to view activity log', NULL, NULL),
(15, 'view-email-template', 'View Email Template', 'Allow to view email template', NULL, NULL),
(16, 'edit-email-template', 'Edit Email Template', 'Allow to edit email template', NULL, NULL),
(17, 'message-to-other-users', 'Message to Other Users', 'Allow to Message to Other Users', NULL, NULL),
(18, 'update-social-settings', 'Update Social Settings', 'Allow to update social settings', NULL, NULL),
(19, 'update-general-settings', 'Update General Settings', 'Allow to update general settings', NULL, NULL),
(20, 'update-custom-fields', 'Update Custom Fields', 'Allow to update Custom Fields', NULL, NULL),
(21, 'manage-custom-fields', 'Manage Custom Fields', 'Allow to manage Custom Fields', NULL, NULL),
(22, 'update-theme-settings', 'Update Theme Settings', 'Allow to update theme settings', NULL, NULL),
(23, 'update-mail-settings', 'Update Theme Settings', 'Allow to update theme settings', NULL, NULL),
(24, 'update-common-settings', 'Update Common Settings', 'Allow to update common settings', NULL, NULL),
(25, 'view-permission', 'View Permission', 'Allow to view permissions', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(1, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(25, 4),
(14, 5),
(15, 6),
(16, 6),
(17, 7),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(22, 8),
(23, 8),
(24, 8);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Superadmin', NULL, NULL),
(2, 'role-dashboard', 'Role Dashboard', 'user role dashboard', NULL, NULL),
(3, 'role-users', 'Role Users', 'user role role-users', NULL, NULL),
(4, 'role-roles-permissions', 'Role Roles and Permissions', 'user role roles and permissions', NULL, NULL),
(5, 'role-activity-log', 'Role Activity Logs', 'user role activity logs', NULL, NULL),
(6, 'role-email-template', 'Role Email Template', 'user role email template', NULL, NULL),
(7, 'role-messages', 'Role messages', 'user role messages', NULL, NULL),
(8, 'role-settings', 'Role settings', 'user role settings', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme_folder` enum('metronic','admin-lte','elite-admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'metronic',
  `facebook_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_notification` tinyint(1) NOT NULL,
  `recaptcha` tinyint(1) NOT NULL,
  `remember_me` tinyint(1) NOT NULL DEFAULT '1',
  `forget_password` tinyint(1) NOT NULL DEFAULT '1',
  `allow_register` tinyint(1) NOT NULL DEFAULT '1',
  `email_confirmation` tinyint(1) NOT NULL,
  `custom_field_on_register` tinyint(1) NOT NULL,
  `mail_driver` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail_host` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail_port` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail_username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail_password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail_encryption` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `recaptcha_public_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recaptcha_private_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `email`, `site_name`, `logo`, `theme_color`, `theme_folder`, `facebook_client_id`, `facebook_client_secret`, `google_client_id`, `google_client_secret`, `twitter_client_id`, `twitter_client_secret`, `created_at`, `updated_at`, `email_notification`, `recaptcha`, `remember_me`, `forget_password`, `allow_register`, `email_confirmation`, `custom_field_on_register`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `recaptcha_public_key`, `recaptcha_private_key`, `locale`, `rtl`) VALUES
(1, 'Knap', 'info@example.com', 'Cipher Studios', 'cipher.png', 'default', 'metronic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 1, 0, 0, '', '', '', '', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `social_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `social_service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.png',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `dob` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `user_type` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `status`, `dob`, `gender`, `user_type`, `remember_token`, `created_at`, `updated_at`, `reset_token`) VALUES
(1, 'Admin', 'admin@example.com', '$2y$10$gC3vaRjDmU53Ohdu1G15YeCbQHEl5CqDivLgent9aWYUJM9X.Bx4.', 'default.png', 'active', NULL, 'male', 'admin', 'WyWHsRL4aTlECK9t9zkAivhZEONE2eBYqKUudM4ucn8X7fpJV1PBtSWRqUm6', '2019-02-04 02:56:08', '2019-02-04 02:56:08', NULL),
(2, 'Kabir Das', 'kabird1196@gmail.com', '$2y$10$PlgSobiMEyCX1Urb7uIYB.nPFHtfoOJs1BfiMrxTtYcDR3fpcTfGS', 'default.png', 'active', '2019-02-05', 'male', 'admin', 'Hv4xBY9tcPWj3wcUb6fZaqbzMnDg1bj8BmHarom7uFwL6fRh9RJGFHDCa3il', '2019-02-04 02:56:49', '2019-02-04 02:56:49', NULL),
(3, 'Amit', 'amit@amit.com', '$2y$10$PWaoYAEtB5MrE1wHJM5bCuvEaunGrEDMOK9fO00GZqvr4DWkoO00W', 'default.png', 'active', '2019-02-06', 'male', 'user', '1pnRjEtzQDiBvc0svTzzD5pHO7bfYfwf65GmiGhqm5pKxBAm1VAXxRtLju5E', '2019-02-13 02:34:07', '2019-02-13 02:34:07', NULL),
(4, 'John', 'john@mil.com', '$2y$10$VLcFeyV7jEv/jGOl/6NT8eHj5/OVLGzzGK6jFlukZOgIP7gepxOnu', 'default.png', 'active', '2019-02-13', 'male', 'user', 'JkIRnTfDC41fcSl1nhpI4crWsab7Zoyq3OVeSCmcNHzDzMhF6SRq6xZxHeka', '2019-02-13 02:44:06', '2019-02-13 02:44:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

CREATE TABLE `users_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `to` int(10) UNSIGNED DEFAULT NULL,
  `message_seen` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_chat`
--

INSERT INTO `users_chat` (`id`, `message`, `from`, `to`, `message_seen`, `created_at`, `updated_at`) VALUES
(1, 'hey', 3, 2, 'no', '2019-02-13 02:34:19', '2019-02-13 02:34:19'),
(2, 'hey', 3, 1, 'yes', '2019-02-13 02:35:00', '2019-04-20 01:28:36'),
(3, 'hey there', 4, 1, 'yes', '2019-02-13 02:44:41', '2019-04-20 01:28:36'),
(4, 'Thanks for reaching out, how may we help you ?', 1, 3, 'no', '2019-04-04 03:20:00', '2019-04-04 03:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_data_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_fields_data_model_index` (`model`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_groups_model_index` (`model`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socials_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_from_foreign` (`from`),
  ADD KEY `users_chat_to_foreign` (`to`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_chat`
--
ALTER TABLE `users_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD CONSTRAINT `custom_fields_data_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `socials`
--
ALTER TABLE `socials`
  ADD CONSTRAINT `socials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD CONSTRAINT `users_chat_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
