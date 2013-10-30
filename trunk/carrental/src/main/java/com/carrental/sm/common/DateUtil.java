package com.carrental.sm.common;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 张霄鹏
 */
public class DateUtil {

	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("HH:mm:ss");
	private static SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * @author 张霄鹏
	 */
	public static String getCurrentDate() {
		return DATE_FORMAT.format(new Date());
	}

	/**
	 * @author 张霄鹏
	 */
	public static String getCurrentTime() {
		return TIME_FORMAT.format(new Date());
	}

	/**
	 * @author 张霄鹏
	 */
	public static String getCurrentDateTime() {
		return DATE_TIME_FORMAT.format(new Date());
	}

	/**
	 * @author 张霄鹏
	 */
	public static String formatDate(String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date());
	}
}
