package com.carrental.sm.service.impl.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentTypeDao;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class RentTypeService implements IRentTypeService {

	@Autowired
	private IRentTypeDao rentTypeDao;
	@Autowired
	private ILogDao logDao;

	public List<RentType> queryList(RentType rentType, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rentType", rentType);

		if (pager != null) {
			pager.setTotalSize(this.rentTypeDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return rentTypeDao.queryList(params);
	}

	public String add(RentType rentType, String resourceIds, Admin loginUser) {
		if (checkExist(rentType)) {
			return "租用类型名称已存在";
		}
		this.rentTypeDao.add(rentType);

		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : resourceIds.split(",")) {
			CarSeries r = new CarSeries();
			r.setId(s);
			carSeriesList.add(r);
		}
		rentType.setCarSeriesList(carSeriesList);
		this.rentTypeDao.addCarSeriesList(rentType);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增租用类型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + rentType.getTypeName() + " 的租用类型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(RentType rentType, String resourceIds, Admin loginUser) {
		if (checkExist(rentType)) {
			return "租用类型名称已存在";
		}
		this.rentTypeDao.update(rentType);

		this.rentTypeDao.deleteCarSeriesList(rentType.getId());
		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : resourceIds.split(",")) {
			CarSeries r = new CarSeries();
			r.setId(s);
			carSeriesList.add(r);
		}
		rentType.setCarSeriesList(carSeriesList);
		this.rentTypeDao.addCarSeriesList(rentType);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改租用类型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + rentType.getTypeName() + " 的租用类型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.rentTypeDao.delete(ids);

		this.rentTypeDao.deleteCarSeriesList(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除租用类型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的租用类型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证租用类型名称是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(RentType rentType) {
		RentType _rentType = new RentType();
		_rentType.setTypeName(rentType.getTypeName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("rentType", _rentType);
		List<RentType> rentTypes = this.rentTypeDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(rentTypes)) {
			return false;
		} else if (StringUtils.isEmpty(rentType.getId())) {
			// add
			if (rentTypes.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (rentTypes.size() > 1) {
				return true;
			} else if (rentTypes.get(0).getId().equals(rentType.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
