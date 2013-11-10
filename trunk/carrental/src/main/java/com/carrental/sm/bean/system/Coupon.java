package com.carrental.sm.bean.system;

import java.sql.Timestamp;
import java.util.List;

/**
 * @author 张霄鹏
 * 
 */
public class Coupon extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String couponTitle;
	private Timestamp startDate;
	private Timestamp endDate;
	private String couponType;
	private Integer fullKilometer;
	private Integer freeKilometer;
	private Integer rentDays;
	private Integer freeDays;
	private Double discount;
	private List<CarSeries> carSeriesList;
	private String content;

	/**
	 * @return the couponTitle
	 */
	public String getCouponTitle() {
		return couponTitle;
	}

	/**
	 * @param couponTitle
	 *            the couponTitle to set
	 */
	public void setCouponTitle(String couponTitle) {
		this.couponTitle = couponTitle;
	}

	/**
	 * @return the startDate
	 */
	public Timestamp getStartDate() {
		return startDate;
	}

	/**
	 * @param startDate
	 *            the startDate to set
	 */
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	/**
	 * @return the endDate
	 */
	public Timestamp getEndDate() {
		return endDate;
	}

	/**
	 * @param endDate
	 *            the endDate to set
	 */
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	/**
	 * @return the couponType
	 */
	public String getCouponType() {
		return couponType;
	}

	/**
	 * @param couponType
	 *            the couponType to set
	 */
	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	/**
	 * @return the fullKilometer
	 */
	public Integer getFullKilometer() {
		return fullKilometer;
	}

	/**
	 * @param fullKilometer
	 *            the fullKilometer to set
	 */
	public void setFullKilometer(Integer fullKilometer) {
		this.fullKilometer = fullKilometer;
	}

	/**
	 * @return the freeKilometer
	 */
	public Integer getFreeKilometer() {
		return freeKilometer;
	}

	/**
	 * @param freeKilometer
	 *            the freeKilometer to set
	 */
	public void setFreeKilometer(Integer freeKilometer) {
		this.freeKilometer = freeKilometer;
	}

	/**
	 * @return the rentDays
	 */
	public Integer getRentDays() {
		return rentDays;
	}

	/**
	 * @param rentDays
	 *            the rentDays to set
	 */
	public void setRentDays(Integer rentDays) {
		this.rentDays = rentDays;
	}

	/**
	 * @return the freeDays
	 */
	public Integer getFreeDays() {
		return freeDays;
	}

	/**
	 * @param freeDays
	 *            the freeDays to set
	 */
	public void setFreeDays(Integer freeDays) {
		this.freeDays = freeDays;
	}

	/**
	 * @return the carSeriesList
	 */
	public List<CarSeries> getCarSeriesList() {
		return carSeriesList;
	}

	/**
	 * @param carSeriesList
	 *            the carSeriesList to set
	 */
	public void setCarSeriesList(List<CarSeries> carSeriesList) {
		this.carSeriesList = carSeriesList;
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
	 * @return the discount
	 */
	public Double getDiscount() {
		return discount;
	}

	/**
	 * @param discount
	 *            the discount to set
	 */
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
}
