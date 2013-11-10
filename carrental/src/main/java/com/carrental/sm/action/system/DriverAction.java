package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Driver;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.IDriverService;
import com.carrental.sm.service.system.IRentCarService;

/**
 * 司机管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("driver")
public class DriverAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private IDriverService driverService;
	@Autowired
	private ICityService cityService;
	@Autowired
	private IRentCarService rentCarService;

	@RequestMapping(value = "/showDriverList")
	public String driverList(Driver driver, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != role) {
			driver.setCity(role.getCity());
		}
		List<Driver> drivers = this.driverService.queryList(driver, pager);
		model.addAttribute("driver", driver);
		model.addAttribute("drivers", drivers);
		return "admin/driverList";
	}

	/**
	 * 显示popup列表弹出层
	 */
	@RequestMapping(value = "/showPopupDriverList")
	public String showPopupDriverList(Driver driver, String rentCarId, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}

		RentCar rentCar = new RentCar();
		rentCar.setId(rentCarId);
		rentCar = this.rentCarService.queryList(rentCar, null).get(0);
		RentCar rentCarQuery = new RentCar();
		// 为预订时间前后各留出2个小时的空余时间
		Calendar pick = Calendar.getInstance();
		pick.setTime(rentCar.getBookPickUpDt());
		pick.add(Calendar.HOUR_OF_DAY, -2);
		rentCarQuery.setBookPickUpDt(new Timestamp(pick.getTime().getTime()));

		Calendar back = Calendar.getInstance();
		back.setTime(rentCar.getBookGiveBackDt());
		back.add(Calendar.HOUR_OF_DAY, 2);
		rentCarQuery.setBookGiveBackDt(new Timestamp(back.getTime().getTime()));

		List<Driver> drivers = this.driverService.queryList(driver, rentCarQuery, pager);
		model.addAttribute("driver", driver);
		model.addAttribute("drivers", drivers);
		return "admin/popupDriverList";
	}

	@RequestMapping(value = "/toDriverEdit")
	public String toDriverEdit(Driver driver, Model model, HttpServletRequest request) {
		if (StringUtils.isNotEmpty(driver.getId())) {
			driver = this.driverService.queryList(driver, null).get(0);
		}
		Role _role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != _role) {
			model.addAttribute("citys", this.cityService.queryList(_role.getCity(), null));
		} else {
			City _city = new City();
			_city.setIsDelete("0");
			model.addAttribute("citys", this.cityService.queryList(_city, null));
		}
		model.addAttribute("driver", driver);
		return "admin/driverEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doDriverEdit", method = RequestMethod.POST)
	public Map<String, String> doDriverEdit(Driver driver, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		driver.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(driver.getId())) {
			// update
			result.put("result", this.driverService.update(driver, _admin));
		} else {
			// add
			driver.setCreatedUser(_admin);
			result.put("result", this.driverService.add(driver, _admin));
		}
		result.put("id", driver.getId());
		return result;
	}

	@RequestMapping(value = "/toDriverDetail")
	public String toDriverDetail(Driver driver, Model model) {
		driver = this.driverService.queryList(driver, null).get(0);
		model.addAttribute("driver", driver);
		return "admin/driverDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doDriverDelete")
	public Map<String, String> doDriverDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.driverService.delete(ids, names, _admin));
		return result;
	}
}
