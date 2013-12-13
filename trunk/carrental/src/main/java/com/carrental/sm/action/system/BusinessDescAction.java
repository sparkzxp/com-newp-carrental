package com.carrental.sm.action.system;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.BusinessDesc;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.FileUtil;
import com.carrental.sm.service.system.IBusinessDescService;

/**
 * 业务描述管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("businessDesc")
public class BusinessDescAction {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private IBusinessDescService businessDescService;

	@RequestMapping(value = "/showBusinessDescList")
	public String businessDescList(BusinessDesc businessDesc, Model model) {
		List<BusinessDesc> businessDescs = this.businessDescService.queryEqualsList(businessDesc);
		model.addAttribute("businessDesc", businessDesc);
		model.addAttribute("businessDescs", businessDescs);
		return "admin/businessDescList";
	}

	@RequestMapping(value = "/toBusinessDescEdit")
	public String toBusinessDescEdit(BusinessDesc businessDesc, Model model) {
		businessDesc = this.businessDescService.queryEqualsList(businessDesc).get(0);
		model.addAttribute("businessDesc", businessDesc);
		return "admin/businessDescEdit";
	}

	@RequestMapping(value = "/doBusinessDescEdit", method = RequestMethod.POST)
	public String doBusinessDescEdit(BusinessDesc businessDesc, @RequestParam(required = false) MultipartFile imageFile, Model model, HttpServletRequest request) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);

		String oldImagePath = businessDesc.getImagePath();
		try {
			if (businessDesc.getImageUploadStatus()) {
				if (null == imageFile) {
					businessDesc.setImagePath("");
				} else {
					String imagePath = request.getSession().getServletContext().getRealPath("upload/businessDesc/image/" + DateUtil.getCurrentDate() + "/");
					File root = new File(imagePath);
					if (!root.isDirectory()) {
						root.mkdirs();
						logger.info("创建文件夹成功：" + imagePath);
					}
					String imageFileName = FileUtil.gainFileName(imageFile.getOriginalFilename());
					File targetFile = new File(imagePath, imageFileName);
					// 保存
					imageFile.transferTo(targetFile);
					businessDesc.setImagePath("upload/businessDesc/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
					logger.info("上传文件成功：upload/businessDesc/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
				}
			}
			businessDesc.setUpdatedUser(_admin);
			// update
			model.addAttribute("result", this.businessDescService.update(businessDesc, _admin));
			model.addAttribute("businessDesc", businessDesc);

			if (businessDesc.getImageUploadStatus() && StringUtils.isNotEmpty(oldImagePath)) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldImagePath);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldImagePath);
			}
		} catch (Exception e) {
			logger.error(e);
			model.addAttribute("result", e.getMessage());
		}

		return "admin/businessDescEdit";
	}

	@RequestMapping(value = "/toBusinessDescDetail")
	public String toBusinessDescDetail(BusinessDesc businessDesc, Model model) {
		businessDesc = this.businessDescService.queryEqualsList(businessDesc).get(0);
		model.addAttribute("businessDesc", businessDesc);
		return "admin/businessDescDetail";
	}
}
