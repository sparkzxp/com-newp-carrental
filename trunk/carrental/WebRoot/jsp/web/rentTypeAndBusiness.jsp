<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广得利租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
.jiesong_car h1 a {
    padding: 0 35px;
}
.work_detail div p span {
    text-decoration: none;
}
</style>

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript">
function showType(value){
	$('#businessType').val(value);
	$('#editForm').attr('action', '<%=basePath%>web/toRentTypeAndBusiness');
	$('#editForm').submit();
}

function showCity(value){
	$('#cityId').val(value);
	$('#editForm').attr('action', '<%=basePath%>web/toRentTypeAndBusiness');
	$('#editForm').submit();
}

function toChooseCar(){
	$('#editForm').attr('action', '<%=basePath%>web/rental/toChooseCar');
	$('#editForm').submit();
}
</script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<form name="editForm" id="editForm">
			<input type="hidden" id="cityId" name="cityId" value="${city.id}">
			<input type="hidden" id="businessType" name="businessType" value="${business.businessType}">
			
			<input type="hidden" id="rentCar_city" name="city.id" value="${city.id}">
			<input type="hidden" id="rentCar_business_businessType" name="business.businessType" value="${business.businessType}">
			<div class="city">
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th width="20%" align="center"><img src="<%=basePath%>images/web/car.jpg"
								width="128" height="82" />
							<h1>热门线路</h1></th>
							<td><img src="<%=basePath%>images/web/cion35.gif" width="458" height="46" />
								<h6 class="clear"></h6>
								<c:forEach items="${citys}" var="parent">
								<a href="javascript:void(0)" onclick="showCity('${parent.id}')" <c:if test="${parent.id == city.id}">class="current"</c:if>>${parent.cityName}</a>
								</c:forEach>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="jiesong_car">
				<h1>
					<a href="javascript:void(0)" id="mainbav0" onclick="showType('点到点代驾')" <c:if test="${business.businessType == '点到点代驾'}">class="current"</c:if>>点到点代驾</a>
					<a href="javascript:void(0)" id="mainbav1" onclick="showType('机场及车站接送')" <c:if test="${business.businessType == '机场及车站接送'}">class="current"</c:if>>机场及车站接送</a>
					<a href="javascript:void(0)" id="mainbav2" onclick="showType('市用半日租')" <c:if test="${business.businessType == '市用半日租'}">class="current"</c:if>>市用半日租</a>
					<a href="javascript:void(0)" id="mainbav3" onclick="showType('市用全日租')" <c:if test="${business.businessType == '市用全日租'}">class="current"</c:if>>市用全日租</a>
					<a href="javascript:void(0)" id="mainbav4" onclick="showType('会务车辆安排')" <c:if test="${business.businessType == '会务车辆安排'}">class="current"</c:if>>会务车辆安排</a>
					<a href="javascript:void(0)" id="mainbav5" onclick="showType('周边省市包车')" <c:if test="${business.businessType == '周边省市包车'}">class="current"</c:if>>周边省市包车</a>
					<h6 class="clear"></h6>
				</h1>
				<h6 class="clear"></h6>
				<div class="box20 work_detail">
					<blockquote class="work_detail_brief">
						${businessDesc.content}
					</blockquote>
					<c:forEach items="${businesses}" var="parent">
					<div>
						<img src="<%=basePath%>images/web/cion05.gif" width="64" height="64"
							class="recommend" /> <img src="<%=basePath%>${parent.rentType.imagePath}" width="434"
							height="290" class="show" />
						<h1>
							<c:set var="count" value="1"></c:set>
							<c:forEach items="${parent.rentType.carSeriesList}" var="carSeries" varStatus="carSeriesStatus">
							<c:if test="${count < 5}">
								<c:choose>
								<c:when test="${carSeriesStatus.index == 0}">
								${carSeries.seriesName}
								</c:when>
								<c:otherwise>
								/${carSeries.seriesName}
								</c:otherwise>
								</c:choose>
							<c:set var="count" value="${count + 1}"></c:set>
							</c:if>
							</c:forEach>
						 等</h1>
						<h2>含${parent.baseHour}小时及${parent.baseKilometer}公里路程(超小时${parent.exceedHourFee}元/小时 超公里${parent.exceedKilometerFee}元/公里)</h2>
						<input type="button" onclick="toChooseCar()" value="点击预订"
							class="btn" style="cursor: pointer;" />
						<p>
							<span>原价: ¥<fmt:formatNumber value="${parent.rentFee * city.multiple}" pattern="#,###,###"/>趟起</span>
						</p>
					</div>
					</c:forEach>
					<h6 class="clear"></h6>
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
