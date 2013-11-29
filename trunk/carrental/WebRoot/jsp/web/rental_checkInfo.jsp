<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
	function toChange(url){
		$('#editForm').attr('action', url);
		$('#editForm').submit();
	}
	
    $(function() {
    	$('#btn_submit').click(function(){
   			$.post('<%=basePath%>rentCar/doBookCarEdit', $('#editForm').serialize(), function(data){
        		if(data.result == 'SUCCESS'){
        			toChange('<%=basePath%>web/rental/toCompleteRent');
        		}else{
        			$.prompt(data.result,{
						title: '提示',
	        			buttons: { "确定": false}
	        		});
        		}
    		}, "json");
	   	});
    });
    </script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<form name="editForm" id="editForm">
			<input type="hidden" name="city.id" id="rentCar_city" value="${rentCar.city.id}"/>
			<input type="hidden" name="city.cityName" id="rentCar_city_cityName" value="${rentCar.city.cityName}"/>
			<input type="hidden" name="business.businessType" id="rentCar_business_businessType" value="${rentCar.business.businessType}"/>
			<input type="hidden" name="business.businessMore" id="rentCar_business_businessMore" value="${rentCar.business.businessMore}"/>
			<input type="hidden" name="rentType.id" id="rentCar_rentType" value="${rentCar.rentType.id}"/>
			<input type="hidden" name="rentType.typeName" id="rentCar_rentType_typeName" value="${rentCar.rentType.typeName}"/>
			<input type="hidden" name="business.rentType.id" id="rentCar_business_rentType" value="${rentCar.business.rentType.id}"/>
			
			<input type="hidden" name="coupon.id" id="rentCar_coupon" value="${rentCar.coupon.id}"/>
			<input type="hidden" name="coupon.couponType" id="rentCar_coupon_couponType" value="${rentCar.coupon.couponType}"/>
			<input type="hidden" name="coupon.couponTitle" id="rentCar_coupon_couponTitle" value="${rentCar.coupon.couponTitle}"/>
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
			
			<input type="hidden" name="bookUserType" value="0"/>
			<input type="hidden" name="rentStatus" value="1"/>
			<input type="hidden" name="rentWay" value="网站在线预订"/>
			<div class="choose_car">
				<ul>
					<li><span>1</span>
					<h1>选择用车方式</h1></li>
					<li><span>2</span>
					<h1>选择车辆</h1></li>
					<li><span>3</span>
					<h1>填写乘车信息</h1></li>
					<li class="now"><span>4</span>
					<h1>确认订单</h1></li>
					<li><span>5</span>
					<h1>成功</h1></li>
				</ul>
				<h6 class="clear"></h6>
			</div>
			<div class="main">
				<div class="place">
					<h1>确认订单</h1>
				</div>
				<div class="box">
					<div class="car_station">
						<h1>
							<a href="javascript:void(0)" onclick="toChange('<%=basePath%>web/rental/toChooseBusiness')">修改</a>您的用车方式
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
					<div class="car_station">
						<h1>
							<a href="javascript:void(0)" onclick="toChange('<%=basePath%>web/rental/toChooseCar')">修改</a>所选车辆
						</h1>
						<blockquote>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="120" height="30" align="right">车&nbsp;&nbsp;型：&nbsp;</td>
									<td>${rentCar.rentType.typeName}</td>
								</tr>
								<tr>
									<td height="30" align="right">小时单价：&nbsp;</td>
									<td>${rentCar.exceedHourFee}元</td>
								</tr>
								<tr>
									<td height="30" align="right">公里单价：&nbsp;</td>
									<td>${rentCar.exceedKilometerFee}元</td>
								</tr>
								<tr>
									<td height="30" align="right">最低消费：&nbsp;</td>
									<td>${rentCar.rentFee}元</td>
								</tr>
								<tr>
									<td height="30" align="right">费用包含：&nbsp;</td>
									<td>
										<c:if test="${rentCar.business.fuelFee == null or rentCar.business.fuelFee == 0}">油</c:if>&nbsp;
										<c:if test="${rentCar.business.insuranceFee == null or rentCar.business.insuranceFee == 0}">险</c:if>&nbsp;
										<c:if test="${rentCar.business.driverFee == null or rentCar.business.driverFee == 0}">驾</c:if>
									</td>
								</tr>
								<tr>
									<td height="30" align="right">参加优惠活动：&nbsp;</td>
									<td>
										<c:choose>
										<c:when test="${rentCar.coupon == null or rentCar.coupon.id == ''}">未参加优惠活动</c:when>
										<c:otherwise>${rentCar.coupon.couponTitle}</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>

						</blockquote>
					</div>
					<div class="car_station">
						<h1>
							<a href="javascript:void(0)" onclick="toChange('<%=basePath%>web/rental/toFillInfo')">修改</a>乘车信息
						</h1>
						<blockquote>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="120" height="30" align="right">预订人姓名：&nbsp;</td>
									<td>${rentCar.bookUser.adminName}&nbsp;
										<c:if test="${rentCar.bookUser.sex == 'male'}">先生</c:if>
										<c:if test="${rentCar.bookUser.sex == 'female'}">女士</c:if>
									</td>
								</tr>
								<c:if test="${rentCar.bookUser.companyName != ''}">
								<tr>
									<td height="30" align="right">预订人公司名称：&nbsp;</td>
									<td>${rentCar.bookUser.companyName}</td>
								</tr>
								</c:if>
								<tr>
									<td height="30" align="right">预订人手机号码：&nbsp;</td>
									<td>${rentCar.bookUser.phone}</td>
								</tr>
								<tr>
									<td height="30" align="right">预订人邮箱：&nbsp;</td>
									<td>${rentCar.bookUser.email}</td>
								</tr>
								<tr>
									<th colspan="2"
										style="border-bottom: 1px dashed #ccc; height: 2px;"></th>
								</tr>
								<c:if test="${rentCar.business.businessType == '机场及车站接送'}">
								<c:if test="${rentCar.business.businessMore == 'send'}">
								<tr>
					                <td height="30" align="right">起飞航班号：&nbsp;</td>
					                <td>
					                	${rentCar.takeOffFlightNo}
					                </td>
					            </tr>
					            <tr>
					                <td height="30" align="right">航班出发时间：&nbsp;</td>
					                <td>
					                	<fmt:formatDate value="${rentCar.takeOfFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
					                </td>
					            </tr>
								</c:if>
								<c:if test="${rentCar.business.businessMore == 'pick'}">
								<tr>
					                <td height="30" align="right">到达航班号：&nbsp;</td>
					                <td>
					                	${rentCar.arriveFlightNo}
					                </td>
					            </tr>
					            <tr>
					                <td height="30" align="right">航班到达时间：&nbsp;</td>
					                <td>
					                	<fmt:formatDate value="${rentCar.arriveFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
					                </td>
					            </tr>
								<tr>
									<th colspan="2"
										style="border-bottom: 1px dashed #ccc; height: 2px;"></th>
								</tr>
								</c:if>
								</c:if>
								<tr>
									<td height="30" align="right">乘车人姓名：&nbsp;</td>
									<td>${rentCar.customer}</td>
								</tr>
								<tr>
									<td height="30" align="right">乘车人公司名称：&nbsp;</td>
									<td>${rentCar.customerCompany}</td>
								</tr>
								<tr>
									<td height="30" align="right">乘车人手机号码：&nbsp;</td>
									<td>${rentCar.customerPhone}</td>
								</tr>
								<tr>
									<td height="30" align="right">乘车人邮箱：&nbsp;</td>
									<td>${rentCar.customerEmail}</td>
								</tr>
								<tr>
									<td height="30" align="right">乘客数量：&nbsp;</td>
									<td>${rentCar.passengerNo}</td>
								</tr>
								<tr>
									<th colspan="2"
										style="border-bottom: 1px dashed #ccc; height: 2px;"></th>
								</tr>
								<tr>
									<td height="30" align="right">预订取车时间：&nbsp;</td>
									<td><fmt:formatDate value="${rentCar.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
								</tr>
								<tr>
									<td height="30" align="right">预订取车地址：&nbsp;</td>
									<td>${rentCar.bookPickUpAddress}</td>
								</tr>
								<tr>
									<td height="30" align="right">预订还车时间：&nbsp;</td>
									<td><fmt:formatDate value="${rentCar.bookGiveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
								</tr>
								<tr>
									<td height="30" align="right">预订还车地址：&nbsp;</td>
									<td>${rentCar.bookGiveBackAddress}</td>
								</tr>
							</table>

						</blockquote>
					</div>
					<div align="center">
						<input type="button" id="btn_submit" value="提交订单"
							class="btn" style="width: 100px;" />
					</div>
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
