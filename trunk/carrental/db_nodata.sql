-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.29 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 carrental.t_admin 结构
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE IF NOT EXISTS `t_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `login_name` varchar(50) NOT NULL,
  `login_pwd` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL DEFAULT 'male',
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(50) NOT NULL DEFAULT 'CUSTOM_PERSONAL',
  `is_delete` varchar(2) NOT NULL DEFAULT '0',
  `in_blacklist` varchar(2) NOT NULL DEFAULT '0',
  `city_id` varchar(2) DEFAULT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_business 结构
DROP TABLE IF EXISTS `t_business`;
CREATE TABLE IF NOT EXISTS `t_business` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `business_type` varchar(50) NOT NULL,
  `rent_fee` smallint(6) NOT NULL,
  `insurance_fee` smallint(6) NOT NULL,
  `fuel_fee` smallint(6) NOT NULL,
  `driver_fee` smallint(6) NOT NULL,
  `exceed_minute_to_hour` tinyint(4) NOT NULL DEFAULT '20',
  `exceed_hour_fee` smallint(6) NOT NULL,
  `exceed_meter_to_kilometer` smallint(6) NOT NULL DEFAULT '400',
  `exceed_kilometer_fee` smallint(6) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `renttype_id` varchar(50) NOT NULL,
  `base_hour` smallint(6) NOT NULL,
  `base_kilometer` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_business_desc 结构
DROP TABLE IF EXISTS `t_business_desc`;
CREATE TABLE IF NOT EXISTS `t_business_desc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(50) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `brief` varchar(140) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_captcha 结构
DROP TABLE IF EXISTS `t_captcha`;
CREATE TABLE IF NOT EXISTS `t_captcha` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `captcha` varchar(10) NOT NULL,
  `used_for` varchar(50) NOT NULL,
  `is_used` varchar(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_car 结构
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE IF NOT EXISTS `t_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `plate_number` varchar(50) NOT NULL,
  `purchaser` varchar(50) NOT NULL,
  `purchaser_phone` varchar(50) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `purchase_price` decimal(10,2) NOT NULL,
  `series_id` varchar(50) NOT NULL,
  `city_id` varchar(50) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_car_series 结构
DROP TABLE IF EXISTS `t_car_series`;
CREATE TABLE IF NOT EXISTS `t_car_series` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `series_name` varchar(50) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `manufacturer_logo_path` varchar(200) NOT NULL,
  `series_img_path` varchar(200) NOT NULL,
  `style_name` varchar(100) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `engine` varchar(50) NOT NULL,
  `gearbox` varchar(50) DEFAULT NULL,
  `LWH` varchar(50) DEFAULT NULL,
  `structrue` varchar(50) DEFAULT NULL,
  `fuel_consumption` decimal(10,1) DEFAULT NULL,
  `fuel_capacity` smallint(6) DEFAULT NULL,
  `trunk_capacity` smallint(6) DEFAULT NULL,
  `fuel_form` varchar(50) DEFAULT NULL,
  `ROZ` varchar(50) DEFAULT NULL,
  `market_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `content` varchar(2000) DEFAULT NULL,
  `is_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_city 结构
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE IF NOT EXISTS `t_city` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `city_name` varchar(50) NOT NULL,
  `city_code` varchar(50) NOT NULL,
  `multiple` decimal(10,2) NOT NULL DEFAULT '1.00',
  `is_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_company 结构
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE IF NOT EXISTS `t_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_coupon 结构
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE IF NOT EXISTS `t_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `coupon_title` varchar(100) NOT NULL,
  `coupon_type` varchar(20) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `full_kilometer` smallint(6) DEFAULT NULL,
  `free_kilometer` smallint(6) DEFAULT NULL,
  `rent_hours` smallint(6) DEFAULT NULL,
  `free_hours` smallint(6) DEFAULT NULL,
  `discount` decimal(10,1) DEFAULT NULL,
  `content` varchar(5000) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_coupon_renttype 结构
DROP TABLE IF EXISTS `t_coupon_renttype`;
CREATE TABLE IF NOT EXISTS `t_coupon_renttype` (
  `coupon_id` varchar(50) NOT NULL,
  `renttype_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_driver 结构
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE IF NOT EXISTS `t_driver` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `driver_name` varchar(20) NOT NULL,
  `driver_code` varchar(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `driver_years` tinyint(4) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` varchar(2000) DEFAULT NULL,
  `city_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_log 结构
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE IF NOT EXISTS `t_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `level` varchar(2) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_message 结构
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE IF NOT EXISTS `t_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `receive_no` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_notice 结构
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE IF NOT EXISTS `t_notice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(200) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_renttype_carseries 结构
DROP TABLE IF EXISTS `t_renttype_carseries`;
CREATE TABLE IF NOT EXISTS `t_renttype_carseries` (
  `type_id` int(10) NOT NULL,
  `series_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_rent_car 结构
DROP TABLE IF EXISTS `t_rent_car`;
CREATE TABLE IF NOT EXISTS `t_rent_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rent_number` varchar(50) NOT NULL,
  `rent_status` varchar(10) NOT NULL,
  `rent_way` varchar(20) NOT NULL,
  `customer` varchar(20) NOT NULL,
  `customer_company` varchar(200) DEFAULT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `book_pick_up_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `book_pick_up_address` varchar(200) NOT NULL,
  `arrive_flight_no` varchar(50) DEFAULT NULL,
  `arrive_flight_dt` timestamp NULL DEFAULT NULL,
  `take_off_flight_no` varchar(50) DEFAULT NULL,
  `take_of_flight_dt` timestamp NULL DEFAULT NULL,
  `passenger_no` tinyint(4) NOT NULL,
  `pick_up_dt` timestamp NULL DEFAULT NULL,
  `start_mileage` decimal(10,1) DEFAULT NULL,
  `book_give_back_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `book_give_back_address` varchar(200) NOT NULL,
  `give_back_dt` timestamp NULL DEFAULT NULL,
  `end_mileage` decimal(10,1) DEFAULT NULL,
  `rent_fee` smallint(6) NOT NULL,
  `exceed_kilometer` smallint(6) DEFAULT NULL,
  `exceed_kilometer_fee` smallint(6) NOT NULL,
  `exceed_hour` smallint(6) DEFAULT NULL,
  `exceed_hour_fee` smallint(6) NOT NULL,
  `total_price` mediumint(9) DEFAULT NULL,
  `rent_type_id` varchar(50) NOT NULL,
  `car_series_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(50) NOT NULL,
  `car_id` varchar(50) DEFAULT NULL,
  `driver_id` varchar(50) DEFAULT NULL,
  `book_user_id` varchar(50) NOT NULL,
  `business_id` varchar(50) NOT NULL,
  `coupon_id` varchar(50) DEFAULT NULL,
  `agent_id` varchar(50) DEFAULT NULL,
  `broken_part` varchar(200) DEFAULT NULL,
  `broken_fee` mediumint(9) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_rent_type 结构
DROP TABLE IF EXISTS `t_rent_type`;
CREATE TABLE IF NOT EXISTS `t_rent_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type_name` varchar(50) NOT NULL,
  `load_limit` tinyint(4) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `image_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_resource 结构
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE IF NOT EXISTS `t_resource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_role 结构
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `city_id` varchar(50) NOT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 carrental.t_role_resource 结构
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE IF NOT EXISTS `t_role_resource` (
  `role_id` varchar(50) DEFAULT NULL,
  `resource_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
