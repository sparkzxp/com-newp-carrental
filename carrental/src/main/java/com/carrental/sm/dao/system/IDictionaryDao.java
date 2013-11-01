package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Dictionary;

/**
 * 字典表管理
 * 
 * @author 张霄鹏
 */
public interface IDictionaryDao {

	/**
	 * 条件查询全部字典表信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Dictionary>
	 * @param params
	 *            :pager,dict
	 */
	List<Dictionary> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部字典表信息
	 * 
	 * @author 张霄鹏
	 * @return List<Dictionary>
	 * @param params
	 *            :pager,dict
	 */
	List<Dictionary> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :dict
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Dictionary dict);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Dictionary dict);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
