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
								<td width="150"><img src="<%=basePath%>${parent.carSeries.seriesImgPath}" height="130" /></td>
								<td><table width="100%" border="0" cellpadding="0"
										cellspacing="8">
										<tr>
											<td width="12%">预定者姓名：</td>
											<td width="38%">${parent.bookUser.adminName}</td>
											<td width="12%">车 型：</td>
											<td width="38%">${parent.carSeries.seriesName}</td>
										</tr>
										<tr>
											<td>租用费用(元)：</td>
											<td>${parent.rentFee}</td>
											<td>手机号码：</td>
											<td>${parent.bookUser.phone}</td>
										</tr>
										<tr>
											<td>邮箱地址：</td>
											<td>${parent.bookUser.email}</td>
											<td>业务类型：</td>
											<td>${parent.business.businessType}</td>
										</tr>
										<tr>
											<td>接待日期：</td>
											<td>
												<c:if test="${parent.pickUpDt == null}"><span style="color: red;">未取车</span></c:if>
												<c:if test="${parent.pickUpDt != null}">
												<fmt:formatDate value="${parent.pickUpDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
											</td>
											<td>还车日期：</td>
											<td>
												<c:if test="${parent.giveBackDt == null}"><span style="color: red;">未还车</span></c:if>
												<c:if test="${parent.giveBackDt != null}">
												<fmt:formatDate value="${parent.giveBackDt}" type="both" pattern="yyyy/MM/dd HH:mm"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td>接待地点：</td>
											<td>
												${parent.bookPickUpAddress}
											</td>
											<td>还车地点：</td>
											<td>${parent.bookGiveBackAddress}</td>
										</tr>
									</table></td>
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
