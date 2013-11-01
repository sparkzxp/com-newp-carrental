package com.carrental.sm.action.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.MD5;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.common.bean.Passworder;
import com.carrental.sm.service.system.IAdminService;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.IRoleService;

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
	@Autowired
	private IRoleService roleService;

	@RequestMapping(value = "/showAdminList")
	public String adminList(Admin admin, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != role) {
			admin.setCity(role.getCity());
		}
		List<Admin> admins = this.adminService.queryList(admin, pager);
		model.addAttribute("admin", admin);
		model.addAttribute("admins", admins);
		if (Constants.USER_ADMIN.equals(admin.getType())) {
			return "admin/adminList";
		} else if (admin.getInBlacklist().equals("1")) {
			return "admin/blacklistList";
		} else {
			return "admin/userList";
		}
	}

	@RequestMapping(value = "/toAdminEdit")
	public String toAdminEdit(Admin admin, Model model, HttpServletRequest request) {
		if (StringUtils.isNotEmpty(admin.getId())) {
			admin = this.adminService.queryList(admin, null).get(0);
		}
		model.addAttribute("admin", admin);
		Role _role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		if (null != _role) {
			model.addAttribute("citys", this.cityService.queryList(_role.getCity(), null));
		} else {
			model.addAttribute("citys", this.cityService.queryList(null, null));
		}
		model.addAttribute("roles", this.roleService.queryList(null, null));
		if (Constants.USER_ADMIN.equals(admin.getType())) {
			return "admin/adminEdit";
		} else {
			return "admin/userEdit";
		}
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

	@ResponseBody
	@RequestMapping(value = "/doAdminIntoBlacklist")
	public Map<String, String> doAdminIntoBlacklist(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.adminService.intoBlacklist(ids, names, _admin));
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/doAdminOutofBlacklist")
	public Map<String, String> doAdminOutofBlacklist(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.adminService.outofBlacklist(ids, names, _admin));
		return result;
	}

	@RequestMapping(value = "/toResetPwd")
	public String toResetPwd(Admin admin, Model model) {
		model.addAttribute("ids", admin.getId());
		model.addAttribute("names", admin.getAdminName());
		return "admin/passwordEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doResetPwd")
	public Map<String, String> doResetPwd(String ids, String names, Passworder passworder, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		String password;
		if (null == passworder || StringUtils.isEmpty(passworder.getNewPassword())) {
			password = MD5.MD5_32("123456");
		} else {
			password = MD5.MD5_32(passworder.getNewPassword());
			List<Admin> _admins = this.adminService.queryList(new Admin(ids), null);
			if (CollectionUtils.isNotEmpty(_admins)) {
				if (!_admins.get(0).getPassword().equals(MD5.MD5_32(passworder.getPassword()))) {
					result.put("result", "原密码输入错误");
					return result;
				}
			} else {
				result.put("result", "该用户不存在，请刷新列表后重试");
				return result;
			}
		}
		result.put("result", this.adminService.resetPwd(ids, names, password, _admin));
		return result;
	}
}
