package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Message;

/**
 * 短信管理
 * 
 * @author 张霄鹏
 */
public interface IMessageDao {

	/**
	 * 条件查询全部短信信息
	 * 
	 * @author 张霄鹏
	 * @return List<Message>
	 * @param params
	 *            :pager,message
	 */
	List<Message> queryList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :message
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Message message);
}
