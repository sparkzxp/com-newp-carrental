package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Driver;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.bean.Pager;

/**
 * 司机管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IDriverService {

	/**
	 * 查询司机信息
	 */
	List<Driver> queryList(Driver driver, Pager pager);

	/**
	 * 查询司机信息，主要用于查询同城空闲司机信息
	 */
	List<Driver> queryList(Driver driver, RentCar rentCar, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(Driver driver, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String update(Driver driver, Admin loginUser);

	/**
	 * 批量删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String delete(String ids, String names, Admin loginUser);
}
