package com.carrental.sm.action.system;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Notice;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.FileUtil;
import com.carrental.sm.common.bean.Pager;
import com.carrental.sm.service.system.INoticeService;

/**
 * 公告管理
 * 
 * @author 张霄鹏
 */
@Controller
@RequestMapping("notice")
public class NoticeAction {
	private Logger logger = Logger.getLogger(getClass());

	@Autowired
	private INoticeService noticeService;

	@RequestMapping(value = "/showNoticeList")
	public String noticeList(Notice notice, Pager pager, Model model) {
		if (pager == null) {
			pager = new Pager();
		}
		List<Notice> notices = this.noticeService.queryList(notice, pager);
		model.addAttribute("notice", notice);
		model.addAttribute("notices", notices);
		return "admin/noticeList";
	}

	@RequestMapping(value = "/toNoticeEdit")
	public String toNoticeEdit(Notice notice, Model model) {
		if (StringUtils.isNotEmpty(notice.getId())) {
			notice = this.noticeService.queryList(notice, null).get(0);
		}
		model.addAttribute("notice", notice);
		return "admin/noticeEdit";
	}

	@RequestMapping(value = "/doNoticeEdit", method = RequestMethod.POST)
	public String doNoticeEdit(Notice notice, @RequestParam(required = false) MultipartFile imageFile, HttpServletRequest request, Model model) {
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);

		String oldImagePath = notice.getImagePath();
		try {
			if (notice.getImageUploadStatus()) {
				if (null == imageFile) {
					notice.setImagePath("");
				} else {
					String imagePath = request.getSession().getServletContext().getRealPath("upload/notice/image/" + DateUtil.getCurrentDate() + "/");
					File root = new File(imagePath);
					if (!root.isDirectory()) {
						root.mkdirs();
						logger.info("创建文件夹成功：" + imagePath);
					}
					String imageFileName = FileUtil.gainFileName(imageFile.getOriginalFilename());
					File targetFile = new File(imagePath, imageFileName);
					// 保存
					imageFile.transferTo(targetFile);
					notice.setImagePath("upload/notice/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
					logger.info("上传文件成功：upload/notice/image/" + DateUtil.getCurrentDate() + "/" + imageFileName);
				}
			}

			notice.setUpdatedUser(_admin);
			if (StringUtils.isNotEmpty(notice.getId())) {
				// update
				model.addAttribute("result", this.noticeService.update(notice, _admin));
			} else {
				// add
				notice.setCreatedUser(_admin);
				model.addAttribute("result", this.noticeService.add(notice, _admin));
			}
			model.addAttribute("notice", notice);

			if (notice.getImageUploadStatus() && StringUtils.isNotEmpty(oldImagePath)) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + oldImagePath);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + oldImagePath);
			}
		} catch (Exception e) {
			logger.error(e);
			model.addAttribute("result", e.getMessage());
		}
		return "admin/noticeEdit";
	}

	@RequestMapping(value = "/toNoticeDetail")
	public String toNoticeDetail(Notice notice, Model model) {
		notice = this.noticeService.queryList(notice, null).get(0);
		model.addAttribute("notice", notice);
		return "admin/noticeDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/doNoticeDelete")
	public Map<String, String> doNoticeDelete(String ids, String names, String images, HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		Admin _admin = (Admin) request.getSession().getAttribute(Constants.SESSION_ADMIN_KEY);
		result.put("result", this.noticeService.delete(ids, names, _admin));

		if (result.get("result").toString().equals(Constants.OPERATION_SUCCESS)) {
			for (String l : images.split(",")) {
				FileUtil.deleteFile(request.getSession().getServletContext().getRealPath("/") + l);
				logger.info("删除文件成功：" + request.getSession().getServletContext().getRealPath("/") + l);
			}
		}
		return result;
	}
}
