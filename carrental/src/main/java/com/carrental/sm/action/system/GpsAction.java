package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Tracker;
import com.carrental.sm.service.system.IRentCarService;
import com.carrental.sm.ws.impl.JitianService;

/**
 * GPS信息管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("gps")
public class GpsAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private IRentCarService rentCarService;

	@RequestMapping(value = "/toGpsMap")
	public String toGpsMap(String rentCarId, Tracker tracker, Model model) {
		if (StringUtils.isNotEmpty(rentCarId)) {
			RentCar _rentCar = new RentCar();
			_rentCar.setId(rentCarId);
			List<RentCar> rentCars = this.rentCarService.queryList(_rentCar, null);
			if (CollectionUtils.isNotEmpty(rentCars)) {
				_rentCar = rentCars.get(0);
				tracker.setCarNumber(_rentCar.getCar().getPlateNumber());
				if (null != _rentCar.getPickUpDt()) {
					tracker.setQueryStartDt(_rentCar.getPickUpDt());
				} else {
					tracker.setQueryStartDt(_rentCar.getBookPickUpDt());
				}
				if (null != _rentCar.getGiveBackDt()) {
					tracker.setQueryEndDt(_rentCar.getGiveBackDt());
				} else {
					tracker.setQueryEndDt(_rentCar.getBookGiveBackDt());
				}

				JitianService jitianService = new JitianService();
				JSONObject json = jitianService.fetchGps(tracker);
				if (null != json && json.size() > 0) {
					model.addAttribute("result", json.get("result"));
					model.addAttribute("latlng", json.get("latlng"));
				}
			}
		}
		model.addAttribute("tracker", tracker);
		return "admin/gpsMap";
	}

	@ResponseBody
	@RequestMapping(value = "/doGpsFetch", method = RequestMethod.POST)
	public Map<String, Object> doGpsFetch(Tracker tracker, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();

		JitianService jitianService = new JitianService();
		JSONObject json = jitianService.fetchGps(tracker);
		result.put("result", json.get("result"));
		result.put("latlng", json.get("latlng"));

		return result;
	}
}
