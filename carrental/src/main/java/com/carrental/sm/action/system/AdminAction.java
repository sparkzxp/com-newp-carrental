package com.carrental.sm.action.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IAdminService;

/**
 * 用户管理
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
}
