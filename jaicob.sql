-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 30, 2023 at 06:35 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jaicob`
--
CREATE DATABASE IF NOT EXISTS `jaicob` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jaicob`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user model', 7, 'add_usermodel'),
(26, 'Can change user model', 7, 'change_usermodel'),
(27, 'Can delete user model', 7, 'delete_usermodel'),
(28, 'Can view user model', 7, 'view_usermodel'),
(29, 'Can add user feedback model', 8, 'add_userfeedbackmodel'),
(30, 'Can change user feedback model', 8, 'change_userfeedbackmodel'),
(31, 'Can delete user feedback model', 8, 'delete_userfeedbackmodel'),
(32, 'Can view user feedback model', 8, 'view_userfeedbackmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'userapp', 'usermodel'),
(8, 'userapp', 'userfeedbackmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-11-24 07:00:26.336798'),
(2, 'auth', '0001_initial', '2022-11-24 07:00:26.803819'),
(3, 'admin', '0001_initial', '2022-11-24 07:00:26.935893'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-24 07:00:26.949415'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-24 07:00:26.963431'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-24 07:00:27.041227'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-24 07:00:27.079560'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-11-24 07:00:27.120581'),
(9, 'auth', '0004_alter_user_username_opts', '2022-11-24 07:00:27.130671'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-11-24 07:00:27.195244'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-11-24 07:00:27.199220'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-24 07:00:27.214422'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-11-24 07:00:27.262929'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-24 07:00:27.306041'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-11-24 07:00:27.356338'),
(16, 'auth', '0011_update_proxy_permissions', '2022-11-24 07:00:27.372760'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-24 07:00:27.414868'),
(18, 'sessions', '0001_initial', '2022-11-24 07:00:27.470901'),
(19, 'userapp', '0001_initial', '2022-11-25 06:26:14.307794'),
(20, 'userapp', '0002_userfeedbackmodel', '2022-11-28 05:40:49.726369'),
(21, 'userapp', '0003_usermodel_user_status', '2022-11-28 07:54:02.372809'),
(22, 'userapp', '0004_alter_usermodel_user_status', '2022-11-28 08:52:14.704716');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('11p8sigvej5rjm7nl2h9n94mxbp7vwsu', 'eyJ1c2VyX2lkIjo1fQ:1ozdT3:H4HIinJDA7zzetyxI7wCH6V-MIlZ9y6i8OfkwWCpcRk', '2022-12-12 12:42:37.187355'),
('kul4zg1nl6t00n5d50p0g01m9pd6j5ey', 'eyJ1c2VyX2lkIjoxMn0:1ozxxZ:5qCuUnzEYpLUHBxG5UZljVJ7DdD9AtD424xnX7dEOBc', '2022-12-13 10:35:29.233754'),
('xnjtqqy0vgrm1gkgf8t5v1a9e73y5euf', 'eyJ1c2VyX2lkIjoxMn0:1p0LUg:bmnwVTMH_zaaNViZInTYp2MRw32yxNFkqJRzU4yOmhI', '2022-12-14 11:43:14.363717'),
('uujbhhc2rbhbcr9u3vpsexwarlaoumjz', 'eyJ1c2VyX2lkIjo1fQ:1p0grS:s0bMvNMzeeekoJCOrvw62Ee9CON1_8gOKH1_Q0z9KsU', '2022-12-15 10:32:10.966785'),
('hav2cks0hsasn27sm3u6ljb5awyp038u', 'eyJ1c2VyX2lkIjo1fQ:1p15VY:uAKzKjYDOVV0r4dupmN85vJ82jfBc5iS-PCB31MrcFI', '2022-12-16 12:51:12.463559'),
('p55va1ekyxz4mrbwf75k9mplxmswzi09', 'eyJ1c2VyX2lkIjo1fQ:1p15d9:2iwuDw-4Y1hnah0j5Y3tOZxHwOq2mVfaSrTQp_Nb9Ww', '2022-12-16 12:59:03.522009'),
('nyzsiezltws9syj6en31wh00itytp9fx', 'eyJ1c2VyX2lkIjoxMn0:1p26BM:__jpQBTzO6R8UUKIdQw_bDY66vAP68OsqcLGacBRZvY', '2022-12-19 07:46:32.205679'),
('xbzmgti1mnxiulno9lgt5aryrejrhjxb', 'eyJ1c2VyX2lkIjo1fQ:1p2APt:coPuIFufeOkl4_ediVM3yc2QDdbRduWKQNbBtr6QKi4', '2022-12-19 12:17:49.260490'),
('bskc64rcjkolowupkc6uasizghznu95q', 'eyJ1c2VyX2lkIjo1fQ:1p2QXv:fsD66z2IYOIlHhRuGONc5deJHuuTr103OrjY9cfSpnQ', '2022-12-20 05:31:11.120308'),
('6c3jmzlbm0sldae0s7agi9hjm47se4iw', 'eyJ1c2VyX2lkIjo1fQ:1p2QXd:wR2ACFpwwrlWJAKDGsUK1TBoBi2XNEWPO4BjPiIPNPA', '2022-12-20 05:30:53.962681'),
('3fsw7yi9yrmhsnp9tj996c7qczw73nk5', 'eyJ1c2VyX2lkIjo1fQ:1p2UyB:tF5A0KBrAL3oVJ1MntEnkkOfZcTjCjDeudmo2FhZEsU', '2022-12-20 10:14:35.000592'),
('g6v5wlvl722vxg1teqqy348fpzt5jko7', 'eyJ1c2VyX2lkIjoxMn0:1qxRfn:pAIw21x7_IqVzB3sfR4eByu4-6LBmLvW9saZmFEemv0', '2023-11-13 12:47:15.260810'),
('pyshdz525m7ud775687u7zvujlkkre1z', 'eyJ1c2VyX2lkIjoxM30:1qxWGj:YWmiaMB8nz6c_BFTs7086SQ7zgIyIhQgzGMej1XJ_t4', '2023-11-13 17:41:41.884579');

-- --------------------------------------------------------

--
-- Table structure for table `user_complete_details`
--

DROP TABLE IF EXISTS `user_complete_details`;
CREATE TABLE IF NOT EXISTS `user_complete_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_contact` varchar(50) NOT NULL,
  `user_address` varchar(500) NOT NULL,
  `user_dob` date NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `user_qualification` varchar(100) NOT NULL,
  `user_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_complete_details`
--

INSERT INTO `user_complete_details` (`user_id`, `user_name`, `user_email`, `user_password`, `user_contact`, `user_address`, `user_dob`, `user_type`, `user_image`, `user_qualification`, `user_status`) VALUES
(10, 'lolly', 'lolly@gmail.com', '123456', '4567456789', 'hyd', '2022-11-19', 'Student', 'media/team-1.jpg', 'BBA', 'pending'),
(4, 'anya', 'anya@gmail.com', '123456', '6789067890', 'lbnagar', '2022-11-10', 'Developer', 'media/girll.webp', 'b.tech', 'declined'),
(5, 'rachanass', 'rachana@gmail.com', '123456', '1234512345', 'lbnagar', '2022-11-01', 'Developer', 'media/team-2.jpg', 'b.tech', 'accepted'),
(9, 'niya', 'niya@gmail.com', '123456', '994984238', 'dsnr', '2022-11-16', 'Developer', 'media/team-3_qZq79gm.jpg', 'Bsc', 'pending'),
(6, 'anu', 'anu@gmail.com', '123456', '994984238', 'chennai', '2022-11-03', 'Student', 'media/testimonial-4.jpg', 'management', 'accepted'),
(11, 'dd', 'dd@gmail.com', '123456', '994984238', 'ggg', '2022-11-05', 'Developer', 'media/user.jpg', 'b.tech', 'pending'),
(7, 'honey', 'honey@gmail.com', '123456', '4567456789', 'hyderabad', '2022-11-03', 'Developer', 'media/team-3.jpg', 'b.tech', 'pending'),
(8, 'riya', 'riya@gmail.com', '', '4564564567', 'Delhi', '2022-11-03', 'Developer', 'media/testimonial-3_nQfjKOb.jpg', 'BBA', 'pending'),
(12, 'mark', 'mark@gmail.com', 'Mark@123', '8975489754', 'hyd', '2000-01-01', 'Developer', 'media/girll_anOygAr.webp', 'BTech', 'accepted'),
(13, 'fazal', 'fazalsirmail@gmail.com', 'fazal', '8555887986', 'hyderabad', '2000-01-01', 'Student', 'media/face19.jpg', 'PhD', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
CREATE TABLE IF NOT EXISTS `user_feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(200) DEFAULT NULL,
  `text` varchar(200) DEFAULT NULL,
  `sentiment` varchar(700) DEFAULT NULL,
  `userfeedback_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `user_feedback_userfeedback_id_53d69569` (`userfeedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_feedback`
--

INSERT INTO `user_feedback` (`feedback_id`, `rating`, `text`, `sentiment`, `userfeedback_id`) VALUES
(4, '3', 'dddddddd', 'Neutral', 6),
(5, '5', 'good service', 'Neutral', 6),
(6, '1', 'hhhhhhhhhhhhhhhhhhhhhh', 'Neutral', 6),
(7, '5', 'good', 'Very Positive', 6),
(8, '3', 'im satisfied', 'Very Positive', 6),
(9, '1', 'bad', 'Very Negative', 5),
(11, '2', 'not good', 'Negative', 5),
(12, '3', 'good experience', 'Very Positive', 6),
(13, '5', 'it is a nice webiste for learning and exploring datascience. excellent job', 'Very Positive', 13);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
