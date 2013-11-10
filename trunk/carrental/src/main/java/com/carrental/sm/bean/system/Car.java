package com.carrental.sm.bean.system;

import java.sql.Timestamp;

/**
 * @author 张霄鹏
 * 
 */
public class Car extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String plateNumber;// 车牌号码
	private String purchaser;// 购买人
	private String purchaserPhone;// 购买人电话
	private Timestamp purchaseDate;// 购买日期
	private String purchasePrice;// 购买价格
	private CarSeries carSeries;// 车系
	private City city;// 所属城市
	private String content;
	private String isDelete;

	/**
	 * @return the plateNumber
	 */
	public String getPlateNumber() {
		return plateNumber;
	}

	/**
	 * @param plateNumber
	 *            the plateNumber to set
	 */
	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	/**
	 * @return the purchaser
	 */
	public String getPurchaser() {
		return purchaser;
	}

	/**
	 * @param purchaser
	 *            the purchaser to set
	 */
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}

	/**
	 * @return the purchaserPhone
	 */
	public String getPurchaserPhone() {
		return purchaserPhone;
	}

	/**
	 * @param purchaserPhone
	 *            the purchaserPhone to set
	 */
	public void setPurchaserPhone(String purchaserPhone) {
		this.purchaserPhone = purchaserPhone;
	}

	/**
	 * @return the purchaseDate
	 */
	public Timestamp getPurchaseDate() {
		return purchaseDate;
	}

	/**
	 * @param purchaseDate
	 *            the purchaseDate to set
	 */
	public void setPurchaseDate(Timestamp purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	/**
	 * @return the purchasePrice
	 */
	public String getPurchasePrice() {
		return purchasePrice;
	}

	/**
	 * @param purchasePrice
	 *            the purchasePrice to set
	 */
	public void setPurchasePrice(String purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	/**
	 * @return the carSeries
	 */
	public CarSeries getCarSeries() {
		return carSeries;
	}

	/**
	 * @param carSeries
	 *            the carSeries to set
	 */
	public void setCarSeries(CarSeries carSeries) {
		this.carSeries = carSeries;
	}

	/**
	 * @return the city
	 */
	public City getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(City city) {
		this.city = city;
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
	 * @return the isDelete
	 */
	public String getIsDelete() {
		return isDelete;
	}

	/**
	 * @param isDelete
	 *            the isDelete to set
	 */
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

}
