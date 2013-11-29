package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.MD5;
import com.carrental.sm.common.MessageException;
import com.carrental.sm.common.RentCarUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IAdminService;
import com.carrental.sm.service.system.IBusinessService;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.ICouponService;
import com.carrental.sm.service.system.IRentCarService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * 预订租用管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("rentCar")
public class RentCarAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private IRentCarService rentCarService;
	@Autowired
	private ICityService cityService;
	@Autowired
	private IRentTypeService rentTypeService;
	@Autowired
	private ICouponService couponService;
	@Autowired
	private IAdminService adminService;
	@Autowired
	private IBusinessService businessService;

	// -----------------------------------车辆预订管理 start---------------------------------------
	@RequestMapping(value = "/showBookCarList")
	public String bookCarList(RentCar rentCar, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != role) {
			rentCar.setCity(role.getCity());
		}
		List<RentCar> rentCars = this.rentCarService.queryList(rentCar, pager);
		model.addAttribute("rentCar", rentCar);
		model.addAttribute("rentCars", rentCars);
		return "admin/bookCarList";
	}

	@RequestMapping(value = "/toBookCarEdit")
	public String toBookCarEdit(RentCar rentCar, Model model, HttpServletRequest request) {
		if (StringUtils.isNotEmpty(rentCar.getId())) {
			rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		}
		model.addAttribute("rentCar", rentCar);

		Role _role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != _role) {
			model.addAttribute("citys", this.cityService.queryList(_role.getCity(), null));
		} else {
			City _city = new City();
			_city.setIsDelete("0");
			model.addAttribute("citys", this.cityService.queryList(_city, null));
		}

		model.addAttribute("rentTypes", this.rentTypeService.queryByBusinessType(rentCar.getBusiness().getBusinessType()));

		Coupon coupon = new Coupon();
		Calendar startDate = Calendar.getInstance();
		startDate.set(Calendar.HOUR_OF_DAY, 0);
		startDate.set(Calendar.MINUTE, 0);
		startDate.set(Calendar.SECOND, 0);
		startDate.set(Calendar.MILLISECOND, 0);
		coupon.setStartDate(new Timestamp(startDate.getTime().getTime()));
		coupon.setEndDate(new Timestamp(startDate.getTime().getTime()));
		model.addAttribute("coupons", this.couponService.queryList(coupon, null));
		return "admin/bookCarEdit";
	}

	/**
	 * 后台新增/修改预订信息，WEB在线预订
	 * 
	 * @param bookUserType
	 *            :0-注册用户.1-新用户
	 */
	@ResponseBody
	@RequestMapping(value = "/doBookCarEdit", method = RequestMethod.POST)
	public Map<String, String> doBookCarEdit(RentCar rentCar, String bookUserType, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		if (null == _admin || StringUtils.isEmpty(_admin.getId())) {
			_admin = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		}
		rentCar.setUpdatedUser(_admin);

		// 选取车系不是选择活动中指定的打折车系
		if (null != rentCar.getCoupon() && StringUtils.isNotEmpty(rentCar.getCoupon().getId())) {
			Coupon coupon = this.couponService.queryList(rentCar.getCoupon(), null).get(0);
			rentCar.setCoupon(coupon);
			if ("指定车型打折".equals(rentCar.getCoupon().getCouponType())) {
				boolean flag = true;
				for (RentType rt : rentCar.getCoupon().getRentTypes()) {
					if (rt.getId().equals(rentCar.getRentType().getId())) {
						flag = false;
					}
				}
				if (flag) {
					result.put("result", "您选取的车型不是选择的优惠活动中指定的打折车型");
					return result;
				}
			}
		}

		// 根据业务类型和租用类型查询业务ID
		Business business = rentCar.getBusiness();
		business.setRentType(rentCar.getRentType());
		business = this.businessService.queryList(business, null).get(0);
		rentCar.setBusiness(business);

		// 是否新用户
		Admin _newer = new Admin();
		if (bookUserType.equals("1")) {
			// 新用户是否是黑名单
			_newer.setPhone(rentCar.getBookUser().getPhone());
			_newer.setIsDelete("0");
			List<Admin> list = this.adminService.queryEqualsList(_newer, null);
			if (CollectionUtils.isNotEmpty(list)) {
				if (list.get(0).getInBlacklist().equals("1")) {
					result.put("result", "该预订用户手机号已列入黑名单，如需预订，请先移出黑名单列表");
				} else {
					result.put("result", "该预订用户手机号已注册过，请查询注册用户");
				}
				return result;
			}

			_newer.setPhone(null);
			_newer.setEmail(rentCar.getBookUser().getEmail());
			list = this.adminService.queryEqualsList(_newer, null);
			if (CollectionUtils.isNotEmpty(list)) {
				result.put("result", "该预订用户邮箱号已注册过，请查询注册用户");
				return result;
			}

			_newer.setPhone(rentCar.getBookUser().getPhone());
			_newer.setCity(rentCar.getCity());
			_newer.setInBlacklist("0");
			_newer.setAdminName(rentCar.getBookUser().getAdminName());
			// 新用户登录账号为手机号，密码为123456
			_newer.setLoginName(_newer.getPhone());
			_newer.setPassword(MD5.MD5_32(Constants.DEFAULT_PASSWORD));
			if (StringUtils.isNotEmpty(rentCar.getBookUser().getCompanyName())) {
				// 有公司名的是企业用户
				_newer.setCompanyName(rentCar.getBookUser().getCompanyName());
				_newer.setType(Constants.USER_CUSTOM_COMPANY);
			} else {
				_newer.setType(Constants.USER_CUSTOM_PERSONAL);
			}
			_newer.setCreatedUser(_admin);
			_newer.setUpdatedUser(_admin);
		} else {
			_newer = rentCar.getBookUser();
		}

		rentCar.setAgent(_admin);
		// rentCar.setRentStatus(Constants.RENT_STATUS_BOOK_EFFECT);

		if (StringUtils.isNotEmpty(rentCar.getId())) {
			// update
			result.put("result", this.rentCarService.update(rentCar, _newer, _admin));
		} else {
			// add
			RentCar _r = new RentCar();
			_r.setCreatedDt(new Timestamp(new Date().getTime()));
			rentCar.setRentNumber(RentCarUtil.newRentNumber(this.rentCarService.count(_r)));
			rentCar.setCreatedUser(_admin);
			try {
				result.put("result", this.rentCarService.add(rentCar, _newer, _admin));
			} catch (MessageException e) {
				result.put("result", e.getMessage());
			}
		}
		result.put("id", rentCar.getId());
		return result;
	}

	@RequestMapping(value = "/toBookCarDetail")
	public String toBookCarDetail(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		return "admin/bookCarDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentCarCancel")
	public Map<String, String> doRentCarCancel(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.rentCarService.cancelRentCar(ids, names, _admin));
		return result;
	}

	@RequestMapping(value = "/toBookCarConfirm")
	public String toBookCarConfirm(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		return "admin/bookCarConfirm";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentCarConfirm")
	public Map<String, String> doRentCarConfirm(RentCar rentCar, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		rentCar.setUpdatedUser(_admin);
		rentCar.setRentStatus(Constants.RENT_STATUS_BOOK_EFFECT);
		try {
			result.put("result", this.rentCarService.confirmRentCar(rentCar, _admin));
		} catch (MessageException e) {
			result.put("result", e.getMessage());
		}

		return result;
	}

	// -----------------------------------车辆预订管理 end---------------------------------------

	// -----------------------------------车辆租用管理 end---------------------------------------
	@RequestMapping(value = "/showRentCarList")
	public String rentCarList(RentCar rentCar, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != role) {
			rentCar.setCity(role.getCity());
		}
		List<RentCar> rentCars = this.rentCarService.queryList(rentCar, pager);
		model.addAttribute("rentCar", rentCar);
		model.addAttribute("rentCars", rentCars);
		return "admin/rentCarList";
	}

	@RequestMapping(value = "/toCarAndDriverAllot")
	public String toCarAndDriverAllot(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		model.addAttribute("carSeriesList", rentCar.getRentType().getCarSeriesList());
		return "admin/rentCar_allotCarAndDriver";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentCarAllot")
	public Map<String, String> doRentCarAllot(RentCar rentCar, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		rentCar.setUpdatedUser(_admin);
		result.put("result", this.rentCarService.allotRentCar(rentCar, _admin));
		return result;
	}

	@RequestMapping(value = "/toCarPickUp")
	public String toCarPickUp(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		return "admin/rentCar_pickUpCar";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentCarPickUp")
	public Map<String, String> doRentCarPickUp(RentCar rentCar, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		rentCar.setUpdatedUser(_admin);
		rentCar.setRentStatus(Constants.RENT_STATUS_PICK_UP_CAR);
		result.put("result", this.rentCarService.pickUpRentCar(rentCar, _admin));
		// TODO 取车后与致昱监控系统中的车辆调度平台对接
		return result;
	}

	@RequestMapping(value = "/toCarReturnBack")
	public String toCarReturnBack(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		return "admin/rentCar_returnBackCar";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentCarReturnBack")
	public Map<String, String> doRentCarReturnBack(RentCar rentCar, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		rentCar.setUpdatedUser(_admin);
		rentCar.setRentStatus(Constants.RENT_STATUS_RETURN_BACK_CAR);
		result.put("result", this.rentCarService.returnBackRentCar(rentCar, _admin));
		// TODO 还车后与致昱监控系统中的车辆调度平台对接
		return result;
	}

	// -----------------------------------车辆租用管理 end---------------------------------------

	@ResponseBody
	@RequestMapping(value = "/doRentCarUpdatePart", method = RequestMethod.POST)
	public Map<String, String> doRentCarUpdatePart(RentCar rentCar, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		rentCar.setUpdatedUser(_admin);
		result.put("result", this.rentCarService.updatePart(rentCar, _admin));
		result.put("id", rentCar.getId());
		return result;
	}

	@RequestMapping(value = "/toRentCarDetail")
	public String toRentCarDetail(RentCar rentCar, Model model) {
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		model.addAttribute("rentCar", rentCar);
		return "admin/rentCarDetail";
	}
}
