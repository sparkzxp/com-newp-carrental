package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import com.carrental.sm.bean.system.Car;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICarSeriesService;
import com.carrental.sm.service.system.ICarService;
import com.carrental.sm.service.system.ICityService;

/**
 * 车辆管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("car")
public class CarAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICarService carService;
	@Autowired
	private ICityService cityService;
	@Autowired
	private ICarSeriesService carSeriesService;

	@RequestMapping(value = "/showCarList")
	public String carList(Car car, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != role) {
			car.setCity(role.getCity());
		}
		List<Car> cars = this.carService.queryList(car, pager);
		model.addAttribute("car", car);
		model.addAttribute("cars", cars);
		return "admin/carList";
	}

	@RequestMapping(value = "/toCarEdit")
	public String toCarEdit(Car car, Model model, HttpServletRequest request) {
		if (StringUtils.isNotEmpty(car.getId())) {
			car = this.carService.queryList(car, null).get(0);
		}
		model.addAttribute("car", car);

		model.addAttribute("carSeriesList", this.carSeriesService.queryList(null, null));
		Role _role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != _role) {
			model.addAttribute("citys", this.cityService.queryList(_role.getCity(), null));
		} else {
			model.addAttribute("citys", this.cityService.queryList(null, null));
		}
		return "admin/carEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doCarEdit", method = RequestMethod.POST)
	public Map<String, String> doCarEdit(Car car, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		car.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(car.getId())) {
			// update
			result.put("result", this.carService.update(car, _admin));
		} else {
			// add
			car.setCreatedUser(_admin);
			result.put("result", this.carService.add(car, _admin));
		}
		result.put("id", car.getId());
		return result;
	}

	@RequestMapping(value = "/toCarDetail")
	public String toCarDetail(Car car, Model model) {
		car = this.carService.queryList(car, null).get(0);
		model.addAttribute("car", car);
		return "admin/carDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doCarDelete")
	public Map<String, String> doCarDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.carService.delete(ids, names, _admin));
		return result;
	}
}
