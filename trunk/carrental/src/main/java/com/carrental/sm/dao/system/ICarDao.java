package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Car;

/**
 * 车辆管理
 * 
 * @author 张霄鹏
 */
public interface ICarDao {

	/**
	 * 条件查询全部车辆信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Car>
	 * @param params
	 *            :pager,car,rentCar(bookPickUpDt,bookGiveBackDt)
	 */
	List<Car> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部车辆信息
	 * 
	 * @author 张霄鹏
	 * @return List<Car>
	 * @param params
	 *            :pager,car
	 */
	List<Car> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :car,rentCar(bookPickUpDt,bookGiveBackDt)
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :car
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 根据车系ID查询未删除的关联车辆数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByCarSeriesIds(String carSeriesIds);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Car car);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Car car);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
