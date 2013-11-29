package com.carrental.sm.action.web;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IBusinessService;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.ICouponService;
import com.carrental.sm.service.system.INoticeService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * @author 张霄鹏
 * 
 */
@Controller
@RequestMapping(value = "web/rental")
public class WebRentalAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICityService cityService;
	@Autowired
	private INoticeService noticeService;
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private IRentTypeService rentTypeService;
	@Autowired
	private IBusinessService businessService;
	@Autowired
	private ICouponService couponService;

	/**
	 * 在线预订第一步，选择城市和业务
	 */
	@RequestMapping(value = "/toChooseBusiness")
	public String toChooseBusiness(RentCar rentCar, Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		initChooseBusiness(rentCar, model);
		return "web/rental_chooseBusiness";
	}

	private void initChooseBusiness(RentCar rentCar, Model model) {
		City city = new City();
		city.setIsDelete("0");
		model.addAttribute("citys", this.cityService.queryList(city, null));
		model.addAttribute("rentCar", rentCar);
	}

	/**
	 * 在线预订第二步，选择车系
	 */
	@RequestMapping(value = "/toChooseCar")
	public String toChooseCar(RentCar rentCar, Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		// 保证业务和城市已选择
		if (null == rentCar || null == rentCar.getBusiness() || StringUtils.isEmpty(rentCar.getBusiness().getBusinessType()) || null == rentCar.getCity() || StringUtils.isEmpty(rentCar.getCity().getId())) {
			initChooseBusiness(rentCar, model);
			return "web/rental_chooseBusiness";
		}

		initChooseCar(rentCar, model);
		return "web/rental_chooseCar";
	}

	private void initChooseCar(RentCar rentCar, Model model) {
		City city = this.cityService.queryList(rentCar.getCity(), null).get(0);
		rentCar.setCity(city);
		List<Business> businesses = this.businessService.queryList(rentCar.getBusiness(), null);
		model.addAttribute("businesses", businesses);
		model.addAttribute("rentCar", rentCar);
		model.addAttribute("rentTypes", this.rentTypeService.queryByBusinessType(rentCar.getBusiness().getBusinessType()));

		Coupon coupon = new Coupon();
		coupon.setCouponType(Constants.COUPON_TYPE_DISCOUNT);
		Calendar startDate = Calendar.getInstance();
		startDate.set(Calendar.HOUR_OF_DAY, 0);
		startDate.set(Calendar.MINUTE, 0);
		startDate.set(Calendar.SECOND, 0);
		startDate.set(Calendar.MILLISECOND, 0);
		coupon.setStartDate(new Timestamp(startDate.getTime().getTime()));
		coupon.setEndDate(new Timestamp(startDate.getTime().getTime()));
		model.addAttribute("coupons", this.couponService.queryList(coupon, null));
	}

	/**
	 * 在线预订第三步，填写乘车信息
	 */
	@RequestMapping(value = "/toFillInfo")
	public String toFillInfo(RentCar rentCar, Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		// 保证业务和城市已选择
		if (null == rentCar || null == rentCar.getBusiness() || StringUtils.isEmpty(rentCar.getBusiness().getBusinessType()) || null == rentCar.getCity() || StringUtils.isEmpty(rentCar.getCity().getId())) {
			initChooseBusiness(rentCar, model);
			return "web/rental_chooseBusiness";
		}
		if (null == rentCar.getRentType() || StringUtils.isEmpty(rentCar.getRentType().getId())) {
			initChooseCar(rentCar, model);
			return "web/rental_chooseCar";
		}

		initFillInfo(rentCar, model);

		return "web/rental_fillInfo";
	}

	private void initFillInfo(RentCar rentCar, Model model) {
		Business business = this.businessService.queryList(rentCar.getBusiness(), null).get(0);
		business.setBusinessMore(rentCar.getBusiness().getBusinessMore());
		rentCar.setBusiness(business);

		double discount = 1;
		if (null != rentCar.getCoupon() && StringUtils.isNotEmpty(rentCar.getCoupon().getId())) {
			List<Coupon> coupons = this.couponService.queryList(rentCar.getCoupon(), null);
			if (CollectionUtils.isEmpty(coupons)) {
				rentCar.setCoupon(null);
			} else {
				rentCar.setCoupon(coupons.get(0));
				discount = rentCar.getCoupon().getDiscount() / 10;
			}
		}

		City city = this.cityService.queryList(rentCar.getCity(), null).get(0);
		DecimalFormat df = new DecimalFormat("0");
		rentCar.setRentFee(Integer.parseInt(df.format(business.getRentFee() * city.getMultiple() * discount)));
		rentCar.setExceedHourFee(Integer.parseInt(df.format(business.getExceedHourFee() * city.getMultiple() * discount)));
		rentCar.setExceedKilometerFee(Integer.parseInt(df.format(business.getExceedKilometerFee() * city.getMultiple() * discount)));

		model.addAttribute("rentCar", rentCar);
	}

	/**
	 * 在线预订第四步，确认预订信息
	 */
	@RequestMapping(value = "/toCheckInfo")
	public String toCheckInfo(RentCar rentCar, Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		// 保证业务和城市已选择
		if (null == rentCar || null == rentCar.getBusiness() || StringUtils.isEmpty(rentCar.getBusiness().getBusinessType()) || null == rentCar.getCity() || StringUtils.isEmpty(rentCar.getCity().getId())) {
			initChooseBusiness(rentCar, model);
			return "web/rental_chooseBusiness";
		}
		if (null == rentCar.getRentType() || StringUtils.isEmpty(rentCar.getRentType().getId())) {
			initChooseCar(rentCar, model);
			return "web/rental_chooseCar";
		}

		Admin user = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		if (null == user || StringUtils.isEmpty(user.getId())) {
			initChooseBusiness(rentCar, model);
			return "web/rental_chooseBusiness";
		}

		rentCar.setBookUser(user);
		model.addAttribute("rentCar", rentCar);

		return "web/rental_checkInfo";
	}

	/**
	 * 在线预订第五步，完成预订
	 */
	@RequestMapping(value = "/toCompleteRent")
	public String toCompleteRent(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/rental_completeRent";
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
