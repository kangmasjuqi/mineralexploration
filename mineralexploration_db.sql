-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `holes`;
CREATE TABLE `holes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dip` double(8,2) NOT NULL,
  `azimuth` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `holes` (`id`, `latitude`, `longitude`, `dip`, `azimuth`, `created_at`, `updated_at`) VALUES
(1,	'23.40449',	'31.1338362',	39.47,	138.00,	'2021-04-24 07:45:30',	'2021-04-24 07:45:30'),
(2,	'24.1676',	'61.8340691',	15.80,	28.00,	'2021-04-24 07:45:31',	'2021-04-24 07:45:31'),
(3,	'40.0411178',	'40.1148',	52.39,	188.00,	'2021-04-24 07:45:31',	'2021-04-24 07:45:31');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2021_04_24_124710_create_holes_table',	1),
(5,	'2021_04_24_125117_create_readings_table',	1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `readings`;
CREATE TABLE `readings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hole_id` int(10) unsigned NOT NULL,
  `depth` double(8,2) NOT NULL,
  `dip` double(8,2) NOT NULL,
  `azimuth` double(8,2) NOT NULL,
  `is_trustworthy` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `readings_hole_id_foreign` (`hole_id`),
  CONSTRAINT `readings_hole_id_foreign` FOREIGN KEY (`hole_id`) REFERENCES `holes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `readings` (`id`, `hole_id`, `depth`, `dip`, `azimuth`, `is_trustworthy`, `created_at`, `updated_at`) VALUES
(2,	2,	847.50,	30.50,	10.00,	0,	'2021-04-24 07:48:52',	'2021-04-24 07:48:52'),
(3,	1,	919.07,	30.50,	10.00,	0,	'2021-04-24 07:48:52',	'2021-04-24 07:48:52'),
(4,	3,	221.41,	32.00,	14.00,	0,	'2021-04-24 07:48:52',	'2021-04-24 07:48:52'),
(5,	1,	463.15,	28.90,	11.80,	0,	'2021-04-24 07:48:52',	'2021-04-24 07:48:52'),
(6,	2,	598.76,	29.40,	10.00,	0,	'2021-04-24 07:48:52',	'2021-04-24 07:48:52'),
(7,	3,	679.34,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(8,	3,	800.96,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(9,	2,	432.58,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(10,	2,	172.43,	29.40,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(11,	1,	819.81,	35.00,	10.00,	0,	'2021-04-24 07:48:53',	'2021-05-17 07:24:53'),
(12,	1,	228.00,	30.50,	12.50,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(13,	3,	779.61,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(14,	3,	631.07,	30.50,	12.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(15,	3,	919.60,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(16,	2,	846.19,	30.50,	8.70,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(17,	1,	418.35,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(18,	2,	908.78,	31.30,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(19,	3,	134.89,	34.00,	17.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(20,	2,	268.22,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(21,	3,	538.51,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(22,	1,	95.87,	35.00,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(23,	3,	360.09,	30.50,	10.00,	0,	'2021-04-24 07:48:53',	'2021-04-24 07:48:53'),
(24,	1,	296.07,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(25,	2,	197.37,	39.00,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(26,	2,	648.22,	31.30,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(27,	2,	412.91,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(28,	2,	444.30,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(29,	2,	218.76,	30.50,	8.70,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(30,	1,	689.97,	30.50,	12.50,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(31,	1,	517.38,	28.90,	11.80,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(32,	3,	920.88,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(33,	2,	867.35,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(34,	2,	561.62,	30.50,	8.70,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(35,	2,	139.29,	31.30,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(36,	3,	113.64,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(37,	2,	188.25,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(38,	3,	414.99,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(39,	3,	946.59,	32.00,	14.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(40,	3,	776.50,	30.50,	10.00,	0,	'2021-04-24 07:48:54',	'2021-04-24 07:48:54'),
(41,	2,	163.54,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(42,	3,	757.02,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(43,	3,	986.71,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(44,	3,	25.59,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(45,	2,	329.63,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(46,	2,	95.89,	30.50,	8.70,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(47,	1,	428.00,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(48,	3,	96.40,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(49,	1,	612.18,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(50,	3,	92.79,	34.00,	13.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(51,	3,	592.46,	30.50,	17.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(52,	3,	386.52,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(53,	3,	770.08,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(54,	1,	489.72,	30.50,	11.80,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(55,	2,	411.97,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(56,	3,	174.78,	32.00,	14.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(57,	3,	917.37,	34.00,	13.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(58,	2,	56.66,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(59,	2,	424.77,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(60,	3,	259.00,	30.50,	10.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(61,	3,	513.31,	32.00,	14.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(62,	3,	75.00,	30.50,	17.00,	0,	'2021-04-24 07:48:55',	'2021-04-24 07:48:55'),
(63,	1,	914.73,	30.50,	12.50,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(64,	3,	240.55,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(65,	3,	340.39,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(66,	3,	783.21,	34.00,	13.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(67,	2,	331.00,	29.40,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(68,	3,	344.00,	34.00,	13.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(69,	1,	588.22,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(70,	3,	555.72,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(71,	1,	128.10,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(72,	3,	852.79,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(73,	2,	317.53,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(74,	2,	701.00,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(75,	3,	197.63,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(76,	3,	701.24,	32.00,	14.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(77,	1,	971.60,	35.00,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(78,	2,	79.28,	30.00,	20.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(79,	3,	325.70,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(80,	1,	744.91,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(81,	2,	311.83,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(82,	3,	256.55,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(83,	1,	828.77,	30.50,	11.80,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(84,	2,	851.11,	30.50,	10.00,	0,	'2021-04-24 07:48:56',	'2021-04-24 07:48:56'),
(85,	3,	727.98,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(86,	3,	598.41,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(87,	1,	57.93,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(88,	3,	113.27,	30.50,	18.00,	0,	'2021-04-24 07:48:57',	'2021-05-17 10:13:05'),
(89,	2,	970.54,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(90,	1,	354.82,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(91,	3,	786.32,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(92,	3,	715.59,	34.00,	13.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(93,	3,	270.74,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(94,	1,	126.00,	30.50,	11.80,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(95,	1,	79.00,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-05-17 07:57:54'),
(96,	2,	27.78,	31.30,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(97,	1,	816.60,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(98,	3,	943.64,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(99,	3,	865.16,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(100,	1,	987.03,	28.90,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(101,	1,	65.81,	35.00,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(102,	3,	227.90,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(103,	2,	377.98,	29.40,	8.70,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(104,	1,	884.18,	30.50,	11.80,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(105,	2,	731.79,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(106,	3,	632.16,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(107,	1,	732.75,	30.50,	12.50,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(108,	2,	308.02,	30.50,	10.00,	0,	'2021-04-24 07:48:57',	'2021-04-24 07:48:57'),
(109,	3,	428.39,	30.50,	17.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(110,	1,	786.09,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(111,	1,	501.49,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(112,	2,	720.79,	29.40,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(113,	3,	736.78,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(114,	2,	500.30,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(115,	3,	865.90,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(116,	3,	806.07,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(117,	3,	962.40,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(118,	1,	612.09,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(119,	2,	80.00,	30.50,	15.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(120,	1,	726.65,	30.50,	11.80,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(121,	2,	769.30,	31.30,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(122,	2,	755.76,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(123,	3,	664.02,	32.00,	14.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(124,	3,	829.35,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(125,	2,	276.10,	39.00,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(126,	1,	21.00,	28.90,	10.00,	0,	'2021-04-24 07:48:58',	'2021-05-17 08:37:50'),
(127,	1,	895.30,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(128,	2,	946.41,	30.50,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(129,	1,	13.00,	30.50,	11.80,	0,	'2021-04-24 07:48:58',	'2021-05-17 08:03:19'),
(130,	1,	189.49,	30.50,	11.80,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(131,	1,	921.22,	28.90,	10.00,	0,	'2021-04-24 07:48:58',	'2021-04-24 07:48:58'),
(132,	1,	17.60,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-05-17 08:04:33'),
(133,	1,	358.90,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(134,	3,	329.20,	32.00,	14.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(135,	1,	199.26,	30.50,	12.50,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(136,	2,	866.04,	29.40,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(137,	2,	165.98,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(138,	3,	957.47,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(139,	1,	415.15,	30.50,	11.80,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(140,	2,	923.97,	31.30,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(141,	2,	75.41,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(142,	2,	231.22,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(143,	1,	411.20,	28.90,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(144,	3,	908.81,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(145,	3,	59.46,	34.00,	13.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(146,	3,	500.33,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(147,	2,	696.51,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(148,	2,	189.00,	30.50,	8.70,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(149,	3,	920.66,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(150,	1,	525.25,	30.50,	12.50,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(151,	1,	988.38,	30.50,	11.80,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(152,	1,	897.22,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(153,	3,	324.31,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(154,	3,	766.28,	30.50,	10.00,	0,	'2021-04-24 07:48:59',	'2021-04-24 07:48:59'),
(155,	3,	991.05,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(156,	3,	162.47,	32.00,	14.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(157,	1,	563.52,	35.00,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(158,	1,	767.19,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(159,	2,	991.48,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(160,	1,	381.10,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(161,	1,	512.00,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(162,	2,	829.44,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(163,	2,	926.66,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(164,	2,	429.79,	31.30,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(165,	1,	828.58,	30.50,	12.50,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(166,	1,	334.00,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(167,	2,	483.36,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(168,	2,	566.16,	30.50,	8.70,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(169,	3,	398.31,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(170,	3,	96.51,	30.50,	17.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(171,	3,	595.03,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(172,	3,	998.30,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(173,	1,	817.03,	35.00,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(174,	2,	105.51,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(175,	1,	215.08,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(176,	3,	573.00,	30.50,	10.00,	0,	'2021-04-24 07:49:00',	'2021-04-24 07:49:00'),
(177,	2,	761.00,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(178,	3,	791.77,	32.00,	14.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(179,	1,	665.20,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(180,	2,	169.81,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(181,	1,	960.09,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(182,	1,	729.00,	28.90,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(183,	3,	834.23,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(184,	1,	33.80,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(185,	2,	676.81,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(186,	3,	680.00,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(187,	2,	701.22,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(188,	1,	51.55,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(189,	3,	389.25,	34.00,	13.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(190,	3,	319.80,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(191,	2,	738.69,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(192,	2,	492.36,	29.40,	8.70,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(193,	1,	871.39,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(194,	3,	407.38,	32.00,	14.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(195,	1,	428.00,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(196,	2,	993.29,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(197,	3,	649.89,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(198,	3,	166.89,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(199,	1,	982.00,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(200,	1,	821.79,	35.00,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(201,	1,	698.00,	30.50,	10.00,	0,	'2021-04-24 07:49:01',	'2021-04-24 07:49:01'),
(202,	3,	165.87,	34.00,	13.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(203,	3,	738.56,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(204,	2,	597.62,	31.30,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(205,	1,	644.10,	28.90,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(206,	3,	964.06,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(207,	3,	328.00,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(208,	3,	609.92,	32.00,	14.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(209,	3,	502.71,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(210,	3,	738.46,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(211,	2,	313.05,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(212,	3,	537.01,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(213,	2,	148.40,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(214,	2,	981.54,	31.30,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(215,	1,	148.90,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(216,	3,	672.86,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(217,	2,	292.73,	29.40,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(218,	3,	380.00,	32.00,	14.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(219,	2,	412.55,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(220,	1,	715.85,	30.50,	12.50,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(221,	2,	498.09,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(222,	3,	869.00,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(223,	2,	707.03,	30.50,	10.00,	0,	'2021-04-24 07:49:02',	'2021-04-24 07:49:02'),
(224,	3,	453.90,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(225,	1,	224.74,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(226,	1,	956.00,	28.90,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(227,	1,	906.70,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(228,	2,	119.67,	29.40,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(229,	1,	437.92,	28.90,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(230,	1,	38.06,	35.00,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(231,	3,	990.14,	32.00,	14.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(232,	2,	950.45,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(233,	3,	187.00,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(234,	1,	767.87,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(235,	1,	155.20,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(236,	1,	717.83,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(237,	2,	404.15,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(238,	2,	783.00,	29.40,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(239,	2,	759.67,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(240,	3,	912.80,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(241,	1,	324.00,	35.00,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(242,	2,	357.00,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(243,	1,	259.86,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(244,	1,	19.07,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-05-17 09:24:01'),
(245,	3,	782.54,	32.00,	14.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(246,	2,	682.12,	30.50,	10.00,	0,	'2021-04-24 07:49:03',	'2021-04-24 07:49:03'),
(247,	1,	372.44,	28.90,	12.50,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(248,	2,	11.42,	31.30,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(249,	2,	673.62,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(250,	1,	696.18,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(251,	2,	756.49,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(252,	3,	164.10,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(253,	3,	968.52,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(254,	2,	18.00,	39.00,	10.00,	0,	'2021-04-24 07:49:04',	'2021-05-17 09:01:14'),
(255,	2,	480.55,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(256,	3,	850.13,	34.00,	13.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(257,	1,	95.35,	35.00,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(258,	1,	714.08,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(259,	1,	46.62,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(260,	2,	151.31,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(261,	3,	865.04,	32.00,	14.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(262,	2,	574.77,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(263,	1,	819.13,	30.50,	11.80,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(264,	2,	958.30,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(265,	1,	209.50,	35.00,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(266,	2,	954.30,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(267,	1,	853.36,	30.50,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(268,	1,	505.62,	28.90,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(269,	2,	44.67,	30.00,	20.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(270,	2,	117.02,	39.00,	10.00,	0,	'2021-04-24 07:49:04',	'2021-04-24 07:49:04'),
(271,	1,	516.49,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(272,	3,	622.19,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(273,	1,	263.10,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(274,	1,	398.61,	30.50,	11.80,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(275,	1,	130.09,	28.90,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(276,	2,	336.89,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(277,	2,	236.14,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(278,	2,	49.32,	30.50,	15.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(279,	2,	189.23,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(280,	2,	227.20,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(281,	1,	156.92,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(282,	2,	379.39,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(283,	2,	20.81,	30.50,	15.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(284,	2,	146.00,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(285,	1,	461.00,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(286,	2,	265.30,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(287,	3,	619.16,	34.00,	13.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(288,	1,	221.68,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(289,	3,	137.30,	30.50,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(290,	1,	922.82,	28.90,	10.00,	0,	'2021-04-24 07:49:05',	'2021-04-24 07:49:05'),
(291,	2,	124.76,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(292,	2,	840.80,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(293,	2,	655.55,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(294,	1,	527.51,	30.50,	11.80,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(295,	1,	159.82,	35.00,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(296,	1,	526.47,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(297,	1,	897.76,	28.90,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(298,	2,	634.08,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(299,	1,	100.14,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(300,	1,	950.76,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06'),
(301,	1,	327.15,	30.50,	10.00,	0,	'2021-04-24 07:49:06',	'2021-04-24 07:49:06');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'marjuqi',	'marjuqi.rahmat@gmail.com',	NULL,	'$2y$10$2jVSioTdVz1vRMxuSvXt6OgfQWrGV06Bm4bAydavGBH4UEDMEvB7G',	NULL,	'2021-04-24 07:18:13',	'2021-04-24 07:18:13');

-- 2021-05-17 17:14:42