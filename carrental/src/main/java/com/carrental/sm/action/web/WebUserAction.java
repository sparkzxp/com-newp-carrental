package com.carrental.sm.action.web;

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
import com.carrental.sm.service.system.ICompanyService;
import com.carrental.sm.service.system.INoticeService;

/**
 * 用户管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping(value = "web/user")
public class WebUserAction {

	@Autowired
	private IAdminService adminService;
	@Autowired
	private INoticeService noticeService;
	@Autowired
	private ICompanyService companyService;

	/**
	 * 用户登录页面
	 */
	@RequestMapping(value = "/toLogin")
	public String toLogin(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/login";
	}

	/**
	 * 用户注册页面
	 */
	@RequestMapping(value = "/toRegist")
	public String toRegist(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/regist";
	}

	/**
	 * 用户个人管理页面
	 */
	@RequestMapping(value = "/toUserManage")
	public String toUserManage(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/userManage";
	}

	/**
	 * 用户修改密码页面
	 */
	@RequestMapping(value = "/toUserPwdEdit")
	public String toUserPwdEdit(Model model, HttpServletRequest request) {
		initTop(model, request);
		initBottom(model);
		return "web/userPwdEdit";
	}

	/**
	 * 获取用户验证码
	 */
	@ResponseBody
	@RequestMapping(value = "/doPickCaptcha")
	public Map<String, String> doPickCaptcha(Admin user, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin loginUser = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		// TODO 发送短信验证码，loginUser可能为null
		result.put("result", Constants.OPERATION_SUCCESS);
		return result;
	}

	/**
	 * 用户注册
	 */
	@ResponseBody
	@RequestMapping(value = "/doRegist")
	public Map<String, String> doRegist(Admin user, String phoneCaptcha, HttpServletRequest request) {
		// TODO 验证手机短信
		Map<String, String> result = new HashMap<String, String>();
		user.setIsDelete("0");
		user.setInBlacklist("0");
		user.setType(Constants.USER_CUSTOM_PERSONAL);
		user.setLoginName(user.getPhone());
		user.setPassword(MD5.MD5_32(user.getPassword()));
		user.setCreatedUser(new Admin(Constants.DEFAULT_ADMIN_ID));
		user.setUpdatedUser(user.getCreatedUser());
		result.put("result", this.adminService.add(user, user));

		request.getSession().setAttribute(Constants.SESSION_WEB_USER_KEY, user);
		return result;
	}

	/**
	 * user login
	 * 
	 * @author 张霄鹏
	 */
	@ResponseBody
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public Map<String, String> doLogin(Admin user, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();

		if (user == null || StringUtils.isEmpty(user.getPhone()) || StringUtils.isEmpty(user.getPassword())) {
			result.put("result", "请重新登录");
			return result;
		}

		user.setLoginName(user.getPhone());
		List<Admin> adminList = this.adminService.queryByLoginName(user);
		if (null != adminList && adminList.size() == 0) {
			result.put("result", "用户不存在");
		} else {
			Admin tmp = adminList.get(0);
			if (!tmp.getPassword().equals(MD5.MD5_32(user.getPassword()))) {
				result.put("result", "密码错误");
			} else if (tmp.getIsDelete().equals("1")) {
				result.put("result", "用户不存在 - 2");
			} else if (tmp.getInBlacklist().equals("1")) {
				result.put("result", "用户不存在 - 3");
			} else {
				request.getSession().setAttribute(Constants.SESSION_WEB_USER_KEY, tmp);

				result.put("result", Constants.OPERATION_SUCCESS);
			}
		}
		return result;
	}

	/**
	 * user logout
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "/doLogout")
	public String doLogout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "web/main";
	}

	/**
	 * 修改用户个人信息
	 */
	@ResponseBody
	@RequestMapping(value = "/doUserManage", method = RequestMethod.POST)
	public Map<String, String> doUserManage(Admin user, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();

		if (user == null || StringUtils.isEmpty(user.getId())) {
			result.put("result", "请重新登录");
			return result;
		}
		Admin loginUser = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		user.setUpdatedUser(loginUser);
		result.put("result", this.adminService.updatePart(user, loginUser));
		request.getSession().setAttribute(Constants.SESSION_WEB_USER_KEY, this.adminService.queryList(new Admin(user.getId()), null).get(0));
		return result;
	}

	/**
	 * 修改用户密码
	 */
	@ResponseBody
	@RequestMapping(value = "/doUserPwdEdit", method = RequestMethod.POST)
	public Map<String, String> doUserPwdEdit(Admin user, String phoneCaptcha, HttpServletRequest request) {
		// TODO 验证手机短信
		Map<String, String> result = new HashMap<String, String>();

		if (user == null || StringUtils.isEmpty(user.getId())) {
			result.put("result", "请重新登录");
			return result;
		}
		Admin loginUser = (Admin) request.getSession().getAttribute(Constants.SESSION_WEB_USER_KEY);
		result.put("result", this.adminService.resetPwd(user.getId(), user.getAdminName(), MD5.MD5_32(user.getPassword()), loginUser));
		return result;
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
