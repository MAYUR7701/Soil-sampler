-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2024 at 06:08 PM
-- Server version: 10.11.6-MariaDB-1
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soil_sampler`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add captcha', 7, 'add_captcha'),
(26, 'Can change captcha', 7, 'change_captcha'),
(27, 'Can delete captcha', 7, 'delete_captcha'),
(28, 'Can view captcha', 7, 'view_captcha'),
(29, 'Can add sample', 8, 'add_sample'),
(30, 'Can change sample', 8, 'change_sample'),
(31, 'Can delete sample', 8, 'delete_sample'),
(32, 'Can view sample', 8, 'view_sample'),
(33, 'Can add station', 9, 'add_station'),
(34, 'Can change station', 9, 'change_station'),
(35, 'Can delete station', 9, 'delete_station'),
(36, 'Can view station', 9, 'view_station'),
(37, 'Can add sample station locator', 10, 'add_samplestationlocator'),
(38, 'Can change sample station locator', 10, 'change_samplestationlocator'),
(39, 'Can delete sample station locator', 10, 'delete_samplestationlocator'),
(40, 'Can view sample station locator', 10, 'view_samplestationlocator'),
(41, 'Can add sample test', 11, 'add_sampletest'),
(42, 'Can change sample test', 11, 'change_sampletest'),
(43, 'Can delete sample test', 11, 'delete_sampletest'),
(44, 'Can view sample test', 11, 'view_sampletest'),
(45, 'Can add station master', 12, 'add_stationmaster'),
(46, 'Can change station master', 12, 'change_stationmaster'),
(47, 'Can delete station master', 12, 'delete_stationmaster'),
(48, 'Can view station master', 12, 'view_stationmaster'),
(49, 'Can add blacklisted token', 13, 'add_blacklistedtoken'),
(50, 'Can change blacklisted token', 13, 'change_blacklistedtoken'),
(51, 'Can delete blacklisted token', 13, 'delete_blacklistedtoken'),
(52, 'Can view blacklisted token', 13, 'view_blacklistedtoken'),
(53, 'Can add outstanding token', 14, 'add_outstandingtoken'),
(54, 'Can change outstanding token', 14, 'change_outstandingtoken'),
(55, 'Can delete outstanding token', 14, 'delete_outstandingtoken'),
(56, 'Can view outstanding token', 14, 'view_outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-01-29 13:49:12.675743', '62780013-3861-4f18-8b88-fdc6a0732a3f', 'Storage Center', 1, '[{\"added\": {}}]', 9, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(2, '2024-01-29 13:49:22.649565', '3cb6c071-fe12-4a42-a872-dd694169fb62', 'A', 1, '[{\"added\": {}}]', 9, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(3, '2024-01-29 13:49:26.972526', '99a99826-0d46-429d-91c5-6c8f318d0d45', 'B', 1, '[{\"added\": {}}]', 9, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(4, '2024-01-29 13:49:33.589972', '3e9f0f68-c929-4d6f-9543-28b5517a80ee', 'C', 1, '[{\"added\": {}}]', 9, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(5, '2024-01-29 13:49:37.707418', 'a4a7ecd3-0387-4002-9ab8-94c3a9f395a1', 'D', 1, '[{\"added\": {}}]', 9, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(6, '2024-01-29 13:50:01.991881', '8fd6188d-3254-4bc6-8e28-52838156515e', 'Akash Yadav Storage Center', 1, '[{\"added\": {}}]', 12, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(7, '2024-01-30 13:27:40.795812', '32843ffb-5e04-4342-a82e-7adce68bb1a1', 'Sample Id: 32843ffb-5e04-4342-a82e-7adce68bb1a1 => Sample No: sdf', 2, '[{\"changed\": {\"fields\": [\"Top depth\"]}}]', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(8, '2024-01-30 13:41:54.152005', '32843ffb-5e04-4342-a82e-7adce68bb1a1', 'Sample Id: 32843ffb-5e04-4342-a82e-7adce68bb1a1 => Sample No: sdf', 3, '', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(9, '2024-01-30 14:30:09.186791', '45edc111-5423-4061-b5e0-ea76c7369db6', 'Sample Id: 45edc111-5423-4061-b5e0-ea76c7369db6 => Sample No: 1-1C', 3, '', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(10, '2024-01-30 14:30:09.187802', '97ba5ee9-0676-49c6-933c-912976ea5665', 'Sample Id: 97ba5ee9-0676-49c6-933c-912976ea5665 => Sample No: 1-1C', 3, '', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(11, '2024-01-30 14:30:09.188612', 'c8493b12-a2b1-42ac-add2-53a4d84a74dd', 'Sample Id: c8493b12-a2b1-42ac-add2-53a4d84a74dd => Sample No: 1-1C', 3, '', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(12, '2024-01-30 14:30:18.431417', '77104cc8-1235-47d5-800d-ae353f823a41', 'Sample Id: 77104cc8-1235-47d5-800d-ae353f823a41 => Sample No: 1-1B', 3, '', 8, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(13, '2024-01-30 14:33:00.180351', '4dd89e2f-f36d-4774-958a-fd52712cb51a', '4dd89e2f-f36d-4774-958a-fd52712cb51a - Locator: Sample Id: 221003d9-1261-4213-9132-635a4648cf4a => Sample No: 1-4 - Station: Storage Center - Completed: False Station: Storage Center - Completed: True', 2, '[{\"changed\": {\"fields\": [\"Remarks\"]}}]', 11, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(14, '2024-01-30 15:27:12.313965', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 1, '[{\"added\": {}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(15, '2024-01-30 15:35:08.476800', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 2, '[]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(16, '2024-01-30 15:38:14.716739', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 2, '[]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(17, '2024-01-30 15:38:21.239011', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 2, '[]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(18, '2024-01-30 15:56:17.409813', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(19, '2024-01-30 16:04:46.990415', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 2, '[]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(20, '2024-01-30 16:05:04.413521', '683e3770-4a1c-48c7-bdee-1937daf5d2ce', 'Harsh Kumar - harsh@email.com', 3, '', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(21, '2024-01-30 16:07:07.493019', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'Harsh Kumar - harsh@email.com', 1, '[{\"added\": {}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(22, '2024-01-30 16:34:24.607145', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'Harsh Kumar A', 1, '[{\"added\": {}}]', 12, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(23, '2024-02-26 05:40:05.496320', '687d25b9-40b5-457b-9a83-3fb83b89e167', 'Pranit - pranit@email.com', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(24, '2024-02-26 05:40:25.779065', '687d25b9-40b5-457b-9a83-3fb83b89e167', 'Pranit - pranit@email.com', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e'),
(25, '2024-02-26 08:51:13.803245', '687d25b9-40b5-457b-9a83-3fb83b89e167', 'Pranit - pranit@email.com', 2, '[{\"changed\": {\"fields\": [\"Can view\"]}}]', 6, '8fd6188d-3254-4bc6-8e28-52838156515e');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(7, 'soil_sampler', 'captcha'),
(8, 'soil_sampler', 'sample'),
(10, 'soil_sampler', 'samplestationlocator'),
(11, 'soil_sampler', 'sampletest'),
(9, 'soil_sampler', 'station'),
(12, 'soil_sampler', 'stationmaster'),
(6, 'soil_sampler', 'user'),
(13, 'token_blacklist', 'blacklistedtoken'),
(14, 'token_blacklist', 'outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-29 13:47:27.227656'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-01-29 13:47:27.261074'),
(3, 'auth', '0001_initial', '2024-01-29 13:47:27.391329'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-01-29 13:47:27.418617'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-01-29 13:47:27.424928'),
(6, 'auth', '0004_alter_user_username_opts', '2024-01-29 13:47:27.432834'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-01-29 13:47:27.437363'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-01-29 13:47:27.438449'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-01-29 13:47:27.442483'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-01-29 13:47:27.446046'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-01-29 13:47:27.449647'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-01-29 13:47:27.461574'),
(13, 'auth', '0011_update_proxy_permissions', '2024-01-29 13:47:27.464907'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-01-29 13:47:27.468191'),
(15, 'soil_sampler', '0001_initial', '2024-01-29 13:47:27.853764'),
(16, 'admin', '0001_initial', '2024-01-29 13:47:27.920633'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-01-29 13:47:27.935119'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-29 13:47:27.944152'),
(19, 'sessions', '0001_initial', '2024-01-29 13:47:27.969338'),
(20, 'token_blacklist', '0001_initial', '2024-01-29 13:47:28.038674'),
(21, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2024-01-29 13:47:28.058609'),
(22, 'token_blacklist', '0003_auto_20171017_2007', '2024-01-29 13:47:28.069274'),
(23, 'token_blacklist', '0004_auto_20171017_2013', '2024-01-29 13:47:28.109963'),
(24, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2024-01-29 13:47:28.132551'),
(25, 'token_blacklist', '0006_auto_20171017_2113', '2024-01-29 13:47:28.150997'),
(26, 'token_blacklist', '0007_auto_20171017_2214', '2024-01-29 13:47:28.271480'),
(27, 'token_blacklist', '0008_migrate_to_bigautofield', '2024-01-29 13:47:28.388366'),
(28, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2024-01-29 13:47:28.409163'),
(29, 'token_blacklist', '0011_linearizes_history', '2024-01-29 13:47:28.410117'),
(30, 'token_blacklist', '0012_alter_outstandingtoken_user', '2024-01-29 13:47:28.417090'),
(31, 'soil_sampler', '0002_alter_sample_top_depth', '2024-01-30 13:27:32.660950'),
(32, 'soil_sampler', '0002_remove_sample_project_no', '2024-02-25 12:23:57.119505'),
(33, 'soil_sampler', '0003_sample_project_no', '2024-02-25 12:24:20.122691'),
(34, 'soil_sampler', '0004_user_can_view', '2024-02-26 06:14:34.007506'),
(35, 'soil_sampler', '0005_sample_hash_value', '2024-02-26 15:06:59.556569');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8huxscbaxkf3yc8kvbk0xyr1jivh5wdm', '.eJxVjjkOwjAQRe_iGlvx2OOMKek5QzTjhbAokbJUiLuTSCmg_u89_bfqeF36bp3L1N2zOiuqOViirB2g115S0FSANAI5shjQYlGnX004Pcuwu_nBw200aRyW6S5mR8yxzuY65vK6HOxfoOe532wpWGsNCaL3LQCRBEaWGAg4SLJN6z3V7V-myDkW4oSpcQIQnPeI6vMFeLZAUg:1rUl3L:SxG9WYdNDfAmezF_zeB23SNhFCFCvX1Fmtyq8NYg22s', '2024-02-13 10:09:15.187191'),
('d707qj5j3shcygdcr8kp6bkyya5fk94r', '.eJxVjjkOwjAQRe_iGlteJrGHkp4zRDMem7AokbJUiLuTSCmg_u99vbfqaF36bp3L1N1FnVWh6F1qRQNy0ECFNTbgdCwcI3AKiUCdfjWm_CzD7sqDhtto8jgs053Njphjnc11lPK6HOzfQU9zv9kxVnHsbdMignWM3LqtxXuuNlYIIhxyzGIt4NaGySLmTLVhlmwhqM8Xwm1Aug:1rUr3o:tcclHl8JwoSx3tRm1SnAZPHAYwNwlPXOo3mN_roVlWg', '2024-02-13 16:34:08.494076'),
('i5msd3aecvogv30wdnmw2rsheii6q91l', '.eJxVjksOgzAMBe-SdYNwQhKny-57BmTHpvQjkPisqt69ILFo129m9N6mpXXp23XWqb2LORvsJAKiWO9CYxsu0aI6tMGhRwgxQFBz-tWYylOH3ZUHDbexKuOwTHeudqQ61rm6jqKvy8H-BXqa-81mhZQj1YXAefEgsWTVEhN0ySfpONduu6LIUoLfqIazesoOUuJAyXy-fhdAyg:1ree2k:KAERqD0wUGB1-a0Y_AHUY2bnqtn8KVgeuGtODJ3CU0w', '2024-03-11 16:41:30.875082'),
('jqgwm3qxt01xbi9hzo47wf9zx0n78aez', '.eJxVjDsOwjAMQO-SmUY4cZuYkZ0zVE7s0AJqpX4mxN1ppQ4wv8_btLwuXbvOOrW9mItRDg5iIxVS8hWypopqhCpoCgFT9JHRnH6zxPmpw97Kg4f7aPM4LFOf7K7Yg872Noq-rof7N-h47rba1VrTdhf00aXiEJByQzlI0RIBaOcugmYg8hGcByxCfGZP2giZzxfEz0BW:1reWUg:8Q4P_pHiob_QU5KBDNZCcoYQthV2WEDQteMOPtGym-I', '2024-03-11 08:37:50.874295'),
('qrgldnx0kl270zlet8jthh9620vnthwq', '.eJxVjjkOwjAQRe_iGlteJrGHkp4zRDMem7AokbJUiLuTSCmg_u99vbfqaF36bp3L1N1FnVWh6F1qRQNy0ECFNTbgdCwcI3AKiUCdfjWm_CzD7sqDhtto8jgs053Njphjnc11lPK6HOzfQU9zv9kxVnHsbdMignWM3LqtxXuuNlYIIhxyzGIt4NaGySLmTLVhlmwhqM8Xwm1Aug:1rUrzm:v030Dlu6MqV08vPQPtz9cmApGDwJK7qijIE-eEoPQhw', '2024-02-13 17:34:02.906753'),
('vrhlxy21kyis8vy8gl0g8iluq9omgk3i', '.eJxVjksOgzAMBe-SdYNwQhKny-57BmTHpvQjkPisqt69ILFo129m9N6mpXXp23XWqb2LORvsJAKiWO9CYxsu0aI6tMGhRwgxQFBz-tWYylOH3ZUHDbexKuOwTHeudqQ61rm6jqKvy8H-BXqa-81mhZQj1YXAefEgsWTVEhN0ySfpONduu6LIUoLfqIazesoOUuJAyXy-fhdAyg:1reDTh:ti5HdxrFIhkwQREczHGv-wrwQQoQIXK2PYLXjRVc3bA', '2024-03-10 12:19:33.895538'),
('w41bf02vmuypn1pudu8kw5004orsh2mc', '.eJxVjjkOwjAQRe_iGlvx2OOMKek5QzTjhbAokbJUiLuTSCmg_u89_bfqeF36bp3L1N2zOiuqOViirB2g115S0FSANAI5shjQYlGnX004Pcuwu_nBw200aRyW6S5mR8yxzuY65vK6HOxfoOe532wpWGsNCaL3LQCRBEaWGAg4SLJN6z3V7V-myDkW4oSpcQIQnPeI6vMFeLZAUg:1rURzy:x415AmJeaKFckasH2Peo7TAwR-WENEKCEV2Vj32OlS0', '2024-02-12 13:48:30.174397'),
('xqvymfipwzvc1zsz55kcj4em7rkpvh0v', '.eJxVzDsOwjAQRdG9uMaWE3vGY0p61hCNP0MCKJHyqRB7h0gpoH73vJfqeFv7blvq3A1FnRVSKC2kqL1NoD2EpCOT004SuUSxNhjU6Zclzo867rbcebxNJk_jOg_J7Ik51sVcp1Kfl6P9O-h56b8aSKxjlIJtaACoBmEKtTABemszCILzgDGKd95FwdxCEKmAwlBEvT-Nc0Bu:1reWds:MfK7S3yaVYkl3dqimP2wpNlmHgq_5UWBZYCOFhi21BM', '2024-03-11 08:47:20.484492');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_captcha`
--

CREATE TABLE `soil_sampler_captcha` (
  `id` uuid NOT NULL,
  `captcha_answer` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_captcha`
--

INSERT INTO `soil_sampler_captcha` (`id`, `captcha_answer`, `created_at`) VALUES
('ad85108f-0c87-4bd2-8067-01f9b9e8ef8e', 'AsR099', '2024-01-30 16:13:02.284487'),
('114d0053-c693-4fd9-95ab-053c66d9120a', 'BK2L1T', '2024-01-30 16:25:39.883530'),
('f9c104f6-c270-491a-9b4e-06ab5ca82db4', 'X5KecE', '2024-01-30 16:12:53.423051'),
('7605c50a-b9e7-430d-bc2e-0c95eae2aef9', 'caGDqX', '2024-01-30 16:12:25.949388'),
('dbe95477-843d-4b23-8dd6-0de395a112d6', 'V7Rgik', '2024-01-30 16:11:53.427089'),
('5628b3a7-9415-45f6-be7e-0ed53de264a6', 'SDUiHc', '2024-01-30 10:09:08.965810'),
('fd8395fd-b96a-4cc0-b644-0eea907059f9', '60kyg7', '2024-01-29 13:48:07.825788'),
('e2c929fc-9b82-467b-98c6-1294577396b2', 'wI1KzH', '2024-01-30 16:32:49.060994'),
('fba19e75-9800-4b4b-b3c7-12ea84024d5c', 'BIN4fz', '2024-02-25 12:52:17.258589'),
('5457aa88-43bc-41c8-a999-163dd70ae1cc', 'JnK1dO', '2024-02-26 08:47:16.976327'),
('72e6f228-6784-493d-a03b-18973d0229aa', 'Xs21Yk', '2024-01-30 10:09:08.667533'),
('d1acdb31-4378-49f5-80ae-1a789efb6c9f', '9eUL4K', '2024-01-30 16:09:53.957308'),
('d9d2bc79-1eb6-4327-9cc8-1b0b84fa8f6b', 'KY19I7', '2024-01-30 10:09:07.482361'),
('be5c8987-97f2-406c-85cc-25bf6ff7523c', 'Y6Birn', '2024-01-30 16:07:45.420154'),
('bbde5ebc-46d3-4a1c-8547-2b21ca58bf2c', 'GZTXQr', '2024-02-25 13:54:11.658033'),
('23a50d1b-1475-4f1a-8127-2b30dda9753b', 'MDEoPq', '2024-01-30 10:09:07.889582'),
('f3297a41-e9e0-4cc1-a89c-2c4b14633017', '09l8Ji', '2024-01-30 16:16:20.525784'),
('9f144133-b97b-4a48-bad5-35c9f6891cb7', 'jUFzb3', '2024-01-30 16:12:53.401244'),
('4832f405-9f1c-42ba-bcf1-35d90e289628', '8rWQWt', '2024-01-30 16:30:51.673300'),
('db79ab15-d975-4ead-b69e-36e31d6ef506', 'HnQtuV', '2024-01-30 16:33:09.727679'),
('4caffd89-d4cd-47fb-922f-49e873a6b3bc', '28T5Tb', '2024-01-30 16:16:23.165921'),
('82dca3b1-c6ad-4da9-a51d-4f7b6da0dd5b', 'q2uizv', '2024-01-30 16:30:51.654215'),
('022c5b50-a324-4301-a2e0-4ffc447a3d08', 'LfqlVN', '2024-02-25 13:54:11.657865'),
('3dcb7e27-8555-4cfd-a436-504bb7b8d0c3', 'IKPvrT', '2024-01-30 16:10:10.963488'),
('49c8bb19-132c-44de-a8c6-5107c691fce0', 'aFGrbf', '2024-01-30 16:11:40.312676'),
('ebd36d33-3f5a-4d68-9279-526c79d99943', 'qlC7Uh', '2024-02-26 05:38:19.558650'),
('92a8bcda-da41-4262-993a-53066677e766', 'LOCcBV', '2024-01-30 10:09:06.964072'),
('6f2a4737-d712-4628-bfcc-54f54f19b877', 'zM8Ek5', '2024-01-30 16:16:01.064533'),
('0667c578-edfa-4cc0-bc1a-565b1bec85ed', 'pxHQZ2', '2024-01-30 10:09:08.964561'),
('573c9d6b-ef64-48a9-9831-594cfc2b4a35', 'SiFD7e', '2024-01-30 18:06:23.645299'),
('1515eee8-28ec-4e0b-8e7a-5cfbdf527fbd', 'gHMbff', '2024-01-30 16:09:38.977647'),
('b1005445-4973-4343-9524-5f12febdfbcb', 'tq3cbx', '2024-01-30 16:30:44.476493'),
('dfa0c209-dfcb-4a5a-95b4-62e81cec7988', 'Y9AXc0', '2024-01-30 10:09:06.965983'),
('0db9bfe3-94b0-4821-815b-6481ab93c2a4', 'cg3wvW', '2024-01-30 16:12:53.403946'),
('1dec668d-1d1f-4f8b-b0d6-669e661896d3', 'aOo0PJ', '2024-01-30 16:27:31.124955'),
('171ffd77-b397-42fc-85a1-68f4a152c71d', 'mEb89t', '2024-01-30 16:32:20.994809'),
('477c9f3e-bc92-4527-aabc-6a1dc4c29d34', '2zJlJB', '2024-01-30 16:13:09.826543'),
('7dc23adc-4f72-4b51-a249-6a7fdef7a2b1', 'bAWkcC', '2024-01-30 16:23:03.024433'),
('fa4f472e-8f3e-49f6-9032-6dfa6fee0fa8', 'ol3v8M', '2024-02-25 12:19:23.521302'),
('058772c8-59af-405f-842d-6e0d3dbe0d02', 'G8lDbJ', '2024-01-30 16:33:17.973276'),
('5a86a598-f939-41b8-bac5-6e7e2abd0686', 'scrfCO', '2024-01-30 16:12:26.804080'),
('f9a8a3ee-e0b6-4923-8e41-70e2217c6c8a', 'Z7pE0Z', '2024-01-30 16:11:30.028371'),
('528df240-4db1-4ca9-a69b-744cfab6dcdc', 'mVa4V2', '2024-02-26 05:40:07.736945'),
('4e509ed8-b527-40a2-bd1e-74b934283fcc', 'eThf6y', '2024-01-30 10:09:07.483147'),
('a9c46ea5-fc57-4613-a9eb-74d0ce07dc0c', 'qqCakD', '2024-01-30 16:30:51.654738'),
('10bf12f7-71ad-46d3-92d1-77c84d9da5eb', 'sOXzvS', '2024-01-30 16:10:27.799695'),
('89d479a9-461d-44b3-9661-790ab9d02cb7', 'rbYZwD', '2024-01-30 07:52:04.243692'),
('97116e4f-dce3-438b-848d-79634c2230fd', 'SYrxLR', '2024-02-26 12:51:11.166957'),
('c209909a-3125-4035-8dea-7deb8ba5701d', 'lgfksV', '2024-01-30 10:09:06.517121'),
('299f4da2-128e-4ba9-81e5-8030b2c05ba7', 'ZHQZln', '2024-01-30 16:16:22.102759'),
('685118fc-5c55-4167-8534-821935dadf62', '7pjgz6', '2024-01-30 10:09:07.888975'),
('9663fcc6-47af-4beb-981a-822c7687bfcd', 'guIHHk', '2024-01-30 16:12:26.303456'),
('d245c550-787c-4a24-a610-862857af7a7a', 'HqKvCf', '2024-01-30 16:15:55.914238'),
('0cb44707-94b7-4d6a-b3b6-87d824443cf3', 'ddHTQN', '2024-01-30 16:31:58.908004'),
('64b05f32-bc14-4eb8-a871-889b994185b8', 'xI7fsm', '2024-01-30 16:34:03.201279'),
('2f71018b-df12-4e6f-9b30-8af1224097b4', 'IRuoPU', '2024-01-30 16:09:47.642853'),
('ce747761-819d-4040-972b-90280b3a5cb9', 'mh43Y3', '2024-01-30 10:09:06.504983'),
('641907a0-4a03-4ebb-a421-90348be23582', 'DALI6l', '2024-01-30 16:23:42.797785'),
('70ccd3d4-d832-44c2-969b-9192917609c2', 'Tf7aRY', '2024-01-30 10:09:06.249561'),
('be86e520-2783-4911-9f29-926713d3ea83', 't8W3ja', '2024-02-25 13:09:40.267763'),
('5d19ba79-ac14-498a-8455-9637e5b0bb40', 'NZSJ5R', '2024-02-25 12:52:17.257879'),
('f71d958c-3e60-433d-8095-96d8677b2e8b', '4RDYYs', '2024-01-29 13:48:07.825290'),
('d863688b-c94b-4962-9503-a75e0bed4d65', 'nIup4Q', '2024-01-30 10:09:08.366939'),
('4f3fbf29-2a31-4891-bfd2-a9603cb62378', 'FE0ceF', '2024-01-30 10:09:08.128105'),
('b92fc698-5834-4606-b5a1-b0ce35305162', 'fqBHX5', '2024-01-30 16:12:25.948836'),
('232bb45e-af97-42f8-be53-b130a9453f5b', '4J9g0M', '2024-01-30 16:25:39.882912'),
('ac3425d6-be16-418b-8d8b-b1c245198210', 'aDIzRN', '2024-01-30 16:26:55.271598'),
('821fa30a-ecf9-487d-92c4-b31b83831f66', 'a7U7ES', '2024-01-30 16:34:03.199788'),
('2250c9c4-85e5-4244-b2a1-b351bcff3c16', 'oUBBqX', '2024-02-26 05:37:27.237890'),
('d9ad46fd-b9fa-48e4-be7b-bcf7a38dd7c8', 'vFd1q0', '2024-01-30 15:28:04.785746'),
('c3689915-7e87-431f-8619-bddfc7de8196', 'ogTb1l', '2024-01-30 16:12:27.538272'),
('1d1e2448-a6c9-4161-8a31-c9a1e4724eed', '10AtVL', '2024-01-30 16:32:54.052081'),
('1c554c1f-a6fe-4912-8d83-cc403c6fc124', 'VktF5Y', '2024-01-30 17:32:20.321370'),
('3a06a83f-5c7c-4179-9e1a-ce1e6f19a436', 'xPXYI6', '2024-02-26 08:37:40.574714'),
('dd1044a2-6b4e-459d-aa15-d51306afcf0b', 'oiO6Cl', '2024-01-30 10:09:06.247476'),
('1c37f843-8db8-45ee-92d6-d65a12a8c04a', 'DMc7Dr', '2024-02-26 08:37:40.575279'),
('c884e01f-c833-4b19-9b0d-dd2d66323459', 'uostAN', '2024-01-30 16:15:56.465324'),
('a094d49c-85d1-49e7-890f-e0677fd80f7d', 'CoIkga', '2024-01-30 17:32:20.320123'),
('1f559096-bfcc-43a6-b22d-e982f68658f6', 'kCPvl4', '2024-02-26 12:50:39.291021'),
('f6b55b3b-ea98-4798-88c2-edaffccc9523', 'BTFsZt', '2024-01-30 16:29:48.285849'),
('13741b2b-3088-4039-a847-eef85362909e', 'TouSDX', '2024-02-26 08:47:16.975716'),
('1b3edc28-ff9f-48a8-87e7-f3cfa6b1e1e6', 'rink29', '2024-02-25 12:19:23.519470'),
('b54aebc0-cbba-4a3e-907a-f3eddff8b1f3', 'cmIPRw', '2024-01-30 16:32:21.009470'),
('9b38c242-4b9d-4890-b3d2-f96ae37da38e', 'hiLmU0', '2024-01-30 16:09:55.990434'),
('b86cbf40-8911-49c0-82a1-f9ccfe11ad26', 'aB0WAb', '2024-01-30 18:06:23.646075'),
('91e31c8c-56f3-457e-abd3-fcea24e04bb4', 'FK15Qs', '2024-01-30 16:11:42.850121'),
('e1455c9b-f43d-4e2b-b637-fe766b768252', 'gQ1hXj', '2024-01-30 16:16:20.017905'),
('1ae8943c-f2d8-442f-8787-ff3ef6d4cbcb', '90n3Cn', '2024-01-30 16:12:43.468626'),
('fe784568-61ab-4d7a-8b66-ff7ce720b442', 'QRxuxa', '2024-01-30 16:32:20.992818');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_sample`
--

CREATE TABLE `soil_sampler_sample` (
  `id` uuid NOT NULL,
  `sample_no` varchar(8) NOT NULL,
  `location` varchar(50) NOT NULL,
  `top_depth` decimal(5,3) NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `project_no` int(10) UNSIGNED NOT NULL CHECK (`project_no` >= 0),
  `hash_value` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_sample`
--

INSERT INTO `soil_sampler_sample` (`id`, `sample_no`, `location`, `top_depth`, `is_archived`, `created_at`, `updated_at`, `project_no`, `hash_value`) VALUES
('5ce51187-dc54-4925-844b-012d50baf185', '1-2', 'S22_KBD_GTK_01_PC', 1.850, 0, '2024-01-30 14:30:22.623640', '2024-02-26 15:14:55.562084', 123456, 'afd56c4de42e5ed434b2db404146ed742284efb54e1c7886df50138b99a99511'),
('8bab0789-5128-4237-a870-042c2858061e', '1-2', 'S22_KBD_GTK_01_PC', 1.400, 0, '2024-01-30 14:30:22.581321', '2024-02-26 15:14:55.569127', 123456, 'abc71c160b18ecb4503232c12549fda59a7bd16988731f84482f32e7617bcb0e'),
('facee714-ae6b-448f-bb5b-044084ac0c71', '1-2', 'S22_KBD_GTK_01_PC', 1.550, 0, '2024-01-30 14:30:22.590109', '2024-02-26 15:14:55.567471', 123456, '10979e8f98a6b34236a64e40370968df2f9b89a38c4e51377127449eda3d73cc'),
('f44704e2-6690-4fbe-b8c6-044e9eccc584', '1-4', 'S22_KBD_GTK_01_PC', 3.350, 0, '2024-01-30 14:30:22.748366', '2024-02-26 15:14:55.547689', 123456, 'ca58c4dff60e6be6397aa3131a53d6aa6c04664fd26046bb771eb6907d30184b'),
('d36c5af7-d08f-4c67-92a0-052ed00af73d', '1-2', 'S22_KBD_GTK_01_PC', 1.950, 0, '2024-01-30 14:30:22.642660', '2024-02-26 15:14:55.560280', 123456, '763f8f3998b4c127dbfa634d37dd28c659f474f14504e233a5108a4a17bd1cdf'),
('f1a4a71c-3339-42ca-b5d4-07018b2a33af', '1-1E', 'S22_KBD_GTK_01_PC', 0.800, 0, '2024-01-30 14:30:22.507241', '2024-02-26 15:14:55.578090', 123456, '2839076228962fd598968118dd32c40c2817799f738d665fcc7203608da5f301'),
('fd198fec-6890-43d2-9c10-0ac023cd13bc', '1-4', 'S22_KBD_GTK_01_PC', 3.700, 0, '2024-01-30 14:30:22.764549', '2024-02-26 15:14:55.544365', 123456, '6b97918a5c3751752ee736e0579d9331248d7e52493b82463653dd70219187ef'),
('c8967ed6-4eb3-48b7-8665-0b01a1c7fcfe', '1-2', 'S22_KBD_GTK_03A_PC', 1.100, 0, '2024-01-30 14:30:23.219892', '2024-02-26 15:14:55.481277', 123456, 'f22e4dd5699c144bf2cd98e650dccc91d9dd441ac776f0bea236417840f4642a'),
('87b8af45-4c92-48b2-9570-0b175bf48417', '1-4', 'S22_KBD_GTK_03A_PC', 3.800, 1, '2024-01-30 14:30:23.584014', '2024-02-26 15:49:44.310371', 123456, '438945b8a1825478fbec202caf3262cdaa84d7973f1cd81217bfa743f8e3cc17'),
('6a3aaec8-5808-4629-aaba-0bbd45d84ae4', '1-3A', 'S22_KBD_GTK_03A_PC', 2.000, 0, '2024-01-30 14:30:23.409446', '2024-02-26 15:14:55.462124', 123456, '7582a10636931ab35aa7d1fec467c514ed70298b0c79c5e553fb91fdd0de26d2'),
('5e388312-7642-4bf5-b0e4-0dcf3504ee58', '1-3D', 'S22_KBD_GTK_02_PC', 2.600, 0, '2024-01-30 14:30:23.085529', '2024-02-26 15:14:55.505226', 123456, '32ad5e72df5441a0e8700d9d24618deadbba11d382f6d6b70ce77de514c1a1a2'),
('c3486044-6189-463e-af0d-0fa732a010f8', '1-2', 'S22_KBD_GTK_02_PC', 1.550, 0, '2024-01-30 14:30:22.972473', '2024-02-26 15:14:55.518146', 123456, '5e907c6fddbf4650eef42e98e9dd7f38aa3cc1b81c63f32354bbf5ece7b541a6'),
('e11d9a75-b40d-43e9-92ec-0fb1ffcc7e61', '1-4', 'S22_KBD_GTK_02_PC', 3.250, 0, '2024-01-30 14:30:23.116439', '2024-02-26 15:14:55.498813', 123456, '1d496c78f51d9b0dda5210d3d7ddbd95eb689a8af03f15e3072dff759b819890'),
('2edb080a-8b3a-45d8-b5f0-0fbd41cc0daa', '1-2', 'S22_KBD_GTK_03A_PC', 1.650, 0, '2024-01-30 14:30:23.330082', '2024-02-26 15:14:55.468292', 123456, '3c5b0473aee4499f75164f1d23ac46a38d47874fcac69bf62ec824fbc54410f7'),
('32169dd0-a79f-44ea-a58d-10359448cf8c', '1-2', 'S22_KBD_GTK_03A_PC', 1.550, 0, '2024-01-30 14:30:23.299146', '2024-02-26 15:14:55.470423', 123456, 'eb3dbb0b8bfff13e81cf9b869b417228903510bccc5f92b5a4e311d810639bfd'),
('47eca2d6-c6b9-4073-ac18-103b777e57b1', '1-2', 'S22_KBD_GTK_03A_PC', 1.350, 0, '2024-01-30 14:30:23.268152', '2024-02-26 15:14:55.475526', 123456, '3302e3ec215eff8fc45bf925062ee9ad4f3c8b18c80829c069a655f53c756efb'),
('0a2a3efe-4e3d-4fc5-9a49-1113b4255267', '1-4', 'S22_KBD_GTK_03A_PC', 3.750, 0, '2024-01-30 14:30:23.564991', '2024-02-26 15:14:55.442686', 123456, '543791c028aed259c9ad29720c88fa376ef0843ee8dbe1e5b33b6753d848a825'),
('04fd954e-ba51-47a6-90c2-113a4ea8081c', '1-2', 'S22_KBD_GTK_03A_PC', 1.700, 0, '2024-01-30 14:30:23.355586', '2024-02-26 15:14:55.467177', 123456, 'a0d03004dc3316a660ae5a3c397a6d8fc4b37e4944123cd06e316c8675c23268'),
('93a9483f-79c4-453f-9a9f-121022ad6d76', '1-4', 'S22_KBD_GTK_03A_PC', 3.450, 0, '2024-01-30 14:30:23.530896', '2024-02-26 15:14:55.447398', 123456, '9826871686f8f34c4959ff4140aa2c5c279f4bb630eb3df9b1f0a7567f1d206d'),
('19832934-2677-4203-8d0e-139e73f7fa6a', '1-4', 'S22_KBD_GTK_01_PC', 3.800, 0, '2024-01-30 14:30:22.782288', '2024-02-26 15:14:55.542696', 123456, 'b2ecfb58a16263e0166e89c9d824633f457939b63f629e3d62ff646529657e3b'),
('0d6498f8-a880-4e14-a1e2-14386f33ea3d', '1-2', 'S22_KBD_GTK_01_PC', 1.150, 0, '2024-01-30 14:30:22.517455', '2024-02-26 15:14:55.574219', 123456, '6d1e4a07b12f54cf64afe402a6eeb7dacdce1d1fa84226f5303c313ee78404c6'),
('b5881ce6-af5d-44be-aa04-1cb5aa3bdb7a', '1-2', 'S22_KBD_GTK_01_PC', 1.450, 0, '2024-01-30 14:30:22.590728', '2024-02-26 15:14:55.566629', 123456, '2945b3d5172a6b9353e587165aade9e61f3b6ae5fca2127dd4bd9acbae85aaef'),
('ae37ca34-018e-439b-a2fc-1e33ffc8c65f', '1-4', 'S22_KBD_GTK_03A_PC', 3.400, 0, '2024-01-30 14:30:23.529364', '2024-02-26 15:14:55.448321', 123456, 'ed5353b83505f6adeca5bdf9ea47a18ace5911bb38dfd69f15f3676a98f02dd5'),
('9ceb5536-dcb2-4a0f-952f-207ef4ea00a5', '1-3C', 'S22_KBD_GTK_02_PC', 2.400, 0, '2024-01-30 14:30:23.057630', '2024-02-26 15:14:55.507730', 123456, '330f763011fcfcc2ed278a311308d2e4df47ae2daa4febee1ff91b26420e5512'),
('315b12f3-90a5-4273-8a52-232ee6e8a4dc', '1-2', 'S22_KBD_GTK_02_PC', 1.300, 0, '2024-01-30 14:30:22.931178', '2024-02-26 15:14:55.525762', 123456, '74f1239f18330a915119ffd6825ccd87f2f6701ff7690b59378991c9a0eeb96b'),
('1319e801-e3ff-4f2c-858a-23bc3b31e440', '1-4', 'S22_KBD_GTK_03A_PC', 3.150, 0, '2024-01-30 14:30:23.458362', '2024-02-26 15:14:55.455470', 123456, 'c32b6c13e11cda375fe78eeab2e96df4e6f2ddd5875548926a2bc2a97307ceb1'),
('91d792af-1de6-457e-bc7a-251a44ce85b7', '1-4', 'S22_KBD_GTK_03A_PC', 3.000, 0, '2024-01-30 14:30:23.447064', '2024-02-26 15:14:55.456775', 123456, 'b2405a4f2b8d3484abfc375fe35f134338ce16380a85ace17b07eabc57cb2fdf'),
('f892629c-0965-4fc0-877c-2544ecffd23b', '1-2', 'S22_KBD_GTK_01_PC', 1.900, 0, '2024-01-30 14:30:22.638761', '2024-02-26 15:14:55.561197', 123456, '07974bee4e09b49b1a9c6d0ef50874b2b9630fb76cc3a0d24280d880cf9e6fed'),
('53287ae0-f3b3-4bc7-957d-29f8a6148cb0', '1-4', 'S22_KBD_GTK_02_PC', 3.000, 0, '2024-01-30 14:30:23.074661', '2024-02-26 15:14:55.506095', 123456, '4e461e3a3f72ce3514ff4696d1df332dc139f9bd1fc8e317f63382fbc71d2147'),
('6cf2c600-e84d-4f47-89fe-2b9c0edbb2c7', '1-3A', 'S22_KBD_GTK_01_PC', 2.000, 0, '2024-01-30 14:30:22.665905', '2024-02-26 15:14:55.557815', 123456, '01269658f0bbd439f601b625490fbe488d055fe25631f3f78ce46313150be085'),
('2aa39464-4863-4aeb-8163-2c9a0f99abde', '1-1D', 'S22_KBD_GTK_02_PC', 0.600, 0, '2024-01-30 14:30:22.865501', '2024-02-26 15:14:55.534129', 123456, '2e8c1df8278ace3838e08308610c1370e9c5a8443e4066d9b169937a8622905d'),
('90d2dfbc-4c0a-4d6c-b136-2d678e66c1ac', '1-2', 'S22_KBD_GTK_01_PC', 1.200, 0, '2024-01-30 14:30:22.539003', '2024-02-26 15:14:55.570836', 123456, '830820f2de0ed0e5c7fd28d4397e6b361780079af97f354a7667b1d590f11834'),
('ec5e3efd-e62b-418a-b0bc-2f627ba8a09c', '1-2', 'S22_KBD_GTK_02_PC', 1.150, 0, '2024-01-30 14:30:22.916614', '2024-02-26 15:14:55.528206', 123456, 'c3a2896601b6c486d8c432a9f2c94cc7bf5b2f285fb9017e251f3170b38e8f1a'),
('60ac8ad6-aa67-44bc-9947-335940d7fdaf', '1-2', 'S22_KBD_GTK_02_PC', 1.200, 0, '2024-01-30 14:30:22.931364', '2024-02-26 15:14:55.523756', 123456, '5244092ea3bb293be8a9d754f5c0b6b6d3c0f73c5a414bc19a38630593e9f257'),
('63dd0e58-7834-41c8-935f-341778e6b521', '1-2', 'S22_KBD_GTK_03A_PC', 1.500, 0, '2024-01-30 14:30:23.296929', '2024-02-26 15:14:55.472555', 123456, '47495373edc2566cfa83d214e727afea12368d6aed24c7efe659ed75c222a951'),
('81552452-011e-4af5-9e79-3560d65c341b', '1-4', 'S22_KBD_GTK_01_PC', 3.450, 0, '2024-01-30 14:30:22.759245', '2024-02-26 15:14:55.546033', 123456, '50eb68e38adb427df3e0345818790d38179be2c2230030a07ab3ef5f9826b3a0'),
('9c10a5b3-1062-417d-a658-36fff83d1263', '1-4', 'S22_KBD_GTK_03A_PC', 3.900, 0, '2024-01-30 14:30:23.579099', '2024-02-26 15:14:55.439805', 123456, '32a34d4009993f05a488a14b7b7a442606d3f267879371e00bf4aadbebe5db20'),
('4e3eb12c-0782-46bb-bafb-3c22038a0b7e', '1-2', 'S22_KBD_GTK_02_PC', 1.450, 0, '2024-01-30 14:30:22.960624', '2024-02-26 15:14:55.519654', 123456, '21eddcf90b0ef452f2f91d671e95a3aaa65f4a3ce7410b288acdcdefaad6ded9'),
('48b97b55-dbac-43c3-841e-3f0ca73db4e5', '1-2', 'S22_KBD_GTK_01_PC', 1.650, 0, '2024-01-30 14:30:22.595470', '2024-02-26 15:14:55.565801', 123456, 'c5f870413f1e3ed6de753f746b2c40b8441f734cdece1bc60b66d7516e7fd13b'),
('513cb13b-35a0-4b53-bc0a-4073d10c290f', '1-3A', 'S22_KBD_GTK_02_PC', 2.000, 0, '2024-01-30 14:30:23.027164', '2024-02-26 15:14:55.509951', 123456, '898383a42eaae830174681a698b2084c5b6bf8cb7b777a6a476978a538566cac'),
('e31f3205-fd40-4f24-a0eb-40a9f4069e54', '1-2', 'S22_KBD_GTK_02_PC', 1.600, 0, '2024-01-30 14:30:23.000676', '2024-02-26 15:14:55.513405', 123456, '17661afcfaa3b0f44254be4d277680bbd56ac7dece4c2cc6a9fe830f4bda505e'),
('f0e3a3fa-f35a-4824-ae57-4217e7d55855', '1-4', 'S22_KBD_GTK_02_PC', 3.510, 0, '2024-01-30 14:30:23.167919', '2024-02-26 15:14:55.491050', 123456, '13c08aa5a2be4346557c1406100a6bb3759bbb679db6b72d001dbb6c43b857e1'),
('bddda871-30b3-4313-9c88-4220d2352009', '1-4', 'S22_KBD_GTK_03A_PC', 3.300, 0, '2024-01-30 14:30:23.503379', '2024-02-26 15:14:55.450322', 123456, '48647747cb64f3e70132f93c9c270981d13d20bd61a565ba892f1439bbc2ac32'),
('04bf573d-d094-4580-a79c-4411c7ae32a8', '1-1A', 'S22_KBD_GTK_01_PC', 0.000, 1, '2024-01-29 13:53:38.055194', '2024-02-26 15:14:55.580627', 123456, 'c7d7fab8d705024639eed8715a5b7c2234bcdc7b7a4d8cfb0b384ee8fc2a8da8'),
('8b25f2ed-db2a-42d5-baae-473199c36a14', '1-4', 'S22_KBD_GTK_01_PC', 3.400, 0, '2024-01-30 14:30:22.752457', '2024-02-26 15:14:55.546883', 123456, '8dc519db19b9950625db404d2eef93375c4f6ca53fdb27775a5b1992315d89f6'),
('5fc817df-b783-4a99-8e73-5112192a4de9', '1-4', 'S22_KBD_GTK_02_PC', 3.100, 0, '2024-01-30 14:30:23.088289', '2024-02-26 15:14:55.504429', 123456, '0ed8d46b2ea2115b967af7571db9c13377c95c147e6858278769d7f7c7e967a0'),
('d31e2cd9-3bd6-4dc6-9851-53c7a05d619d', '1-4', 'S22_KBD_GTK_01_PC', 3.150, 0, '2024-01-30 14:30:22.701443', '2024-02-26 15:14:55.551733', 123456, 'e797b7463fda31ee0ca4b39c4000ea30e8e857c0c800931e6fcd3872e2debba2'),
('c6c98b0a-d2a6-449f-85b4-588d6395f6b6', '1-2', 'S22_KBD_GTK_03A_PC', 1.600, 0, '2024-01-30 14:30:23.301327', '2024-02-26 15:14:55.469113', 123456, 'a52d5f9e46fa5171be1b563444c2588784976ec5baeca1aa067052de673bd141'),
('3545b06c-325e-4113-85a6-628649646368', '1-4', 'S22_KBD_GTK_02_PC', 3.350, 0, '2024-01-30 14:30:23.142168', '2024-02-26 15:14:55.494670', 123456, '5fb6c8663f10a0c78dd577831b2c1b0dbdb1c160e21365e6bdfcba190a43814f'),
('221003d9-1261-4213-9132-635a4648cf4a', '1-4', 'S22_KBD_GTK_03A_PC', 4.200, 1, '2024-01-30 14:30:23.584235', '2024-02-26 15:14:55.434677', 123456, '2efb7e6512e9daebf71ad5d70b5346afb2bc6f36ce70b4b09ad3ba36f8de388a'),
('ab6f8a2a-99c9-4d02-9a64-63c8517c5c00', '1-4', 'S22_KBD_GTK_03A_PC', 3.550, 0, '2024-01-30 14:30:23.531829', '2024-02-26 15:14:55.446559', 123456, '49fa7d412ddae6ad6dfe0774010e729c8b76ef9fdcc7573ecc5a7aefb37d9e4b'),
('58d0fd5d-4c7d-461a-a875-63f1110e27cb', '1-1C', 'S22_KBD_GTK_01_PC', 0.400, 0, '2024-01-30 14:30:22.508155', '2024-02-26 15:14:55.576334', 123456, '300db10c10fd53877663cca8bce64ed5df25c591f47febf7470f7a23a6471f6a'),
('ad9fb261-125f-4317-b532-6476cc63a480', '1-2', 'S22_KBD_GTK_01_PC', 1.800, 0, '2024-01-30 14:30:22.606786', '2024-02-26 15:14:55.564977', 123456, '00df1abb63d181806135cfa5fa662bf08c45cfca5f9f57062056b2f5f3ead9f5'),
('a177493c-955d-443d-ae44-656eaac9a321', '1-2', 'S22_KBD_GTK_03A_PC', 1.800, 0, '2024-01-30 14:30:23.380999', '2024-02-26 15:14:55.464752', 123456, 'd65e8a1c5002cb2c5ebafe6a91598a3708d34076b1c7d1912d92af03e43ac2a5'),
('90f22653-8fe3-4e6a-98f4-657dd0947664', '1-3E', 'S22_KBD_GTK_01_PC', 2.800, 0, '2024-01-30 14:30:22.693821', '2024-02-26 15:14:55.554303', 123456, '49a449ee51eb79399a4672e9f327d9a5c84d91aed5bb00736538be1247cf78ee'),
('358b74af-be16-4eff-878d-65fe3e64534c', '1-4', 'S22_KBD_GTK_03A_PC', 3.700, 0, '2024-01-30 14:30:23.571217', '2024-02-26 15:14:55.441405', 123456, '2a16205e7592a107e31650805b31c806ac0237b16792211a880475bd29fb8120'),
('054bb09b-86da-480a-98e7-680168deb060', '1-4', 'S22_KBD_GTK_02_PC', 3.200, 0, '2024-01-30 14:30:23.104363', '2024-02-26 15:14:55.501431', 123456, 'd8e72c0c52e18f7f2bc4651d8a1af7db43088fe8fea2682112a33920a7c8d150'),
('7ded02e2-f2ee-4d75-a573-6a5a16d9a296', '1-2', 'S22_KBD_GTK_02_PC', 1.700, 0, '2024-01-30 14:30:22.989343', '2024-02-26 15:14:55.515564', 123456, 'ab42cdecb839b9a6d1c39ddc1cd442cb78ad74ad52e4a5ba478a6350a656ea5d'),
('e84055e3-d1ba-494a-9ee5-6db790f7334f', '1-4', 'S22_KBD_GTK_01_PC', 3.250, 0, '2024-01-30 14:30:22.729175', '2024-02-26 15:14:55.549731', 123456, 'e59cc8f7fdc91bfdd52eeb15bd5ac78f6d5e3aec27dc38556ad6dc882c37c77b'),
('59d8520d-9af3-402b-b598-6efcadee4f70', '1-4', 'S22_KBD_GTK_03A_PC', 3.100, 0, '2024-01-30 14:30:23.471133', '2024-02-26 15:14:55.454592', 123456, '9bcd0bf929924fa1d4e21c438b079da373750fdbb173c88e9fac2ab29bccce7e'),
('65575282-a267-49d4-91d2-7358b0b0dc53', '1-5B', 'S22_KBD_GTK_01_PC', 4.200, 0, '2024-01-30 14:30:22.830125', '2024-02-26 15:14:55.537807', 123456, '851a8a45c748e0973316338e743d066be5df4ca88df9e077dab82cb31436be4d'),
('6adaac36-8591-4f8b-aaa1-760befbf18c1', '1-2', 'S22_KBD_GTK_02_PC', 1.250, 0, '2024-01-30 14:30:22.927778', '2024-02-26 15:14:55.526950', 123456, 'f8dd5f44c34828ed939ca7f66c4752497c4dcc475641420885b8041d54e6bc03'),
('e41d9fd4-7814-490b-a529-77e191d1aadf', '1-2', 'S22_KBD_GTK_03A_PC', 1.750, 0, '2024-01-30 14:30:23.374421', '2024-02-26 15:14:55.465940', 123456, '8ad3087dc80952ea405984c5ec29c9ad4a6eb785e6b81b1c06707fec312cb917'),
('7cfe1ca0-ed24-4105-9f1a-78fecaaa7f5c', '1-2', 'S22_KBD_GTK_02_PC', 1.350, 0, '2024-01-30 14:30:22.950590', '2024-02-26 15:14:55.521108', 123456, '7043eaab0f348a0063734cb7bfce9a19506a237d5e43ae61d34dbeea749e25fc'),
('d0764bcc-663c-4cb5-aa92-7a1a926b4183', '1-1B', 'S22_KBD_GTK_02_PC', 0.200, 0, '2024-01-30 14:30:22.873512', '2024-02-26 15:14:55.531604', 123456, 'bc903ba26af6bfb86be13ea94c7a680bf1e5c6b88e6db6a50425211b2b78031a'),
('57f75276-5d6d-4e24-a392-7acd640de9ba', '1-3E', 'S22_KBD_GTK_03A_PC', 2.800, 0, '2024-01-30 14:30:23.437870', '2024-02-26 15:14:55.457903', 123456, '54638dbe9c6757ef41c4148600f3cfe2c6488c7972557538c1463d1c3433d3b8'),
('33853aa8-f25b-4f3b-9755-7e456f3a9a7b', '1-2', 'S22_KBD_GTK_02_PC', 1.100, 0, '2024-01-30 14:30:22.903326', '2024-02-26 15:14:55.529074', 123456, '89a497718c66b999d85e766f3b6e64dd206c072146df39bca14bb023106bdaef'),
('e5360a0f-0710-43c6-a25d-7e99a48b3a65', '1-2', 'S22_KBD_GTK_03A_PC', 1.950, 0, '2024-01-30 14:30:23.388209', '2024-02-26 15:14:55.463837', 123456, '1c22620279ce7c33e59e14cc14209b99e56271077109e7c640208373c8c2d34a'),
('eb78cf7c-2484-4673-82ec-817e89f3bb14', '1-4', 'S22_KBD_GTK_01_PC', 3.550, 0, '2024-01-30 14:30:22.779250', '2024-02-26 15:14:55.543552', 123456, '88f9a93c879d97b3c862de4e5057a3d258bfb62cb8623766f92d67de9a061470'),
('d8b363ac-1a49-4a7f-9852-83c755feb47f', '1-2', 'S22_KBD_GTK_02_PC', 1.650, 0, '2024-01-30 14:30:22.978006', '2024-02-26 15:14:55.516424', 123456, 'a13a5b912e8c80ec9cc6b9361778b4a656956d3c2a9897bbc3d39ccce0c074fa'),
('48f7a8fc-6fda-4055-a203-8495a4c814f3', '1-4', 'S22_KBD_GTK_03A_PC', 3.200, 0, '2024-01-30 14:30:23.479139', '2024-02-26 15:14:55.452562', 123456, '7ddb836e5478a3551971a12614eb3cd7ab73c6da5ba6ece2f660462d1ab38f20'),
('66d8a6ae-8557-4375-b59a-84df2d40246d', '1-5A', 'S22_KBD_GTK_01_PC', 4.000, 0, '2024-01-30 14:30:22.840640', '2024-02-26 15:14:55.536986', 123456, '8efd6b0fcba76c38047f5781cbd0cdbc05d8d991a76f80a4424fefe0b3d898d1'),
('a930cb39-f605-4ce2-ba1a-88d414f15932', '1-2', 'S22_KBD_GTK_03A_PC', 1.150, 0, '2024-01-30 14:30:23.229642', '2024-02-26 15:14:55.480392', 123456, '4ba8ba2b7f5df6419011c34b038674ae10249e1a316c1ac9fb0f38ae6d93aa41'),
('fe2c508c-6ff1-4c75-945d-8b16f3623e52', '1-2', 'S22_KBD_GTK_03A_PC', 1.200, 0, '2024-01-30 14:30:23.239622', '2024-02-26 15:14:55.479458', 123456, '1b2468dc3ee5d910321e49c3f59764f15cf3fa2f474917119bf380eae6d0c1ae'),
('686b29af-8008-44aa-903e-8c31c92c1d78', '1-1E', 'S22_KBD_GTK_02_PC', 0.800, 0, '2024-01-30 14:30:22.874685', '2024-02-26 15:14:55.530800', 123456, '9bc7068f709731c1ba25c69311ee0f2ed31f18b618a50241c591e7f00b6d9fbb'),
('a73d8dbf-b2f0-449b-887d-8d2c924cff82', '1-2', 'S22_KBD_GTK_03A_PC', 1.900, 0, '2024-01-30 14:30:23.390406', '2024-02-26 15:14:55.462989', 123456, '5836abc49d4386db1fc060aaa9ed6cb2c1e61625a8b08051bb7577681803dc5e'),
('94153c6a-3765-4d44-a192-8de651d400bd', '1-2', 'S22_KBD_GTK_03A_PC', 1.250, 0, '2024-01-30 14:30:23.259238', '2024-02-26 15:14:55.476842', 123456, 'cefaed45346723cc5e04c0003ec3aed81d45647c6be8fa0737b13d4c5d8234f2'),
('9eaa3242-164e-46e1-b8d0-8f783bd2283e', '1-3B', 'S22_KBD_GTK_01_PC', 2.200, 0, '2024-01-30 14:30:22.661518', '2024-02-26 15:14:55.558614', 123456, 'c740c0b8b19a60e4aa3ad65009f8f01c3e9404a874305e098517fa06c2e1e370'),
('d8ce1dd5-cdbf-4a67-926c-93c5df632b74', '1-2', 'S22_KBD_GTK_01_PC', 1.250, 0, '2024-01-30 14:30:22.555555', '2024-02-26 15:14:55.569992', 123456, 'dfe362b487af66d2cedadea314eb81a0163a8d94bc1ed6c9aed00d4fa2ccaf4e'),
('e166ee11-83d0-4a41-a402-93d67afb532b', '1-4', 'S22_KBD_GTK_01_PC', 3.100, 0, '2024-01-30 14:30:22.692857', '2024-02-26 15:14:55.555133', 123456, '2ae013d3b040161fd2f3a2023f3c6b83e3a7bb545eeff4be66d14ab895a8bdf6'),
('5094f03d-3892-4fb9-b21c-956d058f67ef', '1-2', 'S22_KBD_GTK_02_PC', 1.950, 0, '2024-01-30 14:30:23.016700', '2024-02-26 15:14:55.510872', 123456, 'ae3818932f2a188b87116527825d673dcb5baa7065568a5bae8be7155164b770'),
('c866445e-35bc-46cf-9e42-98679d194d61', '1-1D', '1-AD', 1.210, 1, '2024-02-26 16:35:06.021244', '2024-02-26 17:14:10.490368', 65423321, '696aba406aff3cc80def071b926726f1793e6ee5e37d344dbde4ba09cc5c4f99'),
('22e22075-2187-40b8-ab3d-98b01a808405', '1-5B', 'S22_KBD_GTK_01_PC', 4.260, 0, '2024-01-30 14:30:22.845959', '2024-02-26 15:14:55.536133', 123456, '610117ebab7342e46ac51dd8e0548d180774f55c203bccda046ed12b5b754a5c'),
('24ac9e3e-334e-45f3-85da-9c54fc165aae', '1-2', 'S22_KBD_GTK_03A_PC', 1.050, 0, '2024-01-30 14:30:23.207976', '2024-02-26 15:14:55.483256', 123456, '0e4076ead8d990c5c60106f6887d95e1b463dd1d5e8340d7742b7ab65d064668'),
('da61824d-e45f-4924-b275-9fd642907ead', '1-4', 'S22_KBD_GTK_01_PC', 3.750, 0, '2024-01-30 14:30:22.794028', '2024-02-26 15:14:55.541875', 123456, '82ffccc62bb8abdde2b6fc848ccbf0fa69343b70977ec8d62a747ead6d480984'),
('a241a2b5-8ce5-404e-944f-a080a10779b0', '1-3B', 'S22_KBD_GTK_02_PC', 2.200, 0, '2024-01-30 14:30:23.048249', '2024-02-26 15:14:55.508616', 123456, '01cc606f7da2961353381d50603980e1d765bd351c7a39ea200dea7c840199f9'),
('6f0db745-a3ef-4efc-bd88-a090242efbbf', '1-2', 'S22_KBD_GTK_02_PC', 1.400, 0, '2024-01-30 14:30:22.944423', '2024-02-26 15:14:55.522756', 123456, 'e9c79a32625cb793eaf2dae7ea8d506bf7038a6c698626d1f74d0b762ec41814'),
('e9ac223f-d4fe-47b7-8f01-a4bf7301cc15', '1-4', 'S22_KBD_GTK_03A_PC', 3.350, 0, '2024-01-30 14:30:23.506690', '2024-02-26 15:14:55.449479', 123456, '8f9ab5d2304d59c3c3bf73c369c6bdcf3b5b7604b0a6a3bf06cbcbb59f9f523c'),
('9bce36f7-3c8e-48d1-a9cd-a8b6b349a359', '1-2', 'S22_KBD_GTK_01_PC', 1.100, 0, '2024-01-30 14:30:22.503519', '2024-02-26 15:14:55.578935', 123456, '19b48d4a86d783b89b3ccc3b28d493ce71f476d3e291b11fdad22b9d47546db4'),
('3e343555-ee87-45a3-b9c3-a983fe7476e3', '1-2', 'S22_KBD_GTK_01_PC', 1.000, 0, '2024-01-30 14:30:22.529390', '2024-02-26 15:14:55.572562', 123456, '4f8ecad1560a1e67bf584ff8826df34998d0512d417c2a4f7a524ebdb197ad32'),
('343d96a3-9131-4774-a0dc-a9e89a68a093', '1-4', 'S22_KBD_GTK_02_PC', 3.050, 0, '2024-01-30 14:30:23.097812', '2024-02-26 15:14:55.502551', 123456, 'b0061dbcddf0c976cc31fea1935f68975408721f02c798f33af6cc837c53fb55'),
('64c3003e-272f-42b6-b73a-aa65566b88a2', '1-3E', 'S22_KBD_GTK_02_PC', 2.800, 0, '2024-01-30 14:30:23.062290', '2024-02-26 15:14:55.506932', 123456, '9846528e74c73201a21c672833208a69f75a889437d8d98f1f0ec8a67230fa6f'),
('077eb906-2ac4-49dc-9af5-aea4ff8cb635', '1-3D', 'S22_KBD_GTK_03A_PC', 2.600, 0, '2024-01-30 14:30:23.430992', '2024-02-26 15:14:55.458726', 123456, '98128272b0a85d1e373e623ec7de705643d300115386579105dc11cae9cbcd45'),
('d2053df3-c22e-4546-8f3b-b01fd9684d25', '1-2', 'S22_KBD_GTK_01_PC', 1.700, 0, '2024-01-30 14:30:22.622892', '2024-02-26 15:14:55.563305', 123456, '23e65d7774ce6136b68610a7dd112934e71a96f71efd7ee43d8ade093e2b0425'),
('47c7387e-e442-4507-a9f3-b5669c8c1551', '1-2', 'S22_KBD_GTK_03A_PC', 1.300, 0, '2024-01-30 14:30:23.258842', '2024-02-26 15:14:55.478249', 123456, '25463b3657b783e057f3123780bae2b8658569e229cbed115039ce6d8b47f7d7'),
('558b64a0-db8e-44e4-b057-b5e4640337af', '1-4', 'S22_KBD_GTK_01_PC', 3.650, 0, '2024-01-30 14:30:22.762528', '2024-02-26 15:14:55.545199', 123456, '0607d2344ac1908361f3aced546a0515d4d7c81b0fdf9415b21813ca0cba37fc'),
('d1204fa6-c53d-4d5a-8193-b6421630c321', '1-2', 'S22_KBD_GTK_02_PC', 1.750, 0, '2024-01-30 14:30:22.997063', '2024-02-26 15:14:55.514878', 123456, '2eb619cb362c3f70dbec1b258eb7cb78aa8a70472ceb0ae818dbede141e473ae'),
('f64cfa3e-cdd8-4452-865b-b6dd4de886ca', '1-3B', 'S22_KBD_GTK_03A_PC', 2.200, 0, '2024-01-30 14:30:23.415370', '2024-02-26 15:14:55.460347', 123456, 'e61e6acfc931e277b1b9423f00d087f28818df9abbccbaf9d25b549e9ec7b172'),
('35437f88-2de0-48c4-97ab-b93109ef90da', '1-1C', 'S22_KBD_GTK_02_PC', 0.400, 0, '2024-01-30 14:30:22.870534', '2024-02-26 15:14:55.533212', 123456, '5256213042ff01e3b61da4126c195d101eb4c11a678d120542043bcc07db6f53'),
('af29d3b2-ec9d-4996-9857-c1fbb1d04ed8', '1-4', 'S22_KBD_GTK_01_PC', 3.000, 0, '2024-01-30 14:30:22.695662', '2024-02-26 15:14:55.553437', 123456, 'ee915e6b1006cf496ae8b68e507bcddde80dba6b524badbe65c0dc5a8947cfbe'),
('6f6f06dc-ce4a-496f-97ba-c3a9716e9d4c', '1-4', 'S22_KBD_GTK_01_PC', 3.300, 0, '2024-01-30 14:30:22.736161', '2024-02-26 15:14:55.548477', 123456, 'fc4e7cdc0294f750bb6ba18c3300147e4cb23e80e8f2a7d12e68a483f3d51471'),
('f54a3c31-8b34-4feb-8a32-ca090b3103ef', '1-4', 'S22_KBD_GTK_01_PC', 3.950, 0, '2024-01-30 14:30:22.819505', '2024-02-26 15:14:55.538543', 123456, '8dd023d78dcedebc9d22d92d4101ff884e149760ccd3cc92d367f78afeef1e86'),
('2620e383-13ab-4d80-b7c9-cb9dd87122f7', '1-2', 'S22_KBD_GTK_03A_PC', 1.000, 0, '2024-01-30 14:30:23.202903', '2024-02-26 15:14:55.484587', 123456, '70ef6e1a06d56daa58ddc5b163555f3ad495524660c950e459f086ef178fb4b7'),
('3a6ab216-f71f-4493-a70e-cc5933b0ad8e', '1-4', 'S22_KBD_GTK_02_PC', 3.300, 0, '2024-01-30 14:30:23.125068', '2024-02-26 15:14:55.496138', 123456, '1b7c1f07a35bae348cb8e6f38a03e7ae84e9844520717051f888baa36fdfd64c'),
('fa80ac80-75a0-48ef-8ab6-cf24c2464032', '1-2', 'S22_KBD_GTK_02_PC', 1.900, 0, '2024-01-30 14:30:23.013462', '2024-02-26 15:14:55.512546', 123456, 'b3ded774a8fe3401b3cd482db5e1a5ee5f8c90ec486378615bbb7aa28c3c529d'),
('5bd5deb3-d262-431d-9df6-d311003fdf80', '1-4', 'S22_KBD_GTK_01_PC', 3.200, 0, '2024-01-30 14:30:22.698330', '2024-02-26 15:14:55.552582', 123456, '3938112fa8bc8ae9a79affb04e96a4a2f002dc66db0fbe3efc8cd1ef362548a8'),
('b5f0909d-0e90-49e0-aaad-d3332cc0430a', '1-1C', 'S22_KBD_GTK_01_PC', 0.400, 0, '2024-01-30 14:30:22.508351', '2024-02-26 15:14:55.575073', 123456, '300db10c10fd53877663cca8bce64ed5df25c591f47febf7470f7a23a6471f6a'),
('dc249683-a422-404c-b9a2-d3c440f3500f', '1-4', 'S22_KBD_GTK_03A_PC', 3.050, 0, '2024-01-30 14:30:23.474047', '2024-02-26 15:14:55.453755', 123456, 'f132dd42a97ef8760ee4e467e2b87e46996835c31b5faf2b541e73aab8ec26cd'),
('cddf5b5b-9be9-426f-8fcf-d3dceca811d7', '1-2', 'S22_KBD_GTK_02_PC', 1.800, 0, '2024-01-30 14:30:23.013853', '2024-02-26 15:14:55.511699', 123456, 'ca5033ebd46ca646b41df6f94385e40d78d58f049cfa286977294c958d00539a'),
('dda89006-bc19-4eef-bad3-d4f76364c87c', '1-3C', 'S22_KBD_GTK_01_PC', 2.400, 0, '2024-01-30 14:30:22.676101', '2024-02-26 15:14:55.556966', 123456, '7d831b82181cfded6cffd437a66b9cd1d1f79b9730a6a1440931800bb44dcaf4'),
('46429675-a28e-4350-ad01-d53708b35384', '1-3D', 'S22_KBD_GTK_01_PC', 2.600, 0, '2024-01-30 14:30:22.686384', '2024-02-26 15:14:55.556075', 123456, '69394748c2be745a77ac459d8a393e241aa2da470f98ce2bdccead090fbda363'),
('15cdd246-a73b-4757-8db4-d5c035e07444', '1-1A', 'S22_KBD_GTK_02_PC', 0.000, 0, '2024-01-30 14:30:22.850243', '2024-02-26 15:14:55.534967', 123456, 'ff51f492962a2575de54003884ebe9db839d21821548d772db8503d0bd6bbfd7'),
('a3e4c48f-cd26-4e6e-8157-d7ed8af05fab', '1-1D', 'S22_KBD_GTK_01_PC', 0.600, 0, '2024-01-30 14:30:22.494621', '2024-02-26 15:14:55.579788', 123456, 'f00df34d08f60114447f30fb3a4c3dfc33e0b8ef66d49148ca6e6b2089e8670c'),
('b22c4f4f-8eaa-4599-b239-db9939bef379', '1-1B', 'S22_KBD_GTK_03A_PC', 0.200, 0, '2024-01-30 14:30:23.174539', '2024-02-26 15:14:55.487640', 123456, 'f1dd0d387dec85aa3abf1964ef2995a38813418de050b00a3fe78fb001d4085d'),
('be5ac5b5-a097-4cbb-82ba-e901b2433ee0', '1-1D', 'S22_KBD_GTK_03A_PC', 0.600, 0, '2024-01-30 14:30:23.169581', '2024-02-26 15:14:55.488569', 123456, '32b6e6c5ed681ab33d58bd7479c33e99c40b18ac691d2503de04e1cf0e285f1b'),
('a64d2f27-f348-40bf-9814-e9b6f4b44faf', '1-4', 'S22_KBD_GTK_02_PC', 3.400, 0, '2024-01-30 14:30:23.150064', '2024-02-26 15:14:55.492315', 123456, '5df24ecd42d50bf5a251d7e1dfef4c742afa5608612ec5684e3a9ee0ba6b95ff'),
('bddc2b2e-28eb-475f-a212-ea7389b32eb6', '1-2', 'S22_KBD_GTK_03A_PC', 1.400, 0, '2024-01-30 14:30:23.277563', '2024-02-26 15:14:55.474611', 123456, 'ee106aa4a2e87db5e376da90744720483e0307abc3b5e900618d5d9804a01e3b'),
('4f05d823-17bf-4936-9f70-ec6879e89cf0', '1-4', 'S22_KBD_GTK_02_PC', 3.150, 0, '2024-01-30 14:30:23.115048', '2024-02-26 15:14:55.500305', 123456, '83b25fbcbd4a3981d9d7831e22e7e64e26aa6b0d0baf182842ca907a0fd9686b'),
('c3b6f5d2-5186-41cd-a66c-ed9482d818d2', '1-2', 'S22_KBD_GTK_01_PC', 1.750, 0, '2024-01-30 14:30:22.616951', '2024-02-26 15:14:55.564162', 123456, '428c6567264c064113d24d24153f97c79ba39723eee2eb887a064f6782d5bedc'),
('9a87cda9-d8e3-4600-b4d1-ee0c6f19f689', '1-4', 'S22_KBD_GTK_03A_PC', 3.650, 0, '2024-01-30 14:30:23.553253', '2024-02-26 15:14:55.445265', 123456, '507c7b7a62ac5851d2c218b4cc1f620eab71ea9b77ddad28ab2e43603fbb0564'),
('67d945ac-2ee1-4859-b7ae-ee6c3a5f2af9', '1-4', 'S22_KBD_GTK_03A_PC', 3.250, 0, '2024-01-30 14:30:23.500205', '2024-02-26 15:14:55.451059', 123456, 'a524383b603ae8f094bf360ebeb7f0179f2e1a07cb662c36aa052bda2b540d7f'),
('6922003d-4138-4948-a1ba-ef7f86a75cf9', '1-1E', 'S22_KBD_GTK_03A_PC', 0.800, 0, '2024-01-30 14:30:23.200053', '2024-02-26 15:14:55.485562', 123456, '6886bb6e6be9ac26f1949da4119a715eca8b5e411eafa8fc55a8ea6a47b232f9'),
('f00f1134-0c4b-4778-a6e5-f1448fe30f26', '1-4', 'S22_KBD_GTK_01_PC', 3.850, 0, '2024-01-30 14:30:22.799981', '2024-02-26 15:14:55.540227', 123456, 'b02997299afed1aaf313a22b5348f15a33c9b5c6ca849e4b046b6701e14fec02'),
('a87b7497-005d-4def-85f9-f1f6c3dead61', '1-2', 'S22_KBD_GTK_02_PC', 1.000, 0, '2024-01-30 14:30:22.902666', '2024-02-26 15:14:55.529989', 123456, 'ee0138be8ac50ef6fb102018516bee665aaad362d092546263c7343591acf6d7'),
('e69910b6-050e-4460-918a-f2db61f5b826', '1-1A', 'S22_KBD_GTK_03A_PC', 0.000, 0, '2024-01-30 14:30:23.168241', '2024-02-26 15:14:55.489798', 123456, '3e00c0ca750711026cf1fdf56e9f7ac39400d557ef3231c8548d1608137955b4'),
('2b7d0a18-05b1-4f2f-b6f7-f5b333289c5f', '1-4', 'S22_KBD_GTK_01_PC', 3.900, 0, '2024-01-30 14:30:22.815566', '2024-02-26 15:14:55.539397', 123456, '4e979527257ca93145b3aa91f91067de00f6d302a3f8338030d618da19930245'),
('230d57fe-0434-4d4f-ae9e-f62ab5d83b9e', '1-1C', 'S22_KBD_GTK_03A_PC', 0.400, 0, '2024-01-30 14:30:23.187336', '2024-02-26 15:14:55.486827', 123456, '2bf2ede85190e320cbb1ad294b486c6401415ab4f67ac00572459f0ed7a907ad'),
('a10c8bd7-6279-448e-8fce-f75df20fe097', '1-4', 'S22_KBD_GTK_03A_PC', 3.600, 0, '2024-01-30 14:30:23.555504', '2024-02-26 15:14:55.443922', 123456, '0a488591705032e46838988e549e696a0b4e3aa04cb6f315409ff43722962156'),
('e3193c1b-2ccf-4a55-9fd5-f870053ae213', '1-3C', 'S22_KBD_GTK_03A_PC', 2.400, 0, '2024-01-30 14:30:23.423062', '2024-02-26 15:14:55.459558', 123456, '2ad90874d8cf69753c5bd34fd1fc8a82c29a67040ea13599b9e85f4de1db4c76'),
('13e81145-3557-4a15-9df8-fa7e230ba6f1', '1-2', 'S22_KBD_GTK_01_PC', 1.350, 0, '2024-01-30 14:30:22.534505', '2024-02-26 15:14:55.571662', 123456, '2aa0ae630016cee26fc90fc618f8fc63b1a8d7435f4fd7fe0de88d513e561505'),
('abab5090-ae0c-4631-8ce1-fcb16afc4032', '1-2', 'S22_KBD_GTK_01_PC', 1.300, 0, '2024-01-30 14:30:22.524802', '2024-02-26 15:14:55.573385', 123456, '18ca9e859516115dc68e199aee661e6adcd9b5b6a4ba829ebe5550be18e9cc56');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_samplestationlocator`
--

CREATE TABLE `soil_sampler_samplestationlocator` (
  `id` uuid NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `is_dispatched` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `sample_id_id` uuid NOT NULL,
  `user_id` uuid NOT NULL,
  `station_id_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_samplestationlocator`
--

INSERT INTO `soil_sampler_samplestationlocator` (`id`, `is_completed`, `is_dispatched`, `created_at`, `updated_at`, `sample_id_id`, `user_id`, `station_id_id`) VALUES
('6fd2e54e-d680-4e7e-8440-0009f2b52888', 1, 1, '2024-01-30 14:30:22.749268', '2024-01-30 14:30:22.749280', '6f6f06dc-ce4a-496f-97ba-c3a9716e9d4c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('833dad8c-bf5d-457c-b99e-03d5b0553ba2', 0, 0, '2024-01-30 14:30:22.717003', '2024-01-30 14:30:22.717019', 'd31e2cd9-3bd6-4dc6-9851-53c7a05d619d', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('b3e8597d-7305-41c3-b529-06ed48abf2a4', 1, 1, '2024-01-30 14:30:22.572312', '2024-01-30 14:30:22.572337', 'd8ce1dd5-cdbf-4a67-926c-93c5df632b74', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('98f53b20-39b8-4dd7-8a47-09f431719683', 1, 1, '2024-01-30 14:30:23.277110', '2024-01-30 14:30:23.277126', '47c7387e-e442-4507-a9f3-b5669c8c1551', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ab303dc2-b579-470c-bbc5-0b3b7e32a33e', 1, 0, '2024-02-26 13:12:47.497988', '2024-02-26 15:49:23.044002', '87b8af45-4c92-48b2-9570-0b175bf48417', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '3cb6c071-fe12-4a42-a872-dd694169fb62'),
('7ea70638-53f7-4e7b-9c26-0b96d4bfa98b', 1, 1, '2024-01-30 14:30:23.227488', '2024-01-30 14:30:23.227509', '6922003d-4138-4948-a1ba-ef7f86a75cf9', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('68b20d81-855c-4c5a-833f-0e398919236d', 1, 0, '2024-01-30 14:30:23.596154', '2024-02-26 04:26:33.116229', '221003d9-1261-4213-9132-635a4648cf4a', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a75d276a-8b8b-405b-9837-127c52927edb', 1, 1, '2024-01-30 14:30:22.784610', '2024-01-30 14:30:22.784622', '558b64a0-db8e-44e4-b057-b5e4640337af', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('dabf3338-c4ce-44eb-b4c0-18cebd966ab2', 0, 0, '2024-01-30 14:30:23.582706', '2024-01-30 14:30:23.582725', '0a2a3efe-4e3d-4fc5-9a49-1113b4255267', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('89f306da-8128-48fc-bc5f-1908fd67acfb', 0, 0, '2024-01-30 14:30:22.803387', '2024-01-30 14:30:22.803411', '19832934-2677-4203-8d0e-139e73f7fa6a', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d4f6bb31-3af5-4eab-a193-1ab6f6f3946a', 1, 1, '2024-01-30 14:30:22.955259', '2024-01-30 14:30:22.955282', '60ac8ad6-aa67-44bc-9947-335940d7fdaf', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('5b9ee8c7-695d-4ece-93b7-1adf0691fdaa', 1, 0, '2024-02-26 16:35:06.024610', '2024-02-26 17:10:17.497981', 'c866445e-35bc-46cf-9e42-98679d194d61', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ab1c02bb-6610-46fe-abe7-1d22d3a5e09d', 1, 1, '2024-01-30 14:30:23.035563', '2024-01-30 14:30:23.035578', 'fa80ac80-75a0-48ef-8ab6-cf24c2464032', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('01dad147-3e28-410c-8a91-1e68aae67d3f', 1, 1, '2024-01-30 14:30:23.568891', '2024-01-30 14:30:23.568917', '9a87cda9-d8e3-4600-b4d1-ee0c6f19f689', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('766c14d7-d66d-4a94-8a31-1f4e8e90fdb5', 0, 0, '2024-01-30 14:30:22.977644', '2024-01-30 14:30:22.977671', '7cfe1ca0-ed24-4105-9f1a-78fecaaa7f5c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('4c2c4e5e-32cd-4e55-a57a-1fe1a4c41aed', 1, 1, '2024-01-30 14:30:22.652946', '2024-01-30 14:30:22.652966', 'd36c5af7-d08f-4c67-92a0-052ed00af73d', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('df2a91ea-9091-4d02-b403-211365b18488', 0, 0, '2024-01-30 14:30:23.022822', '2024-01-30 14:30:23.022840', '7ded02e2-f2ee-4d75-a573-6a5a16d9a296', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('caf788be-cb27-4149-9d96-2215da838446', 1, 1, '2024-01-30 14:30:22.845125', '2024-01-30 14:30:22.845150', 'f54a3c31-8b34-4feb-8a32-ca090b3103ef', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a1bf6d13-1597-4491-b692-22a10b01da7a', 0, 0, '2024-01-30 14:30:22.655333', '2024-01-30 14:30:22.655348', 'f892629c-0965-4fc0-877c-2544ecffd23b', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('36c1b4b5-76f0-47cd-99a0-239c09cf510e', 1, 1, '2024-01-30 14:30:22.604152', '2024-01-30 14:30:22.604171', 'facee714-ae6b-448f-bb5b-044084ac0c71', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('4a74ae05-ffb4-4b05-8a9e-2420900b450b', 0, 0, '2024-01-30 14:30:23.586136', '2024-01-30 14:30:23.586151', '358b74af-be16-4eff-878d-65fe3e64534c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('73c99b8d-7b5d-4c10-852a-24fc9edee221', 1, 1, '2024-01-30 14:30:23.468996', '2024-01-30 14:30:23.469013', '91d792af-1de6-457e-bc7a-251a44ce85b7', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('3bb19380-283e-43ac-a618-26274b124316', 0, 0, '2024-01-30 14:30:22.922457', '2024-01-30 14:30:22.922470', '33853aa8-f25b-4f3b-9755-7e456f3a9a7b', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0d2f2ff3-e92f-450b-b801-2641447b6364', 0, 0, '2024-01-30 14:30:22.708475', '2024-01-30 14:30:22.708492', 'af29d3b2-ec9d-4996-9857-c1fbb1d04ed8', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('e651c5fe-f5aa-40c7-b2d7-2669895d0cd6', 1, 1, '2024-01-30 14:30:22.985102', '2024-01-30 14:30:22.985120', '4e3eb12c-0782-46bb-bafb-3c22038a0b7e', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6272edec-4dd7-4060-a7c4-268bcc523704', 1, 1, '2024-01-30 14:30:23.495369', '2024-01-30 14:30:23.495383', '59d8520d-9af3-402b-b598-6efcadee4f70', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('9a40825c-83bd-46c3-8438-290ab5afe29f', 1, 1, '2024-01-30 14:30:23.212040', '2024-01-30 14:30:23.212060', '230d57fe-0434-4d4f-ae9e-f62ab5d83b9e', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('8207fb2a-419f-4641-99d8-29b05b331486', 1, 1, '2024-01-30 14:30:23.444404', '2024-01-30 14:30:23.444441', 'e3193c1b-2ccf-4a55-9fd5-f870053ae213', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('41cb421b-5f87-44b7-a122-2ccecff87cd3', 0, 0, '2024-01-30 14:30:22.563735', '2024-01-30 14:30:22.563761', '13e81145-3557-4a15-9df8-fa7e230ba6f1', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('32e827b7-71e3-4c6d-84d7-300b2a486744', 0, 0, '2024-01-30 14:30:22.899844', '2024-01-30 14:30:22.899869', 'd0764bcc-663c-4cb5-aa92-7a1a926b4183', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('1d1f5637-a2d0-49f1-8848-30819691b9f9', 0, 0, '2024-01-30 14:30:23.334173', '2024-01-30 14:30:23.334203', '63dd0e58-7834-41c8-935f-341778e6b521', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('55b44489-abc0-48f6-9b83-312d58d178db', 1, 1, '2024-01-30 18:00:38.174159', '2024-02-26 13:12:14.866530', '87b8af45-4c92-48b2-9570-0b175bf48417', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d211f46a-8888-4c98-9958-32d505ab3991', 0, 0, '2024-01-30 14:30:23.141835', '2024-01-30 14:30:23.141855', '3a6ab216-f71f-4493-a70e-cc5933b0ad8e', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('25abd907-20d3-4404-aeeb-3565cf07e69d', 1, 1, '2024-01-30 14:30:22.722351', '2024-01-30 14:30:22.722372', '5bd5deb3-d262-431d-9df6-d311003fdf80', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('06eb4b74-49fb-4ee9-8bf8-379eb24c829a', 1, 1, '2024-01-30 14:30:23.400989', '2024-01-30 14:30:23.401009', 'e5360a0f-0710-43c6-a25d-7e99a48b3a65', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('669e4f71-0094-4ec1-97ed-3982aaba4c5c', 0, 0, '2024-01-30 14:30:23.132833', '2024-01-30 14:30:23.132851', 'e11d9a75-b40d-43e9-92ec-0fb1ffcc7e61', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6df70f47-0848-4077-9707-3a0b522bac80', 0, 0, '2024-01-30 14:30:22.624779', '2024-01-30 14:30:22.624792', 'ad9fb261-125f-4317-b532-6476cc63a480', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6b4a513c-d561-43bb-a44f-3c22e8486dd1', 1, 1, '2024-01-30 14:30:22.638456', '2024-01-30 14:30:22.638483', 'c3b6f5d2-5186-41cd-a66c-ed9482d818d2', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('27d2893e-96d4-4aa8-85ab-40c8d2ac693a', 0, 0, '2024-01-30 14:30:22.942418', '2024-01-30 14:30:22.942445', '6adaac36-8591-4f8b-aaa1-760befbf18c1', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0b01ac08-54a2-4da4-87b8-413c17464672', 1, 1, '2024-01-30 14:30:23.039952', '2024-01-30 14:30:23.039969', 'cddf5b5b-9be9-426f-8fcf-d3dceca811d7', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a9c7131a-5851-4686-87d9-41ea8d285df0', 1, 1, '2024-01-30 14:30:23.023967', '2024-01-30 14:30:23.023980', 'e31f3205-fd40-4f24-a0eb-40a9f4069e54', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('f5b1c4d9-9b0c-4096-b1bc-430aec4fb538', 1, 1, '2024-01-30 14:30:22.820687', '2024-01-30 14:30:22.820703', 'da61824d-e45f-4924-b275-9fd642907ead', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('56422b4c-9285-4348-b741-4577a9741312', 0, 0, '2024-01-30 14:30:22.538251', '2024-01-30 14:30:22.538269', '0d6498f8-a880-4e14-a1e2-14386f33ea3d', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('eb4dbcca-8b63-47d8-a1fd-47ed13957592', 0, 0, '2024-01-30 14:30:23.551381', '2024-01-30 14:30:23.551398', 'ae37ca34-018e-439b-a2fc-1e33ffc8c65f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('dc29fcf6-52a4-4f69-8063-497357cccf53', 1, 1, '2024-01-30 14:30:23.360349', '2024-01-30 14:30:23.360364', '32169dd0-a79f-44ea-a58d-10359448cf8c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ede163f9-9f89-438a-8420-4c284b88b6af', 1, 1, '2024-01-30 14:30:22.616639', '2024-01-30 14:30:22.616656', 'b5881ce6-af5d-44be-aa04-1cb5aa3bdb7a', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ec3c46f5-f8a0-4c07-bb20-4e6fb35ce9ef', 0, 0, '2024-01-30 14:30:23.206020', '2024-01-30 14:30:23.206039', 'f0e3a3fa-f35a-4824-ae57-4217e7d55855', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('026401cb-da6e-47f2-be6b-4e99d033031f', 0, 0, '2024-01-30 14:30:22.885017', '2024-01-30 14:30:22.885034', '2aa39464-4863-4aeb-8163-2c9a0f99abde', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('2be3a7e8-c483-4b97-a394-4f2b3fc82045', 0, 0, '2024-01-30 14:30:23.035086', '2024-01-30 14:30:23.035105', '5094f03d-3892-4fb9-b21c-956d058f67ef', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('1532e369-6ed1-4f46-8621-511292fc5e92', 1, 1, '2024-01-30 14:30:22.711881', '2024-01-30 14:30:22.711909', '46429675-a28e-4350-ad01-d53708b35384', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0dc31ca9-0e03-4135-8bf1-51bb1f4899e9', 1, 1, '2024-01-30 14:30:23.549439', '2024-01-30 14:30:23.549464', '93a9483f-79c4-453f-9a9f-121022ad6d76', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('87c6cd1e-57f3-4e2d-8167-51dd689a1393', 0, 0, '2024-01-30 14:30:22.889509', '2024-01-30 14:30:22.889526', '35437f88-2de0-48c4-97ab-b93109ef90da', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('12090725-3cd4-4137-85fc-548cb194880f', 1, 1, '2024-01-30 14:30:23.595751', '2024-01-30 14:30:23.595768', '87b8af45-4c92-48b2-9570-0b175bf48417', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('29df2f2b-08b0-4e97-bf5e-54b578fa9fbb', 0, 0, '2024-01-30 14:30:22.644964', '2024-01-30 14:30:22.644976', 'd2053df3-c22e-4546-8f3b-b01fd9684d25', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('7b28a355-bd87-4e5e-9395-55aa0665097c', 0, 0, '2024-01-30 14:30:23.230604', '2024-01-30 14:30:23.230638', '24ac9e3e-334e-45f3-85da-9c54fc165aae', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('25007447-c682-4778-856c-55c433bdcd84', 1, 1, '2024-01-30 14:30:23.097150', '2024-01-30 14:30:23.097171', '5e388312-7642-4bf5-b0e4-0dcf3504ee58', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('91705c02-89b4-4dc4-8d5e-57189f2236e4', 1, 1, '2024-01-30 14:30:22.507959', '2024-01-30 14:30:22.507973', 'a3e4c48f-cd26-4e6e-8157-d7ed8af05fab', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('29fdc617-8db1-46ae-9b85-5849eb0f2041', 1, 1, '2024-01-30 14:30:22.697320', '2024-01-30 14:30:22.697339', 'dda89006-bc19-4eef-bad3-d4f76364c87c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0986749c-9dc4-47d5-bd40-596cb7251596', 1, 1, '2024-01-30 14:30:23.477924', '2024-01-30 14:30:23.477941', '1319e801-e3ff-4f2c-858a-23bc3b31e440', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a6a94fab-3083-4947-b70b-5b912887de21', 0, 0, '2024-01-30 14:30:23.520870', '2024-01-30 14:30:23.520890', 'bddda871-30b3-4313-9c88-4220d2352009', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ca2d939d-7c96-4928-b7c5-5be9e2fb8699', 0, 0, '2024-01-30 14:30:22.540493', '2024-01-30 14:30:22.540505', '3e343555-ee87-45a3-b9c3-a983fe7476e3', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('7603be98-94ff-4281-b4ed-5c261ae5d2aa', 0, 0, '2024-01-30 14:30:22.815207', '2024-01-30 14:30:22.815228', 'f00f1134-0c4b-4778-a6e5-f1448fe30f26', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('38db8edf-a832-4540-9767-5c9cab5d143d', 0, 0, '2024-01-30 14:30:22.546444', '2024-01-30 14:30:22.546469', 'abab5090-ae0c-4631-8ce1-fcb16afc4032', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d05bd4f4-fab8-4df1-9664-5cd3cf7beca8', 0, 0, '2024-01-30 14:30:22.706426', '2024-01-30 14:30:22.706448', 'e166ee11-83d0-4a41-a402-93d67afb532b', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('7ebd277d-c3d0-4a9d-a575-62423a02c03d', 0, 0, '2024-01-30 14:30:23.495133', '2024-01-30 14:30:23.495150', 'dc249683-a422-404c-b9a2-d3c440f3500f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ab577e37-563c-4ff1-9971-627ea46bb14d', 1, 1, '2024-01-30 14:30:23.405030', '2024-01-30 14:30:23.405047', 'a177493c-955d-443d-ae44-656eaac9a321', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('8660a9c0-6461-4ad2-a593-64a48dca9f4b', 1, 1, '2024-01-30 14:30:22.787745', '2024-01-30 14:30:22.787766', 'fd198fec-6890-43d2-9c10-0ac023cd13bc', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('57d2d5b7-0add-4f8d-8528-673753499951', 1, 1, '2024-01-30 14:30:23.457533', '2024-01-30 14:30:23.457552', '57f75276-5d6d-4e24-a392-7acd640de9ba', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d9fb0d62-73a9-4f28-95c1-6a7bea70e138', 0, 0, '2024-02-26 18:03:54.350769', '2024-02-26 18:03:54.350808', '9c10a5b3-1062-417d-a658-36fff83d1263', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '3cb6c071-fe12-4a42-a872-dd694169fb62'),
('33f896b9-fd03-4457-a15d-6eab49db9ddd', 1, 1, '2024-01-30 14:30:23.502427', '2024-01-30 14:30:23.502442', '48f7a8fc-6fda-4055-a203-8495a4c814f3', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('abdda97b-90b3-4e73-9a14-6f33850e5736', 1, 1, '2024-01-30 14:30:23.168492', '2024-01-30 14:30:23.168504', 'a64d2f27-f348-40bf-9814-e9b6f4b44faf', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('343f2328-99d1-41a1-9c8c-70e4db11a826', 1, 1, '2024-01-30 14:30:23.121017', '2024-01-30 14:30:23.121035', '054bb09b-86da-480a-98e7-680168deb060', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('48a57162-682b-4caa-8d73-73994d85b6cf', 0, 0, '2024-01-30 14:30:23.450372', '2024-01-30 14:30:23.450395', '077eb906-2ac4-49dc-9af5-aea4ff8cb635', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('13ffd375-19ff-45bb-ae47-751e28190094', 1, 1, '2024-01-30 14:30:23.187119', '2024-01-30 14:30:23.187139', 'e69910b6-050e-4460-918a-f2db61f5b826', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('39981095-7ac6-4efa-bb40-758a5effeb6b', 1, 1, '2024-01-30 14:30:22.969027', '2024-01-30 14:30:22.969046', '315b12f3-90a5-4273-8a52-232ee6e8a4dc', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d3e372c5-dc4d-4731-8756-7b5feb1f8142', 0, 0, '2024-01-30 14:30:22.780235', '2024-01-30 14:30:22.780249', '81552452-011e-4af5-9e79-3560d65c341b', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('f4566ab1-3a4b-43db-99c9-7d766fe77a6d', 1, 1, '2024-01-30 14:30:23.107854', '2024-01-30 14:30:23.107871', '5fc817df-b783-4a99-8e73-5112192a4de9', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('c0a3ffba-ff99-4b73-81eb-7d9906def84d', 1, 1, '2024-01-30 14:30:22.963517', '2024-01-30 14:30:22.963558', '6f0db745-a3ef-4efc-bd88-a090242efbbf', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('b0880423-a6df-4a09-8395-83d9fafaad1a', 1, 1, '2024-01-30 14:30:22.838677', '2024-01-30 14:30:22.838698', '2b7d0a18-05b1-4f2f-b6f7-f5b333289c5f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('4f7d911a-4f99-412d-8c0d-849c21557fcb', 1, 1, '2024-01-30 14:30:23.274970', '2024-01-30 14:30:23.274994', '94153c6a-3765-4d44-a192-8de651d400bd', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a65cbb1b-b256-4f79-b23d-8a2f0270a790', 1, 1, '2024-01-29 13:53:38.059354', '2024-01-30 14:07:26.686790', '04bf573d-d094-4580-a79c-4411c7ae32a8', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6e72ea11-3244-40d4-b901-8cf9e4c6c155', 0, 0, '2024-01-30 14:30:23.523188', '2024-01-30 14:30:23.523204', '67d945ac-2ee1-4859-b7ae-ee6c3a5f2af9', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('51ad578a-2977-469d-8140-8e0c04b6c970', 0, 0, '2024-01-30 14:30:23.236709', '2024-01-30 14:30:23.236729', 'c8967ed6-4eb3-48b7-8665-0b01a1c7fcfe', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('22ae727a-e81c-41f2-aa9d-9223b5c1c6f1', 1, 1, '2024-01-30 14:30:22.539233', '2024-01-30 14:30:22.539246', 'f1a4a71c-3339-42ca-b5d4-07018b2a33af', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('711b135b-8b70-41a4-a454-952c084f8eb1', 0, 0, '2024-01-30 14:30:23.410499', '2024-01-30 14:30:23.410521', 'a73d8dbf-b2f0-449b-887d-8d2c924cff82', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('58881a09-1d24-4797-b992-98b0b5ff4cec', 1, 1, '2024-01-30 14:30:23.163013', '2024-01-30 14:30:23.163039', '3545b06c-325e-4113-85a6-628649646368', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('05cabb5f-768d-4e51-aab3-9d132ef41833', 1, 1, '2024-01-30 14:30:22.644761', '2024-01-30 14:30:22.644779', '5ce51187-dc54-4925-844b-012d50baf185', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('a0c53a0d-68fb-4239-add9-a213ac528242', 1, 1, '2024-01-30 14:30:23.531111', '2024-01-30 14:30:23.531124', 'e9ac223f-d4fe-47b7-8f01-a4bf7301cc15', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('3d8d769a-835f-402a-bb87-a3710def4e7f', 0, 0, '2024-01-30 14:30:22.532442', '2024-01-30 14:30:22.532454', 'b5f0909d-0e90-49e0-aaad-d3332cc0430a', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('1141e70e-6cab-4bf6-8abe-a4ff7ea259b9', 0, 0, '2024-01-30 14:30:23.191471', '2024-01-30 14:30:23.191490', 'b22c4f4f-8eaa-4599-b239-db9939bef379', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('40fafcb4-1858-457f-827e-aa6c282f1692', 0, 0, '2024-01-30 14:30:23.199056', '2024-01-30 14:30:23.199074', 'be5ac5b5-a097-4cbb-82ba-e901b2433ee0', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0c9b8d95-c12a-4a5f-a42a-aa6f927b951f', 1, 1, '2024-01-30 14:30:23.373833', '2024-01-30 14:30:23.373857', '2edb080a-8b3a-45d8-b5f0-0fbd41cc0daa', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('2b0cfdf6-e5db-44de-a105-ab3efa26cd8b', 1, 1, '2024-01-30 14:30:23.065542', '2024-01-30 14:30:23.065558', 'a241a2b5-8ce5-404e-944f-a080a10779b0', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('4bbf2df3-893b-445a-815f-af8d72a6ec58', 1, 1, '2024-01-30 14:30:22.798887', '2024-01-30 14:30:22.798908', 'eb78cf7c-2484-4673-82ec-817e89f3bb14', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('c8638455-3503-40bb-af22-b1700d42ed93', 1, 1, '2024-01-30 16:34:56.964705', '2024-01-30 18:00:12.861163', '87b8af45-4c92-48b2-9570-0b175bf48417', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '3cb6c071-fe12-4a42-a872-dd694169fb62'),
('53ea8178-8f0a-4f3c-88f5-b5fda37b5c72', 1, 1, '2024-01-30 14:30:22.847547', '2024-01-30 14:30:22.847559', '65575282-a267-49d4-91d2-7358b0b0dc53', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('87052b75-1d79-4a61-a5bf-b844d14a7911', 1, 1, '2024-01-30 14:30:22.922242', '2024-01-30 14:30:22.922259', 'a87b7497-005d-4def-85f9-f1f6c3dead61', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('45da6eb8-ca12-402e-a432-bc7b4e6d31bc', 0, 0, '2024-01-30 14:30:23.083170', '2024-01-30 14:30:23.083192', '9ceb5536-dcb2-4a0f-952f-207ef4ea00a5', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6e0c39e4-5b28-45ba-a8a7-bd07673af749', 1, 1, '2024-01-30 14:30:23.295728', '2024-01-30 14:30:23.295745', 'bddc2b2e-28eb-475f-a212-ea7389b32eb6', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('9891ae2c-edf8-4cac-b1dc-bdacf350d666', 1, 1, '2024-01-30 14:30:23.052515', '2024-01-30 14:30:23.052543', '513cb13b-35a0-4b53-bc0a-4073d10c290f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('6bf12e2a-2ef6-4c36-a074-be37d1c0303e', 0, 0, '2024-01-30 14:30:22.930705', '2024-01-30 14:30:22.930723', 'ec5e3efd-e62b-418a-b0bc-2f627ba8a09c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('c2adc867-2dc1-43db-a3de-c06895cb30df', 1, 1, '2024-01-30 14:30:23.255400', '2024-01-30 14:30:23.255416', 'a930cb39-f605-4ce2-ba1a-88d414f15932', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('821b4dda-c281-48f7-8240-c3cd404e0995', 1, 1, '2024-01-30 14:30:23.436780', '2024-01-30 14:30:23.436804', 'f64cfa3e-cdd8-4452-865b-b6dd4de886ca', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('21add530-17c2-4c80-9e31-c770a88ea701', 1, 1, '2024-01-30 14:30:22.569506', '2024-01-30 14:30:22.569529', '90d2dfbc-4c0a-4d6c-b136-2d678e66c1ac', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('9bffda9b-ad01-40df-8a02-c7fc3776d147', 0, 0, '2024-01-30 14:30:23.096756', '2024-01-30 14:30:23.096774', '53287ae0-f3b3-4bc7-957d-29f8a6148cb0', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('c2e024ef-b500-48b5-a32f-c9e9ebaba6f8', 1, 1, '2024-01-30 14:30:23.000410', '2024-01-30 14:30:23.000428', 'd8b363ac-1a49-4a7f-9852-83c755feb47f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('7b3493d2-5333-4024-a841-cc35588140b1', 1, 1, '2024-01-30 14:30:23.571868', '2024-01-30 14:30:23.571883', 'a10c8bd7-6279-448e-8fce-f75df20fe097', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('ff1bc49a-c596-431a-8408-cc5a5563f882', 1, 1, '2024-01-30 14:30:23.001717', '2024-01-30 14:30:23.001735', 'c3486044-6189-463e-af0d-0fa732a010f8', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('8a14b276-6b29-47b3-86e4-cc81a441a1f3', 1, 1, '2024-01-30 14:30:23.592742', '2024-01-30 14:30:23.592759', '9c10a5b3-1062-417d-a658-36fff83d1263', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d884c159-27c1-4b1b-a55b-ccd71c74d984', 1, 1, '2024-01-30 14:30:22.862926', '2024-01-30 14:30:22.862949', '66d8a6ae-8557-4375-b59a-84df2d40246d', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('54af115e-4857-4ec6-8db3-cd92ab6e294d', 0, 0, '2024-01-30 14:30:22.534303', '2024-01-30 14:30:22.534315', '58d0fd5d-4c7d-461a-a875-63f1110e27cb', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('71b156ff-f89f-4afb-86cf-d09d2aab9480', 0, 0, '2024-01-30 14:30:23.133788', '2024-01-30 14:30:23.133800', '4f05d823-17bf-4936-9f70-ec6879e89cf0', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('fa696bfa-8eee-4b6c-87f1-d2ab4a0d2e1b', 1, 1, '2024-01-30 14:30:22.595881', '2024-01-30 14:30:22.595895', '8bab0789-5128-4237-a870-042c2858061e', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('462d0ff3-1537-447b-bbe8-d5879fb22376', 1, 1, '2024-01-30 14:30:22.876273', '2024-01-30 14:30:22.876287', '15cdd246-a73b-4757-8db4-d5c035e07444', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('77bb0324-f767-4f42-843e-d9a889e0a580', 1, 1, '2024-01-30 14:30:23.088046', '2024-01-30 14:30:23.088062', '64c3003e-272f-42b6-b73a-aa65566b88a2', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('8a4ed927-3a66-4a1f-8387-da6e52d8c87b', 0, 0, '2024-01-30 14:30:23.014353', '2024-01-30 14:30:23.014370', 'd1204fa6-c53d-4d5a-8193-b6421630c321', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('02942181-6326-4f6b-b69e-dc3c63117aeb', 0, 0, '2024-01-30 14:30:23.388615', '2024-01-30 14:30:23.388628', 'e41d9fd4-7814-490b-a529-77e191d1aadf', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('d4504522-1308-4f03-a2a1-dd6a9f55b6c4', 1, 1, '2024-01-30 14:30:23.255036', '2024-01-30 14:30:23.255057', 'fe2c508c-6ff1-4c75-945d-8b16f3623e52', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('931f17fa-c52c-4e20-9d2c-ddaf1661ac3d', 0, 0, '2024-01-30 14:30:22.725484', '2024-01-30 14:30:22.725509', '90f22653-8fe3-4e6a-98f4-657dd0947664', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('5e8eee79-c397-4d3e-ac05-e0aad629524a', 1, 1, '2024-01-30 14:30:23.292584', '2024-01-30 14:30:23.292609', '47eca2d6-c6b9-4073-ac18-103b777e57b1', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('97ec8b6f-8dc1-419a-a237-e14821513b27', 1, 1, '2024-01-30 14:30:23.234070', '2024-01-30 14:30:23.234085', '2620e383-13ab-4d80-b7c9-cb9dd87122f7', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0ba13e14-9ca5-4f62-9f10-e3d95c54eaf5', 1, 1, '2024-01-30 14:30:22.530173', '2024-01-30 14:30:22.530185', '9bce36f7-3c8e-48d1-a9cd-a8b6b349a359', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('b7dabb7c-823e-4f2b-ac27-e6d05b5c6580', 0, 0, '2024-01-30 14:30:22.781803', '2024-01-30 14:30:22.781815', '8b25f2ed-db2a-42d5-baae-473199c36a14', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('e532d68e-7cd5-4871-be4b-e81055a7cfab', 1, 1, '2024-01-30 14:30:22.770829', '2024-01-30 14:30:22.770848', 'f44704e2-6690-4fbe-b8c6-044e9eccc584', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('0fe151ba-1c60-4440-918a-e8225d1f1d8a', 0, 0, '2024-01-30 14:30:22.681282', '2024-01-30 14:30:22.681305', '6cf2c600-e84d-4f47-89fe-2b9c0edbb2c7', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('1a057a98-c9aa-4115-82da-e8264e3d488a', 0, 0, '2024-01-30 14:30:22.675430', '2024-01-30 14:30:22.675449', '9eaa3242-164e-46e1-b8d0-8f783bd2283e', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('9903a567-71b3-473d-a271-e84d562e0d3c', 0, 0, '2024-01-30 14:30:23.385373', '2024-01-30 14:30:23.385393', '04fd954e-ba51-47a6-90c2-113a4ea8081c', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('03dbfa18-2840-4bb3-908e-e899224d6305', 1, 1, '2024-01-30 14:30:22.612646', '2024-01-30 14:30:22.612664', '48b97b55-dbac-43c3-841e-3f0ca73db4e5', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('df638778-e990-445c-babe-e8e6e8f91e92', 1, 1, '2024-01-30 14:30:22.893261', '2024-01-30 14:30:22.893278', '686b29af-8008-44aa-903e-8c31c92c1d78', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('e2db848c-65b3-4ec9-9ba8-ed1bf574b3d8', 1, 1, '2024-01-30 14:30:23.359279', '2024-01-30 14:30:23.359301', 'c6c98b0a-d2a6-449f-85b4-588d6395f6b6', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('14156c88-a88f-4fef-b9cd-eeeb66d4209b', 1, 1, '2024-01-30 14:30:23.556416', '2024-01-30 14:30:23.556432', 'ab6f8a2a-99c9-4d02-9a64-63c8517c5c00', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('204cb840-93e4-45f0-bb83-f1a2d09a11b2', 1, 1, '2024-01-30 14:30:22.868511', '2024-01-30 14:30:22.868527', '22e22075-2187-40b8-ab3d-98b01a808405', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('4d8a1864-129b-4380-aba8-f4c75e8a1906', 0, 0, '2024-01-30 14:30:22.740402', '2024-01-30 14:30:22.740420', 'e84055e3-d1ba-494a-9ee5-6db790f7334f', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('83b9cd96-c833-4b41-86e3-f81b3831fbea', 0, 0, '2024-01-30 14:30:23.437604', '2024-01-30 14:30:23.437619', '6a3aaec8-5808-4629-aaba-0bbd45d84ae4', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f'),
('78907111-e255-4484-b87d-fa04da803fb9', 0, 0, '2024-01-30 14:30:23.122990', '2024-01-30 14:30:23.123005', '343d96a3-9131-4774-a0dc-a9e89a68a093', '8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_sampletest`
--

CREATE TABLE `soil_sampler_sampletest` (
  `id` uuid NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `sample_station_locator_id_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_sampletest`
--

INSERT INTO `soil_sampler_sampletest` (`id`, `remarks`, `is_completed`, `created_at`, `updated_at`, `sample_station_locator_id_id`) VALUES
('2dd428f3-d2ee-4e80-baee-3f4e6455b433', 'UNIT WEIGHT-FS', 1, '2024-01-30 14:40:28.722502', '2024-02-26 04:26:29.263955', '68b20d81-855c-4c5a-833f-0e398919236d'),
('f522ef65-492b-4bfd-ab5d-64f0a313ce4b', 'b', 1, '2024-01-30 18:02:02.638141', '2024-01-30 18:02:07.866201', '55b44489-abc0-48f6-9b83-312d58d178db'),
('75b5e3db-2a2f-44e5-b6a4-91682dd01f5a', 's', 1, '2024-01-30 18:01:58.472101', '2024-02-26 13:12:08.166168', '55b44489-abc0-48f6-9b83-312d58d178db'),
('4dd89e2f-f36d-4774-958a-fd52712cb51a', 'WATER CONTENT - F', 1, '2024-01-30 14:31:57.947268', '2024-01-30 14:33:00.179220', '68b20d81-855c-4c5a-833f-0e398919236d');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_station`
--

CREATE TABLE `soil_sampler_station` (
  `id` uuid NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_storage_center` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_station`
--

INSERT INTO `soil_sampler_station` (`id`, `name`, `is_storage_center`, `created_at`, `updated_at`) VALUES
('3e9f0f68-c929-4d6f-9543-28b5517a80ee', 'C', 0, '2024-01-29 13:49:33.589651', '2024-01-29 13:49:33.589666'),
('99a99826-0d46-429d-91c5-6c8f318d0d45', 'B', 0, '2024-01-29 13:49:26.972054', '2024-01-29 13:49:26.972081'),
('a4a7ecd3-0387-4002-9ab8-94c3a9f395a1', 'D', 0, '2024-01-29 13:49:37.707191', '2024-01-29 13:49:37.707203'),
('3cb6c071-fe12-4a42-a872-dd694169fb62', 'A', 0, '2024-01-29 13:49:22.649195', '2024-01-29 13:49:22.649210'),
('62780013-3861-4f18-8b88-fdc6a0732a3f', 'Storage Center', 1, '2024-01-29 13:49:12.675449', '2024-01-29 13:49:12.675464');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_stationmaster`
--

CREATE TABLE `soil_sampler_stationmaster` (
  `user_id` uuid NOT NULL,
  `station_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_stationmaster`
--

INSERT INTO `soil_sampler_stationmaster` (`user_id`, `station_id`) VALUES
('ea72186d-49b3-4aeb-9541-7eb774b838a4', '3cb6c071-fe12-4a42-a872-dd694169fb62'),
('8fd6188d-3254-4bc6-8e28-52838156515e', '62780013-3861-4f18-8b88-fdc6a0732a3f');

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_user`
--

CREATE TABLE `soil_sampler_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` uuid NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(500) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `can_view` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `soil_sampler_user`
--

INSERT INTO `soil_sampler_user` (`password`, `last_login`, `is_superuser`, `id`, `email`, `name`, `is_active`, `is_staff`, `date_joined`, `created_at`, `updated_at`, `can_view`) VALUES
('pbkdf2_sha256$600000$e9IezyxdsmHFUpu7Oo56QO$MFE/NHdT7ZL8rljlDIOOjJqff+Nh3ijTgNn2I/x/aQA=', '2024-02-26 08:47:20.000000', 0, '687d25b9-40b5-457b-9a83-3fb83b89e167', 'pranit@email.com', 'Pranit', 1, 0, '2024-02-26 05:38:15.000000', '2024-02-26 05:38:15.678581', '2024-02-26 08:51:13.801330', 1),
('pbkdf2_sha256$600000$JfSYCwfz5kaNXl3sj48HGG$BZ01v1kOMjkJmRvaBDXYMHiU4ZVDadkgQ4zkj4qX7SI=', '2024-02-26 16:41:30.859090', 1, '8fd6188d-3254-4bc6-8e28-52838156515e', 'yadav@email.com', 'Akash Yadav', 1, 1, '2024-01-29 13:47:57.714019', '2024-01-29 13:47:57.891351', '2024-01-29 13:47:57.891360', 0),
('pbkdf2_sha256$600000$SQMG7nxoR9Z6hTlieC3VEW$MK6yRt4KVAFt3AFWXsrVX8oFi55Cim6LD+nt0TPxCl4=', '2024-02-26 08:37:50.868698', 0, 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'harsh@email.com', 'Harsh Kumar', 1, 0, '2024-01-30 16:05:07.000000', '2024-01-30 16:07:07.484550', '2024-01-30 16:07:07.484561', 0);

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_user_groups`
--

CREATE TABLE `soil_sampler_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` uuid NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soil_sampler_user_user_permissions`
--

CREATE TABLE `soil_sampler_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` uuid NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

INSERT INTO `token_blacklist_blacklistedtoken` (`id`, `blacklisted_at`, `token_id`) VALUES
(1, '2024-01-30 16:07:45.362196', 4),
(2, '2024-01-30 16:10:10.923720', 5),
(4, '2024-01-30 16:10:27.758824', 6),
(6, '2024-01-30 16:11:53.381892', 7),
(7, '2024-01-30 16:12:53.357146', 8),
(9, '2024-01-30 16:13:09.782035', 9),
(11, '2024-01-30 16:16:40.798547', 10),
(12, '2024-01-30 16:23:09.188991', 11),
(13, '2024-01-30 16:23:57.303224', 12),
(14, '2024-01-30 16:25:47.298890', 13),
(16, '2024-01-30 16:27:11.582073', 14),
(18, '2024-01-30 16:27:36.501086', 15),
(19, '2024-01-30 16:29:52.746957', 16),
(21, '2024-01-30 16:30:51.574328', 17),
(22, '2024-01-30 16:32:20.938881', 18),
(23, '2024-01-30 16:32:54.006535', 19),
(24, '2024-01-30 16:33:17.928671', 20);

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` uuid DEFAULT NULL,
  `jti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

INSERT INTO `token_blacklist_outstandingtoken` (`id`, `token`, `created_at`, `expires_at`, `user_id`, `jti`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjYyMjUxMCwiaWF0IjoxNzA2NTM2MTEwLCJqdGkiOiJmYTk4NWRkNTY2MTc0MDMyYmI0OTFkY2MyZWIwYWRkNSIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.781M7rzTS0pBJW7ac_jt8vUOaKzn6fH7Jqh5tvEt_fM', '2024-01-29 13:48:30.168660', '2024-01-30 13:48:30.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', 'fa985dd566174032bb491dcc2eb0add5'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjY4NzU1MSwiaWF0IjoxNzA2NjAxMTUxLCJqdGkiOiJkZDBkZTVjNjQ5MDA0NzI0ODFkNDAyNDgzMzg0NTEwMiIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.q0-EUwVsEgur7BSCQFn5u8VH9jHNxhISXrOAhKoflX0', '2024-01-30 07:52:31.069054', '2024-01-31 07:52:31.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', 'dd0de5c64900472481d4024833845102'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjY5NTc1NSwiaWF0IjoxNzA2NjA5MzU1LCJqdGkiOiIwZTQwNDlhZDEwNzI0ZTNjYjM2MmVlNTM3NGIyY2JjMiIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.QdV-nc3MGyvmvkhvg1CvRVrswBuyBm7uKAro3sCZxh0', '2024-01-30 10:09:15.185517', '2024-01-31 10:09:15.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', '0e4049ad10724e3cb362ee5374b2cbc2'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzI0MCwiaWF0IjoxNzA2NjMwODQwLCJqdGkiOiI4YTY4ZGViMjkwOWI0OTY4OTRjN2Y3MmZkMzgzZDI1MyIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.HId26RHTSFaW2lMzgqI5GicJ1oREE-Pcjfrfdcd5MUc', '2024-01-30 16:07:20.030384', '2024-01-31 16:07:20.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '8a68deb2909b496894c7f72fd383d253'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzQwOCwiaWF0IjoxNzA2NjMxMDA4LCJqdGkiOiIzY2ZmNTg2MzkxODE0NmIyOGNkZTljNTBjYTcxOTY4NyIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.4Vki_2fsQ199whoJBt9rKGcXOffFiC82pH__6UUeewo', '2024-01-30 16:10:08.556218', '2024-01-31 16:10:08.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '3cff5863918146b28cde9c50ca719687'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzQyMCwiaWF0IjoxNzA2NjMxMDIwLCJqdGkiOiI2NDkwOTg1ZTYzYmE0ZWVmOTU2ZWUyNGNlOWM1ZDkwOSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.Tm6EKDrCpJwKyvDpyFRbEkW-dTJrWIbGirYcNukjX90', '2024-01-30 16:10:20.091438', '2024-01-31 16:10:20.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '6490985e63ba4eef956ee24ce9c5d909'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzUwNywiaWF0IjoxNzA2NjMxMTA3LCJqdGkiOiIwYjIyNGVmMjQ4MzA0MTM0OWM5OTUzYjcyM2MxNWU3ZiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.MlLGOwjIATBfm5CSeNYd5gpXFQe7Q6HPn4loUnEr6wA', '2024-01-30 16:11:47.731112', '2024-01-31 16:11:47.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '0b224ef2483041349c9953b723c15e7f'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzU2OCwiaWF0IjoxNzA2NjMxMTY4LCJqdGkiOiJmMjQ2MmJjOGIyYzI0ZTNhYmVkMDJjZTRiNDQ0OTAwZiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.pLb6LF862GL7zJdwe2UMS2sCa3r2RzkkjVyUMSGSZdI', '2024-01-30 16:12:48.578347', '2024-01-31 16:12:48.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'f2462bc8b2c24e3abed02ce4b444900f'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzU4OCwiaWF0IjoxNzA2NjMxMTg4LCJqdGkiOiIwZDE3MzJmOWZmOWE0N2QyOWQ0YjhkMWI4NjYwOGI1MiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.CJp3kHHCO56or_ppXyCjbk158HWuJEejZFdHo0mitQM', '2024-01-30 16:13:08.784280', '2024-01-31 16:13:08.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '0d1732f9ff9a47d29d4b8d1b86608b52'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxNzc4NiwiaWF0IjoxNzA2NjMxMzg2LCJqdGkiOiI3MzNmOWVmMjBiNGI0NTZmYjQ0MmJhM2Q3YTRjODI5MiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.qs0mI_R6sLhPyuHVVlQgCMC-jGw2dsFTU0cqRQoKL_w', '2024-01-30 16:16:26.633869', '2024-01-31 16:16:26.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '733f9ef20b4b456fb442ba3d7a4c8292'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODE4NywiaWF0IjoxNzA2NjMxNzg3LCJqdGkiOiI3NWUwMTZhY2RiODQ0YTQzOGM5NjA2YmMyNGU2ODE5NSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.RJELee1c9tdLeaBXIAvwyuDvRvpRJcJE1PmwVyUZ86c', '2024-01-30 16:23:07.224820', '2024-01-31 16:23:07.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '75e016acdb844a438c9606bc24e68195'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODIyNSwiaWF0IjoxNzA2NjMxODI1LCJqdGkiOiJkZTk3MTBmMzhiZmM0OTMwOTg5ZTM2Nzg5MWQwOGY1OSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.qqRvXMzFKMhyjCvciCz3V7EjJBFPD5oCSVGDAOUKrqw', '2024-01-30 16:23:45.986101', '2024-01-31 16:23:45.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'de9710f38bfc4930989e367891d08f59'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODM0NCwiaWF0IjoxNzA2NjMxOTQ0LCJqdGkiOiJhYjY5MGYwNTMzMjc0OGYyOTMxYmEyM2FlMDYxNDVkNCIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.umP3xGdsjCJRfugyYVlRlMMsW0k_H2bI2HWjjr7c3MA', '2024-01-30 16:25:44.470830', '2024-01-31 16:25:44.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'ab690f05332748f2931ba23ae06145d4'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODQyNCwiaWF0IjoxNzA2NjMyMDI0LCJqdGkiOiI4ZWIxMWQxYTJlYjA0ZWVhOTRjYzNkZWFkNDc5ZGFmZCIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.EsVvTt6h5BkbMAu7qzq4VO_zeBYhnOlr4qkxt8j59wA', '2024-01-30 16:27:04.455682', '2024-01-31 16:27:04.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '8eb11d1a2eb04eea94cc3dead479dafd'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODQ1NCwiaWF0IjoxNzA2NjMyMDU0LCJqdGkiOiI3NmUwM2QyMzYyODg0N2YzYjkwMzE5YzM4YWE1ODA2ZCIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.yLGlKFzCa5cODQ-fpQvP6CNcPvQxSUEpTRzzMyl5mHU', '2024-01-30 16:27:34.485062', '2024-01-31 16:27:34.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '76e03d23628847f3b90319c38aa5806d'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODU5MSwiaWF0IjoxNzA2NjMyMTkxLCJqdGkiOiI2NjgxZjQyZGVkYzM0ZWQwODQyNmFmZWY3YTYwYmZkYSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.ODdC8CSF_Tu8PNhuQTdpLjy9UW0CWvLFAs3GfagqAkY', '2024-01-30 16:29:51.412190', '2024-01-31 16:29:51.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '6681f42dedc34ed08426afef7a60bfda'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODY0OCwiaWF0IjoxNzA2NjMyMjQ4LCJqdGkiOiJmYTY2NWNlMDlmZjg0MGEzYWZkYzQ3ZGE5NTljZTkwOCIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.WAR6laykd-FzgzFaenWernQOuw9-INioicn94T2cat0', '2024-01-30 16:30:48.076748', '2024-01-31 16:30:48.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'fa665ce09ff840a3afdc47da959ce908'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODcyMSwiaWF0IjoxNzA2NjMyMzIxLCJqdGkiOiI1Zjc4Yzg4MjkxMGI0MGZiOTY1NDdjNDE0OTJjNWVhNSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.Q1fpTFVvLesOkZel3XO3wHFX_LqmTa5f4YTgDYDcygI', '2024-01-30 16:32:01.724292', '2024-01-31 16:32:01.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '5f78c882910b40fb96547c41492c5ea5'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODc3MSwiaWF0IjoxNzA2NjMyMzcxLCJqdGkiOiIwMmI2ZmMzMTYzNzY0M2U0YjNiZjRlYzQxZmU3MTU3ZSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.8OR7ZBcRnSph3OvqUKCsAPXCgnT6lnu-36hAjttzHsM', '2024-01-30 16:32:51.687999', '2024-01-31 16:32:51.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '02b6fc31637643e4b3bf4ec41fe7157e'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODc5NiwiaWF0IjoxNzA2NjMyMzk2LCJqdGkiOiJhYTM3MTM1YzNlNzM0YWYwOGE3NGEyN2FiMWY0YjA2NiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.7jRPB2rnqTjKQ5OXRLP_L8TB3f8XEGdD_DiDAeXMpHM', '2024-01-30 16:33:16.367231', '2024-01-31 16:33:16.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'aa37135c3e734af08a74a27ab1f4b066'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcxODg0OCwiaWF0IjoxNzA2NjMyNDQ4LCJqdGkiOiIwYWUxZmMwN2E3MzI0YTUwYTM0ZDZiMjZkYmIxMTRjOCIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.Vfa3sJgQXg3QoVGIbJ5mRS92djBUiTUuY5gORN8Fhxw', '2024-01-30 16:34:08.492730', '2024-01-31 16:34:08.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', '0ae1fc07a7324a50a34d6b26dbb114c8'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNjcyMjQ0MiwiaWF0IjoxNzA2NjM2MDQyLCJqdGkiOiJmMmRmODRkYjlmMjY0ZjQ5OGY0MDQwOTRlOTI4ZjJmYSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.9240Ejg7ag4Yxcyyv2S9awmtYQOMptv2bo_FfiSwjrY', '2024-01-30 17:34:02.904049', '2024-01-31 17:34:02.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'f2df84db9f264f498f404094e928f2fa'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwODk0OTk3MywiaWF0IjoxNzA4ODYzNTczLCJqdGkiOiI1ZDQyMDNiNDY2NDM0YjU1YjZkOTY1OTEzZTM3YTQ1OCIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.muhzB02qJt408nGVkSpzEIts9IKhp2jCJhIR166_hQk', '2024-02-25 12:19:33.893805', '2024-02-26 12:19:33.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', '5d4203b466434b55b6d965913e37a458'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwODk1MTk0MCwiaWF0IjoxNzA4ODY1NTQwLCJqdGkiOiJiNjc5MWNkMTY3ODQ0MWYyYTljOWFlMDJkNmRiOTZjYiIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.HhzkVYqhrBtXM_oUgKqdvOHxrUkgtIVC1lnh1FzTP1Y', '2024-02-25 12:52:20.983333', '2024-02-26 12:52:20.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', 'b6791cd1678441f2a9c9ae02d6db96cb'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwODk1Mjk4NywiaWF0IjoxNzA4ODY2NTg3LCJqdGkiOiJmOWM5NmI2NTYzOTg0OWM0OGE2M2FjZGE5ZjFiYTZlMiIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.qB54BWh9INV1T1y6ICR2rMnG7FDbEcJQN6OQZgkZYqw', '2024-02-25 13:09:47.910702', '2024-02-26 13:09:47.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'f9c96b65639849c48a63acda9f1ba6e2'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTAxMjMwMywiaWF0IjoxNzA4OTI1OTAzLCJqdGkiOiJhZTAzMTYwNDBhZjI0ZjkwYjYzZTY0MTMwMjc0MjFiMyIsInVzZXJfaWQiOiI2ODdkMjViOS00MGI1LTQ1N2ItOWE4My0zZmI4M2I4OWUxNjcifQ.h2VkrYfaXaCVWr1giKK35aM3dX0prCJnnxNhJHXdgxg', '2024-02-26 05:38:23.944424', '2024-02-27 05:38:23.000000', '687d25b9-40b5-457b-9a83-3fb83b89e167', 'ae0316040af24f90b63e6413027421b3'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTAxMjQyOCwiaWF0IjoxNzA4OTI2MDI4LCJqdGkiOiI1Y2M5MjIzYjkyODg0YTk3YTcyNjYxMjZiYTBiNzA2MyIsInVzZXJfaWQiOiI2ODdkMjViOS00MGI1LTQ1N2ItOWE4My0zZmI4M2I4OWUxNjcifQ.PD0iV07TXi0Cxh7yq4GuZg_-JfnHm0MGDjHFRipjDaM', '2024-02-26 05:40:28.769351', '2024-02-27 05:40:28.000000', '687d25b9-40b5-457b-9a83-3fb83b89e167', '5cc9223b92884a97a7266126ba0b7063'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTAyMzAwMSwiaWF0IjoxNzA4OTM2NjAxLCJqdGkiOiIxNTkzYTk2ZDQzN2Y0ZDA3OTlmMTlkODY5NDJkY2M5NyIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.A4mikAeRFjc1_CXugijg4aiMQ7KiAerncQ5r7graBw0', '2024-02-26 08:36:41.441212', '2024-02-27 08:36:41.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', '1593a96d437f4d0799f19d86942dcc97'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTAyMzA3MCwiaWF0IjoxNzA4OTM2NjcwLCJqdGkiOiJkMTlhN2U1NjRjMDU0MDA0YThkYTRlODFmYzBlMTUyZSIsInVzZXJfaWQiOiJlYTcyMTg2ZC00OWIzLTRhZWItOTU0MS03ZWI3NzRiODM4YTQifQ.sJjmCAZ50Q1rbB927X4xHRvuxVmFkbAVfX17BycUTKg', '2024-02-26 08:37:50.872584', '2024-02-27 08:37:50.000000', 'ea72186d-49b3-4aeb-9541-7eb774b838a4', 'd19a7e564c054004a8da4e81fc0e152e'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTAyMzY0MCwiaWF0IjoxNzA4OTM3MjQwLCJqdGkiOiI4YjhiMTFmZTRlZGM0NGVjOTZkZWFkYzgyYmU4YmEyNyIsInVzZXJfaWQiOiI2ODdkMjViOS00MGI1LTQ1N2ItOWE4My0zZmI4M2I4OWUxNjcifQ.l-sc4syHRVsKf7x_Z_vSfZWhVLLzYDaKZ72CzIzpJr4', '2024-02-26 08:47:20.482883', '2024-02-27 08:47:20.000000', '687d25b9-40b5-457b-9a83-3fb83b89e167', '8b8b11fe4edc44ec96deadc82be8ba27'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTA1MjA5MCwiaWF0IjoxNzA4OTY1NjkwLCJqdGkiOiIwZTAzYzdhMzE5Mzk0YTFlYjk0YmE4MDhiZjkyYjAxMyIsInVzZXJfaWQiOiI4ZmQ2MTg4ZC0zMjU0LTRiYzYtOGUyOC01MjgzODE1NjUxNWUifQ.VVszxAEdZmVfvH-6VbJFtSPsw0KFA4IjcM91U3qKHNA', '2024-02-26 16:41:30.860533', '2024-02-27 16:41:30.000000', '8fd6188d-3254-4bc6-8e28-52838156515e', '0e03c7a319394a1eb94ba808bf92b013');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_soil_sampler_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `soil_sampler_captcha`
--
ALTER TABLE `soil_sampler_captcha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soil_sampler_sample`
--
ALTER TABLE `soil_sampler_sample`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soil_sampler_samplestationlocator`
--
ALTER TABLE `soil_sampler_samplestationlocator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `soil_sampler_samples_sample_id_id_4fabf930_fk_soil_samp` (`sample_id_id`),
  ADD KEY `soil_sampler_samples_user_id_17b011a6_fk_soil_samp` (`user_id`),
  ADD KEY `soil_sampler_samples_station_id_id_71ded137_fk_soil_samp` (`station_id_id`);

--
-- Indexes for table `soil_sampler_sampletest`
--
ALTER TABLE `soil_sampler_sampletest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `soil_sampler_samplet_sample_station_locat_b6bfa12a_fk_soil_samp` (`sample_station_locator_id_id`);

--
-- Indexes for table `soil_sampler_station`
--
ALTER TABLE `soil_sampler_station`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `soil_sampler_stationmaster`
--
ALTER TABLE `soil_sampler_stationmaster`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `station_id` (`station_id`);

--
-- Indexes for table `soil_sampler_user`
--
ALTER TABLE `soil_sampler_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `soil_sampler_user_groups`
--
ALTER TABLE `soil_sampler_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `soil_sampler_user_groups_user_id_group_id_aca9e091_uniq` (`user_id`,`group_id`),
  ADD KEY `soil_sampler_user_groups_group_id_720de127_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `soil_sampler_user_user_permissions`
--
ALTER TABLE `soil_sampler_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `soil_sampler_user_user_p_user_id_permission_id_96acc0e2_uniq` (`user_id`,`permission_id`),
  ADD KEY `soil_sampler_user_us_permission_id_3cbb745c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`);

--
-- Indexes for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  ADD KEY `token_blacklist_outs_user_id_83bc629a_fk_soil_samp` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `soil_sampler_user_groups`
--
ALTER TABLE `soil_sampler_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soil_sampler_user_user_permissions`
--
ALTER TABLE `soil_sampler_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_soil_sampler_user_id` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`);

--
-- Constraints for table `soil_sampler_samplestationlocator`
--
ALTER TABLE `soil_sampler_samplestationlocator`
  ADD CONSTRAINT `soil_sampler_samples_sample_id_id_4fabf930_fk_soil_samp` FOREIGN KEY (`sample_id_id`) REFERENCES `soil_sampler_sample` (`id`),
  ADD CONSTRAINT `soil_sampler_samples_station_id_id_71ded137_fk_soil_samp` FOREIGN KEY (`station_id_id`) REFERENCES `soil_sampler_station` (`id`),
  ADD CONSTRAINT `soil_sampler_samples_user_id_17b011a6_fk_soil_samp` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`);

--
-- Constraints for table `soil_sampler_sampletest`
--
ALTER TABLE `soil_sampler_sampletest`
  ADD CONSTRAINT `soil_sampler_samplet_sample_station_locat_b6bfa12a_fk_soil_samp` FOREIGN KEY (`sample_station_locator_id_id`) REFERENCES `soil_sampler_samplestationlocator` (`id`);

--
-- Constraints for table `soil_sampler_stationmaster`
--
ALTER TABLE `soil_sampler_stationmaster`
  ADD CONSTRAINT `soil_sampler_station_station_id_2a278880_fk_soil_samp` FOREIGN KEY (`station_id`) REFERENCES `soil_sampler_station` (`id`),
  ADD CONSTRAINT `soil_sampler_station_user_id_6ebc7beb_fk_soil_samp` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`);

--
-- Constraints for table `soil_sampler_user_groups`
--
ALTER TABLE `soil_sampler_user_groups`
  ADD CONSTRAINT `soil_sampler_user_gr_user_id_b425d6a5_fk_soil_samp` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`),
  ADD CONSTRAINT `soil_sampler_user_groups_group_id_720de127_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `soil_sampler_user_user_permissions`
--
ALTER TABLE `soil_sampler_user_user_permissions`
  ADD CONSTRAINT `soil_sampler_user_us_permission_id_3cbb745c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `soil_sampler_user_us_user_id_a99038c3_fk_soil_samp` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`);

--
-- Constraints for table `token_blacklist_blacklistedtoken`
--
ALTER TABLE `token_blacklist_blacklistedtoken`
  ADD CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`);

--
-- Constraints for table `token_blacklist_outstandingtoken`
--
ALTER TABLE `token_blacklist_outstandingtoken`
  ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_soil_samp` FOREIGN KEY (`user_id`) REFERENCES `soil_sampler_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
