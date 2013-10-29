package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IAdminDao;
import com.carrental.sm.service.system.IAdminService;

/**
 * 系统用户管理
 * 
 * @author 张霄鹏
 */
@Service
public class AdminService implements IAdminService {

	@Autowired
	private IAdminDao adminDao;

	public List<Admin> queryList(Admin admin, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", admin);

		if (pager != null) {
			pager.setTotalSize(this.adminDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return adminDao.queryList(params);
	}

	public List<Admin> queryByLoginName(Admin admin) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", admin);
		return adminDao.queryByLoginName(params);
	}

}
