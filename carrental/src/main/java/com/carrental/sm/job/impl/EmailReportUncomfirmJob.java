package com.carrental.sm.job.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.RentCar;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.SimpleMailSender;
import com.carrental.sm.service.system.IAdminService;
import com.carrental.sm.service.system.IRentCarService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class EmailReportUncomfirmJob extends QuartzJobBean {

	private Logger logger = Logger.getLogger(getClass());
	private IRentCarService rentCarService;
	private IAdminService adminService;

	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		logger.debug("-------------------------------quartz job start----------------------------");
		Properties prop = System.getProperties();
		try {
			prop.load(getClass().getResourceAsStream("/mail.properties"));
		} catch (IOException e) {
			logger.error(e.getMessage());
		} catch (Exception e) {
			logger.error(e.getMessage());
		}

		if (null != prop.getProperty("mail.smtp.username")) {
			List<RentCar> rentCars = this.rentCarService.queryUncomfirmList(null);
			Admin _admin = new Admin();
			_admin.setIsDelete("0");
			_admin.setInBlacklist("0");
			_admin.setType(Constants.USER_ADMIN);

			String cityId = "";
			List<String> recipients = null;
			for (RentCar r : rentCars) {
				if (!cityId.equals(r.getCity().getId())) {
					cityId = r.getCity().getId();
					_admin.setCity(r.getCity());
					List<Admin> admins = this.adminService.queryEqualsList(_admin, null);
					recipients = new ArrayList<String>();
					for (Admin a : admins) {
						if (StringUtils.isNotEmpty(a.getEmail())) {
							recipients.add(a.getEmail());
						}
					}
				}
				SimpleMailSender serviceSms = new SimpleMailSender(prop.getProperty("mail.smtp.username"), prop.getProperty("mail.smtp.password"));
				StringBuffer content = new StringBuffer();
				content.append("用户【").append(r.getBookUser().getAdminName()).append(r.getBookUser().getSex().equals("male") ? " 先生" : " 女士");
				content.append("】于【").append(DateUtil.formatDate(r.getBookPickUpDt(), "yyyy-MM-dd HH:mm"));
				content.append("】在线预订了【").append(r.getBusiness().getBusinessType()).append("】业务的【");
				content.append(r.getRentType().getTypeName()).append("】车型，");
				content.append("预订编号为：").append(r.getRentNumber());
				content.append("，联系电话为：").append(r.getBookUser().getPhone()).append("，请尽快确认！");
				try {
					serviceSms.send(recipients, "[紧急]确认在线预订", content.toString());
				} catch (AddressException e) {
					logger.error(e.getMessage());
				} catch (MessagingException e) {
					logger.error(e.getMessage());
				}
			}
		}
		logger.debug("-------------------------------quartz job end----------------------------");
	}

	/**
	 * @return the rentCarService
	 */
	public IRentCarService getRentCarService() {
		return rentCarService;
	}

	/**
	 * @param rentCarService
	 *            the rentCarService to set
	 */
	public void setRentCarService(IRentCarService rentCarService) {
		this.rentCarService = rentCarService;
	}

	/**
	 * @return the adminService
	 */
	public IAdminService getAdminService() {
		return adminService;
	}

	/**
	 * @param adminService
	 *            the adminService to set
	 */
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

}
