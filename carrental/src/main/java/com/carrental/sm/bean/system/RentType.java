package com.carrental.sm.bean.system;

import java.util.List;

/**
 * @author 张霄鹏
 * 
 */
public class RentType extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String typeName;
	private Integer loadLimit;// 限载人数
	private List<CarSeries> carSeriesList;
	private String content;

	private String imagePath;
	private Boolean imageUploadStatus;// 不存数据库，修改时标记上传的图片是否有更改

	/**
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * @param typeName
	 *            the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * @return the loadLimit
	 */
	public Integer getLoadLimit() {
		return loadLimit;
	}

	/**
	 * @param loadLimit
	 *            the loadLimit to set
	 */
	public void setLoadLimit(Integer loadLimit) {
		this.loadLimit = loadLimit;
	}

	/**
	 * @return the carSeriesList
	 */
	public List<CarSeries> getCarSeriesList() {
		return carSeriesList;
	}

	/**
	 * @param carSeriesList
	 *            the carSeriesList to set
	 */
	public void setCarSeriesList(List<CarSeries> carSeriesList) {
		this.carSeriesList = carSeriesList;
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