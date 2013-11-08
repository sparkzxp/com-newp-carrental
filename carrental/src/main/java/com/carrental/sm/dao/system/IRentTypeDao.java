package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.RentType;

/**
 * 租用类型管理
 * 
 * @author 张霄鹏
 */
public interface IRentTypeDao {

	/**
	 * 条件查询全部租用类型信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<RentType>
	 * @param params
	 *            :pager,rentType
	 */
	List<RentType> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部租用类型信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentType>
	 * @param params
	 *            :pager,rentType
	 */
	List<RentType> queryEqualsList(Map<String, Object> params);

	/**
	 * 根据多个车系ID查询车系信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentType>
	 */
	List<RentType> queryByCarSeriesIds(String ids);

	/**
	 * 根据业务类型查询租用类型信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentType>
	 */
	List<RentType> queryByBusinessType(String businessType);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :rentType
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(RentType rentType);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(RentType rentType);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);

	/**
	 * 为租用类型增加车系关联
	 * 
	 * @author 张霄鹏
	 */
	String addCarSeriesList(RentType rentType);

	/**
	 * 删除租用类型名下车系关联
	 * 
	 * @author 张霄鹏
	 */
	Integer deleteCarSeriesList(String rentTypeIds);
}
