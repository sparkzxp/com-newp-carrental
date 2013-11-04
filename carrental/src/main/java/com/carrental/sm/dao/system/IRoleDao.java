package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Role;

/**
 * 角色管理
 * 
 * @author 张霄鹏
 */
public interface IRoleDao {

	/**
	 * 条件查询全部角色信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Role>
	 * @param params
	 *            :pager,role
	 */
	List<Role> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部角色信息
	 * 
	 * @author 张霄鹏
	 * @return List<Role>
	 * @param params
	 *            :pager,role
	 */
	List<Role> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :role
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Role role);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Role role);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);

	/**
	 * 为角色增加资源关联
	 * 
	 * @author 张霄鹏
	 */
	String addResources(Role role);

	/**
	 * 删除角色名下资源关联
	 * 
	 * @author 张霄鹏
	 */
	Integer deleteResources(String roleIds);
}
