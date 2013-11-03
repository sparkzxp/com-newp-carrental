package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.CarSeries;

/**
 * 车系管理
 * 
 * @author 张霄鹏
 */
public interface ICarSeriesDao {

	/**
	 * 条件查询全部车系信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<CarSeries>
	 * @param params
	 *            :pager,carSeries
	 */
	List<CarSeries> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部车系信息
	 * 
	 * @author 张霄鹏
	 * @return List<CarSeries>
	 * @param params
	 *            :pager,carSeries
	 */
	List<CarSeries> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :carSeries
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(CarSeries carSeries);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(CarSeries carSeries);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
