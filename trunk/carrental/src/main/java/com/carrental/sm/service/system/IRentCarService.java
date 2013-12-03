package com.carrental.sm.service.system;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.MessageException;
import com.carrental.sm.common.bean.Pager;

/**
 * 预订租用管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IRentCarService {

	/**
	 * 查询预订租用信息
	 */
	List<RentCar> queryList(RentCar rentCar, Pager pager);

	/**
	 * 查询预订租用信息
	 * 
	 * @param order
	 *            :city_asc
	 */
	List<RentCar> queryList(RentCar rentCar, Pager pager, String order);

	/**
	 * 查询预订10分钟后还未确认的信息
	 */
	List<RentCar> queryUncomfirmList(RentCar rentCar);

	/**
	 * 按月统计租车数据
	 * 
	 * @author 张霄鹏
	 * @param cityId 
	 * @return List<Map<String, Object>>:rentNum,cancelNum,totalPrice,dt,cityName
	 */
	List<Map<String, Object>> statRentList(Timestamp statStartDate, Timestamp statEndDate, String cityId);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 */
	Integer count(RentCar rentCar);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 * @throws MessageException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(RentCar rentCar, Admin newer, Admin loginUser) throws MessageException;

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String update(RentCar rentCar, Admin newer, Admin loginUser);

	/**
	 * 部分修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String updatePart(RentCar rentCar, Admin loginUser);

	/**
	 * 取消订单
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String cancelRentCar(String ids, String names, Admin loginUser);

	/**
	 * 确认订单，会发送短信
	 * 
	 * @author 张霄鹏
	 * @throws MessageException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String confirmRentCar(RentCar rentCar, Admin _admin) throws MessageException;

	/**
	 * 为预订分配车辆和司机
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String allotRentCar(RentCar rentCar, Admin _admin);

	/**
	 * 取车
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String pickUpRentCar(RentCar rentCar, Admin _admin);

	/**
	 * 还车
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String returnBackRentCar(RentCar rentCar, Admin _admin);
}
