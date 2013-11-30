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
	private Integer rentHours;
	private Integer freeHours;
	private Double discount;
	private List<RentType> rentTypes;
//	private List<CarSeries> carSeriesList;
	private String content;
	private String imagePath;
	private Boolean imageUploadStatus;// 不存数据库

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
	 * @return the rentHours
	 */
	public Integer getRentHours() {
		return rentHours;
	}

	/**
	 * @param rentHours
	 *            the rentHours to set
	 */
	public void setRentHours(Integer rentHours) {
		this.rentHours = rentHours;
	}

	/**
	 * @return the freeHours
	 */
	public Integer getFreeHours() {
		return freeHours;
	}

	/**
	 * @param freeHours
	 *            the freeHours to set
	 */
	public void setFreeHours(Integer freeHours) {
		this.freeHours = freeHours;
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

	/**
	 * @return the imagePath
	 */
	public String getImagePath() {
		return imagePath;
	}

	/**
	 * @param imagePath
	 *            the imagePath to set
	 */
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	/**
	 * @return the imageUploadStatus
	 */
	public Boolean getImageUploadStatus() {
		return imageUploadStatus;
	}

	/**
	 * @param imageUploadStatus
	 *            the imageUploadStatus to set
	 */
	public void setImageUploadStatus(Boolean imageUploadStatus) {
		this.imageUploadStatus = imageUploadStatus;
	}

	/**
	 * @return the rentTypes
	 */
	public List<RentType> getRentTypes() {
		return rentTypes;
	}

	/**
	 * @param rentTypes the rentTypes to set
	 */
	public void setRentTypes(List<RentType> rentTypes) {
		this.rentTypes = rentTypes;
	}
}
