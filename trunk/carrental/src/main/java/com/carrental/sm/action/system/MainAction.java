package com.carrental.sm.action.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.MD5;
import com.carrental.sm.service.system.IAdminService;

/**
 * 登录管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("main")
public class MainAction {

	@Autowired
	private IAdminService adminService;// admin业务对象

	/**
	 * admin login
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Admin admin, Model model, HttpServletRequest request) {
		if (admin == null || StringUtils.isEmpty(admin.getLoginName()) || StringUtils.isEmpty(admin.getPassword())) {
			return "admin/login";
		}
		List<Admin> adminList = this.adminService.queryByLoginName(admin);
		if (null != adminList && adminList.size() > 1) {
			model.addAttribute("message", "用户不存在");
			return "admin/login";
		} else {
			Admin tmp = adminList.get(0);
			if (tmp.getPassword().equals(MD5.MD5_32(admin.getPassword()))) {
				request.getSession().setAttribute(Constants.SESSION_ADMIN_KEY, tmp);
				model.addAttribute("admin", tmp);
				return "admin/main";
			} else {
				model.addAttribute("message", "密码错误");
				return "admin/login";
			}
		}
	}

	/**
	 * admin logout
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "admin/login";
	}

	@RequestMapping(value = "/top")
	public String top(Model model, HttpServletRequest request) {
		model.addAttribute("admin", request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY));
		return "admin/top";
	}

	@RequestMapping(value = "/left")
	public String left(Model model, HttpServletRequest request) {
		return "admin/left";
	}
}
