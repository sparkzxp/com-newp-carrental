package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Driver;

/**
 * 司机管理
 * 
 * @author 张霄鹏
 */
public interface IDriverDao {

	/**
	 * 条件查询全部司机信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Driver>
	 * @param params
	 *            :pager,driver,rentCar
	 */
	List<Driver> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部司机信息
	 * 
	 * @author 张霄鹏
	 * @return List<Driver>
	 * @param params
	 *            :pager,driver
	 */
	List<Driver> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :driver
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Driver driver);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Driver driver);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
