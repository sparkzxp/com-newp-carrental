package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ICityDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.ICityService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CityService implements ICityService {

	@Autowired
	private ICityDao cityDao;
	@Autowired
	private ILogDao logDao;

	public List<City> queryList(City city, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("city", city);

		if (pager != null) {
			pager.setTotalSize(this.cityDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return cityDao.queryList(params);
	}

	public String add(City city, Admin loginUser) {
		if (checkExist(city)) {
			return "城市名称已存在";
		}
		this.cityDao.add(city);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增城市信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + city.getCityName() + " 的城市信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(City city, Admin loginUser) {
		if (checkExist(city)) {
			return "城市名称已存在";
		}
		this.cityDao.update(city);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改城市信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + city.getCityName() + " 的城市信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.cityDao.delete(ids);

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
	private Boolean checkExist(City city) {
		City _city = new City();
		_city.setCityName(city.getCityName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("city", _city);
		List<City> citys = this.cityDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(citys)) {
			return false;
		} else if (StringUtils.isEmpty(city.getId())) {
			// add
			if (citys.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (citys.size() > 1) {
				return true;
			} else if (citys.get(0).getId().equals(city.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
