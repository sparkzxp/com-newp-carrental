package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class BusinessDesc extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String name;
	private String content;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
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
}
