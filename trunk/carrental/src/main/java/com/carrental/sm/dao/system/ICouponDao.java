package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.Coupon;

/**
 * 优惠活动管理
 * 
 * @author 张霄鹏
 */
public interface ICouponDao {

	/**
	 * 条件查询全部优惠活动信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<Coupon>
	 * @param params
	 *            :pager,coupon
	 */
	List<Coupon> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部优惠活动信息
	 * 
	 * @author 张霄鹏
	 * @return List<Coupon>
	 * @param params
	 *            :pager,coupon
	 */
	List<Coupon> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询列表数量，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :coupon
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :coupon
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(Coupon coupon);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(Coupon coupon);

	/**
	 * 删除
	 * 
	 * @author 张霄鹏
	 */
	Integer delete(String ids);

	/**
	 * 为优惠活动增加车系关联
	 * 
	 * @author 张霄鹏
	 */
	String addCarSeriesList(Coupon coupon);

	/**
	 * 删除优惠活动名下车系关联
	 * 
	 * @author 张霄鹏
	 */
	Integer deleteCarSeriesList(String couponIds);
}
