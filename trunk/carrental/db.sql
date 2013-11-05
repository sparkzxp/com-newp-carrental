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
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(50) NOT NULL DEFAULT 'CUSTOM',
  `is_delete` varchar(2) NOT NULL DEFAULT '0',
  `in_blacklist` varchar(2) NOT NULL DEFAULT '0',
  `city_id` varchar(2) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_admin 的数据：~8 rows (大约)
DELETE FROM `t_admin`;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` (`id`, `admin_name`, `login_name`, `login_pwd`, `email`, `phone`, `company_name`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `type`, `is_delete`, `in_blacklist`, `city_id`, `role_id`) VALUES
	(1, '系统管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 09:38:25', 'ADMIN', '0', '0', '1', '1'),
	(2, '赫兹租车', 'hezi', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 20:16:12', 'ADMIN', '0', '0', '3', '3'),
	(3, '得利租车', 'deli', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 09:38:25', 'ADMIN', '0', '0', '1', '2'),
	(6, '张XX', 'zhangxx', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 10:41:04', '1', '2013-10-30 16:00:05', 'CUSTOM_PERSONAL', '0', '0', '2', '2'),
	(7, 'ttt', 'tt', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 11:01:04', '1', '2013-10-30 11:29:27', 'CUSTOM_PERSONAL', '1', '0', '1', '2'),
	(8, '123', '333', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 11:02:29', '1', '2013-10-30 11:02:29', 'ADMIN', '0', '0', '1', '2'),
	(9, 'ttt3', 'tt2', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '1', '2013-10-30 11:29:11', '1', '2013-10-30 11:29:11', 'CUSTOM_PERSONAL', '1', '0', '1', '2'),
	(10, 'hezi2', 'hezi2', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '2', '2013-10-30 20:15:00', '2', '2013-10-30 20:15:00', 'CUSTOM_PERSONAL', '0', '1', '3', '');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;


-- 导出  表 carrental.t_business 结构
DROP TABLE IF EXISTS `t_business`;
CREATE TABLE IF NOT EXISTS `t_business` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `business_type` varchar(50) NOT NULL,
  `rent_fee` smallint(6) NOT NULL,
  `insurance_fee` smallint(6) NOT NULL,
  `fuel_fee` smallint(6) NOT NULL,
  `exceed_minute_to_hour` tinyint(4) NOT NULL DEFAULT '20',
  `exceed_hour_fee` smallint(6) NOT NULL,
  `exceed_meter_to_kilometer` smallint(6) NOT NULL DEFAULT '400',
  `exceed_kilometer_fee` smallint(6) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `renttype_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_business 的数据：~2 rows (大约)
DELETE FROM `t_business`;
/*!40000 ALTER TABLE `t_business` DISABLE KEYS */;
INSERT INTO `t_business` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `business_type`, `rent_fee`, `insurance_fee`, `fuel_fee`, `exceed_minute_to_hour`, `exceed_hour_fee`, `exceed_meter_to_kilometer`, `exceed_kilometer_fee`, `content`, `renttype_id`) VALUES
	(1, '1', '2013-11-04 16:23:18', '1', '2013-11-04 16:23:18', '点到点代驾', 600, 10, 20, 20, 150, 400, 10, '', '1'),
	(2, '1', '2013-11-04 16:32:26', '1', '2013-11-04 16:32:26', '点到点代驾', 110, 2, 3, 4, 5, 6, 7, '8', '2');
/*!40000 ALTER TABLE `t_business` ENABLE KEYS */;


-- 导出  表 carrental.t_car 结构
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE IF NOT EXISTS `t_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_car 的数据：~2 rows (大约)
DELETE FROM `t_car`;
/*!40000 ALTER TABLE `t_car` DISABLE KEYS */;
INSERT INTO `t_car` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `plate_number`, `purchaser`, `purchaser_phone`, `purchase_date`, `purchase_price`, `series_id`, `city_id`, `content`) VALUES
	(1, '1', '2013-11-04 14:46:19', '1', '2013-11-04 14:46:19', '沪B25D86', '于果', '138594658', '2013-10-27 00:00:00', 36.20, '2', '3', ''),
	(2, '1', '2013-11-04 14:47:46', '1', '2013-11-04 14:47:46', '沪B25796', '于果', '1385963223', '2013-10-27 00:00:00', 38.22, '3', '1', '');
/*!40000 ALTER TABLE `t_car` ENABLE KEYS */;


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_car_series 的数据：~3 rows (大约)
DELETE FROM `t_car_series`;
/*!40000 ALTER TABLE `t_car_series` DISABLE KEYS */;
INSERT INTO `t_car_series` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `series_name`, `manufacturer`, `manufacturer_logo_path`, `series_img_path`, `style_name`, `level`, `engine`, `gearbox`, `LWH`, `structrue`, `fuel_consumption`, `fuel_capacity`, `trunk_capacity`, `fuel_form`, `ROZ`, `market_date`, `content`) VALUES
	(2, '1', '2013-11-01 23:28:32', '1', '2013-11-03 18:20:11', '宝马7系', '宝马', 'upload/car_series/logo/20131103182011_9051.png', 'upload/car_series/series/20131103182011_6680.jpg', '宝马7系 2013款 740Li 豪华型', '豪华车', '3.0T 320马力 L6', '8挡手自一体', '5223*1902*1498', '4门5座三厢车', 10.9, 80, NULL, '汽油', '97号(京95号)', '2013-01-01 00:00:00', '认证车主平均油耗(L/100km)	\r\n11.8'),
	(3, '1', '2013-11-03 17:55:17', '1', '2013-11-03 18:16:47', '奥迪A6L', '奥迪', 'upload/car_series/logo/20131103175449_7961.png', 'upload/car_series/series/20131103175514_9955.jpg', '奥迪A6L', '中大型车', '2.5L 190马力 V6', 'CVT无级变速(模拟8挡)', '5015*1874*1455', '4门5座三厢车', 7.5, 75, 460, '汽油', '97号(京95号)', '2013-01-01 00:00:00', '认证车主平均油耗(L/100km)\r\n11.1'),
	(4, '1', '2013-11-04 16:18:23', '1', '2013-11-04 16:18:23', '帕萨特', '大众', 'upload/car_series/logo/20131104161823_2730.png', 'upload/car_series/series/20131104161823_4169.jpg', '帕萨特 2005款 1.8T 自动豪华型', '', '1.8T 150马力 L4', '', '', '', NULL, NULL, NULL, '', '', '2013-01-01 00:00:00', '');
/*!40000 ALTER TABLE `t_car_series` ENABLE KEYS */;


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_city 的数据：~3 rows (大约)
DELETE FROM `t_city`;
/*!40000 ALTER TABLE `t_city` DISABLE KEYS */;
INSERT INTO `t_city` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `city_name`, `city_code`, `multiple`) VALUES
	(1, '1', '2013-10-30 14:34:41', '1', '2013-10-30 14:34:41', '上海市', '32002', 1.60),
	(2, '1', '2013-10-30 14:35:49', '1', '2013-10-30 14:35:49', '深圳', '320015', 1.90),
	(3, '1', '2013-10-30 14:36:17', '1', '2013-10-30 14:37:29', '南京', '320007', 0.80);
/*!40000 ALTER TABLE `t_city` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_company 的数据：~1 rows (大约)
DELETE FROM `t_company`;
/*!40000 ALTER TABLE `t_company` DISABLE KEYS */;
INSERT INTO `t_company` (`id`, `name`, `address`, `tel`, `postcode`, `fax`, `content`, `created_user`, `created_dt`, `updated_user`, `updated_dt`) VALUES
	(1, '新广得利租车', '上海', '8888888', '255', '33332', '       这是简介\r\n这也是简介', '1', '2013-11-01 11:36:32', '1', '2013-11-01 11:36:40');
/*!40000 ALTER TABLE `t_company` ENABLE KEYS */;


-- 导出  表 carrental.t_driver 结构
DROP TABLE IF EXISTS `t_driver`;
CREATE TABLE IF NOT EXISTS `t_driver` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `driver_name` varchar(20) NOT NULL,
  `driver_code` varchar(20) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `driver_years` tinyint(4) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` varchar(2000) DEFAULT NULL,
  `is_delete` varchar(2) NOT NULL DEFAULT '0',
  `city_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_driver 的数据：~0 rows (大约)
DELETE FROM `t_driver`;
/*!40000 ALTER TABLE `t_driver` DISABLE KEYS */;
INSERT INTO `t_driver` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `driver_name`, `driver_code`, `sex`, `driver_years`, `entry_date`, `content`, `is_delete`, `city_id`) VALUES
	(1, '1', '2013-11-05 12:18:33', '1', '2013-11-05 12:18:33', '林鑫', 'B05051', '男', 5, '2013-10-28 00:00:00', '', '0', '1'),
	(2, '1', '2013-11-05 12:22:53', '1', '2013-11-05 12:22:53', '罗翔', 'B05052', '女', 4, '2013-10-27 00:00:00', '', '0', '3');
/*!40000 ALTER TABLE `t_driver` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_log 的数据：~61 rows (大约)
DELETE FROM `t_log`;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` (`id`, `created_user`, `created_dt`, `title`, `content`, `level`) VALUES
	(1, '1', '2013-10-30 13:49:58', '删除用户', '用户：系统管理员 于 2013-10-30 13:49:58 删除了名为：ttt 的用户', '5'),
	(2, '1', '2013-10-30 14:34:41', '新增城市信息', '用户：系统管理员 于 2013-10-30 14:34:41 新增了名为：上海市 的城市信息', '5'),
	(3, '1', '2013-10-30 14:35:49', '新增城市信息', '用户：系统管理员 于 2013-10-30 14:35:49 新增了名为：深圳 的城市信息', '5'),
	(4, '1', '2013-10-30 14:36:17', '新增城市信息', '用户：系统管理员 于 2013-10-30 14:36:17 新增了名为：南京 的城市信息', '5'),
	(5, '1', '2013-10-30 14:37:29', '修改城市信息', '用户：系统管理员 于 2013-10-30 14:37:29 修改了名为：南京 的城市信息', '5'),
	(6, '1', '2013-10-30 14:37:41', '新增城市信息', '用户：系统管理员 于 2013-10-30 14:37:41 新增了名为：44 的城市信息', '5'),
	(7, '1', '2013-10-30 14:37:47', '删除城市信息', '用户：系统管理员 于 2013-10-30 14:37:47 删除了名为：44 的城市信息', '5'),
	(8, '1', '2013-10-30 15:18:25', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:18:25 新增了名为：用户管理 的资源信息', '5'),
	(9, '1', '2013-10-30 15:18:38', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:18:38 新增了名为：城市管理 的资源信息', '5'),
	(10, '1', '2013-10-30 15:18:51', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:18:51 新增了名为：注册用户管理 的资源信息', '5'),
	(11, '1', '2013-10-30 15:19:33', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:19:33 新增了名为：系统用户管理 的资源信息', '5'),
	(12, '1', '2013-10-30 15:20:38', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:20:38 新增了名为：资源管理 的资源信息', '5'),
	(13, '1', '2013-10-30 15:22:47', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:22:47 新增了名为：2 的资源信息', '5'),
	(14, '1', '2013-10-30 15:22:54', '新增资源信息', '用户：系统管理员 于 2013-10-30 15:22:54 新增了名为：3 的资源信息', '5'),
	(15, '1', '2013-10-30 15:23:01', '删除资源信息', '用户：系统管理员 于 2013-10-30 15:23:01 删除了名为：2 的资源信息', '5'),
	(16, '1', '2013-10-30 15:58:06', '修改注册用户', '用户：系统管理员 于 2013-10-30 15:58:06 修改了名为：张XX 的注册用户', '5'),
	(17, '1', '2013-10-30 16:00:05', '修改注册用户', '用户：系统管理员 于 2013-10-30 16:00:05 修改了名为：张XX 的注册用户', '5'),
	(18, '1', '2013-10-30 17:02:12', '新增城市信息', '用户：系统管理员 于 2013-10-30 17:02:12 新增了名为：系统管理员 的城市信息', '5'),
	(19, '1', '2013-10-30 17:04:27', '新增城市信息', '用户：系统管理员 于 2013-10-30 17:04:27 新增了名为：上海业务员 的城市信息', '5'),
	(20, '1', '2013-10-30 19:07:14', '新增角色信息', '用户：系统管理员 于 2013-10-30 19:07:14 新增了名为：南京业务员 的角色信息', '5'),
	(21, '1', '2013-10-30 19:13:26', '新增角色信息', '用户：系统管理员 于 2013-10-30 19:13:26 新增了名为：1 的角色信息', '5'),
	(22, '1', '2013-10-30 19:14:35', '新增角色信息', '用户：系统管理员 于 2013-10-30 19:14:35 新增了名为：2 的角色信息', '5'),
	(23, '1', '2013-10-30 19:15:23', '删除角色信息', '用户：系统管理员 于 2013-10-30 19:15:23 删除了名为：1 的角色信息', '5'),
	(24, '1', '2013-10-30 19:15:40', '修改角色信息', '用户：系统管理员 于 2013-10-30 19:15:40 修改了名为：2 的角色信息', '5'),
	(25, '1', '2013-10-30 19:23:01', '删除角色信息', '用户：系统管理员 于 2013-10-30 19:23:01 删除了名为：2 的角色信息', '5'),
	(26, '1', '2013-10-30 19:23:15', '修改角色信息', '用户：系统管理员 于 2013-10-30 19:23:15 修改了名为：系统管理员 的角色信息', '5'),
	(27, '1', '2013-10-30 19:24:40', '修改角色信息', '用户：系统管理员 于 2013-10-30 19:24:40 修改了名为：上海业务员 的角色信息', '5'),
	(28, '1', '2013-10-30 19:39:08', '修改系统用户', '用户：系统管理员 于 2013-10-30 19:39:08 修改了名为：赫兹租车 的系统用户', '5'),
	(29, '1', '2013-10-30 19:43:07', '修改系统用户', '用户：系统管理员 于 2013-10-30 19:43:07 修改了名为：赫兹租车 的系统用户', '5'),
	(30, '1', '2013-10-30 19:54:42', '修改系统用户', '用户：系统管理员 于 2013-10-30 19:54:42 修改了名为：赫兹租车 的系统用户', '5'),
	(31, '2', '2013-10-30 20:15:00', '新增注册用户', '用户：赫兹租车 于 2013-10-30 20:15:00 新增了名为：hezi2 的注册用户', '5'),
	(32, '2', '2013-10-30 20:15:32', '修改系统用户', '用户：赫兹租车 于 2013-10-30 20:15:32 修改了名为：赫兹租车 的系统用户', '5'),
	(33, '1', '2013-10-30 20:16:12', '修改系统用户', '用户：系统管理员 于 2013-10-30 20:16:12 修改了名为：赫兹租车 的系统用户', '5'),
	(34, '1', '2013-10-31 15:25:10', '用户加入黑名单', '用户：系统管理员 于 2013-10-31 15:25:10 将名为：hezi2 的用户加入了黑名单', '5'),
	(35, '1', '2013-10-31 15:39:42', '用户从黑名单删除', '用户：系统管理员 于 2013-10-31 15:39:42 将名为：hezi2 的用户从黑名单中删除', '5'),
	(36, '1', '2013-10-31 15:39:49', '用户加入黑名单', '用户：系统管理员 于 2013-10-31 15:39:49 将名为：hezi2 的用户加入了黑名单', '5'),
	(37, '1', '2013-10-31 17:14:22', '修改用户密码', '用户：系统管理员 于 2013-10-31 17:14:22 修改了名为： 的用户的密码', '5'),
	(38, '1', '2013-10-31 17:14:42', '修改用户密码', '用户：系统管理员 于 2013-10-31 17:14:42 修改了名为：123 的用户的密码', '5'),
	(39, '1', '2013-10-31 17:22:47', '修改用户密码', '用户：系统管理员 于 2013-10-31 17:22:47 修改了名为： 的用户的密码', '5'),
	(40, '1', '2013-11-01 09:57:04', '修改用户密码', '用户：系统管理员 于 2013-11-01 09:57:04 修改了名为：123 的用户的密码', '5'),
	(41, '1', '2013-11-01 09:57:14', '修改用户密码', '用户：系统管理员 于 2013-11-01 09:57:14 修改了名为：undefined 的用户的密码', '5'),
	(42, '1', '2013-11-01 11:36:32', '新增公司信息', '用户：系统管理员 于 2013-11-01 11:36:32 新增了公司信息', '5'),
	(43, '1', '2013-11-01 11:36:40', '修改公司信息', '用户：系统管理员 于 2013-11-01 11:36:40 修改了公司信息', '5'),
	(44, '1', '2013-11-01 22:08:52', '新增字典表信息', '用户：系统管理员 于 2013-11-01 22:08:52 新增了名为：一汽-大众奥迪 的字典表信息', '5'),
	(45, '1', '2013-11-01 22:16:10', '新增字典表信息', '用户：系统管理员 于 2013-11-01 22:16:10 新增了名为：宝马 的字典表信息', '5'),
	(46, '1', '2013-11-01 22:19:46', '新增字典表信息', '用户：系统管理员 于 2013-11-01 22:19:46 新增了名为：奥迪A4L 的字典表信息', '5'),
	(47, '1', '2013-11-01 23:26:41', '新增车型信息', '用户：系统管理员 于 2013-11-01 23:26:41 新增了名为：奥迪A4L 2013款 35 TFSI 自动豪华型 的车型信息', '5'),
	(48, '1', '2013-11-01 23:28:32', '新增车型信息', '用户：系统管理员 于 2013-11-01 23:28:32 新增了名为：奥迪A4L 2013款 30 TFSI 手动舒适型 的车型信息', '5'),
	(49, '1', '2013-11-01 23:30:29', '修改车型信息', '用户：系统管理员 于 2013-11-01 23:30:29 修改了名为：奥迪A4L 2013款 30 TFSI 手动舒适型 的车型信息', '5'),
	(50, '1', '2013-11-03 17:55:21', '新增车系信息', '用户：系统管理员 于 2013-11-03 17:55:21 新增了名为：奥迪A6L 的车系信息', '5'),
	(51, '1', '2013-11-03 18:16:47', '修改车系信息', '用户：系统管理员 于 2013-11-03 18:16:47 修改了名为：奥迪A6L 的车系信息', '5'),
	(52, '1', '2013-11-03 18:20:11', '修改车系信息', '用户：系统管理员 于 2013-11-03 18:20:11 修改了名为：宝马7系 的车系信息', '5'),
	(53, '1', '2013-11-03 18:29:08', '删除车系信息', '用户：系统管理员 于 2013-11-03 18:29:08 删除了名为：奥迪A4L 的车系信息', '5'),
	(54, '1', '2013-11-04 10:56:43', '新增租用类型信息', '用户：系统管理员 于 2013-11-04 10:56:43 新增了名为：豪华车型 的租用类型信息', '5'),
	(55, '1', '2013-11-04 14:46:19', '新增车辆信息', '用户：系统管理员 于 2013-11-04 14:46:19 新增了车牌号码为：沪B25D86 的车辆信息', '5'),
	(56, '1', '2013-11-04 14:47:46', '新增车辆信息', '用户：系统管理员 于 2013-11-04 14:47:46 新增了车牌号码为：沪B25796 的车辆信息', '5'),
	(57, '1', '2013-11-04 16:18:23', '新增车系信息', '用户：系统管理员 于 2013-11-04 16:18:23 新增了名为：帕萨特 的车系信息', '5'),
	(58, '1', '2013-11-04 16:21:50', '新增租用类型信息', '用户：系统管理员 于 2013-11-04 16:21:50 新增了名为：舒适车型 的租用类型信息', '5'),
	(59, '1', '2013-11-04 16:23:03', '修改业务信息', '用户：系统管理员 于 2013-11-04 16:23:03 修改了类型为：点到点代驾 的业务信息', '5'),
	(60, '1', '2013-11-04 16:23:18', '修改业务信息', '用户：系统管理员 于 2013-11-04 16:23:18 修改了类型为：点到点代驾 的业务信息', '5'),
	(61, '1', '2013-11-04 16:32:26', '新增业务信息', '用户：系统管理员 于 2013-11-04 16:32:26 新增了类型为：点到点代驾 的业务信息', '5'),
	(62, '1', '2013-11-05 12:18:33', '新增司机信息', '用户：系统管理员 于 2013-11-05 12:18:33 新增了名为：林鑫 的司机信息', '5'),
	(63, '1', '2013-11-05 12:22:53', '新增司机信息', '用户：系统管理员 于 2013-11-05 12:22:53 新增了名为：罗翔 的司机信息', '5');
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;


-- 导出  表 carrental.t_renttype_carseries 结构
DROP TABLE IF EXISTS `t_renttype_carseries`;
CREATE TABLE IF NOT EXISTS `t_renttype_carseries` (
  `type_id` int(10) NOT NULL,
  `series_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_renttype_carseries 的数据：~3 rows (大约)
DELETE FROM `t_renttype_carseries`;
/*!40000 ALTER TABLE `t_renttype_carseries` DISABLE KEYS */;
INSERT INTO `t_renttype_carseries` (`type_id`, `series_id`) VALUES
	(1, 3),
	(1, 2),
	(2, 4);
/*!40000 ALTER TABLE `t_renttype_carseries` ENABLE KEYS */;


-- 导出  表 carrental.t_rent_type 结构
DROP TABLE IF EXISTS `t_rent_type`;
CREATE TABLE IF NOT EXISTS `t_rent_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_user` varchar(50) NOT NULL,
  `created_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_user` varchar(50) NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type_name` varchar(50) NOT NULL,
  `load_limit` tinyint(4) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_rent_type 的数据：~2 rows (大约)
DELETE FROM `t_rent_type`;
/*!40000 ALTER TABLE `t_rent_type` DISABLE KEYS */;
INSERT INTO `t_rent_type` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `type_name`, `load_limit`, `content`) VALUES
	(1, '1', '2013-11-04 10:56:43', '1', '2013-11-04 10:56:43', '豪华车型', 4, ''),
	(2, '1', '2013-11-04 16:21:50', '1', '2013-11-04 16:21:50', '舒适车型', 4, '');
/*!40000 ALTER TABLE `t_rent_type` ENABLE KEYS */;


-- 导出  表 carrental.t_resource 结构
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE IF NOT EXISTS `t_resource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `parent_id` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_resource 的数据：~5 rows (大约)
DELETE FROM `t_resource`;
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` (`id`, `name`, `type`, `parent_id`) VALUES
	(1, '用户管理', 'left-1', '0'),
	(2, '城市管理', 'left-1', '0'),
	(3, '注册用户管理', 'left-2', '1'),
	(4, '系统用户管理', 'left-2', '1'),
	(5, '资源配置管理', 'left-2', '1');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_role 的数据：~3 rows (大约)
DELETE FROM `t_role`;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `role_name`, `city_id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`) VALUES
	(1, '系统管理员', '', '1', '2013-10-30 17:02:12', '1', '2013-10-30 19:23:15'),
	(2, '上海业务员', '1', '1', '2013-10-30 17:04:27', '1', '2013-10-30 19:24:40'),
	(3, '南京业务员', '3', '1', '2013-10-30 19:07:14', '1', '2013-10-30 19:07:14');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;


-- 导出  表 carrental.t_role_resource 结构
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE IF NOT EXISTS `t_role_resource` (
  `role_id` varchar(50) DEFAULT NULL,
  `resource_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  carrental.t_role_resource 的数据：~10 rows (大约)
DELETE FROM `t_role_resource`;
/*!40000 ALTER TABLE `t_role_resource` DISABLE KEYS */;
INSERT INTO `t_role_resource` (`role_id`, `resource_id`) VALUES
	('3', ''),
	('1', '2'),
	('1', '1'),
	('1', '3'),
	('1', '4'),
	('1', '5'),
	('2', '2'),
	('2', '1'),
	('2', '3'),
	('2', '4');
/*!40000 ALTER TABLE `t_role_resource` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
