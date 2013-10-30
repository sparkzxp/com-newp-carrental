package com.carrental.sm.bean.system;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author 张霄鹏
 */
public class BaseBean implements Serializable {

	private static final long serialVersionUID = 1L;

	protected String id;
	protected Admin createdUser;
	protected Timestamp createdDt;
	protected Admin updatedUser;
	protected Timestamp updatedDt;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the createdUser
	 */
	public Admin getCreatedUser() {
		return createdUser;
	}

	/**
	 * @param createdUser
	 *            the createdUser to set
	 */
	public void setCreatedUser(Admin createdUser) {
		this.createdUser = createdUser;
	}

	/**
	 * @return the createdDt
	 */
	public Timestamp getCreatedDt() {
		return createdDt;
	}

	/**
	 * @param createdDt
	 *            the createdDt to set
	 */
	public void setCreatedDt(Timestamp createdDt) {
		this.createdDt = createdDt;
	}

	/**
	 * @return the updatedUser
	 */
	public Admin getUpdatedUser() {
		return updatedUser;
	}

	/**
	 * @param updatedUser
	 *            the updatedUser to set
	 */
	public void setUpdatedUser(Admin updatedUser) {
		this.updatedUser = updatedUser;
	}

	/**
	 * @return the updatedDt
	 */
	public Timestamp getUpdatedDt() {
		return updatedDt;
	}

	/**
	 * @param updatedDt
	 *            the updatedDt to set
	 */
	public void setUpdatedDt(Timestamp updatedDt) {
		this.updatedDt = updatedDt;
	}
}
