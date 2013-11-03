package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ICarSeriesDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.ICarSeriesService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CarSeriesService implements ICarSeriesService {

	@Autowired
	private ICarSeriesDao carSeriesDao;
	@Autowired
	private ILogDao logDao;

	public List<CarSeries> queryList(CarSeries carSeries, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("carSeries", carSeries);

		if (pager != null) {
			pager.setTotalSize(this.carSeriesDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return carSeriesDao.queryList(params);
	}

	public String add(CarSeries carSeries, Admin loginUser) {
		if (checkExist(carSeries)) {
			return "车系名称已存在";
		}
		this.carSeriesDao.add(carSeries);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增车系信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + carSeries.getSeriesName() + " 的车系信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(CarSeries carSeries, Admin loginUser) {
		if (checkExist(carSeries)) {
			return "车系名称已存在";
		}
		this.carSeriesDao.update(carSeries);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改车系信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + carSeries.getSeriesName() + " 的车系信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.carSeriesDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除车系信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的车系信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证车系名称是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(CarSeries carSeries) {
		CarSeries _carSeries = new CarSeries();
		_carSeries.setSeriesName(carSeries.getSeriesName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("carSeries", _carSeries);
		List<CarSeries> carSeriess = this.carSeriesDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(carSeriess)) {
			return false;
		} else if (StringUtils.isEmpty(carSeries.getId())) {
			// add
			if (carSeriess.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (carSeriess.size() > 1) {
				return true;
			} else if (carSeriess.get(0).getId().equals(carSeries.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
