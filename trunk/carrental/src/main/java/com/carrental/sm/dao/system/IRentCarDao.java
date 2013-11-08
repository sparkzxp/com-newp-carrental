package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.RentCar;

/**
 * 预订租用管理
 * 
 * @author 张霄鹏
 */
public interface IRentCarDao {

	/**
	 * 条件查询全部预订租用信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<RentCar>
	 * @param params
	 *            :pager,rentCar
	 */
	List<RentCar> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部预订租用信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentCar>
	 * @param params
	 *            :pager,rentCar
	 */
	List<RentCar> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :rentCar
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(RentCar rentCar);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(RentCar rentCar);

	/**
	 * 部份修改
	 * 
	 * @author 张霄鹏
	 */
	Integer updatePart(RentCar rentCar);

	/**
	 * 取消订单
	 * 
	 * @author 张霄鹏
	 */
	Integer cancelRentCar(String ids);
}
