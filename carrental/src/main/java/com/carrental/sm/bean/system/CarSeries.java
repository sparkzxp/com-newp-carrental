package com.carrental.sm.bean.system;

import java.sql.Timestamp;

/**
 * @author 张霄鹏
 * 
 */
public class CarSeries extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String seriesName;
	private String manufacturer;
	private String manufacturerLogoPath;
	private Boolean manufacturerLogoUploadStatus;// 不存数据库，修改时标记上传的图片是否有更改
	private String seriesImgPath;
	private Boolean seriesImgUploadStatus;// 不存数据库，修改时标记上传的图片是否有更改

	private String styleName;// 车型名称
	private String level;// 级别
	private String engine;// 发动机
	private String gearbox;// 变速箱
	private String LWH;// 长*宽*高(mm)
	private String structrue;// 车身结构
	private Double fuelConsumption;// 平均油耗(L/100km)
	private Integer fuelCapacity;// 油箱容积(L)
	private Integer trunkCapacity;// 行李箱容积(L)
	private String fuelForm;// 燃料形式
	private String ROZ;// 燃油标号
	private Timestamp marketDate;// 上市时间
	private String content;
	private String isDelete;

	/**
	 * @return the seriesName
	 */
	public String getSeriesName() {
		return seriesName;
	}

	/**
	 * @param seriesName
	 *            the seriesName to set
	 */
	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	/**
	 * @return the manufacturer
	 */
	public String getManufacturer() {
		return manufacturer;
	}

	/**
	 * @param manufacturer
	 *            the manufacturer to set
	 */
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	/**
	 * @return the manufacturerLogoPath
	 */
	public String getManufacturerLogoPath() {
		return manufacturerLogoPath;
	}

	/**
	 * @param manufacturerLogoPath
	 *            the manufacturerLogoPath to set
	 */
	public void setManufacturerLogoPath(String manufacturerLogoPath) {
		this.manufacturerLogoPath = manufacturerLogoPath;
	}

	/**
	 * @return the seriesImgPath
	 */
	public String getSeriesImgPath() {
		return seriesImgPath;
	}

	/**
	 * @param seriesImgPath
	 *            the seriesImgPath to set
	 */
	public void setSeriesImgPath(String seriesImgPath) {
		this.seriesImgPath = seriesImgPath;
	}

	/**
	 * @return the styleName
	 */
	public String getStyleName() {
		return styleName;
	}

	/**
	 * @param styleName
	 *            the styleName to set
	 */
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @param level
	 *            the level to set
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @return the engine
	 */
	public String getEngine() {
		return engine;
	}

	/**
	 * @param engine
	 *            the engine to set
	 */
	public void setEngine(String engine) {
		this.engine = engine;
	}

	/**
	 * @return the gearbox
	 */
	public String getGearbox() {
		return gearbox;
	}

	/**
	 * @param gearbox
	 *            the gearbox to set
	 */
	public void setGearbox(String gearbox) {
		this.gearbox = gearbox;
	}

	/**
	 * @return the lWH
	 */
	public String getLWH() {
		return LWH;
	}

	/**
	 * @param lWH
	 *            the lWH to set
	 */
	public void setLWH(String lWH) {
		LWH = lWH;
	}

	/**
	 * @return the structrue
	 */
	public String getStructrue() {
		return structrue;
	}

	/**
	 * @param structrue
	 *            the structrue to set
	 */
	public void setStructrue(String structrue) {
		this.structrue = structrue;
	}

	/**
	 * @return the fuelConsumption
	 */
	public Double getFuelConsumption() {
		return fuelConsumption;
	}

	/**
	 * @param fuelConsumption
	 *            the fuelConsumption to set
	 */
	public void setFuelConsumption(Double fuelConsumption) {
		this.fuelConsumption = fuelConsumption;
	}

	/**
	 * @return the fuelCapacity
	 */
	public Integer getFuelCapacity() {
		return fuelCapacity;
	}

	/**
	 * @param fuelCapacity
	 *            the fuelCapacity to set
	 */
	public void setFuelCapacity(Integer fuelCapacity) {
		this.fuelCapacity = fuelCapacity;
	}

	/**
	 * @return the trunkCapacity
	 */
	public Integer getTrunkCapacity() {
		return trunkCapacity;
	}

	/**
	 * @param trunkCapacity
	 *            the trunkCapacity to set
	 */
	public void setTrunkCapacity(Integer trunkCapacity) {
		this.trunkCapacity = trunkCapacity;
	}

	/**
	 * @return the fuelForm
	 */
	public String getFuelForm() {
		return fuelForm;
	}

	/**
	 * @param fuelForm
	 *            the fuelForm to set
	 */
	public void setFuelForm(String fuelForm) {
		this.fuelForm = fuelForm;
	}

	/**
	 * @return the rOZ
	 */
	public String getROZ() {
		return ROZ;
	}

	/**
	 * @param rOZ
	 *            the rOZ to set
	 */
	public void setROZ(String rOZ) {
		ROZ = rOZ;
	}

	/**
	 * @return the marketDate
	 */
	public Timestamp getMarketDate() {
		return marketDate;
	}

	/**
	 * @param marketDate
	 *            the marketDate to set
	 */
	public void setMarketDate(Timestamp marketDate) {
		this.marketDate = marketDate;
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
	 * @return the manufacturerLogoUploadStatus
	 */
	public Boolean getManufacturerLogoUploadStatus() {
		return manufacturerLogoUploadStatus;
	}

	/**
	 * @param manufacturerLogoUploadStatus
	 *            the manufacturerLogoUploadStatus to set
	 */
	public void setManufacturerLogoUploadStatus(Boolean manufacturerLogoUploadStatus) {
		this.manufacturerLogoUploadStatus = manufacturerLogoUploadStatus;
	}

	/**
	 * @return the seriesImgUploadStatus
	 */
	public Boolean getSeriesImgUploadStatus() {
		return seriesImgUploadStatus;
	}

	/**
	 * @param seriesImgUploadStatus
	 *            the seriesImgUploadStatus to set
	 */
	public void setSeriesImgUploadStatus(Boolean seriesImgUploadStatus) {
		this.seriesImgUploadStatus = seriesImgUploadStatus;
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
