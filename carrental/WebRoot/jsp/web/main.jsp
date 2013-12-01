<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/adv.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<%@ include file="part_banner.jsp"%>
		<div class="i_sales">
			<h1>
				<a href="<%=basePath%>web/toCouponList">查看更多</a><img src="<%=basePath%>images/web/cion02.gif"
					width="232" height="26" />
			</h1>
			<blockquote>
				<c:forEach items="${coupons}" var="parent">
				<div>
					<img src="<%=basePath%>images/web/rentbg.png" width="${928 / coupons.size()}"
						height="60" class="img" />
					<p>
						${parent.couponTitle}
					</p>
					<a href="<%=basePath%>web/toCouponDetail?id=${parent.id}"><img src="<%=basePath%>${parent.imagePath}"
						class="sale_img_show" width="${928 / coupons.size()}" height="252"/></a>
					<dd>
						<c:set var="count" value="0"></c:set>
						<c:forEach items="${parent.rentTypes}" var="rentType">
						<c:if test="${count < 5}">
							<c:forEach items="${rentType.carSeriesList}" var="carSerises">
							<c:choose>
							<c:when test="${count == 0}">
							${carSerises.seriesName}
							</c:when>
							<c:otherwise>
							/${carSerises.seriesName}
							</c:otherwise>
							</c:choose>
							<c:set var="count" value="${count + 1}"></c:set>
							</c:forEach>
						</c:if>
						</c:forEach>
					等</dd>
					<%-- <dt>含${parent.baseHour}小时及${business.baseKilometer}公里路程</dt> --%>
				</div>
				</c:forEach>
				<h6 class="clear"></h6>
			</blockquote>
		</div>
		<div class="rent_car">
			<blockquote>
				<c:set var="count" value="0"></c:set>
				<c:forEach items="${businesses}" var="parent">
				<c:if test="${count < 3}">
				<div>
					<img src="<%=basePath%>images/web/cion05.gif" width="64"
						height="64" class="recommend" />
					<p>租一天，把所有的麻烦事都交给司机</p>
					<img src="<%=basePath%>images/web/rentbg.png" width="435"
						height="67" class="img" />
					<h2>
						<a href="javascript:void(0)"><img src="<%=basePath%>${parent.rentType.imagePath}"
							width="435" height="315"/></a>
					</h2>
					<dd>
						<a href="<%=basePath%>web/toRentTypeAndBusiness?businessType=点到点代驾">查看更多</a>${parent.rentType.typeName} <span>¥ ${parent.rentFee}/趟起</span>
					</dd>
				</div>
				<c:set var="count" value="${count + 1}"></c:set>
				</c:if>
				</c:forEach>
				<h6 class="clear"></h6>
			</blockquote>
		</div>

		<div class="i_hot">
			<blockquote style="text-align: right;">
				<img src="<%=basePath%>images/web/cion10.gif" width="509"
					height="54" />
			</blockquote>
			<c:if test="${null != businesses and businesses.size() > 0}">
			<c:forEach items="${businesses}" var="parent" begin="0" end ="0">
			<div>
				<img src="<%=basePath%>images/web/cion07.gif"
					width="43" height="40" class="img left8" /> <a href="javascript:void(0)"><img
					src="<%=basePath%>${parent.rentType.imagePath}" class="hot_img_show" width="310" height="289" /></a>
				<dd>
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
				 等</dd>
				<dt>¥ ${parent.rentFee}/趟起</dt>
				<p>
					<a href="<%=basePath%>web/toRentTypeAndBusiness?businessType=点到点代驾">查看更多</a>
				</p>
			</div>
			</c:forEach>
			
			<c:forEach items="${businesses}" var="parent" begin="${businesses.size() - 1}">
			<div>
				<img src="<%=basePath%>images/web/cion07.gif"
					width="43" height="40" class="img left8" /> <a href="javascript:void(0)"><img
					src="<%=basePath%>${parent.rentType.imagePath}" class="hot_img_show" width="310" height="289" /></a>
				<dd>
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
				 等</dd>
				<dt>¥ ${parent.rentFee}/趟起</dt>
				<p>
					<a href="<%=basePath%>web/toRentTypeAndBusiness?businessType=点到点代驾">查看更多</a>
				</p>
			</div>
			</c:forEach>
			</c:if>
			
			<c:forEach items="${hotBusinesses}" var="parent">
			<div>
				<img src="<%=basePath%>images/web/cion09.gif" width="43" height="40"
					class="img left8" /><a href="javascript:void(0)"><img
					src="<%=basePath%>${parent.rentType.imagePath}" class="hot_img_show" width="310" height="289" /></a>
				<dd>
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
				 等</dd>
				<dt>¥ ${parent.rentFee}/趟起</dt>
				<p>
					<a href="<%=basePath%>web/toRentTypeAndBusiness?businessType=点到点代驾">查看更多</a>
				</p>
			</div>
			</c:forEach>
			<h6 class="clear"></h6>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
