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
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICityService;
import com.carrental.sm.service.system.IRoleService;

/**
 * 角色管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("role")
public class RoleAction {

	@Autowired
	private IRoleService roleService;
	@Autowired
	private ICityService cityService;

	@RequestMapping(value = "/showRoleList")
	public String roleList(Role role, Pager pager, String pageTitle, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Role> roles = this.roleService.queryList(role, pager);
		model.addAttribute("role", role);
		model.addAttribute("roles", roles);
		return "admin/roleList";
	}

	@RequestMapping(value = "/toRoleEdit")
	public String toRoleEdit(Role role, Model model) {
		if (StringUtils.isNotEmpty(role.getId())) {
			role = this.roleService.queryList(role, null).get(0);
		}
		model.addAttribute("role", role);
		model.addAttribute("citys", this.cityService.queryList(null, null));
		return "admin/roleEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doRoleEdit", method = RequestMethod.POST)
	public Map<String, String> doRoleEdit(Role role, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		role.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(role.getId())) {
			// update
			result.put("result", this.roleService.update(role, _admin));
		} else {
			// add
			role.setCreatedUser(_admin);
			result.put("result", this.roleService.add(role, _admin));
		}
		result.put("id", role.getId());
		return result;
	}

	@RequestMapping(value = "/toRoleDetail")
	public String toRoleDetail(Role role, Model model) {
		role = this.roleService.queryList(role, null).get(0);
		model.addAttribute("role", role);
		return "admin/roleDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doRoleDelete")
	public Map<String, String> doRoleDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.roleService.delete(ids, names, _admin));
		return result;
	}
}
