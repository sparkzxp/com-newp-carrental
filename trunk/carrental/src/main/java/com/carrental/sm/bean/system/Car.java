package com.carrental.sm.bean.system;

import java.sql.Timestamp;

/**
 * @author 张霄鹏
 *
 */
public class Car extends BaseBean{

	private static final long serialVersionUID = 1L;

	private String plateNumber;//车牌号码
	private String purchaser;// 购买人
	private String purchaserPhone;// 购买人电话
	private Timestamp purchaseDate;// 购买日期
	private String purchasePrice;// 购买价格
	private CarSeries carSeries;// 车系
	private City city;// 所属城市
	
}
