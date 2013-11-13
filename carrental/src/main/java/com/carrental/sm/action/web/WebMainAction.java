package com.carrental.sm.action.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.INoticeService;

/**
 * 首页管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping(value = "web")
public class WebMainAction {

	@Autowired
	private INoticeService noticeService;
	@Autowired
	private ICompanyService companyService;

	/**
	 * WEB首页
	 */
	@RequestMapping
	public String toMain(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/main";
	}

	/**
	 * 公司简介
	 */
	@RequestMapping(value = "/toCompany")
	public String toCompany(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/company";
	}

	/**
	 * 业务介绍列表
	 */
	@RequestMapping(value = "/toBusinessList")
	public String toBusinessList(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/businessList";
	}

	private void initTop(Model model, HttpServletRequest request) {
		Admin user = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		model.addAttribute("user", user);

		Pager pager = new Pager();
		pager.setPageSize(5);
		model.addAttribute("notices", this.noticeService.queryList(null, pager));
	}

	private void initBottom(Model model) {
		model.addAttribute("company", this.companyService.queryList().get(0));
	}
}
