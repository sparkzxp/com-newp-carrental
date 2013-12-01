package com.carrental.sm.action.web;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IBusinessDescService;
import com.carrental.sm.service.system.IBusinessService;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.ICouponService;
import com.carrental.sm.service.system.INoticeService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * 首页管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping(value = "web")
public class WebMainAction {

	@Autowired
	private INoticeService noticeService;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ICouponService couponService;
	@Autowired
	private IBusinessDescService businessDescService;
	@Autowired
	private IRentTypeService rentTypeService;
	@Autowired
	private IBusinessService businessService;
	@Autowired
	private ICityService cityService;

	/**
	 * WEB首页
	 */
	@RequestMapping
	public String toMain(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);

		Coupon coupon = new Coupon();
		Calendar startDate = Calendar.getInstance();
		startDate.set(Calendar.HOUR_OF_DAY, 0);
		startDate.set(Calendar.MINUTE, 0);
		startDate.set(Calendar.SECOND, 0);
		startDate.set(Calendar.MILLISECOND, 0);
		coupon.setStartDate(new Timestamp(startDate.getTime().getTime()));
		coupon.setEndDate(new Timestamp(startDate.getTime().getTime()));
		model.addAttribute("coupons", this.couponService.queryList(coupon, null));

		// model.addAttribute("rentTypes", this.rentTypeService.queryList(null, null));

		Business business = new Business();
		business.setBusinessType(Constants.BUSINESS_TYPE_POINT_TO_POINT);
		model.addAttribute("businesses", this.businessService.queryList(business, null));

		Pager _pager = new Pager();
		_pager.setPageSize(4);
		model.addAttribute("hotBusinesses", this.businessService.queryHotRentList(business, _pager));

		return "web/main";
	}

	/**
	 * 公司简介
	 */
	@RequestMapping(value = "/toCompany")
	public String toCompany(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/company";
	}

	/**
	 * 业务介绍列表
	 */
	@RequestMapping(value = "/toBusinessList")
	public String toBusinessList(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/businessList";
	}

	/**
	 * 业务介绍详细页面
	 */
	@RequestMapping(value = "/toBusinessDetail")
	public String toBusinessDetail(Model model, BusinessDesc businessDesc, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		model.addAttribute("businessDesc", this.businessDescService.queryEqualsList(businessDesc).get(0));
		return "web/businessDetail";
	}

	/**
	 * 公告列表页面
	 */
	@RequestMapping(value = "/toNoticeList")
	public String toNoticeList(Model model, Pager pager, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		model.addAttribute("noticeList", this.noticeService.queryList(null, pager));
		model.addAttribute("pager", pager);
		return "web/noticeList";
	}

	/**
	 * 公告详细页面
	 */
	@RequestMapping(value = "/toNoticeDetail")
	public String toNoticeDetail(Model model, Notice notice, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		model.addAttribute("notice", this.noticeService.queryList(notice, null).get(0));
		return "web/noticeDetail";
	}

	/**
	 * 优惠活动列表页面
	 */
	@RequestMapping(value = "/toCouponList")
	public String toCouponList(Model model, Pager pager, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		model.addAttribute("couponList", this.couponService.queryList(null, pager));
		model.addAttribute("pager", pager);
		return "web/couponList";
	}

	/**
	 * 优惠活动详细页面
	 */
	@RequestMapping(value = "/toCouponDetail")
	public String toCouponDetail(Model model, Coupon coupon, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		model.addAttribute("coupon", this.couponService.queryList(coupon, null).get(0));
		return "web/couponDetail";
	}

	/**
	 * 车型与租金介绍页面
	 */
	@RequestMapping(value = "/toRentTypeAndBusiness")
	public String toRentTypeAndBusiness(Model model, String cityId, Business business, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);

		City city = new City();
		city.setIsDelete("0");
		List<City> citys = this.cityService.queryList(city, null);
		model.addAttribute("citys", citys);

		if (StringUtils.isEmpty(cityId)) {
			city = citys.get(0);
		} else {
			city.setId(cityId);
			city = this.cityService.queryList(city, null).get(0);
		}
		model.addAttribute("city", city);

		if (null == business || StringUtils.isEmpty(business.getBusinessType())) {
			business = new Business();
			business.setBusinessType(Constants.BUSINESS_TYPE_POINT_TO_POINT);
		}
		model.addAttribute("business", business);
		model.addAttribute("rentTypes", this.rentTypeService.queryByBusinessType(business.getBusinessType()));

		model.addAttribute("businesses", this.businessService.queryList(business, null));
		BusinessDesc _businessDesc = new BusinessDesc();
		_businessDesc.setName(business.getBusinessType());
		model.addAttribute("businessDesc", this.businessDescService.queryEqualsList(_businessDesc).get(0));

		return "web/rentTypeAndBusiness";
	}

	private void initTop(Model model, HttpServletRequest request) {
		Admin user = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		model.addAttribute("user", user);

		Pager pager = new Pager();
		pager.setPageSize(5);
		model.addAttribute("notices", this.noticeService.queryList(null, pager));
	}

	private void initBottom(Model model) {
		model.addAttribute("company", this.companyService.queryList().get(0));
	}
}
