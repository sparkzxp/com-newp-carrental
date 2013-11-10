package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Car;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ICarDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.service.system.ICarService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CarService implements ICarService {

	@Autowired
	private ICarDao carDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IRentCarDao rentCarDao;

	public List<Car> queryList(Car car, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("car", car);

		if (pager != null) {
			pager.setTotalSize(this.carDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return carDao.queryList(params);
	}

	public List<Car> queryList(Car car, RentCar rentCar, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("car", car);
		params.put("rentCar", rentCar);

		if (pager != null) {
			pager.setTotalSize(this.carDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return carDao.queryList(params);
	}

	public String add(Car car, Admin loginUser) {
		if (checkExist(car)) {
			return "车牌号码已存在";
		}
		this.carDao.add(car);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增车辆信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了车牌号码为：" + car.getPlateNumber() + " 的车辆信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(Car car, Admin loginUser) {
		if (checkExist(car)) {
			return "车牌号码已存在";
		}
		this.carDao.update(car);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改车辆信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了车牌号码为：" + car.getPlateNumber() + " 的车辆信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// 验证是否被使用
		if (this.rentCarDao.countByCarIds(ids) > 0) {
			return "车辆已被出租使用，请不要删除";
		}
		this.carDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除车辆信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了车牌号码为：" + names + " 的车辆信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证车牌号码是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(Car car) {
		Car _car = new Car();
		_car.setPlateNumber(car.getPlateNumber());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("car", _car);
		List<Car> cars = this.carDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(cars)) {
			return false;
		} else if (StringUtils.isEmpty(car.getId())) {
			// add
			if (cars.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (cars.size() > 1) {
				return true;
			} else if (cars.get(0).getId().equals(car.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
