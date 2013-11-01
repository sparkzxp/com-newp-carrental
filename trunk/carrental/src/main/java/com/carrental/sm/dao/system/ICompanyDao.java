package com.carrental.sm.dao.system;

import java.util.List;

import com.carrental.sm.bean.system.Company;

/**
 * 公司管理
 * 
 * @author 张霄鹏
 */
public interface ICompanyDao {

	/**
	 * 条件查询全部公司信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 */
	List<Company> queryList();

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Company company);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Company company);
}
