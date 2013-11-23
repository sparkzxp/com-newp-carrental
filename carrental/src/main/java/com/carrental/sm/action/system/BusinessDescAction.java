package com.carrental.sm.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.common.Constants;
import com.carrental.sm.service.system.IBusinessDescService;

/**
 * 业务描述管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("businessDesc")
public class BusinessDescAction {

	@Autowired
	private IBusinessDescService businessDescService;

	@RequestMapping(value = "/showBusinessDescList")
	public String businessDescList(BusinessDesc businessDesc, Model model) {
		List<BusinessDesc> businessDescs = this.businessDescService.queryEqualsList(businessDesc);
		model.addAttribute("businessDesc", businessDesc);
		model.addAttribute("businessDescs", businessDescs);
		return "admin/businessDescList";
	}

	@RequestMapping(value = "/toBusinessDescEdit")
	public String toBusinessDescEdit(BusinessDesc businessDesc, Model model) {
		businessDesc = this.businessDescService.queryEqualsList(businessDesc).get(0);
		model.addAttribute("businessDesc", businessDesc);
		return "admin/businessDescEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doBusinessDescEdit", method = RequestMethod.POST)
	public Map<String, String> doBusinessDescEdit(BusinessDesc businessDesc, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		businessDesc.setUpdatedUser(_admin);
		// update
		result.put("result", this.businessDescService.update(businessDesc, _admin));
		result.put("id", businessDesc.getId());
		return result;
	}

	@RequestMapping(value = "/toBusinessDescDetail")
	public String toBusinessDescDetail(BusinessDesc businessDesc, Model model) {
		businessDesc = this.businessDescService.queryEqualsList(businessDesc).get(0);
		model.addAttribute("businessDesc", businessDesc);
		return "admin/businessDescDetail";
	}
}
