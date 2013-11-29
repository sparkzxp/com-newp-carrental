package com.carrental.sm.action.system;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Coupon;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.FileUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICouponService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * 优惠活动管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("coupon")
public class CouponAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private Logger logger = Logger.getLogger(getClass());

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICouponService couponService;
	@Autowired
	private IRentTypeService rentTypeService;

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

		// 车型树json
		List<RentType> rentTypes = this.rentTypeService.queryList(null, null);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject;
		for (RentType r : rentTypes) {
			jsonObject = new JSONObject();
			jsonObject.put("id", r.getId());
			if (isUpdate && !CollectionUtils.isEmpty(coupon.getRentTypes())) {
				for (RentType r2 : coupon.getRentTypes()) {
					if (r.getId().equals(r2.getId())) {
						jsonObject.put("checked", true);
						break;
					}
				}
			}
			jsonObject.put("pId", "0");
			jsonObject.put("name", r.getTypeName());
			jsonArray.add(jsonObject);
		}
		model.addAttribute("rentTypeJson", jsonArray.toString());
		return "admin/couponEdit";
	}

	@RequestMapping(value = "/doCouponEdit", method = RequestMethod.POST)
	public String doCouponEdit(Coupon coupon, String rentTypeIds, @RequestParam(required = false) MultipartFile imageFile, Model model, HttpServletRequest request) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);

		String oldImagePath = coupon.getImagePath();
		try {
			if (coupon.getImageUploadStatus()) {
				if (null == imageFile) {
					coupon.setImagePath("");
				} else {
					String imagePath = request.getSession().getServletContext().getRealPath("upload/coupon/image/" + DateUtil.getCurrentDate() + "/");
					File root = new File(imagePath);
					if (!root.isDirectory()) {
						root.mkdirs();
						logger.info("创建文件夹成功：" + imagePath);
					}
					String imageFileName = FileUtil.gainFileName(imageFile.getOriginalFilename());
					File targetFile = new File(imagePath, imageFileName);
					// 保存
					imageFile.transferTo(targetFile);
					coupon.setImagePath("upload/coupon/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
					logger.info("上传文件成功：upload/coupon/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
				}
			}
			coupon.setUpdatedUser(_admin);
			if (StringUtils.isNotEmpty(coupon.getId())) {
				// update
				model.addAttribute("result", this.couponService.update(coupon, rentTypeIds, _admin));
			} else {
				// add
				coupon.setCreatedUser(_admin);
				model.addAttribute("result", this.couponService.add(coupon, rentTypeIds, _admin));
			}
			model.addAttribute("coupon", coupon);

			if (coupon.getImageUploadStatus() && StringUtils.isNotEmpty(oldImagePath)) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldImagePath);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldImagePath);
			}
		} catch (Exception e) {
			logger.error(e);
			model.addAttribute("result", e.getMessage());
		}
		return "admin/couponEdit";
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
