package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Captcha extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String captcha;
	private String isUsed;
	private String usedFor;

	/**
	 * @return the captcha
	 */
	public String getCaptcha() {
		return captcha;
	}

	/**
	 * @param captcha
	 *            the captcha to set
	 */
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	/**
	 * @return the isUsed
	 */
	public String getIsUsed() {
		return isUsed;
	}

	/**
	 * @param isUsed
	 *            the isUsed to set
	 */
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}

	/**
	 * @return the usedFor
	 */
	public String getUsedFor() {
		return usedFor;
	}

	/**
	 * @param usedFor
	 *            the usedFor to set
	 */
	public void setUsedFor(String usedFor) {
		this.usedFor = usedFor;
	}
}
