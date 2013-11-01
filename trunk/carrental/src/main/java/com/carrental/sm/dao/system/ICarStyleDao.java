package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.CarStyle;

/**
 * 车型管理
 * 
 * @author 张霄鹏
 */
public interface ICarStyleDao {

	/**
	 * 条件查询全部车型信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<CarStyle>
	 * @param params
	 *            :pager,carStyle
	 */
	List<CarStyle> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部车型信息
	 * 
	 * @author 张霄鹏
	 * @return List<CarStyle>
	 * @param params
	 *            :pager,carStyle
	 */
	List<CarStyle> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :carStyle
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(CarStyle carStyle);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(CarStyle carStyle);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);
}
