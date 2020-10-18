-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 04, 2019 at 05:29 PM
-- Server version: 10.3.9-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`user_id`, `user_email`, `user_pass`) VALUES
(3, 'pratikvalvi007@gmail.com', 'pratik'),
(4, 'sakshijkansara@gmail.com', 'sakshi');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Intel'),
(2, 'AMD'),
(3, 'Cryorig'),
(4, 'NZXT'),
(5, 'EVGA'),
(6, 'MSI'),
(7, 'Seasonic'),
(8, 'G.Skill'),
(9, 'Samsung'),
(10, 'WD'),
(11, 'ASUS');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `qty`) VALUES
(29, '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'CPU'),
(2, 'Motherboard'),
(3, 'GPU'),
(4, 'RAM'),
(5, 'Storage'),
(6, 'Cooler'),
(7, 'Cases'),
(8, 'PSU'),
(9, 'Monitiors');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_ip` varchar(255) NOT NULL,
  `customer_name` text NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_pass` varchar(100) NOT NULL,
  `customer_country` text NOT NULL,
  `customer_city` text NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_ip`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`) VALUES
(9, '::1', 'pratik valvi', 'pratik@gmail.com', 'pratik', 'India', 'nashik', 'a', 'plot no 8 shrutisager new water tank borgad', '7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(100) NOT NULL AUTO_INCREMENT,
  `p_id` int(100) NOT NULL,
  `c_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `status` text NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `p_id`, `c_id`, `qty`, `invoice_no`, `status`, `order_date`) VALUES
(1, 20, 1, 1, 462643381, 'Completed', '2019-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` int(100) NOT NULL,
  `customer_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `currency` text NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `amount`, `customer_id`, `product_id`, `trx_id`, `currency`, `payment_date`) VALUES
(1, 800, 1, 20, '31B07494JS505133P', 'IN', '2019-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(20, 1, 2, 'AMD Ryzen 5 2400G Quad-Core 3.6GHz', 1400, 'Value 4-Core/8-Thread CPU for gaming and productivity purposes.\r\n\r\nName\r\n\r\n	AMD Ryzen 5 2400G Quad-Core 3.6GHz\r\n\r\nModel\r\n\r\n	YD2400C5FBBOX\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nCores\r\n\r\n	4\r\n\r\nThreads\r\n\r\n	8\r\n\r\nCache\r\n\r\n	8\r\n\r\nBase Speed\r\n\r\n	3.6 GHz\r\n\r\nBoost Speed\r\n\r\n	3.9 GHz\r\n\r\nRAM Capacity\r\n\r\n	6 GB', 'img1.jpg', 'AMD, ryzen 5, cpu'),
(21, 1, 1, 'Intel Core i3-8100 Quad-Core 3.6 GHz', 1100, 'Value 4-Core/4-Thread CPU for users playing moderately demanding games.\r\n\r\nName\r\n\r\nIntel Core i3-8100 Quad-Core 3.6 GHz\r\n\r\nModel\r\n\r\nBX80684I38100\r\n\r\nSocket\r\n\r\nLGA 1151\r\n\r\nCores\r\n\r\n4\r\n\r\nThreads\r\n\r\n4\r\n\r\nCache\r\n\r\n6\r\n\r\nBase Speed\r\n\r\n3.6 GHz\r\n\r\nBoost Speed\r\n\r\n3.6 GHz\r\n\r\nRAM Capacity\r\n\r\n64 GB', 'cover.png', 'intel, i3, cpu'),
(26, 1, 2, 'AMD Ryzen 5 2600 6-Core 3.4GHz', 1400, 'Advanced 6-Core/12-Thread CPU for serious gaming and multi-tasking performance.\r\n\r\nName\r\n\r\n	AMD Ryzen 5 2600 6-Core 3.4GHz\r\n\r\nModel\r\n\r\n	YD2600BBAFBOX\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nCores\r\n	\r\n	6\r\n\r\nThreads\r\n\r\n	12\r\n\r\nCache\r\n\r\n	16\r\n\r\nBase Speed\r\n\r\n	3.4 GHz\r\n\r\nBoost Speed\r\n\r\n	3.9 GHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB', 'img1 - Copy (2).jpg', 'AMD,Ryzen5,cpu'),
(27, 1, 2, 'AMD Ryzen 5 2600X 6-Core 3.6GHz', 1450, 'Improved advanced 6-Core/12-Thread CPU for serious gaming and multi-tasking performance.\r\n\r\nName\r\n\r\n	AMD Ryzen 5 2600X 6-Core 3.6GHz\r\n\r\nModel\r\n	\r\n	YD260XBCAFBOX\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nCores\r\n\r\n	6\r\n\r\nThreads\r\n\r\n	12\r\n\r\nCache\r\n\r\n	16\r\n\r\nBase Speed\r\n\r\n	3.6 GHz\r\n\r\nBoost Speed\r\n\r\n	4.2 GHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB', 'img1 - Copy', 'AMD,Ryzan 5,CPU'),
(28, 1, 2, 'AMD Ryzen 7 1700 8-Core 3.0GHz', 1700, 'Premium 8-Core/16-Thread CPU for superior performance and efficiency.\r\n\r\nName\r\n\r\n	AMD Ryzen 7 1700 8-Core 3.0GHz\r\n\r\nModel\r\n\r\n	YD1700BBAEBOX\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nCores\r\n\r\n	8\r\n\r\nThreads\r\n\r\n	16\r\n\r\nCache\r\n\r\n	16\r\n\r\nBase Speed\r\n\r\n	3.0 GHz\r\n\r\nBoost Speed\r\n\r\n	3.7 GHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\n', '51mYUHhRQdL._SL1157_.jpg', 'AMD,ryzen 7,cpu'),
(29, 1, 2, 'AMD Ryzen 7 2700X 8-Core 3.7GHz', 1800, 'Improved Premium 8-Core/16-Thread CPU for superior performance and efficiency.\r\n\r\nName\r\n\r\n	AMD Ryzen 7 2700X 8-Core 3.7GHz\r\n\r\nModel\r\n\r\n	YD270XBGAFBOX\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nCores\r\n\r\n	8\r\n\r\nThreads\r\n\r\n	16\r\n\r\nCache\r\n\r\n	16\r\n\r\nBase Speed\r\n\r\n	3.7 GHz\r\n\r\nBoost Speed\r\n\r\n	4.3 GHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB', '51mYUHhRQdL._SL1157_.jpg', 'amd,ryzen 7,cpu'),
(30, 1, 1, 'Intel Core i5-8400 6-Core 2.8 GHz', 1500, 'Powerful 6-Core/6-Thread CPU for users who want the best price-to-performance ratio.\r\n\r\nName\r\n\r\nIntel Core i5-8400 6-Core 2.8 GHz\r\n\r\nModel\r\n\r\nBX80684I58400\r\n\r\nSocket\r\n\r\nLGA 1151\r\n\r\nCores\r\n\r\n6\r\n\r\nThreads\r\n\r\n6\r\n\r\nCache\r\n\r\n9\r\n\r\nBase Speed\r\n\r\n2.8 GHz\r\n\r\nBoost Speed\r\n\r\n4.0 GHz\r\n\r\nRAM Capacity\r\n\r\n64 GB\r\n\r\n', 'cover.png', 'intel,i5,cpu'),
(31, 1, 1, 'Intel Core i5-8600K 6-Core 3.6 GHz', 1700, 'Advanced 6-Core/6-Thread CPU for users interested in overclocking and more demanding games.\r\n\r\nName\r\n\r\nIntel Core i5-8600K 6-Core 3.6 GHz\r\n\r\nModel\r\n\r\nBX80684I58600K\r\n\r\nSocket\r\n\r\nLGA 1151\r\n\r\nCores\r\n\r\n6\r\n\r\nThreads\r\n\r\n6\r\n\r\nCache\r\n\r\n9\r\n\r\nBase Speed\r\n\r\n3.6 GHz\r\n\r\nBoost Speed\r\n\r\n4.3 GHz\r\n\r\nRAM Capacity\r\n\r\n64 GB', 'cover.png', 'intel,cpu,i5'),
(32, 1, 1, 'Intel Core i7-8700K 6-Core 3.7 GHz', 2000, 'Premium 6-Core/12-Thread CPU for users who want uncompromising gaming and overclocking performance.\r\n\r\nName\r\n\r\nIntel Core i7-8700K 6-Core 3.7 GHz\r\n\r\nModel\r\n\r\nBX80684I78700K\r\n\r\nSocket\r\n\r\nLGA 1151\r\n\r\nCores\r\n\r\n6\r\n\r\nThreads\r\n\r\n10\r\n\r\nCache\r\n\r\n12\r\n\r\nBase Speed\r\n\r\n3.7 GHz\r\n\r\nBoost Speed\r\n\r\n4.7 GHz\r\n\r\nRAM Capacity\r\n\r\n64 GB\r\n\r\n', 'cover.png', 'intel.i7,cpu'),
(33, 2, 11, 'ASUS Prime X470-Pro', 1200, 'Advanced ATX motherboard that supports M.2, overclocking, and all the basic features.\r\n\r\nName\r\n\r\n	ASUS Prime X470-Pro\r\n\r\nModel\r\n\r\n	Prime X470-Pro\r\n\r\nSize\r\n\r\n	ATX\r\n\r\nChipset\r\n\r\n	AMD X470\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	3.6 MHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nM.2 Ports\r\n\r\n	2\r\n\r\nWiFi\r\n\r\n	No\r\n\r\nBluetooth\r\n\r\n	No', 'qbc', 'motherboard,lga2015,pro,intel'),
(34, 2, 11, 'ASUS ROG Crosshair VII Hero (Wi-Fi)', 1250, 'Premium ATX motherboard with no compromises.\r\n\r\nName\r\n\r\n	ASUS ROG Crosshair VII Hero (Wi-Fi)\r\n\r\nModel\r\n\r\n	Crosshair VI Hero\r\n\r\nSize\r\n	\r\n	ATX\r\n\r\nChipset\r\n\r\n	AMD X470\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	3.2 MHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nM.2 Ports\r\n\r\n	1\r\n\r\nWiFi\r\n\r\n	Yes\r\n\r\nBluetooth\r\n\r\n	Yes\r\n\r\n', 'rog hero', 'motherboard,lga2015,ROG,intel'),
(35, 2, 11, 'ASUS ROG Maximus XI Hero (Wi-Fi AC)', 1500, 'Premium ATX board that supports Wi-Fi, M.2 SSDs, overclocking, and RGB options.\r\n\r\nName\r\n\r\n	ASUS ROG Maximus XI Hero (Wi-Fi AC)\r\n\r\nModel\r\n\r\n	Maximus XI Hero (Wi-Fi AC)\r\n\r\nSize\r\n\r\n	ATX\r\n\r\nChipset\r\n\r\n	INTEL Z390\r\n\r\nSocket\r\n\r\n	LGA 1151\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	4.1 MHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nM.2 Ports\r\n\r\n	2\r\n\r\nWiFi\r\n\r\n	Yes\r\n\r\nBluetooth\r\n\r\n\r\n	Yes', '5bc76e7f605ea.png', 'Asus,motherboard,Rog,wifi'),
(36, 2, 6, 'MSI MPG Z390 GAMING PRO CARBON AC', 1400, 'Advanced ATX motherboard that supports Wi-Fi, Bluetooth, M.2 SSDs, overclocking, and RGB lighting.\r\n\r\nName\r\n\r\n	MSI MPG Z390 GAMING PRO CARBON AC\r\n\r\nModel\r\n\r\n	Z390 MPG GAMING PRO CARBON AC\r\n\r\nSize\r\n\r\n	ATX\r\n\r\nChipset\r\n\r\n	INTEL Z390\r\n\r\nSocket\r\n\r\n	LGA 1151\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	4.0 MHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nM.2 Ports\r\n\r\n	2\r\n\r\nWiFi\r\n\r\n	Yes\r\n\r\nBluetooth\r\n\r\n	Yes', '5bf99becb3334.png', 'msi,motherboard,pro'),
(37, 2, 11, 'ASUS ROG Strix X470-F', 1200, 'Premium ATX board supporting M.2, advanced overclocking, and RGB options.\r\n\r\nName\r\n\r\n	ASUS ROG Strix X470-F\r\n\r\nModel\r\n\r\n	Strix X470-F Gaming\r\n\r\nSize\r\n\r\n	ATX\r\n\r\nChipset\r\n\r\n	AMD X470\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	3.4 MHz\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nM.2 Ports\r\n\r\n	2\r\n\r\nWiFi\r\n\r\n	No\r\n\r\nBluetooth\r\n\r\n	No\r\n', 'ASUS ROG Strix X470-F.jpg', 'motherboard,rog,amd,rog'),
(38, 2, 6, 'MSI X470 GAMING PLUS', 1500, 'Advanced ATX motherboard that supports all essential features, including overclocking.\r\n\r\nName\r\n\r\n	MSI X470 GAMING PLUS\r\n\r\nModel\r\n\r\n	X470 GAMING PLUS\r\n\r\nSize\r\n\r\n	ATX\r\n\r\nChipset\r\n\r\n	AMD X470\r\n\r\nSocket\r\n\r\n	AM4\r\n\r\nRAM Slots\r\n\r\n	4\r\n\r\nRAM Speed Support\r\n\r\n	3.600 MH\r\n\r\nRAM Capacity\r\n\r\n	64 GB\r\n\r\nPCIe Slots\r\n\r\n	2\r\n\r\nM.2 Ports\r\n\r\n	2\r\n\r\nWiFi\r\n\r\n	No\r\n\r\nBluetooth\r\n\r\n	No', 'aaa.png', 'motherboard,amd,msi'),
(39, 3, 5, 'EVGA GTX 1080 Gaming', 1700, 'Premium GPU for users playing at 1440p on ultra settings or at 4k on high settings.\r\n\r\nName\r\n\r\n	EVGA GTX 1080 Gaming\r\n\r\nModel\r\n\r\n	08G-P4-6581-KR\r\n\r\nCore Clock\r\n\r\n	1607 MHz\r\n\r\nBoost Clock\r\n\r\n	1733 MHz\r\n\r\nMemory Speed\r\n\r\n	10010 MHz\r\n\r\nGPU Length\r\n\r\n	267 mm\r\n\r\nGPU Thickness\r\n\r\n	50 mm\r\n\r\nHDMI Ports\r\n\r\n	1\r\n\r\nDP Ports\r\n\r\n	3\r\n\r\nDVI Ports\r\n\r\n	1\r\n\r\nSLI\r\n\r\n	Yes', 'gtx 1080.png', 'GPU,GTX,1080'),
(40, 3, 5, 'EVGA GTX 1080 Ti SC Gaming Black Edition', 1600, 'Superior GPU for users playing at 4K on ultra settings.\r\n\r\nName\r\n\r\n	EVGA GTX 1080 Ti SC Gaming Black Edition\r\n\r\nModel\r\n\r\n	11G-P4-6393-KR\r\n\r\nCore Clock\r\n\r\n	1556 MHz\r\n\r\nBoost Clock\r\n\r\n	1670 MHz\r\n\r\nMemory Speed\r\n\r\n	11000 MHz\r\n\r\nGPU Length\r\n\r\n	267 mm\r\n\r\nGPU Thickness\r\n\r\n	0 mm\r\n\r\nSLI\r\n\r\n	Yes\r\n\r\n', 'EVGA GTX 1080 Ti SC Gaming Black Edition.png', 'gpu,gtx,1080,ti'),
(41, 3, 5, 'EVGA RTX 2080 XC GAMING', 1800, 'Newest GPU with Turing architecture for users playing at 4k on ultra settings.\r\n\r\nName\r\n\r\n	EVGA RTX 2080 XC GAMING\r\n\r\nModel\r\n\r\n	08G-P4-2182-KR\r\n\r\nCore Clock\r\n\r\n	1515 MHz\r\n\r\nBoost Clock\r\n\r\n	1800 MHz\r\n\r\nMemory Speed\r\n\r\n	7000 MHz\r\n\r\nGPU Length\r\n\r\n	269 mm\r\n\r\nGPU Thickness\r\n\r\n	40 mm\r\n\r\nHDMI Ports\r\n\r\n	1\r\n\r\nDP Ports\r\n\r\n	3\r\n\r\nSLI\r\n\r\n	Yes', 'EVGA RTX 2080 XC GAMING.png', 'gpu,Rtx,2080'),
(42, 3, 6, 'MSI GTX 1070 ARMOR 8G OC', 1900, 'Advanced GPU for users playing at 1440p on high settings.\r\n\r\nName\r\n\r\n	MSI GTX 1070 ARMOR 8G OC\r\n\r\nModel\r\n\r\n	GTX 1070 ARMOR 8G OC\r\n\r\nCore Clock\r\n\r\n	1556 MHz\r\n\r\nBoost Clock\r\n\r\n	1746 MHz\r\n\r\nMemory Speed\r\n\r\n	8008 MHz\r\n\r\nGPU Length\r\n\r\n	279 mm\r\n\r\nGPU Thickness\r\n\r\n	37 mm\r\n\r\nHDMI Ports\r\n\r\n	1\r\n\r\nDP Ports\r\n\r\n	3\r\n\r\nDVI Ports\r\n\r\n	1\r\n\r\nSLI\r\n\r\n	Yes\r\n\r\n', 'EVGA RTX 2080 XC GAMING.png', 'msi,Gpu,1070,gtx'),
(43, 3, 6, 'MSI RTX 2080 Ti VENTUS', 1980, 'Ultimate GPU for smooth gaming at 4K above 60 FPS at ultra settings.\r\n\r\nName\r\n\r\n	MSI RTX 2080 Ti VENTUS\r\n\r\nModel\r\n\r\n	RTX 2080 Ti VENTUS\r\n\r\nCore Clock\r\n\r\n	1350 MHz\r\n\r\nBoost Clock\r\n\r\n	1545 MHz\r\n\r\nMemory Speed\r\n\r\n	14000 MHz\r\n\r\nGPU Length\r\n\r\n	268 mm\r\n\r\nGPU Thickness\r\n\r\n	50 mm\r\n\r\nHDMI Ports\r\n\r\n	1\r\n\r\nDP Ports\r\n\r\n	3\r\n\r\nSLI\r\n\r\n	Yes', 'MSI RTX 2080 Ti VENTUS.png', 'MSI, rtx ,2080, ti ,VENTUS'),
(44, 4, 8, 'G.Skill rjpjaws V 2666 MHz 8GB', 900, 'G.SKILL Ripjaws V 2666 MHz\r\nThe Ripjaws V has a sleek, black heatsink that goes well in any build.\r\n\r\nName\r\n\r\n	G.SKILL Ripjaws V 8GB (2 x 4GB) 2666 MHz\r\n\r\nModel\r\n\r\n	-\r\n\r\nCapacity\r\n\r\n	4 GB\r\n\r\nSpeed\r\n\r\n	2666.0 MHz\r\n\r\nTimings\r\n\r\n	15-15-15-35\r\n\r\nHeight\r\n\r\n	42mm', '984c623a48f4.png', 'ram,8GB,g.skill'),
(45, 4, 8, 'G.SKILL TridentZ 3000 MHz', 1000, 'The TridentZ has fast timings and room for overclocking.\r\n\r\nName\r\n\r\nG.SKILL TridentZ 16GB (2 x 8GB) 3000 MHz\r\n\r\nModel\r\n\r\n-\r\n\r\nCapacity\r\n\r\n8 GB\r\n\r\nSpeed\r\n\r\n3000.0 MHz\r\n\r\nTimings\r\n\r\n15-16-16-35\r\n\r\nHeight\r\n\r\n44mm', '7d14f9250628.png', 'G.SKILL, TridentZ ,3000 MHz'),
(46, 4, 8, 'G.SKILL TridentZ RGB 3200 MHz', 1100, 'The TridentZ RGB performs well and looks great with its vibrant colors and lighting options.\r\n\r\nName\r\n\r\nG.SKILL TridentZ RGB 16GB (2 x 8GB) 3200 MHz\r\n\r\nModel\r\n\r\nF4-3200C16D-16GTZR\r\n\r\nCapacity\r\n\r\n8 GB\r\n\r\nSpeed\r\n\r\n3.2 MHz\r\n\r\nTimings\r\n\r\n16-18-18-38\r\n\r\nHeight\r\n\r\n44mm', '00a2e199c28aa', 'ram,rgb,8gb'),
(47, 4, 8, 'G.SKILL TridentZ RGB 3600 MHz', 1200, 'The TridentZ RGB performs well and looks great with its vibrant colors and lighting options.\r\n\r\nName\r\n\r\nG.SKILL TridentZ RGB 16GB (2 x 8GB) 3200 MHz\r\n\r\nModel\r\n\r\nF4-3200C16D-16GTZR\r\n\r\nCapacity\r\n\r\n8 GB\r\n\r\nSpeed\r\n\r\n3.2 MHz\r\n\r\nTimings\r\n\r\n16-18-18-38\r\n\r\nHeight\r\n\r\n44mm', 'klnsad.png', 'ram,rgb,g.skill'),
(48, 5, 10, 'WD HDD 1TB', 350, 'Reliable HDD for users needing a very large storage space at 210 MB/s read speeds.\r\n\r\nName	Seagate Barracuda 4TB\r\n\r\nModel	-\r\n\r\nForm Factor	3.5\r\n\r\nRead	0 _B/s\r\n\r\nWrite	0 _B/s\r\n\r\nCapacity	4.0 TB', '5ba03ea22a51a.jpg', 'hard disk,wd,hdd,1tb'),
(49, 5, 10, 'WD HDD 2TB', 400, 'Reliable HDD for users needing a very large storage space at 210 MB/s read speeds.\r\n\r\nName	Seagate Barracuda 4TB\r\n\r\nModel	-\r\n\r\nForm Factor	3.5\r\n\r\nRead	0 _B/s\r\n\r\nWrite	0 _B/s\r\n\r\nCapacity	4.0 TB', '5ba03ea22a51a.jpg', 'hdd,hard disk,2tb'),
(50, 5, 10, 'WD HDD 4TB', 500, 'Reliable HDD for users needing a very large storage space at 210 MB/s read speeds.\r\n\r\nName	Seagate Barracuda 4TB\r\n\r\nModel	-\r\n\r\nForm Factor	3.5\r\n\r\nRead	0 _B/s\r\n\r\nWrite	0 _B/s\r\n\r\nCapacity	4.0 TB', '5ba03ea22a51a', 'WD,HDD,hardsisk,4tb'),
(51, 5, 9, 'Samsung 860 EVO SSD', 600, 'Samsung 860 EVO\r\nDurable SSD with 550/520 MB/s Read/Write speeds.\r\n\r\nName\r\n\r\n	Samsung 860 EVO 250GB\r\n\r\nModel\r\n\r\n	MZ-76E250B/AM\r\n\r\nForm Factor\r\n\r\n	2.5\r\n\r\nRead\r\n\r\n	550 MB/s\r\n\r\nWrite\r\n\r\n	520 MB/s\r\n\r\nCapacity\r\n\r\n	250.0 GB\r\n\r\n	500.0 GB\r\n\r\n	1.0 TB\r\n\r\n	2.0 TB', '5ba03e7f8610f', 'sdd,samsung,860'),
(52, 5, 9, 'Samsung 970 EVO SSD', 700, 'Samsung 970 EVO\r\nAdvanced M.2 SSD with up to 3,500/2,500 MB/s Read/Write speeds.\r\n\r\nName\r\n\r\n	Samsung 970 EVO 250GB\r\n\r\nModel\r\n\r\n	MZ-V7E250BW\r\n\r\nForm Factor\r\n\r\n	M.2\r\n\r\nRead\r\n\r\n	3400 MB/s\r\n\r\nWrite\r\n\r\n	1500 MB/s\r\n\r\nCapacity\r\n\r\n	250.0 GB\r\n\r\n	500.0 GB\r\n\r\n	1.0 TB\r\n\r\n	2.0 TB', '4435a2edab6c.png', 'SSD,samsung,'),
(53, 5, 1, 'Intel Optane SSD 905P 960GB', 700, 'ntel Optane SSD 905P 960GB\r\nBuilt with Intel Optane technology, the Intel Optane SSD 905P series delivers ridiculously fast read/write speed coupled with ultra-low latency and industry-leading endurance.\r\n\r\nName\r\n\r\nIntel Optane SSD 905P 960GB\r\n\r\nModel\r\n\r\nSSDPED1D960GAX1\r\n\r\nForm Factor\r\n\r\nPCIe\r\n\r\nRead\r\n\r\n2600 MB/s\r\n\r\nWrite\r\n\r\n2200 MB/s\r\n\r\nCapacity\r\n\r\n960.0 GB', '5bbfc362bf205.png', 'intel,optane ,sdd'),
(54, 6, 3, 'CRYORIG H7', 300, 'Efficient and silent air cooler allowing basic overclocking.\r\n\r\nName\r\n\r\n	CRYORIG H7\r\n\r\nModel\r\n\r\n	CR-H7A\r\n\r\nCPU Height\r\n\r\n	145 mm\r\n\r\nRadiator/Heatsink Size\r\n\r\n	120 mm\r\n\r\nFans #\r\n\r\n	1\r\n\r\nFan Size\r\n\r\n	120 mm\r\n\r\ndBA\r\n\r\n	10 - 25\r\n\r\nRAM Clearance\r\n\r\n	0 mm\r\n	', '2926c7de92ee.png', 'cooler,cooler,cryorig,h7'),
(55, 6, 3, 'CRYORIG H7 Quad Lumi RGB', 310, 'CAM Powered, efficient and silent air cooler allowing basic overclocking, featuring RGB lighting options.\r\n\r\nName\r\n\r\n	CRYORIG H7 Quad Lumi RGB\r\n\r\nModel\r\n\r\n	CR-H7QLA\r\n\r\nCPU Height\r\n\r\n	145 mm\r\n\r\nRadiator/Heatsink Size\r\n\r\n	120 mm\r\n\r\nFans #\r\n\r\n	1\r\n\r\nFan Size\r\n\r\n	120 mm\r\n\r\ndBA\r\n\r\n	10 - 25\r\n\r\nRAM Clearance\r\n\r\n	0 mm\r\n\r\n', '2926c7de92ee.png', 'h7,cryorig,rgb'),
(56, 6, 4, 'NZXT Kraken X52', 350, 'The X52 features a 240mm radiator and advance controls in an AIO cooler with CAM. Allows for more advanced overclocking and RGB options.\r\n\r\nName\r\n\r\n	NZXT Kraken X52\r\n\r\nModel\r\n\r\n	RL-KRX52-02\r\n\r\nCPU Height\r\n\r\n	53 mm\r\n\r\nRadiator/Heatsink Size\r\n\r\n	240 mm\r\n\r\nFan Size\r\n\r\n	120 mm\r\n\r\ndBA\r\n\r\n	21 - 36\r\n\r\nRAM Clearance\r\n\r\n	35 mm', 'img4.png', 'nzxt,x52'),
(57, 7, 4, 'h500', 250, 'ATX case supporting 1 Kraken, 1-2 HDDs, 3-4 SSDs, tempered glass and 2 120mm fans included.\r\n\r\nName	NZXT H500\r\n\r\nModel	CA-H500B-W1\r\n\r\nDimensions	W: 210mm H: 460mm D: 428mm\r\n\r\nI/O Ports	0 x USB 2.0\r\n		2 x USB 3.0\r\n\r\nHDD Slots	2\r\n\r\nSSD Slots	2\r\n\r\nTotal Fan Support	4 x 120mm	\r\n			3 x 140mm\r\n\r\n', 'img1.jpg', 'H500,h500,nzxt'),
(58, 7, 4, 'h700i', 290, ' Advanced ATX case featuring all steel construction, tempered glass, space for up to 2 HDDs, 5 SSDs and Smart Device for all your RGB and fan controller needs.\r\n\r\nName	NZXT H700i\r\n\r\nModel	CA-H700W-WB\r\n\r\nDimensions	W: 230mm H: 516mm D: 494mm\r\n\r\nI/O Ports	2 x USB 2.0\r\n		2 x USB 3.0\r\n\r\nHDD Slots	2\r\n\r\nSSD Slots	3\r\n\r\nTotal Fan Support	5 x 120mm\r\n			5 x 140mm\r\n\r\n', 'img3.png', 'h700i,case'),
(59, 8, 7, '750W gold', 100, 'This 80+ Gold certified fully modular 750W power supply is rated to achieve 90 % efficiency at 50 % system load.\r\n\r\nName\r\n\r\n	Seasonic Focus Plus 750W Gold\r\n\r\nModel\r\n\r\n	SSR-750FX\r\n\r\nRating\r\n\r\n	80+ Gold\r\n\r\nEfficiency\r\n\r\n	90%\r\n\r\nModular\r\n\r\n	Full', '129eb3c05390.png', 'powersuply,psu,750w'),
(60, 8, 7, '850W', 120, 'This 80+ Gold certified fully modular 850W power supply is rated to achieve 90 % efficiency at 50 % system load.\r\n\r\nName\r\n\r\n	Seasonic Focus Plus 850W Gold\r\n\r\nModel\r\n\r\n	SSR-850FX\r\n\r\nWattage\r\n\r\n	850\r\n\r\nRating\r\n\r\n	80+ Gold\r\n\r\nEfficiency\r\n	\r\n	90%\r\n\r\nModular\r\n\r\n	1\r\n\r\n', '129eb3c05390.png', 'spu,powersuply,850w'),
(61, 8, 7, '1000W', 200, 'This 80+ Platinum certified fully modular 1000W power supply is rated to achieve 92 % efficiency at 50 % system load.\r\n\r\nName\r\n\r\n	Seasonic PRIME Ultra 1000W Platinum\r\n\r\nModel\r\n\r\n	SSR-1000PD\r\n\r\nWattage\r\n\r\n	1000\r\n\r\nRating\r\n\r\n	80+ Platinum\r\n\r\nEfficiency\r\n\r\n	95%\r\n\r\nModular\r\n\r\n	1', '129eb3c05390.png', '1000w,psu,1000W'),
(62, 9, 6, 'MSI Optix MAG24C 24inch 1080p Curved Monitor', 400, 'MSI Optix MAG24C 24inch 1080p Curved Monitor\r\n24 inch curved gaming monitor equipped with the ability to game at 144Hz and 1ms response time with a 1080p VA panel.\r\n\r\nName\r\n\r\nMSI Optix MAG24C 24inch 1080p Curved Monitor\r\n\r\nModel\r\n\r\nOptix MAG24C', '5bc64060a3f90.png', 'msi,monitor,1080p,24inch'),
(63, 9, 6, 'MSI Optix MPG27CQ 27inch 1440p Curved Monito', 450, 'MSI Optix MPG27CQ 27inch 1440p Curved Monitor\r\n27 inch curved gaming monitor equipped with the ability to game at 144Hz and 1ms response time with a 1440p VA panel.\r\n\r\nName\r\n\r\nMSI Optix MPG27CQ 27inch 1440p Curved Monitor\r\n\r\nModel\r\n\r\nOptix MPG27CQ', '5bc63e99ea735.png', 'msi,monitor,1440p,');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
