package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.City;

/**
 * 城市管理
 * 
 * @author 张霄鹏
 */
public interface ICityDao {

	/**
	 * 条件查询全部城市信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<City>
	 * @param params
	 *            :pager,city
	 */
	List<City> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部城市信息
	 * 
	 * @author 张霄鹏
	 * @return List<City>
	 * @param params
	 *            :pager,city
	 */
	List<City> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :city
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :city
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(City city);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(City city);

	/**
	 * 删除 - 假删
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
