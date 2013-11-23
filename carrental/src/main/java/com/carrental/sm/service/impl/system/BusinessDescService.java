package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.dao.system.IAdminDao;
import com.carrental.sm.dao.system.IBusinessDescDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRoleDao;
import com.carrental.sm.service.system.IBusinessDescService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class BusinessDescService implements IBusinessDescService {

	@Autowired
	private IBusinessDescDao businessDescDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IAdminDao adminDao;
	@Autowired
	private IRoleDao roleDao;

	public List<BusinessDesc> queryEqualsList(BusinessDesc businessDesc) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("businessDesc", businessDesc);

		return businessDescDao.queryEqualsList(params);
	}

	public String update(BusinessDesc businessDesc, Admin loginUser) {
		this.businessDescDao.update(businessDesc);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改业务描述信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + businessDesc.getName() + " 的业务描述信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}
}
