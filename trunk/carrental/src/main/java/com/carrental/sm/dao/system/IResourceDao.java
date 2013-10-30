package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Resource;

/**
 * 资源管理
 * 
 * @author 张霄鹏
 */
public interface IResourceDao {

	/**
	 * 条件查询全部资源信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Resource>
	 * @param params
	 *            :pager,resource
	 */
	List<Resource> queryList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :resource
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Resource resource);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Resource resource);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
