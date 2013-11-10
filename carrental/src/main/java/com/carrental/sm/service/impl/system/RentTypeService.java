package com.carrental.sm.service.impl.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IRentCarDao;
import com.carrental.sm.dao.system.IRentTypeDao;
import com.carrental.sm.service.system.ICarSeriesService;
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
	@Autowired
	private ICarSeriesService carSeriesService;
	@Autowired
	private IRentCarDao rentCarDao;

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

	public List<RentType> queryByBusinessType(String businessType) {
		return rentTypeDao.queryByBusinessType(businessType);
	}

	public String add(RentType rentType, String carSeriesIds, Admin loginUser) {
		if (checkExist(rentType)) {
			return "租用类型名称已存在";
		}
		String check = checkCarSeriesRelation(rentType, carSeriesIds);
		if (!"FALSE".equals(check)) {
			return check;
		}
		this.rentTypeDao.add(rentType);

		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : carSeriesIds.split(",")) {
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

	public String update(RentType rentType, String carSeriesIds, Admin loginUser) {
		if (checkExist(rentType)) {
			return "租用类型名称已存在";
		}
		String check = checkCarSeriesRelation(rentType, carSeriesIds);
		if (!"FALSE".equals(check)) {
			return check;
		}
		this.rentTypeDao.update(rentType);

		this.rentTypeDao.deleteCarSeriesList(rentType.getId());
		List<CarSeries> carSeriesList = new ArrayList<CarSeries>();
		for (String s : carSeriesIds.split(",")) {
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
		// 验证是否被使用
		if (this.rentCarDao.countByRentTypeIds(ids) > 0) {
			return "所选租用类型已被租用或预订过，请不要删除";
		}
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

	/**
	 * 验证该车系是否与别的租用类型已关联
	 * 
	 * @author 张霄鹏
	 * @return 未关联：FALSE
	 */
	private String checkCarSeriesRelation(RentType rentType, String carSeriesIds) {
		String result = "FALSE";
		// 根据carSeriesIds查询关联表中是否有id信息
		if (StringUtils.isNotEmpty(carSeriesIds)) {
			List<RentType> list = this.rentTypeDao.queryByCarSeriesIds(carSeriesIds);
			if (CollectionUtils.isNotEmpty(list)) {
				if (null == rentType || StringUtils.isEmpty(rentType.getId())) {
					// 有且是新增操作，返回已关联
					result = "车系 " + list.get(0).getCarSeriesList().get(0).getSeriesName() + " 已经被其它租用类型关联使用";
				} else {
					// 有且是更新操作，在循环比对id后，有一条不一样，返回已关联
					for (RentType rt : list) {
						if (!rt.getId().equals(rentType.getId())) {
							result = "车系 " + rentType.getCarSeriesList().get(0).getSeriesName() + " 已经被其它租用类型关联使用";
							break;
						}
					}
				}
			}
		}
		return result;
	}

}
