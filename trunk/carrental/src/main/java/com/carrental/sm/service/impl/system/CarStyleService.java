package com.carrental.sm.service.impl.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarStyle;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.PagerUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.dao.system.ICarStyleDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.service.system.ICarStyleService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CarStyleService implements ICarStyleService {

	@Autowired
	private ICarStyleDao carStyleDao;
	@Autowired
	private ILogDao logDao;

	public List<CarStyle> queryList(CarStyle carStyle, Pager pager) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("carStyle", carStyle);

		if (pager != null) {
			pager.setTotalSize(this.carStyleDao.count(params));
			PagerUtil.setPager(pager);
		}

		params.put("pager", pager);
		return carStyleDao.queryList(params);
	}

	public String add(CarStyle carStyle, Admin loginUser) {
		if (checkExist(carStyle)) {
			return "车型名称已存在";
		}
		this.carStyleDao.add(carStyle);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增车型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了名为：" + carStyle.getStyleName() + " 的车型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String update(CarStyle carStyle, Admin loginUser) {
		if (checkExist(carStyle)) {
			return "车型名称已存在";
		}
		this.carStyleDao.update(carStyle);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改车型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了名为：" + carStyle.getStyleName() + " 的车型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	public String delete(String ids, String names, Admin loginUser) {
		// TODO 验证是否被使用
		this.carStyleDao.delete(ids);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("删除车型信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 删除了名为：" + names + " 的车型信息");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}

	/**
	 * 验证车型名称是否存在
	 * 
	 * @author 张霄鹏
	 * @return 存在：true，不存在：false
	 */
	private Boolean checkExist(CarStyle carStyle) {
		CarStyle _carStyle = new CarStyle();
		_carStyle.setStyleName(carStyle.getStyleName());
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("carStyle", _carStyle);
		List<CarStyle> carStyles = this.carStyleDao.queryEqualsList(params);
		if (CollectionUtils.isEmpty(carStyles)) {
			return false;
		} else if (StringUtils.isEmpty(carStyle.getId())) {
			// add
			if (carStyles.size() > 0) {
				return true;
			} else {
				return false;
			}
		} else {
			// update
			if (carStyles.size() > 1) {
				return true;
			} else if (carStyles.get(0).getId().equals(carStyle.getId())) {
				return false;
			} else {
				return true;
			}
		}
	}

}
