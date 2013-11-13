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

	public List<Admin> queryEqualsList(Admin admin, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", admin);

		if (pager != null) {
			pager.setTotalSize(this.adminDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return adminDao.queryEqualsList(params);
	}

	public List<Admin> queryByLoginName(Admin admin) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", admin);
		return adminDao.queryByLoginName(params);
	}

	public String add(Admin admin, Admin loginUser) {
		if (checkLoginNameExist(admin)) {
			return "登录账号已存在";
		}
		if (checkPhoneExist(admin)) {
			return "手机号码已存在";
		}
		this.adminDao.add(admin);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		if (admin.getType().equals(Constants.USER_CUSTOM_PERSONAL)) {
			log.setTitle("新增注册用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + admin.getAdminName() + " 的注册用户");
		} else if (admin.getType().equals(Constants.USER_ADMIN)) {
			log.setTitle("新增系统用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + admin.getAdminName() + " 的系统用户");
		}
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Admin admin, Admin loginUser) {
		if (checkLoginNameExist(admin)) {
			return "登录账号已存在";
		}
		if (checkPhoneExist(admin)) {
			return "手机号码已存在";
		}
		this.adminDao.update(admin);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		if (admin.getType().equals(Constants.USER_CUSTOM_PERSONAL)) {
			log.setTitle("修改注册用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的注册用户");
		} else if (admin.getType().equals(Constants.USER_ADMIN)) {
			log.setTitle("修改系统用户");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的系统用户");
		}
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String updatePart(Admin admin, Admin loginUser) {
		this.adminDao.updatePart(admin);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		if (admin.getType().equals(Constants.USER_CUSTOM_PERSONAL)) {
			log.setTitle("修改注册用户部分信息");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的注册用户的部分信息");
		} else if (admin.getType().equals(Constants.USER_ADMIN)) {
			log.setTitle("修改系统用户部分信息");
			log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + admin.getAdminName() + " 的系统用户的部分信息");
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

	public String intoBlacklist(String ids, String names, Admin loginUser) {
		this.adminDao.intoBlacklist(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("用户加入黑名单");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 将名为：" + names + " 的用户加入了黑名单");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String outofBlacklist(String ids, String names, Admin loginUser) {
		this.adminDao.outofBlacklist(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("用户从黑名单删除");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 将名为：" + names + " 的用户从黑名单中删除");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String resetPwd(String ids, String names, String password, Admin loginUser) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("password", password);
		params.put("ids", ids);
		this.adminDao.resetPwd(params);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改用户密码");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + names + " 的用户的密码");
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
	private Boolean checkLoginNameExist(Admin admin) {
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

	/**
	 * 验证手机号码是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkPhoneExist(Admin admin) {
		Admin _admin = new Admin();
		_admin.setPhone(admin.getPhone());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("admin", _admin);
		List<Admin> admins = this.adminDao.queryEqualsList(params);
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
