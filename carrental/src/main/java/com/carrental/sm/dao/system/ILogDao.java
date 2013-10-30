package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Log;

/**
 * 日志管理
 * 
 * @author 张霄鹏
 */
public interface ILogDao {

	/**
	 * 条件查询全部日志信息
	 * 
	 * @author 张霄鹏
	 * @return List<Log>
	 * @param params
	 *            :pager,log
	 */
	List<Log> queryList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :log
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Log log);
}
