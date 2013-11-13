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
	 * 登录名查询用户信息，字符串类型like匹配
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
	List<Admin> queryEqualsList(Map<String, Object> params);

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
	 * 根据城市ID查询未删除的关联用户数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByCityIds(String cityIds);

	/**
	 * 根据角色ID查询未删除的关联用户数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByRoleIds(String roleIds);

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
	 * 部分修改
	 * 
	 * @author 张霄鹏
	 */
	Integer updatePart(Admin admin);

	/**
	 * 批量删除-假删
	 * 
	 * @author 张霄鹏
	 */
	Integer deleteAll(String ids);

	/**
	 * 加入黑名单
	 * 
	 * @author 张霄鹏
	 */
	Integer intoBlacklist(String ids);

	/**
	 * 从黑名单删除
	 * 
	 * @author 张霄鹏
	 */
	Integer outofBlacklist(String ids);

	/**
	 * 批量修改密码
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :password,ids
	 */
	Integer resetPwd(Map<String, Object> params);
}
