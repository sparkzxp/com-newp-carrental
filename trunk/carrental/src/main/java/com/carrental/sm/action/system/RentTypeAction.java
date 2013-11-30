package com.carrental.sm.action.system;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.bean.system.RentType;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.FileUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICarSeriesService;
import com.carrental.sm.service.system.IRentTypeService;

/**
 * 租用车型管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("rentType")
public class RentTypeAction {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private IRentTypeService rentTypeService;
	@Autowired
	private ICarSeriesService carSeriesService;

	@RequestMapping(value = "/showRentTypeList")
	public String rentTypeList(RentType rentType, Pager pager, Model model, HttpServletRequest request) {
		if (pager == null) {
			pager = new Pager();
		}
		List<RentType> rentTypes = this.rentTypeService.queryList(rentType, pager);
		model.addAttribute("rentType", rentType);
		model.addAttribute("rentTypes", rentTypes);
		return "admin/rentTypeList";
	}

	@RequestMapping(value = "/toRentTypeEdit")
	public String toRentTypeEdit(RentType rentType, Model model) {
		initRentTypeEdit(rentType, model);
		return "admin/rentTypeEdit";
	}

	private void initRentTypeEdit(RentType rentType, Model model) {
		boolean isUpdate = StringUtils.isNotEmpty(rentType.getId());
		if (isUpdate) {
			rentType = this.rentTypeService.queryList(rentType, null).get(0);
		}
		model.addAttribute("rentType", rentType);
		// 车系树json
		CarSeries _carSeries = new CarSeries();
		_carSeries.setIsDelete("0");
		List<CarSeries> carSeriesList = this.carSeriesService.queryList(_carSeries, null);
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject;
		for (CarSeries r : carSeriesList) {
			jsonObject = new JSONObject();
			jsonObject.put("id", r.getId());
			if (isUpdate && !CollectionUtils.isEmpty(rentType.getCarSeriesList())) {
				for (CarSeries r2 : rentType.getCarSeriesList()) {
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
	}

	@RequestMapping(value = "/doRentTypeEdit", method = RequestMethod.POST)
	public String doRentTypeEdit(RentType rentType, String carSeriesIds, @RequestParam(required = false) MultipartFile imageFile, Model model, HttpServletRequest request) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);

		String oldImagePath = rentType.getImagePath();
		try {
			if (rentType.getImageUploadStatus()) {
				if (null == imageFile) {
					rentType.setImagePath("");
				} else {
					String imagePath = request.getSession().getServletContext().getRealPath("upload/rentType/image/" + DateUtil.getCurrentDate() + "/");
					File root = new File(imagePath);
					if (!root.isDirectory()) {
						root.mkdirs();
						logger.info("创建文件夹成功：" + imagePath);
					}
					String imageFileName = FileUtil.gainFileName(imageFile.getOriginalFilename());
					File targetFile = new File(imagePath, imageFileName);
					// 保存
					imageFile.transferTo(targetFile);
					rentType.setImagePath("upload/rentType/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
					logger.info("上传文件成功：upload/rentType/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
				}
			}
			rentType.setUpdatedUser(_admin);
			if (StringUtils.isNotEmpty(rentType.getId())) {
				// update
				model.addAttribute("result", this.rentTypeService.update(rentType, carSeriesIds, _admin));
			} else {
				// add
				rentType.setCreatedUser(_admin);
				model.addAttribute("result", this.rentTypeService.add(rentType, carSeriesIds, _admin));
			}
			model.addAttribute("rentType", rentType);

			if (rentType.getImageUploadStatus() && StringUtils.isNotEmpty(oldImagePath)) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldImagePath);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldImagePath);
			}
		} catch (Exception e) {
			logger.error(e);
			model.addAttribute("result", e.getMessage());
		}

		initRentTypeEdit(rentType, model);
		return "admin/rentTypeEdit";
	}

	@RequestMapping(value = "/toRentTypeDetail")
	public String toRentTypeDetail(RentType rentType, Model model) {
		rentType = this.rentTypeService.queryList(rentType, null).get(0);
		model.addAttribute("rentType", rentType);
		return "admin/rentTypeDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doRentTypeDelete")
	public Map<String, String> doRentTypeDelete(String ids, String names, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.rentTypeService.delete(ids, names, _admin));
		// TODO 删除租用车型图片
		return result;
	}
}
