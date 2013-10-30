package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IRoleDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.IRoleService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class RoleService implements IRoleService {

	@Autowired
	private IRoleDao roleDao;
	@Autowired
	private ILogDao logDao;

	public List<Role> queryList(Role role, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("role", role);

		if (pager != null) {
			pager.setTotalSize(this.roleDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return roleDao.queryList(params);
	}

	public String add(Role role, Admin loginUser) {
		if (checkExist(role)) {
			return "城市名称已存在";
		}
		this.roleDao.add(role);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增城市信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + role.getRoleName() + " 的城市信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Role role, Admin loginUser) {
		if (checkExist(role)) {
			return "城市名称已存在";
		}
		this.roleDao.update(role);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改城市信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + role.getRoleName() + " 的城市信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.roleDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除城市信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的城市信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证城市名称是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Role role) {
		Role _role = new Role();
		_role.setRoleName(role.getRoleName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("role", _role);
		List<Role> roles = this.roleDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(roles)) {
			return false;
		} else if (StringUtils.isEmpty(role.getId())) {
			// add
			if (roles.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (roles.size() > 1) {
				return true;
			} else if (roles.get(0).getId().equals(role.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
