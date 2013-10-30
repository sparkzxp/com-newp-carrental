package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.bean.Pager;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IAdminService {

	/**
	 * 登录名查询用户信息
	 * 
	 * @author 张霄鹏
	 */
	List<Admin> queryByLoginName(Admin admin);

	/**
	 * 查询用户信息
	 */
	List<Admin> queryList(Admin admin, Pager pager);

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
	String update(Admin admin);

	/**
	 * 批量删除-假删
	 * 
	 * @author 张霄鹏
	 */
	String delete(String ids, String names);
}
