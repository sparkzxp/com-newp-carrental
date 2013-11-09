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

	// 预订状态：1，已预订未受理；1-A，预订已取消；2，预订已生效；3，已取车；4，已归还
	String RENT_STATUS_NOT_ACCEPT = "1";
	String RENT_STATUS_BOOK_CANCEL = "1-A";
	String RENT_STATUS_BOOK_EFFECT = "2";
	String RENT_STATUS_PICK_UP_CAR = "3";
	String RENT_STATUS_RETURN_BACK_CAR = "4";
	
	// 业务类型：点到点代驾，机场及车站接送，市用半日租，市用全日租，会务车辆安排，周边省市包车
	String BUSINESS_TYPE_POINT_TO_POINT = "点到点代驾";
	String BUSINESS_TYPE_AIRPORT_OR_STATION = "机场及车站接送";
	String BUSINESS_TYPE_HALF_DAY = "市用半日租";
	String BUSINESS_TYPE_ALL_DAY = "市用全日租";
	String BUSINESS_TYPE_CONFERENCE = "会务车辆安排";
	String BUSINESS_TYPE_PERIPHERY_PROVINCE = "周边省市包车";
	
	// 优惠活动类型：公里满就送，天数租就送，指定车系打折
	String COUPON_TYPE_FREE_KILOMETER = "公里满就送";
	String COUPON_TYPE_FREE_DAY = "天数租就送";
	String COUPON_TYPE_DISCOUNT = "指定车系打折";
}
