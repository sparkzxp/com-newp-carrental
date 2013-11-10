package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.common.bean.Pager;

/**
 * 公告管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface INoticeService {

	/**
	 * 查询公告信息
	 */
	List<Notice> queryList(Notice notice, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String add(Notice notice, Admin loginUser);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String update(Notice notice, Admin loginUser);

	/**
	 * 批量删除
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	String delete(String ids, String names, Admin loginUser);
}
