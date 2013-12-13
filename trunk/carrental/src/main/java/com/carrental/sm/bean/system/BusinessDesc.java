package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class BusinessDesc extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String name;
	private String content;
	private String brief;
	private String imagePath;
	private Boolean imageUploadStatus;// 不存数据库

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

	/**
	 * @return the brief
	 */
	public String getBrief() {
		return brief;
	}

	/**
	 * @param brief
	 *            the brief to set
	 */
	public void setBrief(String brief) {
		this.brief = brief;
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
}
