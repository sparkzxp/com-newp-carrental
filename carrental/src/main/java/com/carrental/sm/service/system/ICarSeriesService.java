package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.common.bean.Pager;

/**
 * 车系管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface ICarSeriesService {

	/**
	 * 查询车系信息
	 */
	List<CarSeries> queryList(CarSeries carSeries, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String add(CarSeries carSeries, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String update(CarSeries carSeries, Admin loginUser);

	/**
	 * 批量删除 - 假删
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String delete(String ids, String names, Admin loginUser);

	/**
	 * 根据租用类型查询车系信息
	 * 
	 * @author 张霄鹏
	 * @return List<CarSeries>
	 */
	List<CarSeries> queryByRentTypeId(String rentTypeId);
}
