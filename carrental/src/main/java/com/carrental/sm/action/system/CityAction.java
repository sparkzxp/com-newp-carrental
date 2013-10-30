package com.carrental.sm.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICityService;

/**
 * 城市管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("city")
public class CityAction {

	@Autowired
	private ICityService cityService;

	@RequestMapping(value = "/showCityList")
	public String cityList(City city, Pager pager, String pageTitle, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<City> citys = this.cityService.queryList(city, pager);
		model.addAttribute("city", city);
		model.addAttribute("citys", citys);
		model.addAttribute("pageTitle", pageTitle);
		return "admin/cityList";
	}

	@RequestMapping(value = "/toCityEdit")
	public String toCityEdit(City city, Model model) {
		if (StringUtils.isNotEmpty(city.getId())) {
			city = this.cityService.queryList(city, null).get(0);
		}
		model.addAttribute("city", city);
		return "admin/cityEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doCityEdit", method = RequestMethod.POST)
	public Map<String, String> doCityEdit(City city, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		city.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(city.getId())) {
			// update
			result.put("result", this.cityService.update(city, _admin));
		} else {
			// add
			city.setCreatedUser(_admin);
			result.put("result", this.cityService.add(city, _admin));
		}
		result.put("id", city.getId());
		return result;
	}

	@RequestMapping(value = "/toCityDetail")
	public String toCityDetail(City city, Model model) {
		city = this.cityService.queryList(city, null).get(0);
		model.addAttribute("city", city);
		return "admin/cityDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doCityDelete")
	public Map<String, String> doCityDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.cityService.delete(ids, names, _admin));
		return result;
	}
}
