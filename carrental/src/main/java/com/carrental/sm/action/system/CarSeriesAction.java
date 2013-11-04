package com.carrental.sm.action.system;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.CarSeries;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.CustomTimestampEditor;
import com.carrental.sm.common.FileUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.ICarSeriesService;

/**
 * 车系管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("carSeries")
public class CarSeriesAction {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private Logger logger = Logger.getLogger(getClass());

	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
		binder.registerCustomEditor(Timestamp.class, new CustomTimestampEditor(sdf, true));
	}

	@Autowired
	private ICarSeriesService carSeriesService;

	@RequestMapping(value = "/showCarSeriesList")
	public String carSeriesList(CarSeries carSeries, Pager pager, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<CarSeries> carSeriesList = this.carSeriesService.queryList(carSeries, pager);
		model.addAttribute("carSeries", carSeries);
		model.addAttribute("carSeriesList", carSeriesList);

		return "admin/carSeriesList";
	}

	@RequestMapping(value = "/toCarSeriesEdit")
	public String toCarSeriesEdit(CarSeries carSeries, Model model) {
		if (StringUtils.isNotEmpty(carSeries.getId())) {
			carSeries = this.carSeriesService.queryList(carSeries, null).get(0);
		}
		model.addAttribute("carSeries", carSeries);

		return "admin/carSeriesEdit";
	}

	@RequestMapping(value = "/doCarSeriesEdit", method = RequestMethod.POST)
	public String doCarSeriesEdit(CarSeries carSeries, @RequestParam(required = false) MultipartFile logoImgFile, @RequestParam(required = false) MultipartFile seriesImgFile, HttpServletRequest request, Model model) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);

		String oldManufacturerLogo = carSeries.getManufacturerLogoPath();
		String oldSeriesImg = carSeries.getSeriesImgPath();
		try {
			if (carSeries.getManufacturerLogoUploadStatus()) {
				String logoPath = request.getSession().getServletContext().getRealPath("upload/car_series/logo/");
				File root = new File(logoPath);
				if (!root.isDirectory()) {
					root.mkdirs();
					logger.info("创建文件夹成功：" + logoPath);
				}
				String logoFileName = FileUtil.gainFileName(logoImgFile.getOriginalFilename());
				File targetFile = new File(logoPath, logoFileName);
				// 保存
				logoImgFile.transferTo(targetFile);
				carSeries.setManufacturerLogoPath("upload/car_series/logo/" + logoFileName);
				logger.info("上传文件成功：" + "upload/car_series/logo/" + logoFileName);
			}

			if (carSeries.getSeriesImgUploadStatus()) {
				String seriesPath = request.getSession().getServletContext().getRealPath("upload/car_series/series/");
				File root = new File(seriesPath);
				if (!root.isDirectory()) {
					root.mkdirs();
					logger.info("创建文件夹成功：" + seriesPath);
				}
				String seriesFileName = FileUtil.gainFileName(seriesImgFile.getOriginalFilename());
				File targetFile = new File(seriesPath, seriesFileName);
				// 保存
				seriesImgFile.transferTo(targetFile);
				carSeries.setSeriesImgPath("upload/car_series/series/" + seriesFileName);
				logger.info("上传文件成功：" + "upload/car_series/series/" + seriesFileName);
			}

			carSeries.setUpdatedUser(_admin);
			if (StringUtils.isNotEmpty(carSeries.getId())) {
				// update
				model.addAttribute("result", this.carSeriesService.update(carSeries, _admin));
			} else {
				// add
				carSeries.setCreatedUser(_admin);
				model.addAttribute("result", this.carSeriesService.add(carSeries, _admin));
			}
			model.addAttribute("carSeries", carSeries);
		} catch (Exception e) {
			logger.error(e);
			model.addAttribute("result", e.getMessage());
		}

		if (carSeries.getManufacturerLogoUploadStatus() && StringUtils.isNotEmpty(oldManufacturerLogo)) {
			FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldManufacturerLogo);
			logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldManufacturerLogo);
		}
		if (carSeries.getSeriesImgUploadStatus() && StringUtils.isNotEmpty(oldSeriesImg)) {
			FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldSeriesImg);
			logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldSeriesImg);
		}
		return "admin/carSeriesEdit";
	}

	@RequestMapping(value = "/toCarSeriesDetail")
	public String toCarSeriesDetail(CarSeries carSeries, Model model) {
		carSeries = this.carSeriesService.queryList(carSeries, null).get(0);
		model.addAttribute("carSeries", carSeries);
		return "admin/carSeriesDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doCarSeriesDelete")
	public Map<String, String> doCarSeriesDelete(String ids, String names, String logos, String series, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.carSeriesService.delete(ids, names, _admin));

		if (result.get("result").toString().equals(Constants.OPERATION_SUCCESS)) {
			for (String l : logos.split(",")) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + l);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + l);
			}
			for (String s : series.split(",")) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + s);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + s);
			}
		}
		return result;
	}
}
