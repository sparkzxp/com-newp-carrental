package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.Resource;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IResourceDao;
import com.carrental.sm.service.system.IResourceService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class ResourceService implements IResourceService {

	@Autowired
	private IResourceDao resourceDao;
	@Autowired
	private ILogDao logDao;

	public List<Resource> queryList(Resource resource, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("resource", resource);

		if (pager != null) {
			pager.setTotalSize(this.resourceDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return resourceDao.queryList(params);
	}

	public String add(Resource resource, Admin loginUser) {
		this.resourceDao.add(resource);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增资源信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + resource.getName() + " 的资源信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Resource resource, Admin loginUser) {
		this.resourceDao.update(resource);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改资源信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + resource.getName() + " 的资源信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		this.resourceDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除资源信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 及其附属的资源信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}
}
