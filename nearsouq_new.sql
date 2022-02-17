-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2022 at 01:36 PM
-- Server version: 5.7.37
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nearsouq_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('HOME','WORK') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` enum('TRUE','FALSE') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `first_name`, `last_name`, `comment`, `longitude`, `latitude`, `city`, `state`, `country`, `postal_code`, `street`, `type`, `default_address`, `phone`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, '13', 'Abdalhaleemt', 'Osman', 'جوار المسجد الجديد', '46.258888548', '24.544878787', 'الرياض', 'الرياض', 'المملكة العربية السعودية', '14333', 'شارع غبيراء العام', 'HOME', 'FALSE', '966542447223', '2022-02-01 11:18:28', '2022-02-01 11:19:36', NULL, NULL, NULL, NULL),
(11, '13', 'Abdalhaleem', 'Osman', 'جوار المسجد الجديد', '46.258888548', '24.544878787', 'الرياض', 'الرياض', 'المملكة العربية السعودية', '14333', 'شارع غبيراء العام', 'HOME', 'FALSE', '966542447226', '2022-02-01 11:16:46', '2022-02-01 11:16:55', NULL, NULL, NULL, NULL),
(12, '13', 'Abdalhaleem', 'Osman', 'جوار المسجد الجديد', '46.258888548', '24.544878787', 'الرياض', 'الرياض', 'المملكة العربية السعودية', '14333', 'شارع غبيراء العام', 'HOME', 'FALSE', '966542447226', '2022-02-01 11:16:55', '2022-02-01 11:17:06', NULL, NULL, NULL, NULL),
(13, '13', 'Abdalhaleem', 'Osman', 'جوار المسجد الجديد', '46.258888548', '24.544878787', 'الرياض', 'الرياض', 'المملكة العربية السعودية', '14333', 'شارع غبيراء العام', 'HOME', 'TRUE', '966542447223', '2022-02-01 11:17:06', '2022-02-01 11:19:36', NULL, NULL, NULL, NULL),
(14, '19', 'Dodo', 'Ahmed', 'Mansoura address', '31.364353448152542', '31.210376716574217', 'Belkas City', 'Dakahlia Governorate', 'Egypt', '879989', '6967+8GR', 'HOME', 'FALSE', '8545884734', '2022-02-01 14:16:15', '2022-02-06 11:28:19', '2022-02-06 11:28:19', NULL, NULL, NULL),
(15, '19', 'Doaa', 'Alkasaby', 'KSA address', '47.109418250620365', '24.68902633620423', 'Riydha', 'Riyadh Province', 'Saudi Arabia', '14442', '42323', 'WORK', 'FALSE', '8545884734', '2022-02-01 14:17:34', '2022-02-02 08:50:01', '2022-02-02 08:50:01', NULL, NULL, NULL),
(16, '19', 'Doaa', 'Alkasaby', 'KSA address2', '44.01436295360327', '26.310193189409528', 'Buraydah', 'Al Qassim', 'Saudi Arabia', '52346', '5036', 'WORK', 'TRUE', '8545884734', '2022-02-01 15:55:53', '2022-02-02 08:59:07', '2022-02-02 08:59:07', NULL, NULL, NULL),
(17, '19', 'doaa', 'alkasaby', 'work address', '46.78984746336938', '24.750266771982396', 'Riyadh', 'Riyadh Province', 'Saudi Arabia', '13212', '3533 Ibrahim Ibn Ghunaim', 'WORK', 'FALSE', '6868868871', '2022-02-02 09:00:22', '2022-02-06 11:28:16', '2022-02-06 11:28:16', NULL, NULL, NULL),
(18, '19', 'Nagwa', 'ahmed', 'work address', '44.01424191892147', '26.070827526711273', 'Unayzah', 'Al Qassim', 'Saudi Arabia', '56467', '7018', 'WORK', 'TRUE', '014346736744', '2022-02-02 09:01:18', '2022-02-06 11:28:13', '2022-02-06 11:28:13', NULL, NULL, NULL),
(19, '19', 'Zena', 'omar', 'zeina address', '45.47254588454962', '23.527590313135935', 'riyadh', 'Riyadh Province', 'Saudi Arabia', '19598', '53434', 'HOME', 'FALSE', '4354652342', '2022-02-02 12:35:03', '2022-02-06 11:28:11', '2022-02-06 11:28:11', NULL, NULL, NULL),
(20, '19', 'Mohamed', 'ali', 'mohammed address', '45.47254588454962', '23.527590313135935', 'malz', 'Riyadh Province', 'Saudi Arabia', '19598', '19598', 'HOME', 'FALSE', '4386837858', '2022-02-02 12:48:58', '2022-02-02 12:50:45', '2022-02-02 12:50:45', NULL, NULL, NULL),
(21, '19', 'Said', 'husswin', 'said address', '45.47254588454962', '23.527590313135935', 'malz', 'Riyadh Province', 'Saudi Arabia', '19598', '19598', 'HOME', 'FALSE', '4386837858', '2022-02-02 12:51:14', '2022-02-06 11:28:07', '2022-02-06 11:28:07', NULL, NULL, NULL),
(22, '19', 'doaa', 'alkasaby', 'mama address', '45.47254588454962', '23.527590313135935', 'Riyadh address', 'Riyadh Province', 'Saudi Arabia', '19598', '19598', 'HOME', 'FALSE', '4386837858', '2022-02-06 11:30:25', '2022-02-06 11:30:25', NULL, NULL, NULL, NULL),
(23, '19', 'Huda', 'Salim', 'My sister address', '44.02122437953949', '26.35761864675486', 'Buraydah', 'Al Qassim', 'Saudi Arabia', '52365', '2526', 'WORK', 'FALSE', '7463647344', '2022-02-06 11:40:55', '2022-02-06 11:40:55', NULL, NULL, NULL, NULL),
(24, '20', 'noga', 'alkaaby', 'my sster address', '45.47254588454962', '23.527590313135935', 'mans', 'Riyadh Province', 'Saudi Arabia', '19598', '19598', 'HOME', 'FALSE', '74639573620', '2022-02-06 12:44:36', '2022-02-06 12:44:36', NULL, NULL, NULL, NULL),
(25, '2', 'mahm3435oud shennawy', 'abdo', 'test', '46.7399423', '24.6215765', 'Riyadh', 'Riyadh Province', 'Saudi Arabia', '12664', 'حي', 'HOME', 'TRUE', '01090766553', '2022-02-07 06:20:08', '2022-02-07 06:20:08', NULL, NULL, NULL, NULL),
(26, '19', 'doaa', 'alkasaby', 'my address', '46.603055074810975', '24.599591789773616', 'Riyadh', 'Riyadh Province', 'Saudi Arabia', '12966', '4036', 'HOME', 'FALSE', '4386837858', '2022-02-07 07:10:24', '2022-02-07 07:10:24', NULL, NULL, NULL, NULL),
(27, '19', 'Hanem', 'Omar', 'Sister address', '31.279978193342682', '30.03751597300207', 'Al Abageyah', 'Cairo Governorate', 'Egypt', '587687', 'الأباجية، قسم الخليفة،، Al Abageyah', 'HOME', 'FALSE', '4386837858', '2022-02-08 12:46:37', '2022-02-08 12:46:37', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `quantity` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `shop_id`, `product_id`, `user_id`, `quantity`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 2, 2, 21, 1, '2022-02-16 08:03:53', '2022-02-16 08:03:53', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product_options`
--

CREATE TABLE `cart_product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `description_ar`, `description_en`, `parent`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'القسم الاول ', 'categoris1', '	\r\ncategoris1\r\ndescription_ar	\r\ncategoris1\r\ndescription_ar	\r\ncategoris1\r\ndescription_ar', '	\r\ncategoris1\r\ndescription_ar', NULL, 'child.PNG.jpg', '1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'القسم التاني ', 'categories2', 'categories2categories2categories2categories2', 'categories2categories2', NULL, 'child.PNG.jpg', '1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_calculators`
--

CREATE TABLE `delivery_calculators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `mall_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cost` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT '1',
  `distance` int(11) DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_calculators`
--

INSERT INTO `delivery_calculators` (`id`, `cart_id`, `shop_id`, `mall_id`, `user_id`, `cost`, `count`, `distance`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(2, 8, 1, 1, 2, '809.5', 1, 1619, '30.03751597300207', '31.279978193342682', '2022-02-09 09:59:44', '2022-02-10 06:47:43'),
(8, 11, 4, 3, 19, '73.5', 1, 147, '23.527590313135935', '45.47254588454962', '2022-02-10 12:53:07', '2022-02-10 12:53:07'),
(9, 1, 2, 2, 21, '73.5', 1, 147, '23.527590313135935', '45.47254588454962', '2022-02-16 08:03:53', '2022-02-16 08:03:53');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_costs`
--

CREATE TABLE `delivery_costs` (
  `id` int(11) NOT NULL,
  `min_distance` int(255) DEFAULT NULL,
  `max_distance` int(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_costs`
--

INSERT INTO `delivery_costs` (`id`, `min_distance`, `max_distance`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 20, '0.90', NULL, NULL),
(2, 21, 40, '0.70', NULL, NULL),
(3, 41, 50000, '0.50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_relation`
--

CREATE TABLE `delivery_relation` (
  `id` int(11) NOT NULL,
  `deliverycalculator_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_relation`
--

INSERT INTO `delivery_relation` (`id`, `deliverycalculator_id`, `cart_id`) VALUES
(11, 8, 11),
(12, 9, 1),
(14, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(27, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 1, 4, '2022-01-30 13:02:30', '2022-01-30 13:02:30', NULL, NULL, NULL, NULL),
(40, 1, 1, '2022-01-31 10:02:56', '2022-01-31 10:02:56', NULL, NULL, NULL, NULL),
(41, 1, 1, '2022-01-31 10:03:08', '2022-01-31 10:03:08', NULL, NULL, NULL, NULL),
(42, 1, 1, '2022-01-31 12:13:53', '2022-01-31 12:13:53', NULL, NULL, NULL, NULL),
(43, 1, 1, '2022-01-31 12:14:02', '2022-01-31 12:14:02', NULL, NULL, NULL, NULL),
(44, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 2, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 1, 19, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `imageable_id` int(10) UNSIGNED NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malls`
--

CREATE TABLE `malls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mall_category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `malls`
--

INSERT INTO `malls` (`id`, `name_ar`, `name_en`, `owner_name`, `owner_phone`, `address`, `image`, `desc_ar`, `desc_en`, `email`, `contact_number`, `mall_category_id`, `visible`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'الوان مول', 'alwan mall', '1234567', '1234567', 'الرياض الملز فاطمة الزهراء', '15542698954-min.jpg', 'متجر متخصص في الملابس', 'store', 'mall@gmail.com', '1234567', '1', '1', '24.4547821', '46.578412', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'بنده مول', 'panda mall', '1234567', '1234567', 'الرياض العليا', '15542698832-min.jpg', '1234567', '1234567', 'mall@gmail.com', '1234567', '1', '1', '24.7547821', '46.478412', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'مهام مول', 'maham mall', '1234567', '1234567', 'الرياض الملز فاطمة الزهراء', '15542698954-min.jpg', 'متجر متخصص في الملابس', 'store', 'mall@gmail.com', '1234567', '1', '1', '24.3547821', '46.458412', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'عتيقة مول', 'etaga mall', '1234567', '1234567', 'الرياض الملز فاطمة الزهراء', '15542698954-min.jpg', 'متجر متخصص في الملابس', 'store', 'mall@gmail.com', '1234567', '1', '1', '24.3547821', '46.568412', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_01_01_000001_create_tags_table', 1),
(9, '2020_01_01_180051_laratrust_setup_tables', 1),
(10, '2020_07_18_162255_create_images_table', 1),
(11, '2020_07_28_074044_create_sliders_table', 1),
(12, '2021_12_28_175925_create_addresses_table', 1),
(13, '2021_12_28_181139_create_payment_methods_table', 1),
(14, '2021_12_28_185730_create_shops_table', 1),
(15, '2021_12_28_191016_create_products_table', 1),
(16, '2021_12_28_191737_create_shop_products_table', 1),
(17, '2020_01_01_145852_create_categories_table', 2),
(18, '2022_01_03_101700_create_variants_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'sasdsdasd', 'dasdadasd', 9, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 's\\dcsfd', 'vvcxvzzcxv', 9, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('079b2ef81c69c545d965c752e444acfe874e58835d6a80b3e055cbfd57af15f7ef629fc24628604f', 5, 1, 'MyApp', '[]', 0, '2021-12-29 15:59:08', '2021-12-29 15:59:08', '2022-01-13 17:59:08'),
('0a16cb1c725f31fcb422ba029d78f499f8177f88fe9c30f751a3411efeffd66c065a39ec4189322e', 2, 1, 'MyApp', '[]', 0, '2022-02-07 21:36:44', '2022-02-07 21:36:44', '2022-02-22 21:36:44'),
('0b6b31c50474c07a482ee30473c2c38d470edc1ff9a393b0fff8bea999f9f0a300411097295e5dbc', 2, 1, 'MyApp', '[]', 0, '2022-02-07 11:27:16', '2022-02-07 11:27:16', '2022-02-22 11:27:15'),
('0c4c0dbce007b044526abf1e66fbf12bf997eff83506004d25c8994f02643db830ec87381fdb948e', 2, 1, 'MyApp', '[]', 1, '2022-02-16 09:02:23', '2022-02-16 09:02:23', '2022-03-03 09:02:22'),
('0c79cce0e2199d04bf31cfef05a9c21795e3ab1264b9b84924204ad2fc0ca55c506b50f6fa31cffc', 8, 1, 'MyApp', '[]', 0, '2022-01-01 11:33:28', '2022-01-01 11:33:28', '2022-01-16 13:33:27'),
('1037f2652eacbce62f42d221de25c9d63bad44ff39ffc59711faf2f9707c9494c9f9ea9218a6a0e8', 20, 1, 'MyApp', '[]', 1, '2022-02-06 12:34:40', '2022-02-06 12:34:40', '2022-02-21 12:34:40'),
('134e226e1448db55a2de9d182893f9ba0add364f7bc3b174f8b1002a376512648784a0cb8a8456e6', 2, 1, 'MyApp', '[]', 0, '2022-01-12 06:52:29', '2022-01-12 06:52:29', '2022-01-27 06:52:28'),
('13e4c44e924a9e7afb8cc5fa48aa4cef75121b8c8ed00345d559ff977e2d950b6dbbdd1deb4121c5', 20, 1, 'MyApp', '[]', 1, '2022-02-06 12:22:05', '2022-02-06 12:22:05', '2022-02-21 12:22:05'),
('190d515fc0d1d8bc72d524aee7dfca03576adb3dfa8581fee665476163b441309b88d5462241b316', 2, 1, 'MyApp', '[]', 0, '2022-01-18 19:50:37', '2022-01-18 19:50:37', '2022-02-02 19:50:36'),
('2096b01bbfdedd86562e0cdc245b75c7643d8797ba4df539b9e315feba2929fcafbbff14e7c2391c', 11, 1, 'MyApp', '[]', 0, '2022-01-17 07:39:44', '2022-01-17 07:39:44', '2022-02-01 07:39:44'),
('2214e57448d01ee37e7ed21c9922a22529a20eaa3d56c346ab110d5e96be34e3fd2c9cb69e478b24', 2, 1, 'MyApp', '[]', 0, '2022-01-26 20:08:53', '2022-01-26 20:08:53', '2022-02-10 20:08:53'),
('22bc228e6c1af78781ddc754dc7b06af9ce355a6d6e5763c1ccb43117882525e9a49e94f6fe1b01b', 19, 1, 'MyApp', '[]', 0, '2022-02-08 10:46:02', '2022-02-08 10:46:02', '2022-02-23 10:46:02'),
('2374db4dbfaa6564abcea068b831910b716611a7af7bd666dc5e994ac170884957a0ed1d57f27b2d', 2, 1, 'MyApp', '[]', 0, '2022-01-15 11:26:06', '2022-01-15 11:26:06', '2022-01-30 11:26:05'),
('28bd3552959ba3c8acdc73d66c677e22798ebec977789ed05ac5e60abdeef6b06b1249f8f11b4397', 1, 1, 'MyApp', '[]', 0, '2022-01-23 06:46:17', '2022-01-23 06:46:17', '2022-02-07 06:46:16'),
('2e8259bd09134605e2541aadfcbe1d5e4fd6ef5c4d662fea0c93b71ce3a1884a1492f813037c2279', 2, 1, 'MyApp', '[]', 0, '2022-01-25 19:54:50', '2022-01-25 19:54:50', '2022-02-09 19:54:50'),
('2f581a943901d480f7fb10fcb4b18452a7ca8fb837b5f674dbbdd7a4b709b58a8d654e7ac59ac7be', 2, 1, 'MyApp', '[]', 0, '2022-02-08 19:58:22', '2022-02-08 19:58:22', '2022-02-23 19:58:22'),
('3223449f2d9a13a6e4469bb0dac2223d5ba1ed0365893d3159f8e387e361c0a934cbf5ddc71ba1ca', 2, 1, 'MyApp', '[]', 0, '2022-01-26 20:04:43', '2022-01-26 20:04:43', '2022-02-10 20:04:42'),
('32bcfbb560ddd9375294d85ac90cb77f6de22cce8da34d426a885ab06a47ab4de138e917f33fca55', 2, 1, 'MyApp', '[]', 0, '2022-01-17 18:49:35', '2022-01-17 18:49:35', '2022-02-01 18:49:35'),
('37a73b3d3a99252cfeefd2498e64adf0e3181a082aebef3ab81ebe8d19f55142988d17ca1ff9e1ad', 19, 1, 'MyApp', '[]', 0, '2022-02-07 11:37:22', '2022-02-07 11:37:22', '2022-02-22 11:37:22'),
('39da88bcb497ba55f6061488855aa203d8cb6b7ced9a919ccde7d312ca89f33768f4259b8bc1c475', 2, 1, 'MyApp', '[]', 0, '2022-02-07 08:40:53', '2022-02-07 08:40:53', '2022-02-22 08:40:53'),
('42389072de7ea9003f7cc080f0d4dbab0ce1511165eb1edb2a6728bb3a6c32a318c8e81c039c3217', 2, 1, 'MyApp', '[]', 0, '2022-01-19 19:32:19', '2022-01-19 19:32:19', '2022-02-03 19:32:19'),
('436e6a93ccdbb4503ba839ea6467c61cea5d816b4bf7672dd62b0f577b4dbe669e90fef8c3a9cfce', 2, 1, 'MyApp', '[]', 1, '2022-01-26 11:20:41', '2022-01-26 11:20:41', '2022-02-10 11:20:41'),
('47895e3fec45d03e0804036942c24bb4e2973c20a79b41375cd42e72eaf9df4bd5e22c1121d611ee', 12, 1, 'MyApp', '[]', 0, '2022-01-18 11:38:20', '2022-01-18 11:38:20', '2022-02-02 11:38:20'),
('4a96ad8fbe9c0ec1ad6ff026f8e12b587857c4abe9b5c2301ca9ed6fd31a861c12ae91905595dc93', 2, 1, 'MyApp', '[]', 0, '2022-01-26 20:12:10', '2022-01-26 20:12:10', '2022-02-10 20:12:10'),
('4bf009b70f8977454ac6ded73e5762698fa2dff4853d08864a2de9c87fc4914d29ff812e11d66d9d', 18, 1, 'MyApp', '[]', 0, '2022-01-30 07:38:46', '2022-01-30 07:38:46', '2022-02-14 07:38:46'),
('549ab5e8114c638646c4e053361974db808e16c91f78568a2f28e98b2d31c885bfefdee1b9b8f65b', 2, 1, 'MyApp', '[]', 0, '2022-01-15 09:54:59', '2022-01-15 09:54:59', '2022-01-30 09:54:59'),
('55dcf48cbbaa009691f572e6503141c0154485dc0081485b6a88f2d6ff6721be52eea32051947611', 15, 1, 'MyApp', '[]', 0, '2022-01-23 07:51:01', '2022-01-23 07:51:01', '2022-02-07 07:51:01'),
('583a0a78da8d6bd06df672af9e00cceabf7df606f354a694c003d16ff6a4f8ded94b007692677834', 2, 1, 'MyApp', '[]', 0, '2022-02-06 09:16:26', '2022-02-06 09:16:26', '2022-02-21 09:16:26'),
('59641889353e5b7280f812467ce3e4420ba63f0e3a20b8220d5fe7827d91ee408c6eac3dbdbda919', 2, 1, 'MyApp', '[]', 0, '2022-01-24 11:56:55', '2022-01-24 11:56:55', '2022-02-08 11:56:55'),
('5972ea01cef5be4482103e1e23ec76485559edce1c31b3fcf13d4fe68c5b62f31164d5e6f46e6c4b', 2, 1, 'MyApp', '[]', 0, '2022-02-16 09:03:35', '2022-02-16 09:03:35', '2022-03-03 09:03:34'),
('59e2c21bd608cf5d1d8bb776c49835ec3edbab13dbdba05d90ef765636828fae98a49235da7469ec', 20, 1, 'MyApp', '[]', 0, '2022-02-06 12:40:34', '2022-02-06 12:40:34', '2022-02-21 12:40:34'),
('5dcb8a639886ad15a3f33dd1a97e30219761e26a73d82b2f5529ee38053f6cccb09ff7d2bb5f82d8', 2, 1, 'MyApp', '[]', 0, '2022-01-24 21:26:47', '2022-01-24 21:26:47', '2022-02-08 21:26:47'),
('5fe9f66410139e4270fb1071f3241401ccd14d3d2e253e628f0db1af3e9d0564a291c312eb0f3025', 17, 1, 'MyApp', '[]', 0, '2022-01-29 18:39:06', '2022-01-29 18:39:06', '2022-02-13 18:39:06'),
('64944603893a8790f4ada3dd93174c220a7a933700177f468338c016c9ab7ab1e338dc9f8aa88083', 19, 1, 'MyApp', '[]', 0, '2022-02-16 09:09:43', '2022-02-16 09:09:43', '2022-03-03 09:09:43'),
('689e9bf322283e8d4ae624282382e0ce78e06fa618122cd41f57fbb16c247cf6f339123ff5132c7f', 2, 1, 'MyApp', '[]', 0, '2022-01-16 08:02:22', '2022-01-16 08:02:22', '2022-01-31 08:02:22'),
('6c6840fda6da37f3af214d3f473968a4f4405a6ce3a252c7ada1b939a0a5f2827a9d764d2771c6aa', 19, 1, 'MyApp', '[]', 1, '2022-02-01 09:00:00', '2022-02-01 09:00:00', '2022-02-16 09:00:00'),
('6de2a2f09c0185f795e05822c6536e407c71a713fec8b3be48609dc442a6192ff4add73d0d6f9eb3', 2, 1, 'MyApp', '[]', 0, '2022-01-18 22:23:34', '2022-01-18 22:23:34', '2022-02-02 22:23:34'),
('6f8479d9c2d540bfe2271f8945538fcbd0d1508cac5e9f5c2a27190681802bedecbbd049bd889c43', 2, 1, 'MyApp', '[]', 0, '2022-01-23 13:16:39', '2022-01-23 13:16:39', '2022-02-07 13:16:38'),
('770922808b9665ccea4567547a0396011d040896fde8e860468c8bb6af99d7acc513320ab3957401', 2, 1, 'MyApp', '[]', 0, '2022-02-02 21:22:11', '2022-02-02 21:22:11', '2022-02-17 21:22:11'),
('78c13172b882e40f729c65ef3efd78091e2b0b198176c34f277ea702b261e8d76cc1f2bc6d97f92b', 9, 1, 'MyApp', '[]', 0, '2022-01-08 18:15:15', '2022-01-08 18:15:15', '2022-01-23 18:15:15'),
('7a530abe5d9004acfda3f5e206e339aad6ff34120aa8956161feeab5be7ae900cd0d7e220099ad5c', 19, 1, 'MyApp', '[]', 0, '2022-02-07 07:10:00', '2022-02-07 07:10:00', '2022-02-22 07:10:00'),
('7d70367b13740580c4fc3b6a47f42746e9143a21d6600246f3be0aae28e6cc7c37317c364e2de719', 2, 1, 'MyApp', '[]', 0, '2022-01-29 16:51:09', '2022-01-29 16:51:09', '2022-02-13 16:51:09'),
('81a1fcb6f56a0d6773d89f9e9b4be565e9141fa74042d9d8207b318f460ae8281af6ce28134385b3', 2, 1, 'MyApp', '[]', 0, '2022-02-05 13:11:11', '2022-02-05 13:11:11', '2022-02-20 13:11:10'),
('86247ad0c312d0cd4737008bd4a5b9952f3525f1b177a7210499adc5d4bf79a1baa0121f03a3e119', 2, 1, 'MyApp', '[]', 0, '2022-01-23 07:12:38', '2022-01-23 07:12:38', '2022-02-07 07:12:38'),
('9372f64cc2aadb370b47bb3dd9508753b9fcedeec5974c86b9dddbca5e812498b6ced7c5002ed570', 2, 1, 'MyApp', '[]', 0, '2022-02-09 08:33:33', '2022-02-09 08:33:33', '2022-02-24 08:33:33'),
('952755c235e32f40037c70d01e2f7cb09a2ef899f1536ff424625bca52c0e15818e5db5ad1861505', 1, 1, 'MyApp', '[]', 0, '2022-01-09 11:13:37', '2022-01-09 11:13:37', '2022-01-24 11:13:37'),
('96f073e26f08c0b4c848153fcc2bb7c12de7cba7e7bcddd732b9ea3098c5c1029fba4474e6a09c19', 19, 1, 'MyApp', '[]', 0, '2022-02-07 06:52:37', '2022-02-07 06:52:37', '2022-02-22 06:52:37'),
('9e151c8ea333b6dec4bb1493096ab517e4a42f0ce7bfdc4de9a261610a927f48c5cacb0a694be929', 1, 1, 'MyApp', '[]', 0, '2022-01-09 11:20:32', '2022-01-09 11:20:32', '2022-01-24 11:20:31'),
('a557c1ebd1af8d20c2b8c25f57c1a9c4d26c9427567031f017e183d9c861963e4020df537a25d4fd', 6, 1, 'MyApp', '[]', 0, '2021-12-29 16:12:06', '2021-12-29 16:12:06', '2022-01-13 18:12:06'),
('a5951d56283ab846f4632bd96b5888b8f03529526a59e7498c90ee807765cec01b96781067bb5216', 1, 1, 'MyApp', '[]', 0, '2022-01-20 17:19:51', '2022-01-20 17:19:51', '2022-02-04 17:19:50'),
('adda772ed883964dad3bb99024d502c7d625995bdd51dd456cc66a93b75aec820119c8ae9550caeb', 7, 1, 'MyApp', '[]', 0, '2021-12-29 16:13:03', '2021-12-29 16:13:03', '2022-01-13 18:13:03'),
('af1963ce4af1a843f5d11fe93226ebf26621b548228329a0704f75f294c281a5edfbe2dc19c1837b', 2, 1, 'MyApp', '[]', 0, '2022-01-16 08:02:14', '2022-01-16 08:02:14', '2022-01-31 08:02:14'),
('b22b82b91a66b03b2be791e0dae4bf661a95412f80e49e27a62627aa503fc79b163a4c73cc18f0b7', 1, 1, 'MyApp', '[]', 0, '2022-01-30 13:01:48', '2022-01-30 13:01:48', '2022-02-14 13:01:48'),
('b3ff6c55eb72f06b3bc94795a12b97d3d3cf483abb7b9780061216afe4dab22eba1268198fe44cd3', 2, 1, 'MyApp', '[]', 0, '2022-01-17 12:19:55', '2022-01-17 12:19:55', '2022-02-01 12:19:54'),
('b4296481f7bb57c8410915a404d3b81f9a941b4fd0b2adb330b5f2874903fe35e143d07b7e29fe2d', 2, 1, 'MyApp', '[]', 0, '2022-01-17 18:36:23', '2022-01-17 18:36:23', '2022-02-01 18:36:23'),
('b4d2ee8f5dc9d4580dcbd4148b944a152fbf42b1e70c94dc160738011dfa3c8929804e3cab372a20', 2, 1, 'MyApp', '[]', 0, '2022-02-09 21:44:07', '2022-02-09 21:44:07', '2022-02-24 21:44:07'),
('b685e0f6a365de865e7f59ad8c425896dae8ea2a981a5e52ed532dff9c6de662e72c8fbb14f948eb', 2, 1, 'MyApp', '[]', 0, '2022-01-30 09:03:19', '2022-01-30 09:03:19', '2022-02-14 09:03:18'),
('bc6b60a7cfac5340176a847739207cbc953712b4eacee0e87bf106e36a22d2d122db2e8276b89fa0', 1, 1, 'MyApp', '[]', 0, '2022-01-09 11:19:03', '2022-01-09 11:19:03', '2022-01-24 11:19:03'),
('bff63c3c33fe5312d512686fc1f8f4fccc7afaa90e736a2948b1a9b91607db71e5157c1a63d36de3', 2, 1, 'MyApp', '[]', 0, '2022-01-24 08:21:57', '2022-01-24 08:21:57', '2022-02-08 08:21:57'),
('c12bc7c18b4343cec3cf716f49dbc1d6a197cacd9e4588b6396db9c3201629f0f4dbd4634cde4436', 4, 1, 'MyApp', '[]', 0, '2021-12-29 15:58:19', '2021-12-29 15:58:19', '2022-01-13 17:58:18'),
('ceafdb9e3520609afc580f994c703b3f0f93ab15bf599b03e676c163feb3ae1e3aeda4114b2b817a', 2, 1, 'MyApp', '[]', 0, '2022-02-10 08:11:00', '2022-02-10 08:11:00', '2022-02-25 08:10:59'),
('d093d2e2928f79fa66d6d2667f6d05395670feef94c9e53175d09bffb72aaa694766d15732c3b3c9', 21, 1, 'MyApp', '[]', 0, '2022-02-16 08:03:30', '2022-02-16 08:03:30', '2022-03-03 08:03:29'),
('d3b5c8bb93ec8cc800aea17420e8ba0ba3ac8580dad5ec65a058339087277028878532f14145235a', 1, 1, 'MyApp', '[]', 0, '2022-01-30 13:07:46', '2022-01-30 13:07:46', '2022-02-14 13:07:46'),
('d4ba9ae181b1f603ac99a7fbedcbaa34ed7cb07d036e8da18416370bd0fb7b2da5b7c0c2d1394987', 19, 1, 'MyApp', '[]', 0, '2022-02-07 07:51:04', '2022-02-07 07:51:04', '2022-02-22 07:51:04'),
('dd0c7117e1527f4896a39c35edddd07f7a51baae3896fce28f2525a96eb66dbc6235778bec24ca51', 2, 1, 'MyApp', '[]', 0, '2022-01-20 19:47:28', '2022-01-20 19:47:28', '2022-02-04 19:47:27'),
('dd7034811cbade550c2a5ebf7e3bbbedc81a413e7e526d377aac26f6abb04e1f83f01bbb70bbe4c9', 2, 1, 'MyApp', '[]', 0, '2022-01-26 20:05:40', '2022-01-26 20:05:40', '2022-02-10 20:05:39'),
('e12c8f53bf21c82b41745f8b6111fccfd22ad848e416f7a2e79354c32a2f0401b43814b4bd5bdb52', 19, 1, 'MyApp', '[]', 0, '2022-02-07 12:20:24', '2022-02-07 12:20:24', '2022-02-22 12:20:24'),
('e88cf4c341c97516e463e06c7416d12208f7d99847f5e1ab7ac21c40d4c36f427dd1d9cec699922d', 19, 1, 'MyApp', '[]', 0, '2022-02-07 06:42:31', '2022-02-07 06:42:31', '2022-02-22 06:42:31'),
('e9ec06892a62f2db0417d1ba9684611e1c389859553c2e42991166ceeca21eb4079d6245b5c842c5', 19, 1, 'MyApp', '[]', 0, '2022-02-07 12:27:27', '2022-02-07 12:27:27', '2022-02-22 12:27:27'),
('f01b253422c55d5757348309ac6e0d8e8ed0b4589879553ad72fd09ccb248219cdd1af93124e7f5f', 16, 1, 'MyApp', '[]', 0, '2022-01-27 13:04:29', '2022-01-27 13:04:29', '2022-02-11 13:04:29'),
('f5a2490131213c699d52912c7e8d81020c1142512e0f0447d39e47e876ff831c711434b920c520a0', 2, 1, 'MyApp', '[]', 0, '2022-02-01 09:33:15', '2022-02-01 09:33:15', '2022-02-16 09:33:15'),
('fa942c6ac80b3869c1308fc90a381ba7e8a29586c24298b848dbbf8f9e27a53fc57651cd85aa92f0', 14, 1, 'MyApp', '[]', 0, '2022-01-20 19:04:38', '2022-01-20 19:04:38', '2022-02-04 19:04:38'),
('fadca58ed7673b1717a89ad34fc3d7b9733fc73709201ae0cb40758cc8abe5b6787980314cc6ad94', 2, 1, 'MyApp', '[]', 0, '2022-01-16 08:02:37', '2022-01-16 08:02:37', '2022-01-31 08:02:37'),
('fb6b62442dc9770a3de79e10d3948568e1627f32d2aaff7bd34df6d421612e404ba3bdd57788693b', 10, 1, 'MyApp', '[]', 0, '2022-01-12 12:53:17', '2022-01-12 12:53:17', '2022-01-27 12:53:17'),
('fc9d183a19cae71285dab0cf33289d04d6355034dcc01347febfe06a2c6b81f7e9a6bc3b12c6bdc5', 13, 1, 'MyApp', '[]', 0, '2022-01-19 11:59:52', '2022-01-19 11:59:52', '2022-02-03 11:59:52'),
('fe77b59cbd5a8850ce0684616c81424e377a2127d3946a35e26598b25f26b5d154419034c77f3152', 20, 1, 'MyApp', '[]', 1, '2022-02-06 12:30:24', '2022-02-06 12:30:24', '2022-02-21 12:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '6s2mRGmRVkF1rjiTEY8zj3JsE1YWNji502zoQxDJ', NULL, 'http://localhost', 1, 0, 0, '2021-12-29 15:58:05', '2021-12-29 15:58:05'),
(2, NULL, 'Laravel Password Grant Client', 'P1wLqtbtNul9k0p7wiimgGOkhDOdeZLcb3F9wDNx', 'users', 'http://localhost', 0, 1, 0, '2021-12-29 15:58:05', '2021-12-29 15:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-29 15:58:05', '2021-12-29 15:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name_ar`, `name_en`, `shop_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'اللون', 'the color', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ذاكرة الوصول العشوائي', 'RAM', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_distance_in_km` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `capon_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qrcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('PAID','NOT_PAID') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `delivery_cost`, `delivery_distance_in_km`, `payment_type`, `user_id`, `capon_id`, `address_id`, `date`, `qrcode`, `total`, `subtotal`, `payment_status`, `bill_number`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, NULL, '1267', '2534', '1', 2, 1, 1, '2022-02-09', NULL, '10000', '9217.3913043478', 'NOT_PAID', 'SOUQ_5148', '2022-02-09 10:47:38', '2022-02-17 08:27:29', NULL, NULL, NULL, NULL),
(2, NULL, '1178.5', '2357', '1', 19, 1, 1, '2022-02-09', NULL, '4000', '3478.2608695652', NULL, 'SOUQ_8272', '2022-02-09 11:09:28', '2022-02-09 11:09:28', NULL, NULL, NULL, NULL),
(3, 'canceled', '1267', '2534', '1', 19, 1, 1, '2022-02-09', NULL, '12000', '10434.782608696', NULL, 'SOUQ_6761', '2022-02-09 11:10:33', '2022-02-09 12:27:13', NULL, NULL, NULL, NULL),
(4, NULL, '2445.5', '4891', '1', 2, 1, 1, '2022-02-10', NULL, '10200', '8869.5652173913', NULL, 'SOUQ_8939', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, NULL, NULL, NULL),
(5, NULL, '0', '0', 'visa', 19, 1, 1, '2022-02-10', NULL, '7200', '6260.8695652174', NULL, 'SOUQ_3648', '2022-02-10 08:48:22', '2022-02-10 08:48:22', NULL, NULL, NULL, NULL),
(6, NULL, '0', '0', 'MADA', 19, NULL, 22, '2022-02-10', NULL, '6200', '5391.3043478261', NULL, 'SOUQ_2125', '2022-02-10 13:10:31', '2022-02-10 13:10:31', NULL, NULL, NULL, NULL),
(7, NULL, '0', '0', 'STCPAY', 19, NULL, 22, '2022-02-10', NULL, '4800', '4173.9130434783', NULL, 'SOUQ_6457', '2022-02-10 13:12:55', '2022-02-10 13:12:55', NULL, NULL, NULL, NULL),
(8, NULL, '0', '0', 'STCPAY', 19, NULL, 22, '2022-02-10', NULL, '3800', '3800', NULL, 'SOUQ_7911', '2022-02-10 13:14:53', '2022-02-10 13:14:53', NULL, NULL, NULL, NULL),
(9, NULL, '0', '0', '1', 19, NULL, 22, NULL, NULL, '6500', '5652.1739130435', 'NOT_PAID', 'SOUQ_4236', '2022-02-16 09:20:11', '2022-02-16 13:21:06', NULL, NULL, NULL, NULL),
(10, NULL, '0', '0', '1', 19, NULL, 22, NULL, NULL, '2200', '1913.0434782609', NULL, 'SOUQ_6767', '2022-02-17 07:35:51', '2022-02-17 08:32:51', NULL, NULL, NULL, NULL),
(11, NULL, '0', '0', 'MADA', 19, NULL, 22, NULL, NULL, '1800', '1565.2173913043', NULL, 'SOUQ_2465', '2022-02-17 13:14:16', '2022-02-17 13:14:16', NULL, NULL, NULL, NULL),
(12, NULL, '0', '0', '1', 19, NULL, 22, NULL, NULL, '1', '0.8695652173913', NULL, 'SOUQ_9079', '2022-02-17 13:23:04', '2022-02-17 13:23:46', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('RECEIVED','READY','SHIPPED','DELIVERED','CANCELED','RETURNED') COLLATE utf8mb4_unicode_ci DEFAULT 'RECEIVED',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commsion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commsion_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `status`, `image`, `shop_id`, `product_id`, `order_id`, `price`, `vat`, `vat_value`, `name_ar`, `name_en`, `commsion`, `commsion_value`, `quantity`, `delivery_date`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'RECEIVED', '1568025683HenL6lSt.png', 1, 1, 1, '2000', '1', NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '3', '2022-02-09', '2022-02-09 10:47:38', '2022-02-09 10:47:38', NULL, 19, 19, NULL),
(2, 'RECEIVED', 'default.png', 2, 2, 1, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-09', '2022-02-09 10:47:38', '2022-02-09 10:47:38', NULL, 19, 19, NULL),
(3, 'RECEIVED', 'default.png', 4, 2, 2, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-09', '2022-02-09 11:09:28', '2022-02-09 11:09:28', NULL, 19, 19, NULL),
(4, 'RECEIVED', 'default.png', 4, 2, 3, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-09', '2022-02-09 11:10:33', '2022-02-09 11:10:33', NULL, 19, 19, NULL),
(5, 'RECEIVED', '1568025683HenL6lSt.png', 1, 1, 3, '2000', NULL, NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '4', '2022-02-09', '2022-02-09 11:10:33', '2022-02-09 11:10:33', NULL, 19, 19, NULL),
(6, 'RECEIVED', 'default.png', 4, 2, 4, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-09', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, 2, 2, NULL),
(7, 'RECEIVED', 'default.png', 1, 2, 4, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-09', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, 2, 2, NULL),
(8, 'RECEIVED', '1568025683HenL6lSt.png', 1, 1, 4, '2000', NULL, NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '1', '2022-02-09', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, 2, 2, NULL),
(9, 'RECEIVED', '1568025683HenL6lSt.png', 1, 1, 5, '2000', NULL, NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '3', '2022-02-10', '2022-02-10 08:48:22', '2022-02-10 08:48:22', NULL, 19, 19, NULL),
(10, 'RECEIVED', '1568025683HenL6lSt.png', 3, 1, 6, '2000', NULL, NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '1', '2022-02-10', '2022-02-10 13:10:31', '2022-02-10 13:10:31', NULL, 19, 19, NULL),
(11, 'RECEIVED', 'default.png', 4, 2, 6, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-10', '2022-02-10 13:10:31', '2022-02-10 13:10:31', NULL, 19, 19, NULL),
(12, 'RECEIVED', '1568025683HenL6lSt.png', 3, 1, 7, '2000', NULL, NULL, 'جوال سامسونج', 'samsung A80', NULL, NULL, '2', '2022-02-10', '2022-02-10 13:12:55', '2022-02-10 13:12:55', NULL, 19, 19, NULL),
(13, 'RECEIVED', 'default.png', 2, 2, 8, '3000', NULL, NULL, 'جوال ايفون 13', 'Iphone 13', NULL, NULL, '2', '2022-02-10', '2022-02-10 13:14:53', '2022-02-10 13:14:53', NULL, 19, 19, NULL),
(14, 'RECEIVED', '1568025683HenL6lSt.png', 1, 1, 9, '2000', '15', '600', 'جوال سامسونج', 'samsung A80', '15', '521.73913043478', '2', '2022-02-16', '2022-02-16 09:20:11', '2022-02-16 09:20:11', NULL, 19, 19, NULL),
(15, 'RECEIVED', 'default.png', 1, 2, 9, '3000', '15', '247.82608695652', 'جوال ايفون 13', 'Iphone 13', '15', '215.50094517958', '1', '2022-02-16', '2022-02-16 09:20:11', '2022-02-16 09:20:11', NULL, 19, 19, NULL),
(16, 'RECEIVED', '1568025683HenL6lSt.png', 3, 1, 10, '2000', '15', '286.95652173913', 'جوال سامسونج', 'samsung A80', '15', '249.52741020794', '1', '2022-02-17', '2022-02-17 07:35:51', '2022-02-17 07:35:51', NULL, 19, 19, NULL),
(17, 'RECEIVED', '1568025683HenL6lSt.png', 3, 1, 11, '2000', '15', '234.78260869565', 'جوال سامسونج', 'samsung A80', '15', '204.15879017013', '1', '2022-02-17', '2022-02-17 13:14:16', '2022-02-17 13:14:16', NULL, 19, 19, NULL),
(18, 'RECEIVED', 'default.png', 1, 2, 12, '2', '15', '0.1304347826087', 'جوال ايفون 13', 'Iphone 13', '15', '0.11342155009452', '1', '2022-02-17', '2022-02-17 13:23:04', '2022-02-17 13:23:04', NULL, 19, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_products_options`
--

CREATE TABLE `order_products_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `order_detail_id` int(11) DEFAULT NULL,
  `extra_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products_options`
--

INSERT INTO `order_products_options` (`id`, `variant_id`, `option_id`, `order_detail_id`, `extra_price`, `option_name_ar`, `option_name_en`, `variant_name_ar`, `variant_name_en`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 2, 1, NULL, '100', 'اللون', 'the color', 'برتقالي', 'orange', '2022-02-09 10:47:38', '2022-02-09 10:47:38', NULL, NULL, NULL, NULL),
(2, 7, 2, NULL, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 64 جيجا', 'RAM 64 G', '2022-02-09 10:47:38', '2022-02-09 10:47:38', NULL, NULL, NULL, NULL),
(3, 3, 1, NULL, '100', 'اللون', 'the color', 'اخضر', 'green', '2022-02-09 11:10:33', '2022-02-09 11:10:33', NULL, NULL, NULL, NULL),
(4, 7, 2, NULL, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 64 جيجا', 'RAM 64 G', '2022-02-09 11:10:33', '2022-02-09 11:10:33', NULL, NULL, NULL, NULL),
(5, 1, 1, 6, '100', 'اللون', 'the color', 'احمر', 'red', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, NULL, NULL, NULL),
(6, 1, 1, 7, '100', 'اللون', 'the color', 'احمر', 'red', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, NULL, NULL, NULL),
(7, 2, 1, 8, '100', 'اللون', 'the color', 'برتقالي', 'orange', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, NULL, NULL, NULL),
(8, 6, 2, 8, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 16 جيجا', 'RAM 16 G', '2022-02-10 06:47:49', '2022-02-10 06:47:49', NULL, NULL, NULL, NULL),
(9, 1, 1, 9, '100', 'اللون', 'the color', 'احمر', 'red', '2022-02-10 08:48:22', '2022-02-10 08:48:22', NULL, NULL, NULL, NULL),
(10, 7, 2, 9, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 64 جيجا', 'RAM 64 G', '2022-02-10 08:48:22', '2022-02-10 08:48:22', NULL, NULL, NULL, NULL),
(11, 3, 1, 10, '100', 'اللون', 'the color', 'اخضر', 'green', '2022-02-10 13:10:31', '2022-02-10 13:10:31', NULL, NULL, NULL, NULL),
(12, 8, 2, 10, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 128 جيجا', 'RAM 128 G', '2022-02-10 13:10:31', '2022-02-10 13:10:31', NULL, NULL, NULL, NULL),
(13, 2, 1, 12, '100', 'اللون', 'the color', 'برتقالي', 'orange', '2022-02-10 13:12:55', '2022-02-10 13:12:55', NULL, NULL, NULL, NULL),
(14, 7, 2, 12, '100', 'ذاكرة الوصول العشوائي', 'RAM', 'رام 64 جيجا', 'RAM 64 G', '2022-02-10 13:12:55', '2022-02-10 13:12:55', NULL, NULL, NULL, NULL),
(15, 1, 1, 14, '100', 'اللون', 'the color', 'احمر', 'red', '2022-02-16 09:20:11', '2022-02-16 09:20:11', NULL, NULL, NULL, NULL),
(16, 2, 1, 14, '100', 'اللون', 'the color', 'برتقالي', 'orange', '2022-02-16 09:20:11', '2022-02-16 09:20:11', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `name_ar`, `name_en`, `description_ar`, `description_en`, `copy`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'aboutus', 'aboutus', 'aboutus', 'aboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutus', 'aboutusaboutusaboutusaboutusaboutusaboutusaboutusaboutus', 'aboutus', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'termcondition', 'termcondition', 'termcondition', 'termconditiontermconditiontermconditiontermconditiontermconditiontermconditiontermcondition', 'termconditiontermconditiontermconditiontermconditiontermconditiontermconditiontermconditiontermcondition', 'termcondition', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'privacy', 'privacy', 'privacy', 'privacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacy', 'privacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacyprivacy', 'privacy', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name_ar`, `name_en`, `enable`, `public_key`, `secret_key`, `entity_id`, `icon`, `code`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'مدى', 'mada', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac9a4cb7be86c95017bebd0b7713311', 'default.jpg', 'MADA', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'stc pay', 'stc pay', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac9a4cb7be86c95017bebd0247e330a', 'default.jpg', 'STCPAY', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'فيزا', 'Visa', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac9a4cb7be86c95017bebd0247e330a', 'default.jpg', 'VISA', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ماستر كارد', 'Master card', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac9a4cb7be86c95017bebd0247e330a', 'default.jpg', 'MASTER', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'أبل باي', 'Apple pay', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac7a4c87b286bdb017b2d2824f710c9', 'default.jpg', 'APPLEPAY', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'دفع عند الاستلام', 'Pay on Receipt', '1', '1', 'OGFjOWE0Y2I3YmU4NmM5NTAxN2JlYmNmOGRhNjMzMDZ8ejY4YVNrWm1neg==', '8ac9a4cb7be86c95017bebd0247e330a', 'default.jpg', 'CASH', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `ingredients_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_count` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_delivery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` enum('TRUE','FALSE') COLLATE utf8mb4_unicode_ci DEFAULT 'TRUE',
  `extras` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `price`, `discount_price`, `desc_ar`, `desc_en`, `image`, `category_id`, `ingredients_ar`, `ingredients_en`, `unit`, `package_count`, `weight`, `can_delivery`, `published`, `extras`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'جوال سامسونج', 'samsung A80', '2', '1', 'رام 4 جيجا', '4G RAM', '1568025683HenL6lSt.png', 1, 'جوال جميل مكون من بطارية من اللوثيوم', 'A beautiful mobile phone consisting of a lithium battery', 'G', '1', '220', '1', 'TRUE', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'جوال ايفون 13', 'Iphone 13', '2', '1', 'مساحة تخزينية 220 جيجا ، رام 10 قيقا', 'HDD : 220G \r\nRAM : 10G', 'default.png', 1, 'جوال جميل مكون من بطارية من اللوثيوم', 'A beautiful mobile phone consisting of a lithium battery', 'G', '1', '230', '1', 'TRUE', '1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `option_id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `rate`, `comment`, `image`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'rtrtrtertry', '1568025683HenL6lSt.png', 18, '2022-01-30 07:47:04', '2022-01-30 07:47:04'),
(2, 1, 1, 'rtrtrtertry', '1568025683HenL6lSt.png', 18, '2022-01-30 07:48:39', '2022-01-30 07:48:39'),
(3, 1, 1, 'rtrtrtertry', '1568025683HenL6lSt.png', 18, '2022-01-30 08:49:57', '2022-01-30 08:49:57'),
(4, 2, 4, 'rtrtrtertry', 'default.png', 18, '2022-01-30 12:44:40', '2022-01-30 12:44:40'),
(5, 2, 5, 'Awesme', '1568025683HenL6lSt.png', 1, '2022-01-30 12:48:10', '2022-01-30 12:48:10'),
(6, 2, 5, 'test', 'default.png', 2, '2022-02-07 22:19:34', '2022-02-07 22:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rated_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Mall','Shop','Product') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rated_id`, `user_id`, `rate`, `type`, `comment`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 1, 1, '1', 'Shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, '4', 'Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 1, '2', 'Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, 2, '1', 'Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 4, 5, '3', 'Mall', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `team_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `param` varchar(200) CHARACTER SET utf8 NOT NULL,
  `value` varchar(200) CHARACTER SET utf8 NOT NULL,
  `type` enum('customer_app','delivery_app','vendor_app','web') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `param`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'min_cart_charge', '1', 'customer_app', '2022-01-09 11:47:21', '2022-01-09 11:47:21'),
(2, 'currency', 'SA', 'customer_app', '2022-01-09 11:47:21', '2022-01-09 11:47:21'),
(3, 'currencies_code', 'SAR', 'customer_app', '2022-01-09 11:47:21', '2022-01-09 11:47:21'),
(4, 'max_delivery_distance', '30', 'customer_app', '2022-01-09 11:47:21', '2022-01-09 11:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings_old`
--

CREATE TABLE `settings_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `build_no` smallint(6) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire` timestamp NULL DEFAULT NULL,
  `days` smallint(6) DEFAULT NULL,
  `change_log` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recommend_build` smallint(6) NOT NULL DEFAULT '0',
  `recommend_version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `min_cart_charge` smallint(6) NOT NULL DEFAULT '0',
  `currency` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SA',
  `currencies_code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SAR',
  `radius` smallint(6) NOT NULL DEFAULT '8',
  `distanceUnit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'km',
  `appLanguage` tinyint(4) NOT NULL DEFAULT '1',
  `copyright` tinyint(1) NOT NULL DEFAULT '1',
  `otp` tinyint(1) NOT NULL DEFAULT '0',
  `delivering` tinyint(1) NOT NULL DEFAULT '1',
  `curbsidePickup` tinyint(1) NOT NULL DEFAULT '1',
  `coupon` tinyint(1) NOT NULL DEFAULT '1',
  `deliveringTime` tinyint(1) NOT NULL DEFAULT '1',
  `delivery` tinyint(1) NOT NULL DEFAULT '1',
  `privacy` tinyint(1) NOT NULL DEFAULT '1',
  `terms` tinyint(1) NOT NULL DEFAULT '1',
  `refund` tinyint(1) NOT NULL DEFAULT '1',
  `googleLogin_ca` tinyint(1) NOT NULL DEFAULT '1',
  `facebookLogin_ca` tinyint(1) NOT NULL DEFAULT '1',
  `defaultLat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '24.661865145014097',
  `defaultLng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '46.73812777724177',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings_old`
--

INSERT INTO `settings_old` (`id`, `build_no`, `type`, `os`, `expire`, `days`, `change_log`, `recommend_build`, `recommend_version`, `min_cart_charge`, `currency`, `currencies_code`, `radius`, `distanceUnit`, `appLanguage`, `copyright`, `otp`, `delivering`, `curbsidePickup`, `coupon`, `deliveringTime`, `delivery`, `privacy`, `terms`, `refund`, `googleLogin_ca`, `facebookLogin_ca`, `defaultLat`, `defaultLng`, `created_at`, `updated_at`) VALUES
(1, 5, 'Customer_app', 'iphone', '0000-00-00 00:00:00', 0, 'البحث عن المنتجات تم اضافة ميزة الدردشة وميزة', 10, '1', 0, 'SA', 'SAR', 8, 'km', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '24.661865145014097', '46.73812777724177', NULL, NULL),
(8, 6, 'Customer_app', 'iphone', '2022-01-27 17:34:44', 15, 'تم اضافة ميزة الدردشة وميزة البحث عن المنتجات', 10, '1.3.4', 0, 'SA', 'SAR', 8, 'km', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '24.661865145014097', '46.73812777724177', '2022-01-03 17:48:12', NULL),
(13, 7, 'Customer_app', 'iphone', '2022-01-26 17:38:13', 12, '“تم اضافة ميزة الدردشة وميزة ', 1, '1', 1, 'SA', 'SAR', 8, 'km', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '24.661865145014097', '46.73812777724177', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` enum('TRUE','FALSE') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobilephone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `mall_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commerical_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('main','branch') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name_ar`, `name_en`, `published`, `phone`, `mobilephone`, `address`, `image`, `desc_ar`, `desc_en`, `commission`, `vat`, `mall_id`, `category_id`, `vat_no`, `vat_img`, `commerical_img`, `latitude`, `longitude`, `type`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'متجر ماكس', 'Max store', 'TRUE', '966542447226', '966542447226', 'الرياض الملز', 'default.jpg', 'متجر متخصص في الملابس', 'clothing store', '15', '15', '2', '1', NULL, NULL, NULL, '24.7547821', '46.578412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'متجر وادي الروابي', 'Wadi alrawabi store', 'TRUE', '966542447226', '966542447226', 'الرياض الملز', 'default.jpg', 'متجر متخصص في الملابس', 'clothing store', '15', '0', '2', '1', NULL, NULL, NULL, '24.5547821', '46.378412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'متجر هيا', 'haya store', 'TRUE', '966542447226', '966542447226', 'الرياض الملز', '1588967861logo-06.png', 'متجر متخصص في الملابس', 'clothing store', '15', '15', '2', '1', NULL, NULL, NULL, '24.5547821', '46.478412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'متجر بنده', 'Panda store', 'TRUE', '966542447226', '966542447226', 'الرياض الملز', 'default.jpg', 'متجر متخصص في الملابس', 'clothing store', '15', '15', '3', '1', NULL, NULL, NULL, '24.5547821', '46.378412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'متجر الوان', 'alwan store', 'TRUE', '232321321214', '424214', 'rrrrrrrrrrrr', 'default.jpg', 'fffffffffffff', 'fgggggggggggggg', '1', '0', '2', '1', NULL, NULL, NULL, '24.65547821', '46.278412', 'branch', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'متجر سما', 'sama store', 'TRUE', '3554543', '664363', 'ggf', 'default.jpg', 'vvvvvvvvvvvvvv', 'ffffffffffffff', '1', '0', '4', '1', NULL, NULL, NULL, '24.43547821', '46.178412', 'branch', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'متجر احمد', 'ahmed store', 'TRUE', '3242352243534', '456356354635', 'gfsdgf', 'default.jpg', 'ffffffffffffffffffffff', 'ggggggggggg', '1', '0', '3', '1', NULL, NULL, NULL, '24.45347821', '46.778412', 'branch', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'متجر نير', 'near store', 'TRUE', '11111111111', '1111111111111', '1dddddddddddddd', 'default.jpg', 'fdfsdfsfsdfs', 'sdfsdfsdf', '1', '0', '2', '1', NULL, NULL, NULL, '24.7347821', '46.278412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'متجر الملز', 'al malaz store', 'TRUE', '12424324', '242111', 'sdffdsfs', 'default.jpg', 'rrrrrrrrrr', 'wwwwwwwwwwww', '1', '0', '3', '1', NULL, NULL, NULL, '24.23547821', '46.378412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'متجر نيوماكس', 'new max store', 'TRUE', '111111111', '1111111111', 'الرياض الملز', 'default.jpg', 'fffffffffff', 'ffffffffffff', '1', '0', '4', '1', NULL, NULL, NULL, '24.7347821', '46.978412', 'main', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'متجر بحر', 'bahir store', 'TRUE', '111111111111', '1111111', 'qaaaaaaaaa', 'default.jpg', 'xzcxczc', 'zxczcz', '1', '0', '2', '1', NULL, NULL, NULL, '24.9547821', '46.368412', 'branch', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `published` enum('TRUE','FALSE') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_products`
--

INSERT INTO `shop_products` (`id`, `shop_id`, `product_id`, `published`, `quantity`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 1, 1, 'TRUE', 997, NULL, '2022-02-16 09:20:11', NULL, NULL, NULL, NULL),
(2, 2, 1, 'TRUE', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'TRUE', 500, NULL, '2022-02-17 13:14:16', NULL, NULL, NULL, NULL),
(4, 2, 2, 'TRUE', 30, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 2, 'TRUE', 48, NULL, '2022-02-17 13:23:04', NULL, NULL, NULL, NULL),
(6, 4, 2, 'TRUE', 2, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('SuperAdmin','Admin','User') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeReg` enum('email','facebook') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `email_verified_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onesignal_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `phone`, `address`, `latitude`, `longitude`, `type`, `typeReg`, `image`, `email_verified_at`, `password`, `status`, `code`, `_token`, `onesignal_id`, `platform`, `version_no`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'Doaa alkasaby', NULL, 'doaa@mail.com', '01140200011', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$Xhgz/UM4XvFL7sSK8mZ6NOxVxNBQFdeh3fL/Fltka0ri8qDMg3Mxu', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 15:55:12', '2022-01-30 13:08:50', NULL, NULL, 1, NULL),
(2, 'mahm3435oud shennawy', NULL, 'abdu6700@gmail.com', '01090766553', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2a$12$PZRolT7FLKz.xUe5wP7zMOEr4/r0rIFAJR/4lD89G.5H7QKtCzznG', 0, '507452', NULL, NULL, NULL, NULL, '2021-12-29 15:56:41', '2022-01-01 12:32:10', NULL, NULL, NULL, NULL),
(3, 'mahm3435oud shennawy', NULL, 'm.3543@gma45435il.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$dkTJg4Pg45yp.LAFKsQdn.wJ0zsgjC/mxUcZ9fmDwKOJk6j0O3yi.', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 15:57:06', '2021-12-29 15:57:06', NULL, NULL, NULL, NULL),
(4, 'mahm3435oud shennawy', NULL, 'm.3543@gma452432435il.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$KB8bCWYPKFJo8VXK0Js/HO3yM8ZxkqNPR/X7BOblCPQmav3.nqStW', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 15:58:18', '2021-12-29 15:58:18', NULL, NULL, NULL, NULL),
(5, 'ana', NULL, '11ana773@gmail.com', '1112345602122377', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$J.D5Pu55mFJKAZaqI.9s1OZHgy89yOKTqUVXDLR1n06zQG6hxxJh.', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 15:59:08', '2021-12-29 16:15:56', NULL, NULL, 5, NULL),
(6, 'mahm3435oud shennawy', NULL, 'm.3543@gma4453452432435issl.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$rPsGUkHThUqfbRCRKLwYQOA3xwXsvhU2Bxd3JchLiU4qlIGRVoM9W', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 16:12:06', '2021-12-29 16:12:06', NULL, NULL, NULL, NULL),
(7, 'mahm3435oud shennawy', NULL, 'm.3543@gma44534532322432435issl.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$z332KdsubpFBfhcrO85nJeMqrpn.1X.m3aHrWoi5hdpI/rYlv5sE6', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-29 16:13:03', '2021-12-29 16:32:43', NULL, NULL, 7, NULL),
(8, 'mahm3435oud shennawy', NULL, 'm.3543@g666666534532322432435issl.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$535UjppowXQnc.9ZAVG9DODxhcqXqejGutz0QJyEoP4veQI2/SA56', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:33:26', '2022-01-01 12:33:25', NULL, NULL, 8, NULL),
(9, 'mahm3435oud shennawy', NULL, 'm.3543@g666666532435issl.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$0xisiantX1sCLF5XEOUCCOZq4wXLC9PQ9y1igymhsVwwD3FY.8dXW', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-08 18:15:15', '2022-01-08 18:15:15', NULL, NULL, NULL, NULL),
(10, 'mahm3435oud shennawy', NULL, 'm.3543@g6666242166532435issl.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$BTrKyHx/j0qFsgEOPbzTLOxUjA3u3rx0j9C17t5Jy6ezbhfgNdvNK', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-12 12:53:17', '2022-01-12 12:53:17', NULL, NULL, NULL, NULL),
(11, 'mahm3435oud shennawy', NULL, 'm.354@rrrrrrrrr.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$v2mbwy6Fhx0ROgnzLhEmau81XnTSeOqt.2X.Lh1L.qMMjoRVbILZS', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-17 07:39:44', '2022-01-17 07:39:44', NULL, NULL, NULL, NULL),
(12, 'mahm3435oud shennawy', NULL, 'm.354@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$qPqwjsC32YnSzeP3B27l6er3SToYj0TpkbTFN9eLomANZQGqNcG3G', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-18 11:38:20', '2022-01-18 11:38:20', NULL, NULL, NULL, NULL),
(13, 'asaada11111111', 'kasasa11111111111', 'm.3534234@2.com', '010677554654', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$7yiBhkMI2jFj4uMnKhMoj.kcT0Pb2A5uG8.xmekyQLb/G1ng/jaXm', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-19 11:59:52', '2022-01-31 12:19:56', NULL, NULL, 13, NULL),
(14, 'mahm3435oud shennawy', NULL, 'm.8888888@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$1hCEP1cWzTGnNKQ54KdPRuymuTtuvrng28i6YkD5RSavKspGr0TUS', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-20 19:04:38', '2022-01-20 19:04:38', NULL, NULL, NULL, NULL),
(15, 'mahm3435oud shennawy', NULL, 'm.354cxcx@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$.Qx9pHCSEYl2EP8IQu69.O3wo6R.0r4MXA9OPACGhA3ddJZ2GVAum', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-23 07:51:01', '2022-01-23 07:51:01', NULL, NULL, NULL, NULL),
(16, 'mahm3435oud shennawy', NULL, 'm.88832328888@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$IF03iRQARImdWAwUR7nLEu9UslokbQUlvtgFBWzFIjuAsHbf69r.6', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-27 13:04:29', '2022-01-27 13:04:29', NULL, NULL, NULL, NULL),
(17, 'mahm3435oud shennawy', NULL, 'm.898@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$XVMGi4RgHNGi5nHJbbO6DulITArR7JTnqOuCweTNLsW1Ic5bjeDE6', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-29 18:39:06', '2022-01-29 18:39:06', NULL, NULL, NULL, NULL),
(18, 'mahm3435oud shennawy', NULL, 'm.uuuuuuuu@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$cOThw0jVvNQnjPv.woHYS.5EwQJuLJQL4vER/XSkhLnyczIqUh9z.', 0, NULL, NULL, NULL, NULL, NULL, '2022-01-30 07:38:46', '2022-01-30 07:38:46', NULL, NULL, NULL, NULL),
(19, 'doaa', NULL, 'dodo@mail.com', '4386837858', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$Mii48YC2/j8GuL3/tKCKw.wjWlCBoV8RZpPl2DjnlZ9ZNFlVg5meG', 0, NULL, NULL, NULL, NULL, NULL, '2022-02-01 09:00:00', '2022-02-01 09:00:00', NULL, NULL, NULL, NULL),
(20, 'noga', NULL, 'noga@mail.com', '74639573620', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$m/3StQ4QTRzwOuc1hir1EOUQKlnmx7G6qrs.BjB/eaIBp5/i6T8bi', 0, NULL, NULL, NULL, NULL, NULL, '2022-02-06 12:22:05', '2022-02-06 12:22:05', NULL, NULL, NULL, NULL),
(21, 'mahm3435oud shennawy', NULL, 'm.35876874@2.com', '090987659449005440094', NULL, NULL, NULL, NULL, NULL, 'default.jpg', NULL, '$2y$10$ofmMAviOXvgrn659PcIvm.VzJ8ZN0N0KltyJWyXy/idIjIsVVCDKa', 0, NULL, NULL, NULL, NULL, NULL, '2022-02-16 08:03:30', '2022-02-16 08:03:30', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `extra_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name_ar`, `name_en`, `option_id`, `extra_price`, `image`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(1, 'احمر', 'red', 1, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'برتقالي', 'orange', 1, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'اخضر', 'green', 1, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'اضفر', 'yellow', 1, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'وردي', 'pink', 1, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'رام 16 جيجا', 'RAM 16 G', 2, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'رام 64 جيجا', 'RAM 64 G', 2, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'رام 128 جيجا', 'RAM 128 G', 2, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'رام 256 جيجا', 'RAM 256 G', 2, '100', '1568025683HenL6lSt.png', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `version_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `build_no` int(10) DEFAULT NULL,
  `release_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `change_log_en` text CHARACTER SET utf8,
  `change_log_ar` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `type` enum('customer_app','delivery_app','vendor_app','web') NOT NULL,
  `os` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `version_no`, `build_no`, `release_date`, `expiry_date`, `change_log_en`, `change_log_ar`, `status`, `type`, `os`, `created_at`, `updated_at`) VALUES
(5, '1.0.3', 5, '2021-08-29', '2021-10-30', 'order can be from multi shops', 'اضافه منتجات من محلات مختلفه', 1, 'customer_app', 'iphone', '2021-07-07 12:46:25', '2021-07-07 12:46:25'),
(7, '1.0.3', 6, '2021-08-29', '2022-12-30', 'order can be from multi shops', 'اضافه منتجات من محلات مختلفه', 1, 'customer_app', 'android', '2021-07-07 12:46:25', '2021-07-07 12:46:25'),
(8, '1.0.3', 6, '2021-08-29', '2021-12-30', 'order can be from multi shops', 'اضافه منتجات من محلات مختلفه', 1, 'customer_app', 'iphone', '2021-07-07 12:46:25', '2021-07-07 12:46:25'),
(10, '1.0.3', 3, '2021-08-29', '2021-12-30', 'Add an electronic wallet\r\nAdd a list of malls\r\nAdd new stores', 'اضافة محفظة الكترونية \r\nاضافة قائمة المولات\r\nاضافة محلات جديدة', 1, 'customer_app', 'iphone', '2021-07-07 12:46:25', '2021-07-07 12:46:25'),
(11, '1.0.3', 8, '2021-08-29', '2022-12-30', 'Add an electronic wallet\r\nAdd a list of malls\r\nAdd new stores', 'اضافة محفظة الكترونية \r\nاضافة قائمة المولات\r\nاضافة محلات جديدة', 1, 'customer_app', 'android', '2021-07-07 12:46:25', '2021-07-07 12:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_product`
--

CREATE TABLE `visitor_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `seen_count` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_product`
--

INSERT INTO `visitor_product` (`id`, `product_id`, `user_id`, `category_id`, `seen_count`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`) VALUES
(3, 1, 10, 1, '2', '2022-01-12 21:43:07', '2022-01-16 08:25:32', NULL, NULL, NULL, NULL),
(4, 1, 11, 1, '4', '2022-01-17 07:40:29', '2022-01-17 07:52:24', NULL, NULL, NULL, NULL),
(5, 2, NULL, 1, '25', '2022-01-17 07:40:33', '2022-02-08 13:19:14', NULL, NULL, NULL, NULL),
(6, 1, NULL, 1, '89', '2022-01-17 07:56:15', '2022-02-08 13:18:58', NULL, NULL, NULL, NULL),
(7, 1, 1, 1, '40', '2022-01-20 17:32:46', '2022-01-31 08:53:57', NULL, NULL, NULL, NULL),
(8, 2, 1, 1, '10', '2022-01-20 18:14:22', '2022-01-31 10:02:02', NULL, NULL, NULL, NULL),
(9, 2, 2, 1, '7', '2022-01-26 11:23:33', '2022-02-09 07:10:50', NULL, NULL, NULL, NULL),
(10, 1, 16, 1, '2', '2022-01-27 13:04:51', '2022-01-27 15:36:48', NULL, NULL, NULL, NULL),
(11, 2, 16, 1, '4', '2022-01-27 15:43:15', '2022-01-27 17:08:20', NULL, NULL, NULL, NULL),
(12, 1, 2, 1, '8', '2022-01-29 16:59:08', '2022-02-07 06:19:23', NULL, NULL, NULL, NULL),
(13, 1, 19, 1, '37', '2022-02-02 09:41:51', '2022-02-17 13:21:56', NULL, NULL, NULL, NULL),
(14, 2, 19, 1, '14', '2022-02-02 09:42:52', '2022-02-17 13:22:49', NULL, NULL, NULL, NULL),
(15, 1, 20, 1, '2', '2022-02-06 12:43:24', '2022-02-06 13:24:54', NULL, NULL, NULL, NULL),
(16, 2, 20, 1, '1', '2022-02-06 12:43:36', '2022-02-06 12:43:36', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_created_by_foreign` (`created_by`),
  ADD KEY `addresses_updated_by_foreign` (`updated_by`),
  ADD KEY `addresses_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_created_by_foreign` (`created_by`),
  ADD KEY `carts_updated_by_foreign` (`updated_by`),
  ADD KEY `carts_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_options_created_by_foreign` (`created_by`),
  ADD KEY `cart_product_options_updated_by_foreign` (`updated_by`),
  ADD KEY `cart_product_options_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_updated_by_foreign` (`updated_by`),
  ADD KEY `categories_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `delivery_calculators`
--
ALTER TABLE `delivery_calculators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_costs`
--
ALTER TABLE `delivery_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_relation`
--
ALTER TABLE `delivery_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_created_by_foreign` (`created_by`),
  ADD KEY `favorites_updated_by_foreign` (`updated_by`),
  ADD KEY `favorites_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `malls`
--
ALTER TABLE `malls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `malls_created_by_foreign` (`created_by`),
  ADD KEY `malls_updated_by_foreign` (`updated_by`),
  ADD KEY `malls_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_created_by_foreign` (`created_by`),
  ADD KEY `notifications_updated_by_foreign` (`updated_by`),
  ADD KEY `notifications_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_created_by_foreign` (`created_by`),
  ADD KEY `options_updated_by_foreign` (`updated_by`),
  ADD KEY `options_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_created_by_foreign` (`created_by`),
  ADD KEY `orders_updated_by_foreign` (`updated_by`),
  ADD KEY `orders_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_created_by_foreign` (`created_by`),
  ADD KEY `order_details_updated_by_foreign` (`updated_by`),
  ADD KEY `order_details_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `order_products_options`
--
ALTER TABLE `order_products_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_options_created_by_foreign` (`created_by`),
  ADD KEY `order_products_options_updated_by_foreign` (`updated_by`),
  ADD KEY `order_products_options_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_created_by_foreign` (`created_by`),
  ADD KEY `pages_updated_by_foreign` (`updated_by`),
  ADD KEY `pages_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_created_by_foreign` (`created_by`),
  ADD KEY `payment_methods_updated_by_foreign` (`updated_by`),
  ADD KEY `payment_methods_deleted_by_foreign` (`deleted_by`);

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
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD UNIQUE KEY `permission_user_user_id_permission_id_user_type_team_id_unique` (`user_id`,`permission_id`,`user_type`,`team_id`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_updated_by_foreign` (`updated_by`),
  ADD KEY `products_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_created_by_foreign` (`created_by`),
  ADD KEY `product_options_updated_by_foreign` (`updated_by`),
  ADD KEY `product_options_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_created_by_foreign` (`created_by`),
  ADD KEY `ratings_updated_by_foreign` (`updated_by`),
  ADD KEY `ratings_deleted_by_foreign` (`deleted_by`);

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
  ADD UNIQUE KEY `role_user_user_id_role_id_user_type_team_id_unique` (`user_id`,`role_id`,`user_type`,`team_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_old`
--
ALTER TABLE `settings_old`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_build_no_unique` (`build_no`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_created_by_foreign` (`created_by`),
  ADD KEY `shops_updated_by_foreign` (`updated_by`),
  ADD KEY `shops_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_products_created_by_foreign` (`created_by`),
  ADD KEY `shop_products_updated_by_foreign` (`updated_by`),
  ADD KEY `shop_products_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_created_by_foreign` (`created_by`),
  ADD KEY `tags_updated_by_foreign` (`updated_by`),
  ADD KEY `tags_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`),
  ADD KEY `users_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_created_by_foreign` (`created_by`),
  ADD KEY `variants_updated_by_foreign` (`updated_by`),
  ADD KEY `variants_deleted_by_foreign` (`deleted_by`);

--
-- Indexes for table `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_product`
--
ALTER TABLE `visitor_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_product_created_by_foreign` (`created_by`),
  ADD KEY `visitor_product_updated_by_foreign` (`updated_by`),
  ADD KEY `visitor_product_deleted_by_foreign` (`deleted_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_calculators`
--
ALTER TABLE `delivery_calculators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `delivery_costs`
--
ALTER TABLE `delivery_costs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_relation`
--
ALTER TABLE `delivery_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `malls`
--
ALTER TABLE `malls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_products_options`
--
ALTER TABLE `order_products_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings_old`
--
ALTER TABLE `settings_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `visitor_product`
--
ALTER TABLE `visitor_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `addresses_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `addresses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  ADD CONSTRAINT `cart_product_options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_product_options_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cart_product_options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `favorites_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `favorites_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `malls`
--
ALTER TABLE `malls`
  ADD CONSTRAINT `malls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `malls_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `malls_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `options_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_details_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_products_options`
--
ALTER TABLE `order_products_options`
  ADD CONSTRAINT `order_products_options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_products_options_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_products_options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pages_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_methods_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `payment_methods_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_options_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_options_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ratings_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ratings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shops_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shops_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD CONSTRAINT `shop_products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shop_products_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shop_products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tags_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `variants_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `variants_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `visitor_product`
--
ALTER TABLE `visitor_product`
  ADD CONSTRAINT `visitor_product_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `visitor_product_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `visitor_product_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
