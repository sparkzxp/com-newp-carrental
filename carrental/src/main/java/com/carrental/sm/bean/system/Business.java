package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Business extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String businessType;
	private Integer rentFee;// 租用费用
	private Integer insuranceFee;// 保险费用
	private Integer fuelFee;// 油费
	private Integer exceedMinuteToHour;// 超多少分钟算一小时
	private Integer exceedHourFee;// 超小时费
	private Integer exceedMeterToKilometer;// 超多少里算一公里
	private Integer exceedKilometerFee;// 超公里费
	private String content;
	private RentType rentType;

	/**
	 * @return the businessType
	 */
	public String getBusinessType() {
		return businessType;
	}

	/**
	 * @param businessType
	 *            the businessType to set
	 */
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	/**
	 * @return the rentFee
	 */
	public Integer getRentFee() {
		return rentFee;
	}

	/**
	 * @param rentFee
	 *            the rentFee to set
	 */
	public void setRentFee(Integer rentFee) {
		this.rentFee = rentFee;
	}

	/**
	 * @return the insuranceFee
	 */
	public Integer getInsuranceFee() {
		return insuranceFee;
	}

	/**
	 * @param insuranceFee
	 *            the insuranceFee to set
	 */
	public void setInsuranceFee(Integer insuranceFee) {
		this.insuranceFee = insuranceFee;
	}

	/**
	 * @return the fuelFee
	 */
	public Integer getFuelFee() {
		return fuelFee;
	}

	/**
	 * @param fuelFee
	 *            the fuelFee to set
	 */
	public void setFuelFee(Integer fuelFee) {
		this.fuelFee = fuelFee;
	}

	/**
	 * @return the exceedMinuteToHour
	 */
	public Integer getExceedMinuteToHour() {
		return exceedMinuteToHour;
	}

	/**
	 * @param exceedMinuteToHour
	 *            the exceedMinuteToHour to set
	 */
	public void setExceedMinuteToHour(Integer exceedMinuteToHour) {
		this.exceedMinuteToHour = exceedMinuteToHour;
	}

	/**
	 * @return the exceedHourFee
	 */
	public Integer getExceedHourFee() {
		return exceedHourFee;
	}

	/**
	 * @param exceedHourFee
	 *            the exceedHourFee to set
	 */
	public void setExceedHourFee(Integer exceedHourFee) {
		this.exceedHourFee = exceedHourFee;
	}

	/**
	 * @return the exceedMeterToKilometer
	 */
	public Integer getExceedMeterToKilometer() {
		return exceedMeterToKilometer;
	}

	/**
	 * @param exceedMeterToKilometer
	 *            the exceedMeterToKilometer to set
	 */
	public void setExceedMeterToKilometer(Integer exceedMeterToKilometer) {
		this.exceedMeterToKilometer = exceedMeterToKilometer;
	}

	/**
	 * @return the exceedKilometerFee
	 */
	public Integer getExceedKilometerFee() {
		return exceedKilometerFee;
	}

	/**
	 * @param exceedKilometerFee
	 *            the exceedKilometerFee to set
	 */
	public void setExceedKilometerFee(Integer exceedKilometerFee) {
		this.exceedKilometerFee = exceedKilometerFee;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content
	 *            the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the rentType
	 */
	public RentType getRentType() {
		return rentType;
	}

	/**
	 * @param rentType
	 *            the rentType to set
	 */
	public void setRentType(RentType rentType) {
		this.rentType = rentType;
	}

}