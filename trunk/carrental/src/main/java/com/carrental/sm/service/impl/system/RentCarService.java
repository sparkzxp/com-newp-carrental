package com.carrental.sm.service.impl.system;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IAdminDao;
import com.carrental.sm.dao.system.IBusinessDao;
import com.carrental.sm.dao.system.ICityDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.service.system.IRentCarService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class RentCarService implements IRentCarService {

	@Autowired
	private IRentCarDao rentCarDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IAdminDao adminDao;
	@Autowired
	private ICityDao cityDao;
	@Autowired
	private IBusinessDao businessDao;

	public List<RentCar> queryList(RentCar rentCar, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rentCar", rentCar);

		if (pager != null) {
			pager.setTotalSize(this.rentCarDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return rentCarDao.queryList(params);
	}

	public Integer count(RentCar rentCar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rentCar", rentCar);
		return this.rentCarDao.count(params);
	}

	public String add(RentCar rentCar, Admin newer, Admin loginUser) {
		// 判断预订人是否新用户
		if (StringUtils.isEmpty(newer.getId())) {
			this.adminDao.add(newer);
		}
		rentCar.setBookUser(newer);

		initFee(rentCar);
		this.rentCarDao.add(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增预订租用信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了预订号为：" + rentCar.getRentNumber() + " 的预订租用信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(RentCar rentCar, Admin newer, Admin loginUser) {
		// 判断预订人是否新用户
		if (StringUtils.isEmpty(newer.getId())) {
			this.adminDao.add(newer);
		}
		rentCar.setBookUser(newer);

		initFee(rentCar);
		this.rentCarDao.update(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改预订租用信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了预订号为：" + rentCar.getRentNumber() + " 的预订租用信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String updatePart(RentCar rentCar, Admin loginUser) {
		this.rentCarDao.updatePart(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改预订租用信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了预订号为：" + rentCar.getRentNumber() + " 的预订租用信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String cancelRentCar(String ids, String names, Admin loginUser) {
		this.rentCarDao.cancelRentCar(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("取消预订租用信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 取消了预订号为：" + names + " 的预订租用信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String confirmRentCar(RentCar rentCar, Admin loginUser) {
		this.rentCarDao.updatePart(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("确认预订信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 确认了预订号为：" + rentCar.getRentNumber() + " 的预订信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String allotRentCar(RentCar rentCar, Admin loginUser) {
		this.rentCarDao.updatePart(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("分配车辆和司机");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 为预订号为：" + rentCar.getRentNumber() + " 的预订信息分配了车辆（" + rentCar.getCar().getPlateNumber() + "）和司机（" + rentCar.getDriver().getDriverName() + "）");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String pickUpRentCar(RentCar rentCar, Admin loginUser) {
		this.rentCarDao.updatePart(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("取车");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 领取了预订号为：" + rentCar.getRentNumber() + " 的预订车辆");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String returnBackRentCar(RentCar rc, Admin loginUser) {
		// 保存还车数据后，清算费用，最后再保存一次清算记录
		RentCar rentCar = new RentCar();
		rentCar.setId(rc.getId());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rentCar", rentCar);
		rentCar = rentCarDao.queryList(params).get(0);
		rentCar.setUpdatedUser(rc.getUpdatedUser());
		rentCar.setRentStatus(rc.getRentStatus());
		rentCar.setGiveBackDt(rc.getGiveBackDt());
		rentCar.setEndMileage(rc.getEndMileage());
		rentCar.setBrokenPart(rc.getBrokenPart());
		rentCar.setBrokenFee(rc.getBrokenFee());
		rentCar.setContent(rc.getContent());

		clearFee(rentCar);
		this.rentCarDao.updatePart(rentCar);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("还车");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 归还了预订号为：" + rentCar.getRentNumber() + " 的车辆");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 初始化费用
	 */
	private void initFee(RentCar rentCar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("city", rentCar.getCity());
		City city = this.cityDao.queryList(params).get(0);
		double multiple = city.getMultiple();

		double discount = 1;
		if (null != rentCar.getCoupon() && StringUtils.isNotEmpty(rentCar.getCoupon().getId()) && Constants.COUPON_TYPE_FREE_KILOMETER.equals(rentCar.getCoupon().getCouponType())) {
			discount = rentCar.getCoupon().getDiscount() / 10;
		}

		params.clear();
		params.put("business", rentCar.getBusiness());
		Business business = this.businessDao.queryList(params).get(0);
		rentCar.setBusiness(business);
		DecimalFormat df = new DecimalFormat("0");
		rentCar.setRentFee(Integer.parseInt(df.format(business.getRentFee() * multiple * discount)));
		rentCar.setExceedHourFee(Integer.parseInt(df.format(business.getExceedHourFee() * multiple * discount)));
		rentCar.setExceedKilometerFee(Integer.parseInt(df.format(business.getExceedKilometerFee() * multiple * discount)));
	}

	/**
	 * 结算费用
	 */
	private void clearFee(RentCar rentCar) {
		// 计算实际开了多少公里
		int distance = (int) (rentCar.getEndMileage() - rentCar.getStartMileage());
		String str = String.valueOf(rentCar.getEndMileage() - rentCar.getStartMileage()).replaceAll("\\d+\\.", "");
		double _d = Double.parseDouble("0." + str + "0") * 1000;
		if (_d >= rentCar.getBusiness().getExceedMeterToKilometer()) {
			distance++;
		}

		// 计算预订开了多少天，多少小时
		long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
		long nh = 1000 * 60 * 60;// 一小时的毫秒数
		long nm = 1000 * 60;// 一分钟的毫秒数
		long diff = rentCar.getBookGiveBackDt().getTime() - rentCar.getBookPickUpDt().getTime();
		int bookDay = (int) (diff / nd);// 计算差多少天
		int bookHour = (int) (diff % nd / nh);// 计算差多少小时
		if (bookHour > 0) {
			bookDay++;
		}

		// 计算实际超出了多少天，多少小时
		diff = rentCar.getGiveBackDt().getTime() - rentCar.getBookGiveBackDt().getTime();
		int day = (int) (diff / nd);
		int hour = (int) (diff % nd / nh);
		int min = (int) (diff % nd % nh / nm);// 计算差多少分钟
		if (min >= rentCar.getBusiness().getExceedMinuteToHour()) {
			hour++;
		}
		hour = hour + (day * 24);

		// 计算预订的基础里程
		int baseDistance = rentCar.getBusiness().getBaseKilometer() * bookDay;
		if (null != rentCar.getCoupon() && StringUtils.isNotEmpty(rentCar.getCoupon().getId())) {
			if (Constants.COUPON_TYPE_FREE_KILOMETER.equals(rentCar.getCoupon().getCouponType())) {
				// 基础里程加上送的公里
				baseDistance += baseDistance / rentCar.getCoupon().getFullKilometer() * rentCar.getCoupon().getFreeKilometer();
			} else if (Constants.COUPON_TYPE_FREE_DAY.equals(rentCar.getCoupon().getCouponType())) {
				// 扣除送的天数
				bookDay -= bookDay / (rentCar.getCoupon().getRentDays() + rentCar.getCoupon().getFreeDays()) * rentCar.getCoupon().getFreeDays();
			}
		}

		// 实际开的里程 - 计算优惠后预订的基础里程 = 实际超公里数
		rentCar.setExceedKilometer(distance - baseDistance);

		// 实际超小时数
		rentCar.setExceedHour(hour);

		// 总计价格为：（每天的租用费用+保险费+油费+代驾费）*天数 + 实际超公里数*超公里费 + 实际超小时数*超小时费 + 破损补偿费用
		int price = bookDay * (rentCar.getRentFee() + rentCar.getBusiness().getInsuranceFee() + rentCar.getBusiness().getFuelFee() + rentCar.getBusiness().getDriverFee()) + rentCar.getExceedKilometer() * rentCar.getExceedKilometerFee() + rentCar.getExceedHour() * rentCar.getExceedHourFee();
		rentCar.setTotalPrice(price);
	}
}
