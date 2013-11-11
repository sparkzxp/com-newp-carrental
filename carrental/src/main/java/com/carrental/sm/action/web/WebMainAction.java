package com.carrental.sm.action.web;

import java.util.List;

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
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.INoticeService;

/**
 * 首页管理
 * 
 * @author 张霄鹏
 */
@Controller
public class WebMainAction {

	@Autowired
	private IAdminService adminService;
	@Autowired
	private INoticeService noticeService;
	@Autowired
	private ICompanyService companyService;

	@RequestMapping(value = "web")
	public String admin(Model model) {
		initTop(model);
		initBottom(model);
		return "web/main";
	}

	@RequestMapping(value = "web/company")
	public String top(Model model, HttpServletRequest request) {
		initTop(model);
		initBottom(model);
		return "web/company";
	}

	/**
	 * user login
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "web/login", method = RequestMethod.POST)
	public String login(Admin admin, Model model, HttpServletRequest request) {
		if (admin == null || StringUtils.isEmpty(admin.getLoginName()) || StringUtils.isEmpty(admin.getPassword())) {
			return "admin/login";
		}
		List<Admin> adminList = this.adminService.queryByLoginName(admin);
		if (null != adminList && adminList.size() == 0) {
			model.addAttribute("message", "用户不存在");
			return "admin/login";
		} else {
			Admin tmp = adminList.get(0);
			if (tmp.getPassword().equals(MD5.MD5_32(admin.getPassword()))) {
				request.getSession().setAttribute(Constants.SESSION_ADMIN_KEY, tmp);
				request.getSession().setAttribute(Constants.SESSION_ROLE_KEY, tmp.getRole());
				model.addAttribute("admin", tmp);
				return "admin/web";
			} else {
				model.addAttribute("message", "密码错误");
				return "admin/login";
			}
		}
	}

	/**
	 * user logout
	 * 
	 * @author 张霄鹏
	 */
	@ResponseBody
	@RequestMapping(value = "web/logout", method = RequestMethod.POST)
	public String logout(Model model, HttpServletRequest request) {
		request.getSession().invalidate();
		return "logout";
	}

	private void initTop(Model model) {
		Pager pager = new Pager();
		pager.setPageSize(5);
		model.addAttribute("notices", this.noticeService.queryList(null, pager));
	}

	private void initBottom(Model model) {
		model.addAttribute("company", this.companyService.queryList().get(0));
	}
}
