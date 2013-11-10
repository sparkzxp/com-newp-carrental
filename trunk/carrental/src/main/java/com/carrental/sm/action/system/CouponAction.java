package com.carrental.sm.action.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICarSeriesService;
import com.carrental.sm.service.system.ICouponService;

/**
 * 优惠活动管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("coupon")
public class CouponAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICouponService couponService;
	@Autowired
	private ICarSeriesService carSeriesService;

	@RequestMapping(value = "/showCouponList")
	public String couponList(Coupon coupon, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Coupon> coupons = this.couponService.queryList(coupon, pager);
		model.addAttribute("coupon", coupon);
		model.addAttribute("coupons", coupons);
		return "admin/couponList";
	}

	@RequestMapping(value = "/toCouponEdit")
	public String toCouponEdit(Coupon coupon, Model model, HttpServletRequest request) {
		boolean isUpdate = StringUtils.isNotEmpty(coupon.getId());
		if (isUpdate) {
			coupon = this.couponService.queryList(coupon, null).get(0);
		}
		model.addAttribute("coupon", coupon);
		// 车系树json
		CarSeries _carSeries = new CarSeries();
		_carSeries.setIsDelete("0");
		List<CarSeries> carSeriesList = this.carSeriesService.queryList(_carSeries, null);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject;
		for (CarSeries r : carSeriesList) {
			jsonObject = new JSONObject();
			jsonObject.put("id", r.getId());
			if (isUpdate && !CollectionUtils.isEmpty(coupon.getCarSeriesList())) {
				for (CarSeries r2 : coupon.getCarSeriesList()) {
					if (r.getId().equals(r2.getId())) {
						jsonObject.put("checked", true);
						break;
					}
				}
			}
			jsonObject.put("pId", "0");
			jsonObject.put("name", r.getSeriesName());
			jsonArray.add(jsonObject);
		}
		model.addAttribute("carSeriesJson", jsonArray.toString());
		return "admin/couponEdit";
	}

	@ResponseBody
	@RequestMapping(value = "/doCouponEdit", method = RequestMethod.POST)
	public Map<String, String> doCouponEdit(Coupon coupon, String carSeriesIds, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		coupon.setUpdatedUser(_admin);
		if (StringUtils.isNotEmpty(coupon.getId())) {
			// update
			result.put("result", this.couponService.update(coupon, carSeriesIds, _admin));
		} else {
			// add
			coupon.setCreatedUser(_admin);
			result.put("result", this.couponService.add(coupon, carSeriesIds, _admin));
		}
		result.put("id", coupon.getId());
		return result;
	}

	@RequestMapping(value = "/toCouponDetail")
	public String toCouponDetail(Coupon coupon, Model model) {
		coupon = this.couponService.queryList(coupon, null).get(0);
		model.addAttribute("coupon", coupon);
		return "admin/couponDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doCouponDelete")
	public Map<String, String> doCouponDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.couponService.delete(ids, names, _admin));
		return result;
	}
}
