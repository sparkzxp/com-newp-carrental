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

	private void initFee(RentCar rentCar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("city", rentCar.getCity());
		City city = this.cityDao.queryList(params).get(0);
		double multiple = city.getMultiple();

		double discount = 1;
		if (null != rentCar.getCoupon() && StringUtils.isNotEmpty(rentCar.getCoupon().getId()) && "指定车系打折".equals(rentCar.getCoupon().getCouponType())) {
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
}
