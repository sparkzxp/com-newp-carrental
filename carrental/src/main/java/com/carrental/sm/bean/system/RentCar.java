package com.carrental.sm.bean.system;

import java.sql.Timestamp;

/**
 * @author 张霄鹏
 * 
 */
public class RentCar extends BaseBean {

	private static final long serialVersionUID = 1L;

	private String rentNumber;// 预订号
	private RentType rentType;
	private CarSeries carSeries;
	private City city;// 使用城市
	private Car car;
	private Driver driver;
	private String rentStatus;// 预订状态，1，已预订未受理；1-A，预订已取消；2，预订已生效；3，已取车；4，已归还
	private String rentWay;// 预订方式
	private Admin bookUser;// 预订人
	private String customer;// 客户姓名
	private String customerCompany;// 客户公司名称
	private String customerPhone;// 客户手机号码
	private String customerEmail;// 客户邮件地址
	private Business business;// 预订业务类型
	private Coupon coupon;// 参与优惠活动
	private Timestamp bookPickUpDt;// 预订取车时间
	private String bookPickUpAddress;// 预订取车地址
	private String arriveFlightNo;// 到达航班号
	private Timestamp arriveFlightDt;// 航班到达时间
	private String takeOffFlightNo;// 起飞航班号
	private Timestamp takeOfFlightDt;// 航班出发时间
	private Integer passengerNo;// 乘客数量
	private Admin agent;// 预订确认员
	private Timestamp pickUpDt;// 取车时间
	private Double startMileage;// 取车起始里程数
	private Timestamp bookGiveBackDt;// 预订还车时间
	private String bookGiveBackAddress;// 预订还车地址
	private Timestamp giveBackDt;// 还车时间
	private Double endMileage;// 还车结束里程数
	private String content;

	private Integer rentFee;// 租用费用
	private Integer exceedKilometer;// 超公里数
	private Integer exceedKilometerFee;// 超公里费
	private Integer exceedHour;// 超小时数
	private Integer exceedHourFee;// 超小时费
	private String brokenPart;// 破损部分
	private Integer brokenFee;// 破损补偿费用
	private Integer totalPrice;// 总计

	/**
	 * @return the rentNumber
	 */
	public String getRentNumber() {
		return rentNumber;
	}

	/**
	 * @param rentNumber
	 *            the rentNumber to set
	 */
	public void setRentNumber(String rentNumber) {
		this.rentNumber = rentNumber;
	}

	/**
	 * @return the rentType
	 */
	public RentType getRentType() {
		return rentType;
	}

	/**
	 * @param rentType
	 *            the rentType to set
	 */
	public void setRentType(RentType rentType) {
		this.rentType = rentType;
	}

	/**
	 * @return the carSeries
	 */
	public CarSeries getCarSeries() {
		return carSeries;
	}

	/**
	 * @param carSeries
	 *            the carSeries to set
	 */
	public void setCarSeries(CarSeries carSeries) {
		this.carSeries = carSeries;
	}

	/**
	 * @return the city
	 */
	public City getCity() {
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(City city) {
		this.city = city;
	}

	/**
	 * @return the car
	 */
	public Car getCar() {
		return car;
	}

	/**
	 * @param car
	 *            the car to set
	 */
	public void setCar(Car car) {
		this.car = car;
	}

	/**
	 * @return the driver
	 */
	public Driver getDriver() {
		return driver;
	}

	/**
	 * @param driver
	 *            the driver to set
	 */
	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	/**
	 * @return the rentStatus
	 */
	public String getRentStatus() {
		return rentStatus;
	}

	/**
	 * @param rentStatus
	 *            the rentStatus to set
	 */
	public void setRentStatus(String rentStatus) {
		this.rentStatus = rentStatus;
	}

	/**
	 * @return the rentWay
	 */
	public String getRentWay() {
		return rentWay;
	}

	/**
	 * @param rentWay
	 *            the rentWay to set
	 */
	public void setRentWay(String rentWay) {
		this.rentWay = rentWay;
	}

	/**
	 * @return the bookUser
	 */
	public Admin getBookUser() {
		return bookUser;
	}

	/**
	 * @param bookUser
	 *            the bookUser to set
	 */
	public void setBookUser(Admin bookUser) {
		this.bookUser = bookUser;
	}

	/**
	 * @return the customer
	 */
	public String getCustomer() {
		return customer;
	}

	/**
	 * @param customer
	 *            the customer to set
	 */
	public void setCustomer(String customer) {
		this.customer = customer;
	}

	/**
	 * @return the customerCompany
	 */
	public String getCustomerCompany() {
		return customerCompany;
	}

	/**
	 * @param customerCompany
	 *            the customerCompany to set
	 */
	public void setCustomerCompany(String customerCompany) {
		this.customerCompany = customerCompany;
	}

	/**
	 * @return the customerPhone
	 */
	public String getCustomerPhone() {
		return customerPhone;
	}

	/**
	 * @param customerPhone
	 *            the customerPhone to set
	 */
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	/**
	 * @return the customerEmail
	 */
	public String getCustomerEmail() {
		return customerEmail;
	}

	/**
	 * @param customerEmail
	 *            the customerEmail to set
	 */
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	/**
	 * @return the business
	 */
	public Business getBusiness() {
		return business;
	}

	/**
	 * @param business
	 *            the business to set
	 */
	public void setBusiness(Business business) {
		this.business = business;
	}

	/**
	 * @return the coupon
	 */
	public Coupon getCoupon() {
		return coupon;
	}

	/**
	 * @param coupon
	 *            the coupon to set
	 */
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	/**
	 * @return the bookPickUpDt
	 */
	public Timestamp getBookPickUpDt() {
		return bookPickUpDt;
	}

	/**
	 * @param bookPickUpDt
	 *            the bookPickUpDt to set
	 */
	public void setBookPickUpDt(Timestamp bookPickUpDt) {
		this.bookPickUpDt = bookPickUpDt;
	}

	/**
	 * @return the bookPickUpAddress
	 */
	public String getBookPickUpAddress() {
		return bookPickUpAddress;
	}

	/**
	 * @param bookPickUpAddress
	 *            the bookPickUpAddress to set
	 */
	public void setBookPickUpAddress(String bookPickUpAddress) {
		this.bookPickUpAddress = bookPickUpAddress;
	}

	/**
	 * @return the arriveFlightNo
	 */
	public String getArriveFlightNo() {
		return arriveFlightNo;
	}

	/**
	 * @param arriveFlightNo
	 *            the arriveFlightNo to set
	 */
	public void setArriveFlightNo(String arriveFlightNo) {
		this.arriveFlightNo = arriveFlightNo;
	}

	/**
	 * @return the arriveFlightDt
	 */
	public Timestamp getArriveFlightDt() {
		return arriveFlightDt;
	}

	/**
	 * @param arriveFlightDt
	 *            the arriveFlightDt to set
	 */
	public void setArriveFlightDt(Timestamp arriveFlightDt) {
		this.arriveFlightDt = arriveFlightDt;
	}

	/**
	 * @return the takeOffFlightNo
	 */
	public String getTakeOffFlightNo() {
		return takeOffFlightNo;
	}

	/**
	 * @param takeOffFlightNo
	 *            the takeOffFlightNo to set
	 */
	public void setTakeOffFlightNo(String takeOffFlightNo) {
		this.takeOffFlightNo = takeOffFlightNo;
	}

	/**
	 * @return the takeOfFlightDt
	 */
	public Timestamp getTakeOfFlightDt() {
		return takeOfFlightDt;
	}

	/**
	 * @param takeOfFlightDt
	 *            the takeOfFlightDt to set
	 */
	public void setTakeOfFlightDt(Timestamp takeOfFlightDt) {
		this.takeOfFlightDt = takeOfFlightDt;
	}

	/**
	 * @return the passengerNo
	 */
	public Integer getPassengerNo() {
		return passengerNo;
	}

	/**
	 * @param passengerNo
	 *            the passengerNo to set
	 */
	public void setPassengerNo(Integer passengerNo) {
		this.passengerNo = passengerNo;
	}

	/**
	 * @return the agent
	 */
	public Admin getAgent() {
		return agent;
	}

	/**
	 * @param agent
	 *            the agent to set
	 */
	public void setAgent(Admin agent) {
		this.agent = agent;
	}

	/**
	 * @return the pickUpDt
	 */
	public Timestamp getPickUpDt() {
		return pickUpDt;
	}

	/**
	 * @param pickUpDt
	 *            the pickUpDt to set
	 */
	public void setPickUpDt(Timestamp pickUpDt) {
		this.pickUpDt = pickUpDt;
	}

	/**
	 * @return the startMileage
	 */
	public Double getStartMileage() {
		return startMileage;
	}

	/**
	 * @param startMileage
	 *            the startMileage to set
	 */
	public void setStartMileage(Double startMileage) {
		this.startMileage = startMileage;
	}

	/**
	 * @return the bookGiveBackDt
	 */
	public Timestamp getBookGiveBackDt() {
		return bookGiveBackDt;
	}

	/**
	 * @param bookGiveBackDt
	 *            the bookGiveBackDt to set
	 */
	public void setBookGiveBackDt(Timestamp bookGiveBackDt) {
		this.bookGiveBackDt = bookGiveBackDt;
	}

	/**
	 * @return the bookGiveBackAddress
	 */
	public String getBookGiveBackAddress() {
		return bookGiveBackAddress;
	}

	/**
	 * @param bookGiveBackAddress
	 *            the bookGiveBackAddress to set
	 */
	public void setBookGiveBackAddress(String bookGiveBackAddress) {
		this.bookGiveBackAddress = bookGiveBackAddress;
	}

	/**
	 * @return the giveBackDt
	 */
	public Timestamp getGiveBackDt() {
		return giveBackDt;
	}

	/**
	 * @param giveBackDt
	 *            the giveBackDt to set
	 */
	public void setGiveBackDt(Timestamp giveBackDt) {
		this.giveBackDt = giveBackDt;
	}

	/**
	 * @return the endMileage
	 */
	public Double getEndMileage() {
		return endMileage;
	}

	/**
	 * @param endMileage
	 *            the endMileage to set
	 */
	public void setEndMileage(Double endMileage) {
		this.endMileage = endMileage;
	}

	/**
	 * @return the rentFee
	 */
	public Integer getRentFee() {
		return rentFee;
	}

	/**
	 * @param rentFee
	 *            the rentFee to set
	 */
	public void setRentFee(Integer rentFee) {
		this.rentFee = rentFee;
	}

	/**
	 * @return the exceedKilometer
	 */
	public Integer getExceedKilometer() {
		return exceedKilometer;
	}

	/**
	 * @param exceedKilometer
	 *            the exceedKilometer to set
	 */
	public void setExceedKilometer(Integer exceedKilometer) {
		this.exceedKilometer = exceedKilometer;
	}

	/**
	 * @return the exceedKilometerFee
	 */
	public Integer getExceedKilometerFee() {
		return exceedKilometerFee;
	}

	/**
	 * @param exceedKilometerFee
	 *            the exceedKilometerFee to set
	 */
	public void setExceedKilometerFee(Integer exceedKilometerFee) {
		this.exceedKilometerFee = exceedKilometerFee;
	}

	/**
	 * @return the exceedHour
	 */
	public Integer getExceedHour() {
		return exceedHour;
	}

	/**
	 * @param exceedHour
	 *            the exceedHour to set
	 */
	public void setExceedHour(Integer exceedHour) {
		this.exceedHour = exceedHour;
	}

	/**
	 * @return the exceedHourFee
	 */
	public Integer getExceedHourFee() {
		return exceedHourFee;
	}

	/**
	 * @param exceedHourFee
	 *            the exceedHourFee to set
	 */
	public void setExceedHourFee(Integer exceedHourFee) {
		this.exceedHourFee = exceedHourFee;
	}

	/**
	 * @return the totalPrice
	 */
	public Integer getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @param totalPrice
	 *            the totalPrice to set
	 */
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	/**
	 * @return the brokenPart
	 */
	public String getBrokenPart() {
		return brokenPart;
	}

	/**
	 * @param brokenPart
	 *            the brokenPart to set
	 */
	public void setBrokenPart(String brokenPart) {
		this.brokenPart = brokenPart;
	}

	/**
	 * @return the brokenFee
	 */
	public Integer getBrokenFee() {
		return brokenFee;
	}

	/**
	 * @param brokenFee
	 *            the brokenFee to set
	 */
	public void setBrokenFee(Integer brokenFee) {
		this.brokenFee = brokenFee;
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
