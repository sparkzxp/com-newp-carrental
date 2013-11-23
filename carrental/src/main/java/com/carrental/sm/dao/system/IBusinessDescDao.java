package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.BusinessDesc;

/**
 * 业务描述管理
 * 
 * @author 张霄鹏
 */
public interface IBusinessDescDao {

	/**
	 * 条件查询全部业务描述信息
	 * 
	 * @author 张霄鹏
	 * @return List<BusinessDesc>
	 * @param params
	 *            :businessDesc
	 */
	List<BusinessDesc> queryEqualsList(Map<String, Object> params);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(BusinessDesc businessDesc);
}
