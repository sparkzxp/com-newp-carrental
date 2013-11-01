package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarStyle;
import com.carrental.sm.bean.system.Dictionary;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICarStyleService;
import com.carrental.sm.service.system.IDictionaryService;

/**
 * 车型管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("carStyle")
public class CarStyleAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		//binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICarStyleService carStyleService;
	@Autowired
	private IDictionaryService dictionaryService;

	@RequestMapping(value = "/showCarStyleList")
	public String carStyleList(CarStyle carStyle, Pager pager, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<CarStyle> carStyles = this.carStyleService.queryList(carStyle, pager);
		model.addAttribute("carStyle", carStyle);
		model.addAttribute("carStyles", carStyles);

		model.addAttribute("manufacturers", this.dictionaryService.queryList(new Dictionary(Constants.DICT_CAR_MANUFACTURER), null));
		if (null != carStyle && null != carStyle.getSeries() && null != carStyle.getSeries().getParent() && StringUtils.isNotEmpty(carStyle.getSeries().getParent().getId())) {
			Dictionary _d = new Dictionary();
			_d.setId(carStyle.getSeries().getParent().getId());
			model.addAttribute("serieses", this.dictionaryService.queryList(new Dictionary(_d), null));
		} else {
			model.addAttribute("serieses", null);
		}
		return "admin/carStyleList";
	}

	@RequestMapping(value = "/toCarStyleEdit")
	public String toCarStyleEdit(CarStyle carStyle, Model model) {
		if (StringUtils.isNotEmpty(carStyle.getId())) {
			carStyle = this.carStyleService.queryList(carStyle, null).get(0);
		}
		model.addAttribute("carStyle", carStyle);

		model.addAttribute("manufacturers", this.dictionaryService.queryList(new Dictionary(Constants.DICT_CAR_MANUFACTURER), null));
		if (null != carStyle && null != carStyle.getSeries() && null != carStyle.getSeries().getParent() && StringUtils.isNotEmpty(carStyle.getSeries().getParent().getId())) {
			Dictionary _d = new Dictionary();
			_d.setId(carStyle.getSeries().getParent().getId());
			model.addAttribute("serieses", this.dictionaryService.queryList(new Dictionary(_d), null));
		} else {
			model.addAttribute("serieses", null);
		}
		return "admin/carStyleEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doCarStyleEdit", method = RequestMethod.POST)
	public Map<String, String> doCarStyleEdit(CarStyle carStyle, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		carStyle.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(carStyle.getId())) {
			// update
			result.put("result", this.carStyleService.update(carStyle, _admin));
		} else {
			// add
			carStyle.setCreatedUser(_admin);
			result.put("result", this.carStyleService.add(carStyle, _admin));
		}
		result.put("id", carStyle.getId());
		return result;
	}

	@RequestMapping(value = "/toCarStyleDetail")
	public String toCarStyleDetail(CarStyle carStyle, Model model) {
		carStyle = this.carStyleService.queryList(carStyle, null).get(0);
		model.addAttribute("carStyle", carStyle);
		return "admin/carStyleDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doCarStyleDelete")
	public Map<String, String> doCarStyleDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.carStyleService.delete(ids, names, _admin));
		return result;
	}
}
