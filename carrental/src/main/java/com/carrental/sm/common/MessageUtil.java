package com.carrental.sm.common;

import com.carrental.sm.bean.system.Message;

/**
 * 短信发送
 * 
 * @author 张霄鹏
 */
public class MessageUtil {

	public static String sendMessage(Message message) {
		String result = Constants.OPERATION_SUCCESS;
		// TODO 发送短信
		try {
//			Integer.parseInt("s");
		} catch (Exception e) {
			result = e.getMessage();
		}
		return result;
	}
}
