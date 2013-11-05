package com.carrental.sm.bean.system;

import java.sql.Timestamp;

/**
 * @author 张霄鹏
 * 
 */
public class Driver extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String driverName;
	private String driverCode;
	private String sex;
	private Integer driverYears;
	private Timestamp entryDate;
	private City city;
	private String content;
	private String isDelete;

	/**
	 * @return the driverName
	 */
	public String getDriverName() {
		return driverName;
	}

	/**
	 * @param driverName
	 *            the driverName to set
	 */
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	/**
	 * @return the driverCode
	 */
	public String getDriverCode() {
		return driverCode;
	}

	/**
	 * @param driverCode
	 *            the driverCode to set
	 */
	public void setDriverCode(String driverCode) {
		this.driverCode = driverCode;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex
	 *            the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the driverYears
	 */
	public Integer getDriverYears() {
		return driverYears;
	}

	/**
	 * @param driverYears
	 *            the driverYears to set
	 */
	public void setDriverYears(Integer driverYears) {
		this.driverYears = driverYears;
	}

	/**
	 * @return the entryDate
	 */
	public Timestamp getEntryDate() {
		return entryDate;
	}

	/**
	 * @param entryDate
	 *            the entryDate to set
	 */
	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
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
