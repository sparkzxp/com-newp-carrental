package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.RentCar;
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
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 */
	Integer count(RentCar rentCar);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String add(RentCar rentCar, Admin newer, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String update(RentCar rentCar, Admin newer, Admin loginUser);

	/**
	 * 部分修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String updatePart(RentCar rentCar, Admin loginUser);

	/**
	 * 取消订单
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String cancelRentCar(String ids, String names, Admin loginUser);

	/**
	 * 确认订单
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String confirmRentCar(RentCar rentCar, Admin _admin);

	/**
	 * 为预订分配车辆和司机
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String allotRentCar(RentCar rentCar, Admin _admin);

	/**
	 * 取车
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String pickUpRentCar(RentCar rentCar, Admin _admin);
}
