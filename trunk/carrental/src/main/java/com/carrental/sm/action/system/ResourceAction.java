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
import com.carrental.sm.bean.system.Resource;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IResourceService;

/**
 * 资源管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("resource")
public class ResourceAction {

	@Autowired
	private IResourceService resourceService;

	@RequestMapping(value = "/showResourceList")
	public String resourceList(Resource resource, Pager pager, String pageTitle, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Resource> resources = this.resourceService.queryList(resource, pager);
		model.addAttribute("resource", resource);
		model.addAttribute("resources", resources);
		return "admin/resourceList";
	}

	@RequestMapping(value = "/toResourceEdit")
	public String toResourceEdit(Resource resource, Model model) {
		if (StringUtils.isNotEmpty(resource.getId())) {
			resource = this.resourceService.queryList(resource, null).get(0);
		}
		model.addAttribute("resource", resource);
		model.addAttribute("resources", this.resourceService.queryList(new Resource("left-1"), null));
		return "admin/resourceEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doResourceEdit", method = RequestMethod.POST)
	public Map<String, String> doResourceEdit(Resource resource, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		resource.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(resource.getId())) {
			// update
			result.put("result", this.resourceService.update(resource, _admin));
		} else {
			// add
			resource.setCreatedUser(_admin);
			result.put("result", this.resourceService.add(resource, _admin));
		}
		result.put("id", resource.getId());
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/doResourceDelete")
	public Map<String, String> doResourceDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.resourceService.delete(ids, names, _admin));
		return result;
	}
}
