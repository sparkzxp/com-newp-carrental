package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Notice;

/**
 * 公告管理
 * 
 * @author 张霄鹏
 */
public interface INoticeDao {

	/**
	 * 条件查询全部公告信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Notice>
	 * @param params
	 *            :pager,notice
	 */
	List<Notice> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部公告信息
	 * 
	 * @author 张霄鹏
	 * @return List<Notice>
	 * @param params
	 *            :pager,notice
	 */
	List<Notice> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :notice
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Notice notice);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Notice notice);

	/**
	 * 删除 - 假删
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
