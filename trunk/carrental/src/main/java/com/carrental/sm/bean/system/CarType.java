package com.carrental.sm.bean.system;

import java.util.List;

/**
 * @author 张霄鹏
 * 
 */
public class CarType extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String typeName;
	private String typeValue;
	private Integer rentFee;// 租用费用
	private Integer insuranceFee;// 保险费用
	private Integer fuelFee;// 油费
	private Integer exceedMinuteToHour;// 超多少分钟算一小时
	private Integer exceedHourFee;// 超小时费
	private Integer exceedMeterToKilometer;// 超多少里算一公里
	private Integer exceedKilometerFee;// 超公里费
	private Integer loadLimit;// 限载人数
	private List<CarSeries> carSeriesList;
	private String content;
}