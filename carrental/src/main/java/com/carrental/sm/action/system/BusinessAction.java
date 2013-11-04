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
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IBusinessService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * 业务管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("business")
public class BusinessAction {

	@Autowired
	private IBusinessService businessService;
	@Autowired
	private IRentTypeService rentTypeService;

	@RequestMapping(value = "/showBusinessList")
	public String businessList(Business business, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Business> businesss = this.businessService.queryList(business, pager);
		model.addAttribute("business", business);
		model.addAttribute("businesss", businesss);
		return "admin/businessList";
	}

	@RequestMapping(value = "/toBusinessEdit")
	public String toBusinessEdit(Business business, Model model, HttpServletRequest request) {
		boolean isUpdate = StringUtils.isNotEmpty(business.getId());
		if (isUpdate) {
			business = this.businessService.queryList(business, null).get(0);
		}
		model.addAttribute("business", business);
		model.addAttribute("rentTypes", this.rentTypeService.queryList(null, null));
		return "admin/businessEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doBusinessEdit", method = RequestMethod.POST)
	public Map<String, String> doBusinessEdit(Business business, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		business.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(business.getId())) {
			// update
			result.put("result", this.businessService.update(business, _admin));
		} else {
			// add
			business.setCreatedUser(_admin);
			result.put("result", this.businessService.add(business, _admin));
		}
		result.put("id", business.getId());
		return result;
	}

	@RequestMapping(value = "/toBusinessDetail")
	public String toBusinessDetail(Business business, Model model) {
		business = this.businessService.queryList(business, null).get(0);
		model.addAttribute("business", business);
		return "admin/businessDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doBusinessDelete")
	public Map<String, String> doBusinessDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.businessService.delete(ids, names, _admin));
		return result;
	}
}
