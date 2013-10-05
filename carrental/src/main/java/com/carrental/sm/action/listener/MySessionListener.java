package com.carrental.sm.action.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;

import com.carrental.sm.common.Constants;

/**
 * @author 张霄鹏
 */
public class MySessionListener implements HttpSessionListener {

	private static Logger logger = Logger.getLogger(MySessionListener.class);
	public static Map<String, HttpSession> sessionMap_s = new HashMap<String, HttpSession>();
	public static Map<String, Object> configMap_s = new HashMap<String, Object>();

	/**
	 * @author 张霄鹏
	 */
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		HttpSession session = sessionEvent.getSession();
		try {
			session.setAttribute(Constants.SESSION_USER_MARK, "INITIAL_VALUE");
			sessionMap_s.put(session.getId(), session);

			logger.debug("Session创建:" + session);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

	/**
	 * @author 张霄鹏
	 */
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		HttpSession session = sessionEvent.getSession();
		try {
			logger.debug("Session过期: " + session + "已销毁");
			sessionMap_s.remove(session.getId());
			session.setAttribute(Constants.SESSION_USER_KEY, null);
			session.setAttribute(Constants.SESSION_USER_MARK, null);

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
