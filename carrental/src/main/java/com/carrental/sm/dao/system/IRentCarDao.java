package com.carrental.sm.dao.system;

import java.util.List;
import java.util.Map;

import com.carrental.sm.bean.system.RentCar;

/**
 * 预订租用管理
 * 
 * @author 张霄鹏
 */
public interface IRentCarDao {

	/**
	 * 条件查询全部预订租用信息，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @return List<RentCar>
	 * @param params
	 *            :pager,rentCar,order
	 */
	List<RentCar> queryList(Map<String, Object> params);

	/**
	 * 条件查询全部预订租用信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentCar>
	 * @param params
	 *            :pager,rentCar,order<city_asc>
	 */
	List<RentCar> queryEqualsList(Map<String, Object> params);

	/**
	 * 条件查询预订10分钟后还未确认的信息
	 * 
	 * @author 张霄鹏
	 * @return List<RentCar>
	 * @param params
	 *            :pager,rentCar,order
	 */
	List<RentCar> queryUncomfirmList(Map<String, Object> params);

	/**
	 * 条件查询列表数量，字符串类型like匹配
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :rentCar
	 */
	Integer count(Map<String, Object> params);

	/**
	 * 条件查询列表数量
	 * 
	 * @author 张霄鹏
	 * @param params
	 *            :rentCar
	 */
	Integer countEquals(Map<String, Object> params);

	/**
	 * 根据车辆ID查询关联的预订租车数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByCarIds(String carIds);

	/**
	 * 根据司机ID查询关联的预订租车数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByDriverIds(String driverIds);

	/**
	 * 根据活动优惠ID查询关联的预订租车数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByCouponIds(String couponIds);

	/**
	 * 根据租用车型ID查询关联的预订租车数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByRentTypeIds(String rentTypeIds);

	/**
	 * 根据业务ID查询关联的预订数量
	 * 
	 * @author 张霄鹏
	 */
	Integer countByBusinessIds(String businessIds);

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 */
	String add(RentCar rentCar);

	/**
	 * 修改
	 * 
	 * @author 张霄鹏
	 */
	Integer update(RentCar rentCar);

	/**
	 * 部份修改
	 * 
	 * @author 张霄鹏
	 */
	Integer updatePart(RentCar rentCar);

	/**
	 * 取消订单
	 * 
	 * @author 张霄鹏
	 */
	Integer cancelRentCar(String ids);
}
