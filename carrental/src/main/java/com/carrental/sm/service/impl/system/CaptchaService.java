package com.carrental.sm.service.impl.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrental.sm.bean.system.Admin;
import com.carrental.sm.bean.system.Captcha;
import com.carrental.sm.bean.system.Log;
import com.carrental.sm.bean.system.Message;
import com.carrental.sm.common.Constants;
import com.carrental.sm.common.DateUtil;
import com.carrental.sm.common.MessageException;
import com.carrental.sm.common.MessageUtil;
import com.carrental.sm.dao.system.ICaptchaDao;
import com.carrental.sm.dao.system.ILogDao;
import com.carrental.sm.dao.system.IMessageDao;
import com.carrental.sm.service.system.ICaptchaService;

/**
 * @author 张霄鹏
 * 
 */
@Service
public class CaptchaService implements ICaptchaService {

	@Autowired
	private ICaptchaDao captchaDao;
	@Autowired
	private ILogDao logDao;
	@Autowired
	private IMessageDao messageDao;

	public String add(Captcha captcha, Admin user, Admin loginUser) throws MessageException {
		String result = Constants.OPERATION_SUCCESS;

		this.captchaDao.add(captcha);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("新增验证码信息");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 新增了" + captcha.getUsedFor() + "的验证码：" + captcha.getCaptcha());
		log.setLevel("5");
		this.logDao.add(log);

		// TODO 发送短信验证码
		Message message = new Message();
		message.setCreatedUser(loginUser);
		message.setTitle(Constants.MESSAGE_PHONE_CAPTCHA);
		message.setReceiveNo(user.getPhone());
		message.setContent("短信验证码：" + captcha.getCaptcha() + "，验证码请在15分钟内使用，仅限使用一次" + Constants.MESSAGE_SUFFIX);
		this.messageDao.add(message);
		result = MessageUtil.sendMessage(message);
		if (!Constants.OPERATION_SUCCESS.equals(result)) {
			throw new MessageException(result);
		}

		return result;
	}

	public String updateUsed(Captcha captcha, Admin loginUser) {
		this.captchaDao.updateUsed(captcha);

		Log log = new Log();
		log.setCreatedUser(loginUser);
		log.setTitle("修改验证码已使用");
		log.setContent("用户：" + loginUser.getAdminName() + " 于 " + DateUtil.getCurrentDateTime() + " 修改了" + captcha.getUsedFor() + "的验证码：" + captcha.getCaptcha() + " 为已使用");
		log.setLevel("5");
		this.logDao.add(log);
		return Constants.OPERATION_SUCCESS;
	}
}
