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

	public static String getFormatDate(Date date) {
		return DATE_FORMAT.format(date);
	}

	/**
	 * @author 张霄鹏
	 */
	public static String getCurrentTime() {
		return TIME_FORMAT.format(new Date());
	}

	public static String getFormatTime(Date date) {
		return TIME_FORMAT.format(date);
	}

	/**
	 * @author 张霄鹏
	 */
	public static String getCurrentDateTime() {
		return DATE_TIME_FORMAT.format(new Date());
	}

	public static String getFormatDateTime(Date date) {
		return DATE_TIME_FORMAT.format(date);
	}

	/**
	 * @author 张霄鹏
	 */
	public static String formatCurrentDate(String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date());
	}

	public static String formatDate(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}
}
