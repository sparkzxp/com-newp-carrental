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
import com.carrental.sm.bean.system.Company;
import com.carrental.sm.common.Constants;
import com.carrental.sm.service.system.ICompanyService;

/**
 * 公司管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("company")
public class CompanyAction {

	@Autowired
	private ICompanyService companyService;

	@RequestMapping(value = "/toCompanyEdit")
	public String toCompanyEdit(Model model) {
		List<Company> companys = this.companyService.queryList();
		Company company = null;
		if (CollectionUtils.isEmpty(companys)) {
			company = new Company();
		} else {
			company = companys.get(0);
		}
		model.addAttribute("company", company);
		return "admin/companyEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doCompanyEdit", method = RequestMethod.POST)
	public Map<String, String> doCompanyEdit(Company company, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		company.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(company.getId())) {
			// update
			result.put("result", this.companyService.update(company, _admin));
		} else {
			// add
			company.setCreatedUser(_admin);
			result.put("result", this.companyService.add(company, _admin));
		}
		result.put("id", company.getId());
		return result;
	}
}
