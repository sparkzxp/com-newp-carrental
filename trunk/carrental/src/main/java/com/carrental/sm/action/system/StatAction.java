package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.City;
import com.carrental.sm.bean.system.Role;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.service.system.IRentCarService;

/**
 * 数据统计汇总
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("stat")
public class StatAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private IRentCarService rentCarService;

	// -----------------------------------数据统计汇总 start---------------------------------------
	@RequestMapping(value = "/showRentStatList")
	public String showRentStatList(Timestamp statStartDate, Timestamp statEndDate, Model model, HttpServletRequest request) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		if (_admin == null) {
			return Constants.JSP_LOGIN;
		}
		Role role = (Role) request.getSession().getAttribute(Constants.SESSION_ROLE_KEY);
		String cityId = "";
		if (null != role && null != role.getCity()) {
			cityId = role.getCity().getId();
		}

		if (statStartDate != null && statEndDate != null && statStartDate.after(statEndDate)) {
			model.addAttribute("result", "统计开始时间不能在结束时间之后");
			model.addAttribute("statStartDate", statStartDate);
			model.addAttribute("statEndDate", statEndDate);
		} else {
			Calendar start = Calendar.getInstance();
			if (null != statStartDate) {
				start.setTime(statStartDate);
			} else {
				start.add(Calendar.MONTH, -2);
			}
			start.set(Calendar.DAY_OF_MONTH, 1);
			start.set(Calendar.HOUR_OF_DAY, 0);
			start.set(Calendar.MINUTE, 0);
			start.set(Calendar.SECOND, 0);
			start.set(Calendar.MILLISECOND, 0);
			statStartDate = new Timestamp(start.getTime().getTime());
			model.addAttribute("statStartDate", statStartDate);

			Calendar end = Calendar.getInstance();
			if (null != statEndDate) {
				end.setTime(statEndDate);
			}
			end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH));
			end.set(Calendar.HOUR_OF_DAY, 23);
			end.set(Calendar.MINUTE, 59);
			end.set(Calendar.SECOND, 59);
			end.set(Calendar.MILLISECOND, 999);
			statEndDate = new Timestamp(end.getTime().getTime());
			model.addAttribute("statEndDate", statEndDate);

			List<Map<String, Object>> list = this.rentCarService.statRentList(statStartDate, statEndDate, cityId);
			model.addAttribute("statStartDate", statStartDate);
			model.addAttribute("statEndDate", statEndDate);
			model.addAttribute("statList", list);
		}
		return "admin/rentStatList";
	}
	// -----------------------------------数据统计汇总 end---------------------------------------
}
