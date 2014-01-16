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
    $(function() {
    	$('#btn_submit').click(function(){
    		if($('#rentCar_city').val() == ''){
    			$.prompt('请选择您要用车的城市',{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else{
    			if($(':radio[checked]').attr('id') != null){
    				if($(':radio[checked]').attr('id') == 'pointToPoint'){
	    				$('#rentCar_business_businessMore').val('point');
	    			}else if($(':radio[checked]').attr('id') == 'airportOrStation_send'){
	    				$('#rentCar_business_businessMore').val('send');
	    			}else if($(':radio[checked]').attr('id') == 'airportOrStation_pick'){
	    				$('#rentCar_business_businessMore').val('pick');
	    			}else if($(':radio[checked]').attr('id') == 'halfDay'){
	    				$('#rentCar_business_businessMore').val('half');
	    			}else if($(':radio[checked]').attr('id') == 'wholeDay'){
	    				$('#rentCar_business_businessMore').val('whole');
	    			}else if($(':radio[checked]').attr('id') == 'meetingCar'){
	    				$('#rentCar_business_businessMore').val('meeting');
	    			}else if($(':radio[checked]').attr('id') == 'aroundProvince'){
	    				$('#rentCar_business_businessMore').val('around');
	    			}
    			}
	    		$('#editForm').submit();
    		}
    	});
    });
    </script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
	<form name="editForm" id="editForm" action="<%=basePath%>web/rental/toChooseCar">
		<input type="hidden" name="business.businessMore" id="rentCar_business_businessMore" value="${rentCar.business.businessMore}"/>
			
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
				<li class="now"><span>1</span>
				<h1>选择用车方式</h1></li>
				<li><span>2</span>
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
		<div class="main">
			<div class="place">
				<h1>在线预订</h1>
			</div>
			<div class="box20 content">
				<table width="100%" border="0" cellspacing="20" cellpadding="0"
					class="online">
					<tr>
						<td width="15%" align="right">用车城市：</td>
						<td>
							<select name="city.id" id="rentCar_city">
								<option value="">请选择您用车的城市</option>
								<c:forEach items="${citys}" var="parent">
								<option value="${parent.id}" <c:if test="${null != rentCar && null != rentCar.city && rentCar.city.id == parent.id}">selected="selected"</c:if>>${parent.cityName}</option>
								</c:forEach>
							</select>
							<!-- <a href="javascript:void(0)" style="color: #f00; margin: 0 0 0 10px;">选择其他城市</a> -->
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">用车方式：</td>
						<td valign="top"><table width="100%" border="0"
								cellspacing="0" cellpadding="0" class="online_yewu">
								<tr>
									<td><input name="business.businessType" type="radio" id="pointToPoint" value="点到点代驾"
										<c:if test="${null == rentCar || null == rentCar.business || rentCar.business.businessType == ''}">checked="checked"</c:if>
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '点到点代驾'}">checked="checked"</c:if> /><img
										src="<%=basePath%>images/web/icon_point.jpg" width="22" height="22" />点到点代驾（
										无需等待，24小时为您随时待命 ）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="airportOrStation_send" value="机场及车站接送"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'send'}">checked="checked"</c:if> /><img
										src="<%=basePath%>images/web/icon_send.jpg" width="22" height="22" />机场及车站送机（
										24小时准时出发，安心开启旅程 ）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="airportOrStation_pick" value="机场及车站接送"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'pick'}">checked="checked"</c:if> /><img src="<%=basePath%>images/web/icon_pick.jpg" width="22"
										height="22" />机场及车站接机 （自动跟踪航班动态，飞机晚点免费等待）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="halfDay" value="市用半日租"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '市用半日租'}">checked="checked"</c:if> /><img src="<%=basePath%>images/web/icon_half.jpg" width="22"
										height="22" />市用半日租 （4小时租车，打包更划算）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="wholeDay" value="市用全日租"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '市用全日租'}">checked="checked"</c:if> /><img src="<%=basePath%>images/web/icon_whole.jpg" width="22"
										height="22" />市用全日租 （8小时租车，一天为您护航）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="meetingCar" value="会务车辆安排"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '会务车辆安排'}">checked="checked"</c:if> /><img src="<%=basePath%>images/web/icon_meeting.jpg" width="22"
										height="22" />会务车辆安排 （全程接送，方便快捷）</td>
								</tr>
								<tr>
									<td><input name="business.businessType" type="radio" id="aroundProvince" value="周边省市包车"
										<c:if test="${null != rentCar && null != rentCar.business && rentCar.business.businessType == '周边省市包车'}">checked="checked"</c:if> /><img src="<%=basePath%>images/web/icon_around.jpg" width="22"
										height="22" />周边省市包车 （长途用车，安心且优惠）</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="button" id="btn_submit"
							value="下一步，选择车型" class="btn" /></td>
					</tr>
				</table>
			</div>
		</div>
		<%@ include file="part_help.jsp"%>
	</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
