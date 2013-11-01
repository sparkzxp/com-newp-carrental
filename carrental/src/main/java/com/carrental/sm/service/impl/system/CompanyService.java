package com.carrental.sm.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Company;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.dao.system.ICompanyDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.ICompanyService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CompanyService implements ICompanyService {

	@Autowired
	private ICompanyDao companyDao;
	@Autowired
	private ILogDao logDao;

	public List<Company> queryList() {
		return companyDao.queryList();
	}

	public String add(Company company, Admin loginUser) {
		this.companyDao.add(company);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增公司信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了公司信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Company company, Admin loginUser) {
		this.companyDao.update(company);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改公司信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了公司信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

}
