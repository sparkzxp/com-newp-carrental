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
import com.carrental.sm.bean.system.Dictionary;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.IDictionaryService;

/**
 * 字典表管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("dict")
public class DictionaryAction {

	@Autowired
	private IDictionaryService dictionaryService;

	@RequestMapping(value = "/showDictList")
	public String dictList(Dictionary dict, Pager pager, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Dictionary> dicts = this.dictionaryService.queryList(dict, pager);
		model.addAttribute("dict", dict);
		model.addAttribute("dicts", dicts);
		return "admin/dictList";
	}

	@ResponseBody
	@RequestMapping(value = "/queryDictList")
	public Map<String, Object> queryDictList(Dictionary dict) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Dictionary> dicts = this.dictionaryService.queryList(dict, null);
		result.put("result", Constants.OPERATION_SUCCESS);
		result.put("dicts", dicts);
		return result;
	}

	@RequestMapping(value = "/toDictEdit")
	public String toDictEdit(Dictionary dict, String title, Model model) {
		if (StringUtils.isNotEmpty(dict.getId())) {
			dict = this.dictionaryService.queryList(dict, null).get(0);
		}
		model.addAttribute("title", title);
		model.addAttribute("dict", dict);
		return "admin/dictEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doDictEdit", method = RequestMethod.POST)
	public Map<String, String> doDictEdit(Dictionary dict, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		dict.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(dict.getId())) {
			// update
			result.put("result", this.dictionaryService.update(dict, _admin));
		} else {
			// add
			dict.setCreatedUser(_admin);
			result.put("result", this.dictionaryService.add(dict, _admin));
		}
		result.put("id", dict.getId());
		result.put("typeValue", dict.getTypeValue());
		result.put("name", dict.getName());
		return result;
	}

	@RequestMapping(value = "/toDictDetail")
	public String toDictDetail(Dictionary dict, Model model) {
		dict = this.dictionaryService.queryList(dict, null).get(0);
		model.addAttribute("dict", dict);
		return "admin/dictDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doDictDelete")
	public Map<String, String> doDictDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.dictionaryService.delete(ids, names, _admin));
		return result;
	}
}
