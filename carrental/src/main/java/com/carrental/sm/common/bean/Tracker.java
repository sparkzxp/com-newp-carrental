package com.carrental.sm.common.bean;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author 张霄鹏
 * 
 */
public class Tracker implements Serializable {

	private static final long serialVersionUID = 1L;

	private String machineCode;
	private String carNumber;
	private String alias;
	private String tableName;
	private Timestamp queryStartDt;
	private Timestamp queryEndDt;

	/**
	 * @return the machineCode
	 */
	public String getMachineCode() {
		return machineCode;
	}

	/**
	 * @param machineCode
	 *            the machineCode to set
	 */
	public void setMachineCode(String machineCode) {
		this.machineCode = machineCode;
	}

	/**
	 * @return the carNumber
	 */
	public String getCarNumber() {
		return carNumber;
	}

	/**
	 * @param carNumber
	 *            the carNumber to set
	 */
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}

	/**
	 * @return the alias
	 */
	public String getAlias() {
		return alias;
	}

	/**
	 * @param alias
	 *            the alias to set
	 */
	public void setAlias(String alias) {
		this.alias = alias;
	}

	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * @param tableName
	 *            the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * @return the queryStartDt
	 */
	public Timestamp getQueryStartDt() {
		return queryStartDt;
	}

	/**
	 * @param queryStartDt
	 *            the queryStartDt to set
	 */
	public void setQueryStartDt(Timestamp queryStartDt) {
		this.queryStartDt = queryStartDt;
	}

	/**
	 * @return the queryEndDt
	 */
	public Timestamp getQueryEndDt() {
		return queryEndDt;
	}

	/**
	 * @param queryEndDt
	 *            the queryEndDt to set
	 */
	public void setQueryEndDt(Timestamp queryEndDt) {
		this.queryEndDt = queryEndDt;
	}
}
