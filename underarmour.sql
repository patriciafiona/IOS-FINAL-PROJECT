-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 28, 2021 at 07:01 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `underarmour`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids');

-- --------------------------------------------------------

--
-- Table structure for table `con_test`
--

CREATE TABLE `con_test` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_01` varchar(256) NOT NULL DEFAULT 'product_default.png',
  `photo_02` varchar(256) DEFAULT '',
  `photo_03` varchar(256) DEFAULT '',
  `photo_04` varchar(256) DEFAULT '',
  `photo_05` varchar(256) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `product_id`, `photo_01`, `photo_02`, `photo_03`, `photo_04`, `photo_05`, `created_at`, `updated_at`) VALUES
(1, 1, 'product_photo_UA1_1.png', 'product_photo_UA2_1.png', 'product_photo_UA3_1.png', 'product_photo_UA4_1.png', 'product_photo_UA5_1.png', '2021-06-18 15:51:00', '2021-06-18 16:28:07'),
(2, 2, 'product_photo_UA1_2.png', 'product_photo_UA2_2.png', 'product_photo_UA3_2.png', 'product_photo_UA4_2.png', '', '2021-06-18 15:51:37', '2021-06-18 16:28:41'),
(3, 3, 'product_photo_UA1_3.png', 'product_photo_UA2_3.jpg', 'product_photo_UA3_3.png', 'product_photo_UA4_3.png', '', '2021-06-18 16:00:35', '2021-06-18 16:29:05'),
(4, 4, 'product_photo_UA1_4.jpg', 'product_photo_UA2_4.png', 'product_photo_UA3_4.png', 'product_photo_UA4_4.png', 'product_photo_UA5_4.jpg', '2021-06-18 16:08:03', '2021-06-18 16:29:33'),
(5, 5, 'product_photo_UA1_5.png', 'product_photo_UA2_5.png', 'product_photo_UA3_5.png', 'product_photo_UA4_5.png', '', '2021-06-18 16:10:32', '2021-06-18 16:29:58'),
(6, 6, 'product_photo_UA1_6.jpg', 'product_photo_UA2_6.png', 'product_photo_UA3_6.png', 'product_photo_UA4_6.png', '', '2021-06-18 16:15:00', '2021-06-18 16:30:25'),
(7, 7, 'product_photo_UA1_7.jpg', 'product_photo_UA2_7.png', 'product_photo_UA3_7.png', 'product_photo_UA4_7.png', 'product_photo_UA5_7.png', '2021-06-18 16:49:03', '2021-06-18 17:01:21'),
(8, 8, 'product_photo_UA1_8.png', 'product_photo_UA2_8.jpg', 'product_photo_UA3_8.jpg', 'product_photo_UA4_8.png', 'product_photo_UA5_8.png', '2021-06-18 16:51:55', '2021-06-18 17:01:54'),
(9, 9, 'product_photo_UA1_9.jpg', 'product_photo_UA2_9.jpg', 'product_photo_UA3_9.png', 'product_photo_UA4_9.jpg', 'product_photo_UA5_9.png', '2021-06-18 16:55:08', '2021-06-18 17:02:28'),
(10, 10, 'product_photo_UA1_10.png', 'product_photo_UA2_10.png', 'product_photo_UA3_10.png', 'product_photo_UA4_10.png', '', '2021-06-18 17:06:16', '2021-06-19 01:04:09'),
(11, 11, 'product_photo_UA1_11.png', 'product_photo_UA2_11.png', 'product_photo_UA3_11.png', 'product_photo_UA4_11.png', '', '2021-06-18 17:08:27', '2021-06-19 01:04:55'),
(12, 12, 'product_photo_UA1_12.png', 'product_photo_UA2_12.png', 'product_photo_UA3_12.png', 'product_photo_UA4_12.png', '', '2021-06-18 17:25:49', '2021-06-19 01:15:09'),
(13, 13, 'product_photo_UA1_13.png', 'product_photo_UA2_13.png', 'product_photo_UA3_13.png', 'product_photo_UA4_13.png', 'product_photo_UA5_13.png', '2021-06-18 17:53:04', '2021-06-19 01:27:24'),
(14, 14, 'product_photo_UA1_14.png', 'product_photo_UA2_14.png', 'product_photo_UA3_14.png', 'product_photo_UA4_14.png', '', '2021-06-18 17:56:14', '2021-06-19 01:27:54'),
(15, 15, 'product_photo_UA1_15.png', 'product_photo_UA2_15.png', 'product_photo_UA3_15.png', 'product_photo_UA4_15.png', 'product_photo_UA5_15.png', '2021-06-18 17:58:59', '2021-06-19 01:29:55'),
(16, 16, 'product_photo_UA1_16.png', 'product_photo_UA2_16.png', 'product_photo_UA3_16.png', 'product_photo_UA4_16.png', 'product_photo_UA5_16.png', '2021-06-18 18:01:36', '2021-06-19 01:21:33'),
(17, 18, 'product_photo_UA1_18.png', 'product_photo_UA2_18.png', 'product_photo_UA3_18.png', 'product_photo_UA4_18.png', 'product_photo_UA5_18.png', '2021-06-19 01:40:04', '2021-06-19 01:53:19'),
(18, 19, 'product_photo_UA1_19.png', 'product_photo_UA2_19.png', 'product_photo_UA3_19.png', 'product_photo_UA4_19.png', 'product_photo_UA5_19.png', '2021-06-19 01:42:41', '2021-06-19 01:53:47'),
(19, 20, 'product_photo_UA1_20.png', 'product_photo_UA2_20.png', 'product_photo_UA3_20.png', 'product_photo_UA4_20.png', '', '2021-06-19 01:46:08', '2021-06-19 02:05:40'),
(20, 21, 'product_photo_UA1_21.png', 'product_photo_UA2_21.png', 'product_photo_UA3_21.png', 'product_photo_UA4_21.png', '', '2021-06-19 01:48:26', '2021-06-19 02:06:12'),
(21, 22, 'product_photo_UA1_22.png', 'product_photo_UA2_22.png', 'product_photo_UA3_22.png', 'product_photo_UA4_22.png', 'product_photo_UA5_22.webp', '2021-06-19 02:10:26', '2021-06-19 02:23:02'),
(22, 23, 'product_photo_UA1_23.png', 'product_photo_UA2_23.png', 'product_photo_UA3_23.png', 'product_photo_UA4_22.png', '', '2021-06-19 02:12:33', '2021-06-19 02:24:28'),
(23, 24, 'product_photo_UA1_24.png', 'product_photo_UA2_24.png', 'product_photo_UA3_24.png', 'product_photo_UA4_24.png', '', '2021-06-19 02:15:27', '2021-06-19 02:25:12'),
(24, 25, 'product_photo_UA1_25.png', 'product_photo_UA2_25.png', 'product_photo_UA3_25.png', 'product_photo_UA4_25.png', 'product_photo_UA5_25.png', '2021-06-19 02:17:26', '2021-06-19 02:25:50'),
(25, 26, 'product_photo_UA1_26.png', 'product_photo_UA2_26.png', 'product_photo_UA3_26.png', 'product_photo_UA4_26.png', 'product_photo_UA5_26.png', '2021-06-19 02:19:26', '2021-06-19 02:26:23'),
(26, 27, 'product_photo_UA1_27.png', 'product_photo_UA2_27.png', 'product_photo_UA3_27.png', 'product_photo_UA4_27.png', '', '2021-06-19 02:29:20', '2021-06-19 02:34:59'),
(27, 28, 'product_photo_UA1_28.png', 'product_photo_UA2_28.png', 'product_photo_UA3_28.png', 'product_photo_UA4_28.png', 'product_photo_UA5_28.png', '2021-06-19 02:31:13', '2021-06-19 02:35:31'),
(28, 29, 'product_photo_UA1_29.png', 'product_photo_UA2_29.png', 'product_photo_UA3_29.png', 'product_photo_UA4_29.png', 'product_photo_UA5_29.png', '2021-06-19 02:33:04', '2021-06-19 02:35:59'),
(29, 30, 'product_photo_UA1_30.png', 'product_photo_UA2_30.png', 'product_photo_UA3_30.png', 'product_photo_UA4_30.png', '', '2021-06-19 04:07:22', '2021-06-19 04:29:20'),
(30, 31, 'product_photo_UA1_31.png', '', '', '', '', '2021-06-19 04:08:57', '2021-06-19 04:29:39'),
(31, 32, 'product_photo_UA1_32.png', 'product_photo_UA2_32.png', '', '', '', '2021-06-19 04:10:26', '2021-06-19 04:29:55'),
(32, 33, 'product_photo_UA1_33.png', 'product_photo_UA2_33.png', '', '', '', '2021-06-19 04:12:00', '2021-06-19 04:30:11'),
(33, 34, 'product_photo_UA1_34.png', 'product_photo_UA2_34.png', '', '', '', '2021-06-19 04:13:23', '2021-06-19 04:30:27'),
(34, 35, 'product_photo_UA1_35.png', 'product_photo_UA2_35.png', '', '', '', '2021-06-19 04:15:20', '2021-06-19 04:30:51'),
(35, 36, 'product_photo_UA1_36.png', 'product_photo_UA2_36.png', '', '', '', '2021-06-19 04:17:22', '2021-06-19 04:31:07'),
(36, 37, 'product_photo_UA1_37.png', 'product_photo_UA2_37.png', '', '', '', '2021-06-19 04:19:54', '2021-06-19 04:31:22'),
(37, 38, 'product_photo_UA1_38.png', 'product_photo_UA2_38.png', 'product_photo_UA3_38.png', 'product_photo_UA4_38.png', '', '2021-06-19 04:21:34', '2021-06-19 04:31:51'),
(38, 39, 'product_photo_UA1_39.png', 'product_photo_UA2_39.png', 'product_photo_UA3_39.png', 'product_photo_UA4_39.png', 'product_photo_UA5_39.png', '2021-06-19 04:23:57', '2021-06-19 04:34:13'),
(39, 40, 'product_photo_UA1_40.png', 'product_photo_UA2_40.png', 'product_photo_UA3_40.png', 'product_photo_UA4_40.png', '', '2021-06-19 04:25:47', '2021-06-19 04:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `rating` double NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `color` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `tag`, `rating`, `price`, `stock`, `color`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Men\'s Project Rock Dare to Fail Short Sleeve', 1, 1, 0, 699000, 1873, '#b2523e', 'Project Rock training gear was built to help you find boundaries, then push right through them. Everything in this collection was personally approved by Dwayne Johnson, the hardest worker in the room. ANY room.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Super-soft, cotton-blend fabric provides all-day comfort\r\n* Ribbed collar\r\n* Style #: 1363557\r\n* 60% Cotton/40% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 15:50:58', '2021-06-18 15:50:58'),
(2, 'Men\'s Project Rock Fire Short Sleeve', 1, 1, 0, 699000, 1273, '#1d1d1d', 'Project Rock training gear was built to help you find boundaries, then push right through them. Everything in this collection was personally approved by Dwayne Johnson, the hardest worker in the room. ANY room.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Super-soft, cotton-blend fabric provides all-day comfort\r\n* Ribbed collar\r\n* Style #: 1363557\r\n* 60% Cotton/40% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 15:51:35', '2021-06-18 15:51:35'),
(3, 'Men\'s UA MK-1 Short Sleeve', 1, 1, 0, 559000, 1839, '#e8e9f4', 'These men\'s training T-shirts are built with fabric that dries fast to keep you cool, and a streamlined fit to cut bulk. They\'re part of the UA MK-1 systemâa collection of gear keeps you ready for any training situation.\r\n\r\n* Fitted: Next-to-skin without the squeeze\r\n* HeatGearÂ® fabric is ultra-soft & smooth for extreme comfort with very little weight\r\n* Mesh back & underarm panels deliver strategic ventilation\r\n* 4-way stretch construction moves better in every direction\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Style #: 1306428\r\n* 90% Polyester/10% Elastane\r\n* Imported', '2021-06-18 16:00:33', '2021-06-18 16:00:33'),
(4, 'Men\'s Project Rock Iso-Chill Sleeveless', 1, 1, 0, 999000, 1394, '#1a1b1f', 'Project Rock training gear was built to help you find boundaries, then push right through them. Everything in this collection was personally approved by Dwayne Johnson, the hardest worker in the room. ANY room.\r\n\r\n* Compression: Ultra-tight, second skin fit\r\n* Iso-Chill fabric helps disperse body heat, making it feel cool to the touch\r\n* 4-way stretch construction moves better in every direction\r\n* Iso-Chill mesh back panel for added ventilation where you need it\r\n* Style #: 1361649\r\n* Body: 78% Nylon/22% Elastane\r\n* Mesh: 86% Nylon/14% Elastane\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 16:08:01', '2021-06-18 16:08:01'),
(5, 'Men\'s UA Baseline Reversible Tank', 1, 1, 0, 599000, 1938, '#1e1e20', 'This collection was built for people who live and breathe basketball. You\'ve got ultra-comfortable warm-ups along with Ts, tanks, and shorts that perform better than anything else on the court.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* All-over mesh fabric is soft & super-breathable\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Dropped armholes for extra mobility & range of motion\r\n* Style #: 1361899\r\n* Reversible construction\r\n* 100% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 16:10:30', '2021-06-18 16:10:30'),
(6, 'Men\'s UA CoolSwitch Sleeveless', 1, 1, 0, 499000, 1294, '#4342a0', 'It gets hot out there. Really hot. So we created a specialized hidden print that activates as soon as you start to sweat to pull heat away from your skinâkeeping you cooler and more concentrated.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* UA CoolSwitch pulls heat away from your skin, making you actually feel cool & able to perform longer\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Dropped, shaped hem for enhanced coverage\r\n* Style #: 1361429\r\n* 100% Polyester\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 16:14:58', '2021-06-18 16:14:58'),
(7, 'Men\'s UA Rival Fleece Alma Mater Shorts', 1, 2, 0, 629000, 1245, '#f5f5f5', 'These are your new favorite warm-up shorts for pretty much everything you doâthey\'re light, comfy, and are super-soft on the inside.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Lightweight, ultra-comfortable cotton-blend fleece\r\n* Soft inner layer keeps you warm & comfortable\r\n* 2-color, stretchy ribbed waistband with external drawcord\r\n* Open hand pockets & secure, snap closure back pocket\r\n* Style #: 1361624\r\n* Raised silicone patch logo\r\n* Inseam: 9\"\r\n* No liner\r\n* 80% Cotton/20% Polyester\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-18 16:49:01', '2021-06-18 16:49:01'),
(8, 'Men\'s UA Iso-Chill Shorts', 1, 2, 0, 909300, 1973, '#263140', 'Iso-Chill technology feels cool the instant you put it on. Like an ice pack built right into your men\'s golf shorts. the fibers disperse heat, while titanium dioxide-the stuff in sunscreen-pulls away heat.\r\n\r\n* Iso-Chill fabric helps disperse body heat, making it feel cool to the touch\r\n* Lightweight stretch-woven fabric with stain-resistant finish provides all-day comfort\r\n* 4-way stretch construction moves better in every direction\r\n* Stretch-engineered waistband for superior mobility & insane comfort\r\n* Flat-front, 4-pocket design\r\n* Inseam: 9\"\r\n* No liner\r\n* Rear pockets stitched closed to maintain shape in transit-rip or cut to remove\r\n* Style #: 1358785\r\n* 53% Nylon/39% Polyester/8% Elastane\r\n* Imported', '2021-06-18 16:51:53', '2021-06-18 16:51:53'),
(9, 'Men\'s UA Tech™ Mesh Shorts', 1, 2, 0, 529000, 1837, '#4f5259', '* Loose: Fuller cut for complete comfort\r\n* All-over mesh fabric is soft & extremely breathable for all-purpose wear\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Encased elastic waistband with external drawcord\r\n* Open hand pockets\r\n* Style #: 1328705\r\n* Inseam: 9\"\r\n* No liner\r\n* 100% Polyester\r\n* Imported', '2021-06-18 16:55:06', '2021-06-18 16:55:06'),
(10, 'Men\'s Charged Cotton® 6\" Boxerjock® 3-Pack (Army Pattern)', 1, 2, 0, 799000, 1294, '#202224', '* Fitted: Next-to-skin without the squeeze\r\n* Lightweight, Charged CottonÂ® fabric has the comfort of cotton, but dries much faster\r\n* No side or back seams for ultimate comfort\r\n* 4-way stretch construction moves better in every direction\r\n* Material wicks sweat & dries really fast\r\n* Performance waistband with matte wordmark\r\n* Working fly\r\n* 3 BoxerjocksÂ® per pack\r\n* Inseam: 6\"\r\n* 57% Cotton/38% Polyester/5% Elastane\r\n* Imported', '2021-06-18 17:06:14', '2021-06-18 17:06:14'),
(11, 'Men\'s Charged Cotton® 6\" Boxerjock® 3-Pack (Red)', 1, 2, 0, 799000, 1394, '#bf0323', 'Mother nature made cotton, we made it better. These men\'s quickdry boxer shorts are built with Charged CottonÂ®. They have the soft feel of natural cotton, but they dry much faster and stretch way more.\r\n\r\n* Fitted: Next-to-skin without the squeeze\r\n* Lightweight, Charged CottonÂ® fabric has the comfort of cotton, but dries much faster\r\n* No side or back seams for ultimate comfort\r\n* 4-way stretch construction moves better in every direction\r\n* Material wicks sweat & dries really fast\r\n* Performance waistband with matte wordmark\r\n* Style #: 1363617\r\n* Working fly\r\n* 3 BoxerjocksÂ® per pack\r\n* Inseam: 6\"\r\n* 57% Cotton/38% Polyester/5% Elastane\r\n* Imported\r\n* 57% Cotton/38% Polyester/5% Elastane\r\n* Imported', '2021-06-18 17:08:25', '2021-06-18 17:08:25'),
(12, 'Men\'s Charged Cotton® 6\" Boxerjock® 3-Pack (White)', 1, 2, 0, 799000, 1384, '#f7f7f7', 'Mother nature made cotton, we made it better. These men\'s quickdry boxer shorts are built with Charged CottonÂ®. They have the soft feel of natural cotton, but they dry much faster and stretch way more.\r\n\r\n* Fitted: Next-to-skin without the squeeze\r\n* Lightweight, Charged CottonÂ® fabric has the comfort of cotton, but dries much faster\r\n* No side or back seams for ultimate comfort\r\n* 4-way stretch construction moves better in every direction\r\n* Material wicks sweat & dries really fast\r\n* Performance waistband with matte wordmark\r\n* Style #: 1363617\r\n* Working fly\r\n* 3 BoxerjocksÂ® per pack\r\n* Inseam: 6\"\r\n* 57% Cotton/38% Polyester/5% Elastane\r\n* Imported\r\n* 57% Cotton/38% Polyester/5% Elastane\r\n* Imported', '2021-06-18 17:25:47', '2021-06-18 17:25:47'),
(13, 'Men\'s UA HOVR™ Infinite 3 25th Anniversary Running Shoes', 1, 3, 0, 2199000, 1293, '#d7d7db', 'Pro distance runners want energy return and efficiency. And that\'s exactly what UA HOVRâ¢ Infinite 3 delivers. That and real-time Form Coaching. Connect your shoes to UA MapMyRunâ¢ for personalized tips to help you run better.\r\n\r\n* CONNECTS TO UA MAPMYRUNâ¢: tracks & analyzes your running metrics to help make you a better runner\r\n* UA HOVRâ¢ technology provides \'zero gravity feel\' to maintain energy return that helps eliminate impact\r\n* Compression mesh Energy Web contains & molds UA HOVRâ¢ foam to give back the energy you put in\r\n* Engineered mesh upper is extremely lightweight & breathable, with strategic support where you need it\r\n* Internal heel counter for additional support that helps keep the back of the foot locked-in place\r\n* Die-cut, full-length EVA sockliner molds to the foot, eliminating slippage & providing ideal underfoot comfort\r\n* Anatomically placed, deep flex grooves offer proper flexibility in key areas\r\n* Carbon rubber pods under the heel deliver greater traction & durability at high-impact strike zones\r\n* Style #: 3024390\r\n* Offset: 8mm\r\n* Weight: 10.68 oz.\r\n* Imported\r\n* NEUTRAL: For runners who need a balance of flexibility & cushioning', '2021-06-18 17:53:02', '2021-06-18 17:53:02'),
(14, 'Men\'s UA Project Rock 3 Training Shoes', 1, 3, 0, 1749000, 1833, '#b7ea3a', 'Project Rock gear was built to help you find boundaries, then push right through them. These men\'s weight lifting shoes, like everything in this collection, were approved by Dwayne Johnson, the hardest worker in any room.\r\n\r\n* Delivers strategic support, tailored for medium-support activities like cycling, weight training & boxing\r\n* Soft, removable cups for enhanced shape & coverage\r\n* Interior, mesh shelf bra for added breathability & versatility\r\n* Ergonomic shaped band lays flat & stays in place for complete comfort\r\n* Slightly longer line hem creates a super-flattering silhouette\r\n* Carved ribbed details on side panels\r\n* External heel counter combined with stability chassis creates the ultimate in stable support\r\n* Full rubber outsole for elevated traction & durability\r\n* Style #: 1329055\r\n* 72% Polyester/28% Elastane\r\n* Weight: 10.9 oz.\r\n* Imported', '2021-06-18 17:56:12', '2021-06-18 17:56:12'),
(15, 'Unisex UA Embiid One Basketball Shoes', 1, 3, 0, 2199000, 1384, '#e2e1e6', 'Just like Joel himself, these shoes are truly positionless. Explosive off the drop, bouncy enough to move, strong enough for a big guy, and deceptively light. Everything you need for 5 positions on the court.\r\n\r\n* Lightweight textile upper with open-hole mesh for ultimate breathability\r\n* TPU wing provides superior midfoot lockdown & enhanced lateral stability\r\n* 5/8 construction for added ankle support\r\n* Die-cut EVA sockliner provides underfoot cushioning & support\r\n* Micro GÂ® foam midsole turns cushioned landings into explosive takeoffs\r\n* Rubber outsole with unique traction pattern for lateral movements & maximum grip\r\n* Style #: 3023086\r\n* Weight: 13.9 oz.\r\n* Imported', '2021-06-18 17:58:57', '2021-06-18 17:58:57'),
(16, 'Men\'s UA Clone Magnetico Pro FG Soccer Cleats', 1, 3, 0, 2519000, 1384, '#b9e094', '* UA CLONE upper provides a truly customized fit, no matter your foot size\r\n* An internal layer of flexible, auxetic material molds around the foot for a precise, glove-like fit & feel that\'s truly customized to every foot\r\n* Form-fitting toe box is incredibly soft for unmatched touch & feel\r\n* Ultra-responsive, Charged CushioningÂ® footbed absorbs impact & converts it into responsive quickness\r\n* Innovative soleplate provides a lightweight chassis that enhances the foot\'s natural ability to accelerate, dart in any direction & flex where necessary\r\n* Combination of bladed & round, conical studs for optimum traction\r\n* Conical studs enable quickness in all directions for enhanced agility & change of direction\r\n* Style #: 3022629\r\n* Imported', '2021-06-18 18:01:34', '2021-06-18 18:01:34'),
(18, 'Women\'s Armour® High Crossback Sports Bra', 2, 1, 0, 559000, 1284, '#e027b3', '* Compression: Ultra-tight, second skin fit\r\n* Delivers strategic support, tailored for high-support activities like running, court sports & field sports\r\n* Fixed performance foam pads provide extra coverage & support while still delivering breathability\r\n* Mesh lining & insets provide extra ventilation\r\n* Smooth, sweat-wicking band has easy hook & eye closure for easy on & off\r\n* Super-smooth, double-layer HeatGearÂ® fabric delivers superior next-to-skin feel & lasting comfort\r\n* Material wicks sweat & dries really fast\r\n* 4-way stretch construction moves better in every direction\r\n* Style #: 1355109\r\n* Adjustable crossback straps with keyhole detail\r\n* 87% Polyester/13% Elastane\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Line dry\r\n* Do not iron\r\n* Do not dry clean', '2021-06-19 01:40:02', '2021-06-19 01:40:02'),
(19, 'Women\'s Armour® Mid Crossback Matte/Shine Sports Bra', 2, 1, 0, 599000, 1832, '#000000', 'Bras shouldn\'t be complicated. They should be comfortable and they should be supportive. So we went straight to the source and asked real women how to make their favorite UA bra even better. And it worked.\r\n\r\n* Compression: Ultra-tight, second skin fit\r\n* Delivers strategic support, tailored for medium-support activities like cycling, weight training & boxing\r\n* Soft, quick-drying cups provide extra structure & coverage with perforations for added breathability\r\n* Removable cups have helpful R & L arrows to easily put back in\r\n* Crossover straps with updated keyhole detail for easier on/off\r\n* Updated interior construction helps keep pads in placeâduring wear & wash\r\n* Elastic band feels super-smooth & soft\r\n* Super-smooth, double-layer HeatGearÂ® fabric delivers superior next-to-skin feel\r\n* Material wicks sweat & dries really fast & light\r\n* Style #: 1362612\r\n* Front Panel: 72% Polyester/28% Elastane\r\n* Back: 87% Polyester/13% Elastane\r\n* Imported\r\n* Remove pads before washing\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 01:42:39', '2021-06-19 01:42:39'),
(20, 'Women\'s UA Tech™ Full Zip', 2, 1, 0, 799000, 1093, '#000000', 'UA Techâ¢ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* UA Techâ¢ fabric is quick-drying, ultra-soft & has a more natural feel\r\n* Material wicks sweat & dries really fast\r\n* 4-way stretch construction moves better in every direction\r\n* Generous funnel neck with external drawcords\r\n* Style #: 1319383\r\n* Open hand pockets\r\n* 100% Polyester\r\n* Imported', '2021-06-19 01:46:06', '2021-06-19 01:46:06'),
(21, 'Women\'s UA RUSH™ Vent Full Zip', 2, 1, 0, 979000, 1839, '#a0939d', 'No wasted energy, only more gains. UA RUSHâ¢ uses a mineral-infused fabric to take the energy you give off when you work and reflect it back into your muscles, increasing blood flow and helping them work harder.\r\n\r\n* Fitted: Next-to-skin without the squeeze\r\n* As your body emits energy, the mineral-infused fabric absorbs & reflects it back, improving endurance\r\n* Strategic mesh panels for ultimate breathability\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Open hand pockets\r\n* Dropped, shaped hem\r\n* Style #: 1360592\r\n* Powered by Celliant\r\n* 90% Polyester/10% Elastane\r\n* Imported\r\n* Garments should be washed & dried zipped up\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 01:48:24', '2021-06-19 01:48:24'),
(22, 'Women\'s UA Fly-By Run Your Face Off', 2, 2, 0, 459000, 1284, '#1f2123', 'Everyone needs a go-to pair of shorts. With side hand pockets and a soft, smooth waistbandâthese women\'s training shorts are it.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Soft, lightweight knit construction delivers superior comfort & breathability\r\n* Material wicks sweat & dries really fast\r\n* Anti-pill/anti-pick finish adds extra durability\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Updated exposed elastic printed waistband\r\n* Convenient side hand pockets\r\n* Curved hem for a more flattering silhouette\r\n* Style #: 1344552\r\n* Inseam: 3\"\r\n* 100% Polyester\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 02:10:24', '2021-06-19 02:10:24'),
(23, 'Women\'s UA Play Up Shorts 3.0', 2, 2, 0, 279000, 1903, '#e122ba', 'Everyone needs a go-to pair of shorts. With side hand pockets and a soft, smooth waistbandâthese women\'s training shorts are it.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Soft, lightweight knit construction delivers superior comfort & breathability\r\n* Material wicks sweat & dries really fast\r\n* Anti-pill/anti-pick finish adds extra durability\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Updated exposed elastic printed waistband\r\n* Convenient side hand pockets\r\n* Curved hem for a more flattering silhouette\r\n* Style #: 1344552\r\n* Inseam: 3\"\r\n* 100% Polyester\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 02:12:31', '2021-06-19 02:12:31'),
(24, 'Women\'s HeatGear® Armour No-Slip Waistband Geo Ankle Leggings', 2, 2, 0, 899000, 1738, '#1f2025', 'HeatGearÂ® Armour is our original performance baselayerâthe one you put on first and take off last. So we made it extra comfortable by wicking sweat and stretching so you can move no matter what.\r\n\r\n* Compression: Ultra-tight, second skin fit\r\n* Our Most Legendary: Super-light HeatGearÂ® fabric delivers superior coverage without weighing you down\r\n* Material wicks sweat & dries really fast\r\n* 4-way stretch construction moves better in every direction\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Ergonomic flatlock seams deliver a comfortable, chafe-free fit\r\n* High-rise UA No-Slip Waistband for optimal coverage & support that stays put with every move you make\r\n* Front waistband pocket\r\n* Style #: 1363253\r\n* Inseam: 26\"\r\n* 87% Polyester/13% Elastane\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 02:15:25', '2021-06-19 02:15:25'),
(25, 'Women\'s HeatGear® Armour No-Slip Waistband Shine Full-Length Leggings', 2, 2, 0, 629000, 1631, '#bd507c', 'HeatGearÂ® Armour is our original performance baselayerâthe one you put on first and take off last. So we made it extra comfortable by wicking sweat and stretching so you can move no matter what.\r\n\r\n* Compression: Ultra-tight, second skin fit\r\n* Our Most Legendary: Super-light HeatGearÂ® fabric delivers superior coverage without weighing you down\r\n* Material wicks sweat & dries really fast\r\n* 4-way stretch construction moves better in every direction\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Ergonomic flatlock seams deliver a comfortable, chafe-free fit\r\n* High-rise UA No-Slip Waistband for optimal coverage & support that stays put with every move you make\r\n* Side drop-in pocket\r\n* Style #: 1365352\r\n* Shine panels for an added pop\r\n* Inseam: 29\"\r\n* 87% Polyester/13% Elastane\r\n* Imported', '2021-06-19 02:17:24', '2021-06-19 02:17:24'),
(26, 'Women\'s UA Favorite Wordmark Leggings', 2, 2, 0, 699000, 1937, '#919294', '* Fitted: Next-to-skin without the squeeze\r\n* Soft, ultra-lightweight performance cotton fabric delivers incredible comfort\r\n* Soft elastic waistband\r\n* Style #: 1356403\r\n* Inseam: 29\"\r\n* 58% Cotton/32% Polyester/10% Elastane\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 02:19:24', '2021-06-19 02:19:24'),
(27, 'Women\'s UA Flow Velociti Wind Running Shoes', 2, 3, 0, 2599000, 1728, '#8ad4d1', 'There\'s fast, and then there\'s UA FLOW fast. Lightweight, rubberless, and durable, our newest cushioning gives a close-to-the-ground, grippy feeling of speed. The kind of speed that feels like you\'ve got the wind at your back.\r\n\r\n* CONNECTS TO UA MAPMYRUNâ¢: tracks & analyzes your running metrics to help make you a better runner\r\n* Warpâ¢ upper optimizes containment with lightweight lockdown & allows maximum breathability\r\n* One-piece Flow midsole provides responsive & long-lasting cushioning\r\n* Flow technology eliminates the rubber outsole, creating a more lightweight & seamless ride on any surface\r\n* Outsole material is super-durable & increases ground traction\r\n* Style #: 3023561\r\n* Offset: 8mm\r\n* Weight: 8.02 oz.\r\n* Imported\r\n* NEUTRAL: For runners who need a balance of flexibility & cushioning\r\n* Designed for a more secure, close-to-foot fit', '2021-06-19 02:29:18', '2021-06-19 02:29:18'),
(28, 'Women\'s UA Project Rock 3 Training Shoes', 2, 3, 0, 1749000, 1028, '#f5f5f5', 'Project Rock gear was built to help you find boundaries, then push right through them. These women\'s lifting shoes, like everything in this collection, were approved by Dwayne Johnson, the hardest worker in any room.\r\n\r\n* UA HOVRâ¢ technology provides \'zero gravity feel\' to maintain energy return that helps eliminate impact\r\n* Compression mesh Energy Web contains & molds UA HOVRâ¢ foam to give back the energy you put in\r\n* UA Tribaseâ¢ maximizes ground contact, promotes natural motion & provides flexibility to grip during lifts\r\n* Upper is extremely comfortable & durable, while providing stability & containment where you need it\r\n* Unique lacing structure for a locked-in fit & feel\r\n* Updated, knit bootie construction for a snug, comfortable fit\r\n* External heel counter combined with stability chassis creates the ultimate in stable support\r\n* Full rubber outsole for elevated traction & durability\r\n* Style #: 3023005\r\n* Offset: 8mm\r\n* Imported', '2021-06-19 02:31:11', '2021-06-19 02:31:11'),
(29, 'Curry Flow 8 Basketball Shoes', 2, 3, 0, 2599000, 1933, '#e9b2a1', 'You\'ve never felt a shoe like this before. The Curry Flow 8 is totally rubberless, making it lighter and ridiculously grippy. It gives you a better court feel, lets you start and stop on a dime, and get off the ground faster.\r\n\r\n* Breathable, lightweight flat knit upper with synthetic overlays for strategic support\r\n* Bi-directional internal fit structure with independent layers for lockdown & lateral containment\r\n* Bootie construction provides a sock-like fit & feel with a high-stretch collar for easy entry\r\n* New UA Flow cushioning technology is super-light, bouncy & provides insane grip\r\n* Flexible PebaxÂ® plate adds support & stability to every move\r\n* Durable UA Flow outsole provides better court feel so you can cut & stop/start faster than ever before\r\n* Style #: 3024432\r\n* Weight: 12.1 oz.\r\n* Imported', '2021-06-19 02:33:02', '2021-06-19 02:33:02'),
(30, 'Boys\' Project Rock BSR Short Sleeve', 3, 1, 0, 321000, 1289, '#1f1f1f', 'This collection supports Team Rubiconâa non-profit made up of veterans who, even after their service, devote themselves to helping people prepare, respond, and recover from disasters and humanitarian crises.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Super-soft, cotton-blend fabric provides all-day comfort\r\n* Style #: 1357553\r\n* Ribbed collar\r\n* 60% Cotton/40% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean\r\n* 60% Cotton/40% Polyester\r\n* Imported', '2021-06-19 04:07:20', '2021-06-19 04:07:20'),
(31, 'Boys\' UA Tech™ Gator Short Sleeve', 3, 1, 0, 299000, 1099, '#f24c59', 'UA Techâ¢ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* UA Techâ¢ fabric is quick-drying, ultra-soft & has a more natural feel\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Many UA Techâ¢ T\'s are made with recycled, traceable polyester & re-use about 5 bottles per shirt\r\n* Style #: 1361829\r\n* Raglan sleeves\r\n* 100% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 04:08:55', '2021-06-19 04:08:55'),
(32, 'Boys\' UA Tech™ Octo-Sport Short Sleeve', 3, 1, 0, 299000, 1028, '#171d2f', 'UA Techâ¢ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* UA Techâ¢ fabric is quick-drying, ultra-soft & has a more natural feel\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Many UA Techâ¢ T\'s are made with recycled, traceable polyester & re-use about 5 bottles per shirt\r\n* Style #: 1361832\r\n* Raglan sleeves\r\n* 100% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 04:10:24', '2021-06-19 04:10:24'),
(33, 'Boys\' Project Rock Brahma Bull Short Sleeve', 3, 1, 0, 321000, 1634, '#fec9d0', 'Everyone makes graphic Ts...but Under Armour makes them better. The fabric we use is light, soft, and quick-drying.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Super-soft, cotton-blend fabric provides all-day comfort\r\n* Style #: 1357552\r\n* Ribbed collar\r\n* 60% Cotton/40% Polyester\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean\r\n* 60% Cotton/40% Polyester\r\n* Imported', '2021-06-19 04:11:58', '2021-06-19 04:11:58'),
(34, 'Boys\' UA Performance Floral Polo', 3, 1, 0, 559000, 1243, '#f7f7f7', 'We actually upgraded one of the best-selling polos in the world. The fabric is now lighter and more breathable to keep you even cooler and more focused.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Smooth, soft anti-pick, anti-pill fabric has a textured snag-free finish\r\n* 4-way stretch construction moves better in every direction\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Self-fabric collar\r\n* Side-vent hem\r\n* Style #: 1364424\r\n* 94% Polyester/6% Elastane\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 04:13:21', '2021-06-19 04:13:21'),
(35, 'Girls\' Project Rock Play Up Shorts', 3, 2, 0, 559000, 1293, '#000000', 'Project Rock training gear was built to help you find boundaries, then push right through them. Everything in this collection was personally approved by Dwayne Johnson, the hardest worker in the room. ANY room.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Lightweight, soft-knit performance fabric delivers superior comfort & breathability\r\n* Material wicks sweat & dries really fast\r\n* Anti-pill/anti-pick finish adds extra durability\r\n* Soft elastic waistband has pop color wordmark & external drawcord for customized comfort\r\n* Updated shaped hem for a more streamlined look & feel\r\n* Style #: 1363227\r\n* Inseam: 2.5\"\r\n* 100% Polyester\r\n* Imported', '2021-06-19 04:15:18', '2021-06-19 04:15:18'),
(36, 'Girls\' UA Play Up Shorts', 3, 2, 0, 299000, 1382, '#b8a7cc', 'Everyone needs a go-to pair of shorts. These feature a lightweight fabric that keeps you cool and comfortable at all times. You\'ll love the way they look and the way they feel even more.\r\n\r\n* Loose: Fuller cut for complete comfort\r\n* Soft, lightweight knit construction delivers superior comfort & breathability\r\n* Material wicks sweat & dries really fast\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Soft elastic waistband has pop color wordmark & external drawcord for customized comfort\r\n* Shaped hem with crossover side seams for a more streamlined look\r\n* Style #: 1363372\r\n* Inseam: 2.5\"\r\n* 100% Polyester\r\n* Imported\r\n* Machine wash cold with like colors\r\n* Do not bleach\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 04:17:20', '2021-06-19 04:17:20'),
(37, 'Girls\' UA Favorites Leggings', 3, 2, 0, 391000, 1284, '#d45673', '* Fitted: Next-to-skin without the squeeze\r\n* Soft, ultra-lightweight performance cotton fabric delivers incredible comfort\r\n* Soft, stretchy wide elastic waistband\r\n* Style #: 1356463\r\n* Inseam: YMD 25.5\" (+/- 1.5\" per size)\r\n* 58% Cotton/31% Polyester/11% Elastane\r\n* Imported\r\n* Wash garment inside out\r\n* Machine wash cold with like colors\r\n* Use only non-chlorine bleach when needed\r\n* Tumble dry low\r\n* Do not iron\r\n* Do not use softeners\r\n* Do not dry clean', '2021-06-19 04:19:52', '2021-06-19 04:19:52'),
(38, 'Girls\' HeatGear® Armour Leggings', 3, 2, 0, 461000, 1384, '#000000', 'HeatGearÂ® Armour is our original performance baselayerâthe one you put on first and take off last. So we made it extra comfortable by wicking sweat and stretching so you can move. No athlete can go without it.\r\n\r\n* Fitted: Next-to-skin without the squeeze\r\n* Super-light HeatGearÂ® fabric delivers superior coverage without weighing you down\r\n* Material wicks sweat & dries really fast\r\n* 4-way stretch construction moves better in every direction\r\n* Anti-odor technology prevents the growth of odor-causing microbes\r\n* Stretchy elastic waistband with wordmark wrap detail\r\n* Style #: 1331679\r\n* Inseam: YMD 25\" (+/- 2\" per size)\r\n* 86% Polyester/14% Elastane\r\n* Imported', '2021-06-19 04:21:32', '2021-06-19 04:21:32'),
(39, 'Grade School UA Surge 2 Running Shoes', 3, 3, 0, 599000, 1834, '#b30628', '* Lightweight, breathable mesh upper delivers increased ventilation\r\n* TPU heel overlay for added durability & support\r\n* Enhanced cushioning around ankle collar for superior comfort\r\n* Full-length EVA sockliner for added comfort & a custom fit\r\n* Cushioned EVA midsole delivers a lightweight & responsive ride\r\n* Aggressive outsole traction pattern with slightly raised rubber knobs for added grip\r\n* Strategically placed rubber pods beneath the heel & forefoot for greater durability with less weight\r\n* Imported\r\n* Style #: 3022870\r\n* Imported', '2021-06-19 04:23:55', '2021-06-19 04:23:55'),
(40, 'Grade School UA Embiid One Basketball Shoes', 3, 3, 0, 1049000, 1243, '#fafafa', 'Just like Joel himself, these shoes are truly positionless. Explosive off the drop, bouncy enough to move, strong enough for a big, and deceptively light. Everything you need for 5 positions on the court.\r\n\r\n* Lightweight textile upper with open-hole mesh for ultimate breathability\r\n* TPU wing provides superior midfoot lockdown & enhanced lateral stability\r\n* 5/8 construction for added ankle support\r\n* Die-cut EVA sockliner provides underfoot cushioning & support\r\n* Micro GÂ® foam midsole turns cushioned landings into explosive takeoffs\r\n* Rubber outsole with unique traction pattern for lateral movements & maximum grip\r\n* Style #: 3023529\r\n* Imported', '2021-06-19 04:25:45', '2021-06-19 04:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Tops'),
(2, 'Bottoms'),
(3, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `bod` date NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `photo` varchar(256) NOT NULL DEFAULT 'user_default.png',
  `isLogin` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `bod`, `address`, `phone_number`, `photo`, `isLogin`, `created_at`, `updated_at`) VALUES
(1, 'Patricia Fiona', 'patriciafiona@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, '1999-04-17', 'Jl. Petojo Enclek II No. 41 A', '085889998396', 'user_photo_1.jpg', 0, '2021-06-12 14:26:45', '2021-06-18 16:32:29'),
(2, '王佳佳', 'wangjiajia@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, '1999-04-17', NULL, NULL, 'user_default.png', 0, '2021-06-19 04:50:26', '2021-06-19 04:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`,`tag`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`tag`) REFERENCES `tags` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
