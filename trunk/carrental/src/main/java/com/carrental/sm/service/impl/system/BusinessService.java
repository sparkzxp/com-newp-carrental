package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Business;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IBusinessDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.service.system.IBusinessService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class BusinessService implements IBusinessService {

	@Autowired
	private IBusinessDao businessDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IRentCarDao rentCarDao;

	public List<Business> queryList(Business business, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("business", business);

		if (pager != null) {
			pager.setTotalSize(this.businessDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return businessDao.queryList(params);
	}

	public List<Business> queryHotRentList(Business business, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("business", business);
		params.put("pager", pager);
		return businessDao.queryHotRentList(params);
	}

	public String add(Business business, Admin loginUser) {
		if (checkExist(business)) {
			return business.getBusinessType() + "已有此租用车型";
		}
		this.businessDao.add(business);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增业务信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了类型为：" + business.getBusinessType() + " 的业务信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Business business, Admin loginUser) {
		if (checkExist(business)) {
			return business.getBusinessType() + "已有此租用车型";
		}
		this.businessDao.update(business);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改业务信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了类型为：" + business.getBusinessType() + " 的业务信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// 验证是否被使用
		if (this.rentCarDao.countByBusinessIds(ids) > 0) {
			return "该业务已被关联使用，请不要删除";
		}
		this.businessDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除业务信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了类型为：" + names + " 的业务信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证该业务类型是否已有此租用车型
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Business business) {
		Business _business = new Business();
		_business.setBusinessType(business.getBusinessType());
		_business.setRentType(business.getRentType());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("business", _business);
		List<Business> businesss = this.businessDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(businesss)) {
			return false;
		} else if (StringUtils.isEmpty(business.getId())) {
			// add
			if (businesss.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (businesss.size() > 1) {
				return true;
			} else if (businesss.get(0).getId().equals(business.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
