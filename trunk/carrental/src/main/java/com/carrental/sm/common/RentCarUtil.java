package com.carrental.sm.common;

/**
 * @author 张霄鹏
 * 
 */
public class RentCarUtil {

	public static String newRentNumber(int suffixNum) {
		suffixNum++;
		String suffix = "";
		if (suffixNum < 10) {
			suffix = "000" + String.valueOf(suffixNum);
		} else if (suffixNum < 100) {
			suffix = "00" + String.valueOf(suffixNum);
		} else if (suffixNum < 1000) {
			suffix = "0" + String.valueOf(suffixNum);
		} else {
			suffix = String.valueOf(suffixNum);
		}
		return "ZC" + DateUtil.formatCurrentDate("yyyyMMhh") + "-" + suffix;
	}
}
