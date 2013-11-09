package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.bean.Pager;

/**
 * 角色管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IRoleService {

	/**
	 * 查询角色信息
	 */
	List<Role> queryList(Role role, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String add(Role role, String resourceIds, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String update(Role role, String resourceIds, Admin loginUser);

	/**
	 * 批量删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String delete(String ids, String names, Admin loginUser);
}
