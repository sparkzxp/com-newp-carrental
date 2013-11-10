package com.carrental.sm.bean.system;

/**
 * @author 张霄鹏
 * 
 */
public class Notice extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String title;
	private String content;
	private String imagePath;
	private Boolean imageUploadStatus;// 不存数据库

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
