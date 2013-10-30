package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Admin;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
public interface IAdminDao {

	/**
	 * 登录名查询用户信息
	 * 
	 * @author 张霄鹏
	 * @return List<Admin>
	 * @param params
	 *            :admin
	 */
	List<Admin> queryByLoginName(Map<String, Object> params);

	/**
	 * 条件查询全部用户信息
	 * 
	 * @author 张霄鹏
	 * @return List<Admin>
	 * @param params
	 *            :pager,admin
	 */
	List<Admin> queryList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :admin
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Admin admin);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Admin admin);

	/**
	 * 批量删除-假删
	 * 
	 * @author 张霄鹏
	 */
	Integer deleteAll(String ids);
}
