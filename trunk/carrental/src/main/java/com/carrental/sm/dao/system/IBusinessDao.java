package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Business;

/**
 * 业务管理
 * 
 * @author 张霄鹏
 */
public interface IBusinessDao {

	/**
	 * 条件查询全部业务信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Business>
	 * @param params
	 *            :pager,business
	 */
	List<Business> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部业务信息
	 * 
	 * @author 张霄鹏
	 * @return List<Business>
	 * @param params
	 *            :pager,business
	 */
	List<Business> queryEqualsList(Map<String, Object> params);

	/**
	 * 查询最热门租用车型的租用业务
	 * 
	 * @author 张霄鹏
	 * @return List<Business>
	 * @param params
	 *            :pager,business
	 */
	List<Business> queryHotRentList(Map<String, Object> params);

	/**
	 * 条件查询列表数量，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :business
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :business
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Business business);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Business business);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
