package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Driver;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.IDriverDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.service.system.IDriverService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class DriverService implements IDriverService {

	@Autowired
	private IDriverDao driverDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IRentCarDao rentCarDao;

	public List<Driver> queryList(Driver driver, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("driver", driver);

		if (pager != null) {
			pager.setTotalSize(this.driverDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return driverDao.queryList(params);
	}

	public List<Driver> queryList(Driver driver, RentCar rentCar, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("driver", driver);
		params.put("rentCar", rentCar);

		if (pager != null) {
			pager.setTotalSize(this.driverDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return driverDao.queryList(params);
	}

	public String add(Driver driver, Admin loginUser) {
		if (checkExist(driver)) {
			return "司机编号已存在";
		}
		this.driverDao.add(driver);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增司机信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + driver.getDriverName() + " 的司机信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Driver driver, Admin loginUser) {
		if (checkExist(driver)) {
			return "司机编号已存在";
		}
		this.driverDao.update(driver);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改司机信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + driver.getDriverName() + " 的司机信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// 验证是否被使用
		if (this.rentCarDao.countByDriverIds(ids) > 0) {
			return "司机已有工作记录，请不要删除";
		}
		this.driverDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除司机信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的司机信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证司机编号是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Driver driver) {
		Driver _driver = new Driver();
		_driver.setDriverCode(driver.getDriverCode());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("driver", _driver);
		List<Driver> drivers = this.driverDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(drivers)) {
			return false;
		} else if (StringUtils.isEmpty(driver.getId())) {
			// add
			if (drivers.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (drivers.size() > 1) {
				return true;
			} else if (drivers.get(0).getId().equals(driver.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
