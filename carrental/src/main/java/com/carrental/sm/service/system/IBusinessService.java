package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.common.bean.Pager;

/**
 * 业务管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IBusinessService {

	/**
	 * 查询业务信息
	 */
	List<Business> queryList(Business business, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String add(Business business, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String update(Business business, Admin loginUser);

	/**
	 * 批量删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String delete(String ids, String names, Admin loginUser);
}
