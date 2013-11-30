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
<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<form action="<%=basePath%>web/user/toUserRentHistory" name="queryForm" id="queryForm">
		<div id="wrapp">
			<div class="member">
				<div class="member_title">
					<a href="<%=basePath%>web/user/toUserManage">个人信息</a><a href="<%=basePath%>web/user/toUserPwdEdit">修改密码</a><a href="javascript:void(0)" class="current">租车历史</a>
					<h6 class="clear"></h6>
				</div>
				<div class="member_main">
					<c:forEach items="${rentCars}" var="parent">
					<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="150">
									<c:choose>
									<c:when test="${null == parent.carSeries or '' == parent.carSeries.seriesImgPath}">
										<img src="<%=basePath%>images/web/huodong.jpg" height="130" />
									</c:when>
									<c:otherwise><img src="<%=basePath%>${parent.carSeries.seriesImgPath}" height="130" /></c:otherwise>
									</c:choose>
								</td>
								<td><table width="100%" border="0" cellpadding="0"
										cellspacing="8">
										<tr>
											<td width="10%">预定编号：</td>
											<td width="13%">${parent.rentNumber}</td>
											<td width="10%">车 型：</td>
											<td width="13%">${parent.rentType.typeName}</td>
											<td width="10%">租用费用：</td>
											<td width="13%">${parent.rentFee}(元/天)</td>
										</tr>
										<tr>
											<td>预定人姓名：</td>
											<td>${parent.bookUser.adminName}</td>
											<td>手机号码：</td>
											<td>${parent.bookUser.phone}</td>
											<td>业务类型：</td>
											<td>${parent.business.businessType}</td>
										</tr>
										<tr>
											<td>预订取车地点：</td>
											<td>
												${parent.bookPickUpAddress}
											</td>
											<td>
												<c:if test="${parent.pickUpDt == null}">预订取车时间：</c:if>
												<c:if test="${parent.pickUpDt != null}">取车时间：</c:if>
											</td>
											<td>
												<c:if test="${parent.pickUpDt == null}">
												<fmt:formatDate value="${parent.bookPickUpDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
												<c:if test="${parent.pickUpDt != null}">
												<fmt:formatDate value="${parent.pickUpDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
											</td>
											<td>起始里程数：</td>
											<td>
												<c:choose>
													<c:when test="${parent.startMileage == null or parent.startMileage == ''}"><span style="color: red;">暂无</span></c:when>
													<c:otherwise>${parent.startMileage}(公里)</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>预订还车地点：</td>
											<td>${parent.bookGiveBackAddress}</td>
											<td>
												<c:if test="${parent.giveBackDt == null}">预订还车时间：</c:if>
												<c:if test="${parent.giveBackDt != null}">还车时间：</c:if>
											</td>
											<td>
												<c:if test="${parent.giveBackDt == null}">
												<fmt:formatDate value="${parent.bookGiveBackDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
												<c:if test="${parent.giveBackDt != null}">
												<fmt:formatDate value="${parent.giveBackDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
											</td>
											<td>结束里程数：</td>
											<td>
												<c:choose>
													<c:when test="${parent.endMileage == null or parent.endMileage == ''}"><span style="color: red;">暂无</span></c:when>
													<c:otherwise>${parent.endMileage}(公里)</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>超公里数：</td>
											<td>
												<c:choose>
													<c:when test="${parent.exceedKilometer == null or parent.exceedKilometer == ''}"><span style="color: red;">暂无</span></c:when>
													<c:otherwise>${parent.exceedKilometer}(公里)</c:otherwise>
												</c:choose>
											</td>
											<td>超小时数：</td>
											<td>
												<c:choose>
													<c:when test="${parent.exceedHour == null or parent.exceedHour == ''}"><span style="color: red;">暂无</span></c:when>
													<c:otherwise>${parent.exceedHour}(小时)</c:otherwise>
												</c:choose>
											</td>
											<td>费用总计：</td>
											<td>
												<c:choose>
													<c:when test="${parent.totalPrice == null or parent.totalPrice == ''}"><span style="color: red;">暂无</span></c:when>
													<c:otherwise>${parent.totalPrice}(元)</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<h6 class="clear"></h6>
					</div>
					</c:forEach>
					<%@ include file="part_pager.jsp"%>
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</div>
	</form>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
