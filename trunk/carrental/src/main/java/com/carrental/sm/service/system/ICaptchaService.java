package com.carrental.sm.service.system;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Captcha;
import com.carrental.sm.common.MessageException;

/**
 * 验证码管理
 * 
 * @author 张霄鹏
 */
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public interface ICaptchaService {

	/**
	 * 新增
	 * 
	 * @author 张霄鹏
	 * @throws MessageException
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String add(Captcha captcha, Admin user, Admin loginUser) throws MessageException;

	/**
	 * 验证码已使用
	 * 
	 * @author 张霄鹏
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
	String updateUsed(Captcha captcha, Admin loginUser);
}
