package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IAdminDao;
import com.carrental.sm.dao.system.ILogDao;
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
	@Autowired
	private ILogDao logDao;

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

	public String add(Admin admin, Admin loginUser) {
		if (checkExist(admin)) {
			return "登录账号已存在";
		}
		this.adminDao.add(admin);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		if (admin.getType().equals(Constants.CUSTOM_USER)) {
			log.setTitle("新增注册用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + admin.getAdminName() + " 的注册用户");
		} else if (admin.getType().equals(Constants.ADMIN_USER)) {
			log.setTitle("新增系统用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + admin.getAdminName() + " 的系统用户");
		}
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Admin admin, Admin loginUser) {
		if (checkExist(admin)) {
			return "登录账号已存在";
		}
		this.adminDao.update(admin);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		if (admin.getType().equals(Constants.CUSTOM_USER)) {
			log.setTitle("修改注册用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的注册用户");
		} else if (admin.getType().equals(Constants.ADMIN_USER)) {
			log.setTitle("修改系统用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的系统用户");
		}
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		this.adminDao.deleteAll(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除用户");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的用户");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证登录账号是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Admin admin) {
		Admin _admin = new Admin();
		_admin.setLoginName(admin.getLoginName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", _admin);
		List<Admin> admins = this.adminDao.queryByLoginName(params);
		if (CollectionUtils.isEmpty(admins)) {
			return false;
		} else if (StringUtils.isEmpty(admin.getId())) {
			// add
			if (admins.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (admins.size() > 1) {
				return true;
			} else if (admins.get(0).getId().equals(admin.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}
}
