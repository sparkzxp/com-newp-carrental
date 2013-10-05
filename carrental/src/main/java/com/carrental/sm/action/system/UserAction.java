package com.carrental.sm.action.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.carrental.sm.bean.system.User;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.MD5;
import com.carrental.sm.service.system.IUserService;

/**
 * 用户管理
 * 
 * @author 张霄鹏
 * @date 2012-12-5
 */
@Controller
@RequestMapping("user")
public class UserAction {

	@Autowired
	private IUserService userService;// user业务对象

	/**
	 * user login
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Model model, HttpServletRequest request) {
		if (user == null || StringUtils.isEmpty(user.getLoginName()) || StringUtils.isEmpty(user.getPassword())) {
			return "index/login";
		}
		List<User> userList = this.userService.queryList(user);
		if (null != userList && userList.size() > 1) {
			model.addAttribute("message", "用户不存在");
			return "index/login";
		} else {
			User tmp = userList.get(0);
			if (tmp.getPassword().equals(MD5.MD5_32(user.getPassword()))) {
				request.getSession().setAttribute(Constants.SESSION_USER_KEY, tmp);
				model.addAttribute("user", tmp);
				return "index/main";
			} else {
				model.addAttribute("message", "密码错误");
				return "index/login";
			}
		}
	}

	/**
	 * user logout
	 * 
	 * @author 张霄鹏
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index/login";
	}

	@RequestMapping(value = "/showUserList", method = RequestMethod.POST)
	public String userList(Model model){
		List<User> users = this.userService.queryList(null);
		model.addAttribute("users", users);
		return "admin/userList";
	}
}
