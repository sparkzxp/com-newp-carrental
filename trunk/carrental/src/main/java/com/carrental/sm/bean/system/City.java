package com.carrental.sm.bean.system;

/**
 * 城市实体
 * 
 * @author 张霄鹏
 */
public class City extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String cityName;
	private String cityCode;
	private Double multiple;// 价格倍数

	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}

	/**
	 * @param cityName
	 *            the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * @return the cityCode
	 */
	public String getCityCode() {
		return cityCode;
	}

	/**
	 * @param cityCode
	 *            the cityCode to set
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * @return the multiple
	 */
	public Double getMultiple() {
		return multiple;
	}

	/**
	 * @param multiple
	 *            the multiple to set
	 */
	public void setMultiple(Double multiple) {
		this.multiple = multiple;
	}

}
