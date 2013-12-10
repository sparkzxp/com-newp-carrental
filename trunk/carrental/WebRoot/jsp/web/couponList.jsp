<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广得利租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/adv.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<form action="<%=basePath%>web/toCouponList" name="queryForm" id="queryForm">
		<div id="wrapp">
			<%@ include file="part_banner.jsp"%>
			<div class="main">
				<div class="place">
					<div>
						您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>优惠活动列表</span>
					</div>
					<h1>优惠活动列表</h1>
				</div>
				<div class="box20 sales">
					<c:forEach items="${couponList}" var="parent">
					<div>
						<img src="<%=basePath%>${parent.imagePath}" width="348" height="191" />
						<h1>
							<a href="<%=basePath%>web/toCouponDetail?id=${parent.id}">${parent.couponTitle}</a>
						</h1>
						<%-- ${fn:replace(parent.content,vEnter,"<br>")} --%>
						<p>${parent.couponType}</p>
						<p>
							<span>活动日期：<fmt:formatDate value="${parent.startDate}" type="both" pattern="yyyy/MM/dd"/>&nbsp;-&nbsp;<fmt:formatDate
								value="${parent.endDate}" type="both" pattern="yyyy/MM/dd"/></span>
						</p>
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
