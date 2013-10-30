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
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.MD5;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IAdminService;
import com.carrental.sm.service.system.ICityService;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("admin")
public class AdminAction {

	@Autowired
	private IAdminService adminService;// admin业务对象
	@Autowired
	private ICityService cityService;

	@RequestMapping(value = "/showAdminList")
	public String adminList(Admin admin, Pager pager, String pageTitle, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Admin> admins = this.adminService.queryList(admin, pager);
		model.addAttribute("admin", admin);
		model.addAttribute("admins", admins);
		model.addAttribute("pageTitle", pageTitle);
		return "admin/adminList";
	}

	@RequestMapping(value = "/toAdminEdit")
	public String toAdminEdit(Admin admin, Model model) {
		if (StringUtils.isNotEmpty(admin.getId())) {
			admin = this.adminService.queryList(admin, null).get(0);
		}
		model.addAttribute("admin", admin);
		model.addAttribute("citys", this.cityService.queryList(null, null));
		return "admin/adminEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doAdminEdit", method = RequestMethod.POST)
	public Map<String, String> doAdminEdit(Admin admin, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		admin.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(admin.getId())) {
			// update
			result.put("result", this.adminService.update(admin, _admin));
		} else {
			// add
			admin.setCreatedUser(_admin);
			admin.setPassword(MD5.MD5_32(Constants.DEFAULT_PASSWORD));
			result.put("result", this.adminService.add(admin, _admin));
		}
		result.put("id", admin.getId());
		return result;
	}

	@RequestMapping(value = "/toAdminDetail")
	public String toAdminDetail(Admin admin, Model model) {
		admin = this.adminService.queryList(admin, null).get(0);
		model.addAttribute("admin", admin);
		return "admin/adminDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doAdminDelete")
	public Map<String, String> doAdminDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.adminService.delete(ids, names, _admin));
		return result;
	}
}
