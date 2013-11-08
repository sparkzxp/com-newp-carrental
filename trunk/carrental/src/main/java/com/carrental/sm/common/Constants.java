package com.carrental.sm.common;

/**
 * 常量
 * 
 * @author 张霄鹏
 */
public interface Constants {

	String SESSION_ADMIN_KEY = "adminInfo";
	String SESSION_ROLE_KEY = "roleInfo";
	String SESSION_ADMIN_MARK = "adminSessionMark";

	String USER_CUSTOM_PERSONAL = "CUSTOM_PERSONAL";
	String USER_CUSTOM_COMPANY = "CUSTOM_COMPANY";
	String USER_ADMIN = "ADMIN";

	String DEFAULT_PASSWORD = "123456";
	String OPERATION_SUCCESS = "SUCCESS";

	// 预订状态，1，已预订未受理；1-A，预订已取消；2，预订已生效；3，已取车；4，已归还
	String RENT_STATUS_NOT_ACCEPT = "1";
	String RENT_STATUS_BOOK_CANCEL = "1-A";
	String RENT_STATUS_BOOK_EFFECT = "2";
	String RENT_STATUS_TAKE_CAR = "3";
	String RENT_STATUS_RETURN_BACK_CAR = "4";
}
