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
-- 正在导出表  carrental.t_admin 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` (`id`, `admin_name`, `login_name`, `login_pwd`, `sex`, `email`, `phone`, `address`, `qq`, `company_name`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `type`, `is_delete`, `in_blacklist`, `city_id`, `role_id`) VALUES
	(1, '系统管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'male', '13861613227@163.com', '', NULL, NULL, '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 09:38:25', 'ADMIN', '0', '0', '1', '1'),
	(2, '赫兹租车', 'hezi', 'e10adc3949ba59abbe56e057f20f883e', 'male', '', '', NULL, NULL, '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 20:16:12', 'ADMIN', '0', '0', '2', '3'),
	(3, '得利租车', 'deli', 'e10adc3949ba59abbe56e057f20f883e', 'male', '', '', NULL, NULL, '', '1', '2013-10-30 09:38:21', '1', '2013-10-30 09:38:25', 'ADMIN', '0', '0', '1', '2'),
	(4, '张霄鹏', '13861613227', 'e10adc3949ba59abbe56e057f20f883e', 'male', '13861613227@163.com', '13861613227', NULL, NULL, '', '1', '2013-11-29 20:32:16', '1', '2013-11-29 20:32:16', 'CUSTOM_PERSONAL', '0', '0', NULL, NULL);
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;

-- 正在导出表  carrental.t_business_desc 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `t_business_desc` DISABLE KEYS */;
INSERT INTO `t_business_desc` (`id`, `updated_user`, `updated_dt`, `name`, `content`, `brief`, `image_path`) VALUES
	(1, '1', '2013-12-13 14:30:19', '点到点代驾', '<p>点到点代驾说明</p>\r\n<p>驾龄超过5年的专业司机提供服务。 统一着装：衬衫、西裤、白手套，秋冬季节配深色西装外套。标准普通话，经过培训的统一话术，文明用语。</p>', '点到点代驾说明', 'upload/businessDesc/image/2013-12-13/20131213143019_7482.jpg'),
	(2, '1', '2013-12-13 14:36:41', '机场及车站接送', '<p>机场及车站接送说明</p>', '机场及车站接送说明', 'upload/businessDesc/image/2013-12-13/20131213143019_7483.jpg'),
	(3, '1', '2013-12-13 14:36:45', '市用半日租', '<p>市用半日租说明</p>', '市用半日租说明', 'upload/businessDesc/image/2013-12-13/20131213143019_7484.jpg'),
	(4, '1', '2013-12-13 14:36:50', '市用全日租', '<p>市用全日租说明</p>', '市用全日租说明', 'upload/businessDesc/image/2013-12-13/20131213143342_3457.jpg'),
	(5, '1', '2013-12-13 14:36:54', '会务车辆安排', '<p>会务车辆安排说明</p>', '会务车辆安排说明', 'upload/businessDesc/image/2013-12-13/20131213143342_3458.jpg'),
	(6, '1', '2013-12-13 14:36:59', '周边省市包车', '<p>周边省市包车说明</p>', '周边省市包车说明', 'upload/businessDesc/image/2013-12-13/20131213143342_3459.jpg');
/*!40000 ALTER TABLE `t_business_desc` ENABLE KEYS */;

-- 正在导出表  carrental.t_city 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_city` DISABLE KEYS */;
INSERT INTO `t_city` (`id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`, `city_name`, `city_code`, `multiple`, `is_delete`) VALUES
	(1, '1', '2013-10-30 14:34:41', '1', '2013-10-30 14:34:41', '上海', '32002', 1.00, '0'),
	(2, '1', '2013-10-30 14:35:49', '1', '2013-10-30 14:35:49', '深圳', '320015', 1.10, '0');
/*!40000 ALTER TABLE `t_city` ENABLE KEYS */;

-- 正在导出表  carrental.t_company 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `t_company` DISABLE KEYS */;
INSERT INTO `t_company` (`id`, `name`, `address`, `tel`, `postcode`, `fax`, `content`, `created_user`, `created_dt`, `updated_user`, `updated_dt`) VALUES
	(1, '新广得利租车', '上海市黄浦区陆家浜路721-723号', '0510-8888888', '214000', '0510-8888888', '<p>上海新广得利新广得利租车有限公司成立于二〇〇七年，前身是市属机关三产；是具有上海市经营资质的正规新广得利租车公司。</p>\r\n<p>公司注册以及实到资金均为人民币壹仟萬圆整，且拥有自营品牌汽车4S店多家，企业实力雄厚。</p>\r\n<p>公司营销团队具有丰富的实际经验，能为客户带来愉悦的租车体验。</p>\r\n<p>新广得利致力打造：</p>\r\n<p>★精品带驾服务</p>\r\n<p>★企业菁英自驾长租</p>\r\n<p>★管家式车辆托管</p>', '1', '2013-11-01 11:36:32', '1', '2013-11-12 11:59:20');
/*!40000 ALTER TABLE `t_company` ENABLE KEYS */;

-- 正在导出表  carrental.t_resource 的数据：~34 rows (大约)
/*!40000 ALTER TABLE `t_resource` DISABLE KEYS */;
INSERT INTO `t_resource` (`id`, `name`, `type`, `parent_id`) VALUES
	(1, '用户管理', 'left-1', '0'),
	(2, '城市管理', 'left-1', '0'),
	(3, '注册用户管理', 'left-2', '1'),
	(4, '系统用户管理', 'left-2', '1'),
	(5, '资源配置管理', 'left-2', '1'),
	(6, '角色配置管理', 'left-2', '1'),
	(7, '黑名单管理', 'left-2', '1'),
	(8, '用户密码管理', 'left-2', '1'),
	(9, '企业信息管理', 'left-1', '0'),
	(10, '企业公告管理', 'left-1', '0'),
	(11, '车辆管理', 'left-1', '0'),
	(12, '车系管理', 'left-2', '11'),
	(13, '租用类型管理', 'left-2', '11'),
	(14, '车辆管理', 'left-2', '11'),
	(15, '司机管理', 'left-1', '0'),
	(16, '业务管理', 'left-1', '0'),
	(17, '点到点代驾', 'left-2', '16'),
	(18, '机场及车站接送', 'left-2', '16'),
	(19, '市用半日租', 'left-2', '16'),
	(20, '市用全日租', 'left-2', '16'),
	(21, '会务车辆安排', 'left-2', '16'),
	(22, '周边省市包车', 'left-2', '16'),
	(23, '活动优惠管理', 'left-1', '0'),
	(24, '车辆预订管理', 'left-1', '0'),
	(25, '点到点代驾', 'left-2', '24'),
	(26, '机场及车站接送', 'left-2', '24'),
	(27, '市用半日租', 'left-2', '24'),
	(28, '市用全日租', 'left-2', '24'),
	(29, '会务车辆安排', 'left-2', '24'),
	(30, '周边省市包车', 'left-2', '24'),
	(31, '车辆租用管理', 'left-1', '0'),
	(32, '业务描述管理', 'left-2', '16'),
	(33, 'GPS在线监控', 'left-1', '0'),
	(34, '数据统计汇总', 'left-1', '0');
/*!40000 ALTER TABLE `t_resource` ENABLE KEYS */;

-- 正在导出表  carrental.t_role 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `role_name`, `city_id`, `created_user`, `created_dt`, `updated_user`, `updated_dt`) VALUES
	(1, '系统管理员', '', '1', '2013-10-30 17:02:12', '1', '2013-12-03 14:43:33'),
	(2, '上海业务员', '1', '1', '2013-10-30 17:04:27', '1', '2013-12-03 14:43:40'),
	(3, '深圳业务员', '2', '1', '2013-10-30 19:07:14', '1', '2013-12-03 14:43:50');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- 正在导出表  carrental.t_role_resource 的数据：~91 rows (大约)
/*!40000 ALTER TABLE `t_role_resource` DISABLE KEYS */;
INSERT INTO `t_role_resource` (`role_id`, `resource_id`) VALUES
	('1', '33'),
	('1', '16'),
	('1', '32'),
	('1', '21'),
	('1', '22'),
	('1', '20'),
	('1', '19'),
	('1', '18'),
	('1', '17'),
	('1', '9'),
	('1', '10'),
	('1', '15'),
	('1', '2'),
	('1', '34'),
	('1', '23'),
	('1', '1'),
	('1', '3'),
	('1', '8'),
	('1', '4'),
	('1', '6'),
	('1', '5'),
	('1', '7'),
	('1', '31'),
	('1', '11'),
	('1', '13'),
	('1', '12'),
	('1', '14'),
	('1', '24'),
	('1', '29'),
	('1', '30'),
	('1', '28'),
	('1', '27'),
	('1', '26'),
	('1', '25'),
	('2', '33'),
	('2', '16'),
	('2', '32'),
	('2', '21'),
	('2', '22'),
	('2', '20'),
	('2', '19'),
	('2', '18'),
	('2', '17'),
	('2', '15'),
	('2', '34'),
	('2', '23'),
	('2', '1'),
	('2', '3'),
	('2', '8'),
	('2', '4'),
	('2', '7'),
	('2', '31'),
	('2', '11'),
	('2', '13'),
	('2', '12'),
	('2', '14'),
	('2', '24'),
	('2', '29'),
	('2', '30'),
	('2', '28'),
	('2', '27'),
	('2', '26'),
	('2', '25'),
	('3', '33'),
	('3', '16'),
	('3', '32'),
	('3', '21'),
	('3', '22'),
	('3', '20'),
	('3', '19'),
	('3', '18'),
	('3', '17'),
	('3', '15'),
	('3', '34'),
	('3', '1'),
	('3', '3'),
	('3', '8'),
	('3', '4'),
	('3', '7'),
	('3', '31'),
	('3', '11'),
	('3', '13'),
	('3', '12'),
	('3', '14'),
	('3', '24'),
	('3', '29'),
	('3', '30'),
	('3', '28'),
	('3', '27'),
	('3', '26'),
	('3', '25');
/*!40000 ALTER TABLE `t_role_resource` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
