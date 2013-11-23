package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Message extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String title;
	private String content;
	private String receiveNo;

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
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
	 * @return the receiveNo
	 */
	public String getReceiveNo() {
		return receiveNo;
	}

	/**
	 * @param receiveNo
	 *            the receiveNo to set
	 */
	public void setReceiveNo(String receiveNo) {
		this.receiveNo = receiveNo;
	}
}
