package com.carrental.sm.action.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IBusinessDescService;
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.ICouponService;
import com.carrental.sm.service.system.INoticeService;

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

	/**
	 * WEB首页
	 */
	@RequestMapping
	public String toMain(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
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