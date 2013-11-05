package com.carrental.sm.service.impl.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.ICouponDao;
import com.carrental.sm.service.system.ICarSeriesService;
import com.carrental.sm.service.system.ICouponService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CouponService implements ICouponService {

	@Autowired
	private ICouponDao couponDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private ICarSeriesService carSeriesService;

	public List<Coupon> queryList(Coupon coupon, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("coupon", coupon);

		if (pager != null) {
			pager.setTotalSize(this.couponDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return couponDao.queryList(params);
	}

	public String add(Coupon coupon, String carSeriesIds, Admin loginUser) {
		if (checkExist(coupon)) {
			return "优惠活动标题已存在";
		}
		this.couponDao.add(coupon);

		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : carSeriesIds.split(",")) {
			CarSeries r = new CarSeries();
			r.setId(s);
			carSeriesList.add(r);
		}
		coupon.setCarSeriesList(carSeriesList);
		this.couponDao.addCarSeriesList(coupon);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增优惠活动信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + coupon.getCouponTitle() + " 的优惠活动信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Coupon coupon, String carSeriesIds, Admin loginUser) {
		if (checkExist(coupon)) {
			return "优惠活动标题已存在";
		}
		this.couponDao.update(coupon);

		this.couponDao.deleteCarSeriesList(coupon.getId());
		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : carSeriesIds.split(",")) {
			CarSeries r = new CarSeries();
			r.setId(s);
			carSeriesList.add(r);
		}
		coupon.setCarSeriesList(carSeriesList);
		this.couponDao.addCarSeriesList(coupon);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改优惠活动信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + coupon.getCouponTitle() + " 的优惠活动信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.couponDao.delete(ids);

		this.couponDao.deleteCarSeriesList(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除优惠活动信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的优惠活动信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证优惠活动标题是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Coupon coupon) {
		Coupon _coupon = new Coupon();
		_coupon.setCouponTitle(coupon.getCouponTitle());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("coupon", _coupon);
		List<Coupon> coupons = this.couponDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(coupons)) {
			return false;
		} else if (StringUtils.isEmpty(coupon.getId())) {
			// add
			if (coupons.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (coupons.size() > 1) {
				return true;
			} else if (coupons.get(0).getId().equals(coupon.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
