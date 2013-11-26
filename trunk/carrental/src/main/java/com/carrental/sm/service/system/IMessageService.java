package com.carrental.sm.service.system;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Message;
import com.carrental.sm.common.bean.Pager;

/**
 * 短信管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface IMessageService {

	/**
	 * 查询短信信息
	 */
	List<Message> queryList(Message message, Pager pager);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(Message message);
}
