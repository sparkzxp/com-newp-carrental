package com.carrental.sm.common.bean;

/**
 * @author 张霄鹏
 * 
 */
public class Passworder {

	private String password;
	private String newPassword;
	private String repetPassword;

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**
	 * @param newPassword
	 *            the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	/**
	 * @return the repetPassword
	 */
	public String getRepetPassword() {
		return repetPassword;
	}

	/**
	 * @param repetPassword
	 *            the repetPassword to set
	 */
	public void setRepetPassword(String repetPassword) {
		this.repetPassword = repetPassword;
	}
}
