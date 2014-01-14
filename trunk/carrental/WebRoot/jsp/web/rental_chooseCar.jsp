<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link rel="icon" type="image/x-icon" href="<%=basePath%>favicon.ico"/>
<link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>favicon.ico"/>
<title>欢迎使用新广得利租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
	function bookCar(rentTypeId, rentTypeName, couponId){
		$('#rentCar_rentType').val(rentTypeId);
		$('#rentCar_rentType_typeName').val(rentTypeName);
		$('#rentCar_business_rentType').val(rentTypeId);
		$('#rentCar_coupon').val(couponId);
		$('#editForm').submit();
	}
    $(function() {
    	
    });
    </script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<form name="editForm" id="editForm" action="<%=basePath%>web/rental/toFillInfo">
			<input type="hidden" name="city.id" id="rentCar_city" value="${rentCar.city.id}"/>
			<input type="hidden" name="city.cityName" id="rentCar_city_cityName" value="${rentCar.city.cityName}"/>
			<input type="hidden" name="business.businessType" id="rentCar_business_businessType" value="${rentCar.business.businessType}"/>
			<input type="hidden" name="business.businessMore" id="rentCar_business_businessMore" value="${rentCar.business.businessMore}"/>
			<input type="hidden" name="rentType.id" id="rentCar_rentType" value="${rentCar.rentType.id}"/>
			<input type="hidden" name="rentType.typeName" id="rentCar_rentType_typeName" value="${rentCar.rentType.typeName}"/>
			<input type="hidden" name="business.rentType.id" id="rentCar_business_rentType" value="${rentCar.business.rentType.id}"/>
			<input type="hidden" name="coupon.id" id="rentCar_coupon" value="${rentCar.coupon.id}"/>
			
			<input type="hidden" name="exceedHourFee" value="${rentCar.exceedHourFee}"/>
			<input type="hidden" name="exceedKilometerFee" value="${rentCar.exceedKilometerFee}"/>
			<input type="hidden" name="rentFee" value="${rentCar.rentFee}"/>
			<input type="hidden" name="business.fuelFee" value="${rentCar.business.fuelFee}"/>
			<input type="hidden" name="business.insuranceFee" value="${rentCar.business.insuranceFee}"/>
			<input type="hidden" name="business.driverFee" value="${rentCar.business.driverFee}"/>
			
			<input type="hidden" name="bookUser.id" id="rentCar_bookUser" value="${rentCar.bookUser.id}"/>
			<input type="hidden" id="rentCar_bookUser_adminName" name="bookUser.adminName" value="${rentCar.bookUser.adminName}"/>
			<input type="hidden" id="rentCar_bookUser_companyName" name="bookUser.companyName" value="${rentCar.bookUser.companyName}"/>
			<input type="hidden" id="rentCar_bookUser_phone" name="bookUser.phone" value="${rentCar.bookUser.phone}"/>
			<input type="hidden" id="rentCar_bookUser_email" name="bookUser.email" value="${rentCar.bookUser.email}"/>
			<input type="hidden" id="rentCar_bookUser_sex" name="bookUser.sex" value="${rentCar.bookUser.sex}"/>
			<input type="hidden" id="rentCar_takeOffFlightNo" name="takeOffFlightNo" value="${rentCar.takeOffFlightNo}"/>
			<input type="hidden" id="rentCar_takeOfFlightDt" name="takeOfFlightDt" value="<fmt:formatDate value="${rentCar.takeOfFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>"/>
			<input type="hidden" id="rentCar_arriveFlightNo" name="arriveFlightNo" value="${rentCar.arriveFlightNo}"/>
			<input type="hidden" id="rentCar_arriveFlightDt" name="arriveFlightDt" value="<fmt:formatDate value="${rentCar.arriveFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>"/>
			<input type="hidden" id="rentCar_customer" name="customer" value="${rentCar.customer}"/>
			<input type="hidden" name="customerCompany" value="${rentCar.customerCompany}"/>
			<input type="hidden" name="customerPhone" value="${rentCar.customerPhone}"/>
			<input type="hidden" name="customerEmail" value="${rentCar.customerEmail}"/>
			<input type="hidden" name="passengerNo" value="${rentCar.passengerNo}"/>
			<input type="hidden" id="rentCar_bookPickUpDt" name="bookPickUpDt" value="<fmt:formatDate value="${rentCar.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>"/>
			<input type="hidden" name="bookPickUpAddress" value="${rentCar.bookPickUpAddress}"/>
			<input type="hidden" id="rentCar_bookGiveBackDt" name="bookGiveBackDt" value="<fmt:formatDate value="${rentCar.bookGiveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>"/>
			<input type="hidden" name="bookGiveBackAddress" value="${rentCar.bookGiveBackAddress}"/>
			<div class="choose_car">
				<ul>
					<li><span>1</span>
					<h1>选择用车方式</h1></li>
					<li class="now"><span>2</span>
					<h1>选择车辆</h1></li>
					<li><span>3</span>
					<h1>填写乘车信息</h1></li>
					<li><span>4</span>
					<h1>确认订单</h1></li>
					<li><span>5</span>
					<h1>成功</h1></li>
				</ul>
				<h6 class="clear"></h6>
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top">
						<div class="car">
							<h1>车辆选择</h1>
							<blockquote>
								<c:forEach items="${rentTypes}" var="parent">
								<div class="car_detail">
									<table width="100%" border="0" cellspacing="5" cellpadding="0">
										<tr>
											<td width="172" valign="top"><h3>${parent.typeName}</h3></td>
											<td valign="top" style="border-bottom: 1px dashed #ccc;">
												<dl>
													<c:forEach items="${parent.carSeriesList}" var="child">
													<dt style="background:url(<%=basePath%>${child.manufacturerLogoPath}) no-repeat left center;">
														${child.seriesName}
													</dt>
													</c:forEach>
												</dl>
											</td>
										</tr>
										<tr>
											<td valign="top"><img src="<%=basePath%>${parent.imagePath}" width="160"
												height="130" /></td>
											<td valign="top">
												<ul>
													<c:forEach items="${businesses}" var="biz">
													<c:if test="${biz.rentType.id == parent.id}">
													<li>起步价格<fmt:formatNumber value="${biz.rentFee * rentCar.city.multiple}" pattern="#,###,###"/>元（<fmt:formatNumber value="${biz.exceedHourFee * rentCar.city.multiple}" pattern="#,###,###"/>元/小时+<fmt:formatNumber value="${biz.exceedKilometerFee * rentCar.city.multiple}" pattern="#,###,###"/>元/公里）</li>
													<li>人数：${parent.loadLimit}&nbsp;&nbsp;费用包含：
													<c:if test="${biz.fuelFee == null or biz.fuelFee == 0}">油</c:if>&nbsp;
													<c:if test="${biz.insuranceFee == null or biz.insuranceFee == 0}">险</c:if>&nbsp;
													<c:if test="${biz.driverFee == null or biz.driverFee == 0}">驾</c:if>
													</li>
													</c:if>
													</c:forEach>
													<c:set var="couponId" value="0"></c:set>
													<c:forEach items="${coupons}" var="coupon">
													<c:forEach items="${coupon.rentTypes}" var="rentType">
													<c:if test="${rentType.typeName == parent.typeName}">
													<c:set var="couponId" value="${coupon.id}"></c:set>
													<li>优惠活动：${coupon.couponTitle}&nbsp;&nbsp;活动折扣：${coupon.discount}折</li>
													</c:if>
													</c:forEach>
													</c:forEach>
												</ul> <input type="button" onclick="bookCar(${parent.id},'${parent.typeName}',${couponId})" value="立即预订" class="btn"/>
											</td>
										</tr>
									</table>
								</div>
								</c:forEach>
							</blockquote>
						</div>
					</td>
					<td width="10" valign="top">&nbsp;</td>
					<td width="280" valign="top">
						<div class="car_station">
							<h1>
								<a href="<%=basePath%>web/rental/toChooseBusiness?city.id=${rentCar.city.id}&business.businessType=${rentCar.business.businessType}&business.businessMore=${rentCar.business.businessMore}">修改</a>您的用车方式
							</h1>
							<blockquote>
								<h2>用车城市：${rentCar.city.cityName}</h2>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="27"><img src="<%=basePath%>images/web/cion20.gif" width="22"
											height="22" /></td>
										<td>
											<c:choose>
												<c:when test="${rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'send'}">机场及车站送机</c:when>
												<c:when test="${rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'pick'}">机场及车站接机</c:when>
												<c:otherwise>${rentCar.business.businessType}</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
							</blockquote>
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="part_help.jsp"%>
		</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
