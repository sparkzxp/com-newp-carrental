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
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.ICouponDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.service.system.IRentTypeService;
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
	private IRentTypeService rentTypeService;
	@Autowired
	private IRentCarDao rentCarDao;

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

	public String add(Coupon coupon, String rentTypeIds, Admin loginUser) {
		if (checkExist(coupon)) {
			return "优惠活动标题已存在";
		}
		this.couponDao.add(coupon);

		List<RentType> rentTypes = new ArrayList<RentType>();
		for (String s : rentTypeIds.split(",")) {
			RentType r = new RentType();
			r.setId(s);
			rentTypes.add(r);
		}
		coupon.setRentTypes(rentTypes);
		this.couponDao.addRentTypes(coupon);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增优惠活动信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + coupon.getCouponTitle() + " 的优惠活动信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Coupon coupon, String rentTypeIds, Admin loginUser) {
		if (checkExist(coupon)) {
			return "优惠活动标题已存在";
		}
		this.couponDao.update(coupon);

		this.couponDao.deleteRentTypes(coupon.getId());
		List<RentType> rentTypes = new ArrayList<RentType>();
		for (String s : rentTypeIds.split(",")) {
			RentType r = new RentType();
			r.setId(s);
			rentTypes.add(r);
		}
		coupon.setRentTypes(rentTypes);
		this.couponDao.addRentTypes(coupon);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改优惠活动信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + coupon.getCouponTitle() + " 的优惠活动信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// 验证是否被使用
		if (this.rentCarDao.countByCouponIds(ids) > 0) {
			return "优惠活动已被关联使用，请不要删除";
		}
		this.couponDao.delete(ids);

		this.couponDao.deleteRentTypes(ids);

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
