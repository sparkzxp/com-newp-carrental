package com.carrental.sm.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@RequestMapping(value = "/showAdminList")
	public String adminList(Admin admin, Pager pager, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Admin> admins = this.adminService.queryList(admin, pager);
		model.addAttribute("admin", admin);
		model.addAttribute("admins", admins);
		return "admin/adminList";
	}

	@RequestMapping(value = "/toAdminEdit")
	public String toAdminEdit(Admin admin, Model model) {
		if (StringUtils.isNotEmpty(admin.getId())) {
			admin = this.adminService.queryList(admin, null).get(0);
		}
		model.addAttribute("admin", admin);
		return "admin/adminEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doAdminEdit", method = RequestMethod.POST)
	public Map<String, String> doAdminEdit(Admin admin) {
		if (StringUtils.isNotEmpty(admin.getId())) {
			// update
		} else {
			// add
			admin.setPassword(MD5.MD5_32(Constants.DEFAULT_PASSWORD));
		}
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", "success");
		result.put("id", "1");
		return result;
	}
}
