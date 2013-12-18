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

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<form name="editForm" id="editForm">
			<div class="choose_car">
				<ul>
					<li><span>1</span>
					<h1>选择用车方式</h1></li>
					<li><span>2</span>
					<h1>选择车辆</h1></li>
					<li><span>3</span>
					<h1>填写乘车信息</h1></li>
					<li><span>4</span>
					<h1>确认订单</h1></li>
					<li class="now"><span>5</span>
					<h1>成功</h1></li>
				</ul>
				<h6 class="clear"></h6>
			</div>
			<div class="main">
				<div class="place">

					<h1>订单详情</h1>
				</div>
				<div class="box">
					<p style="margin: 100px 0; text-indent: 2em;">
						您的订单已成功，请保持您留下的联系方式畅通，以便于我们客服与您联系！如果有问题，可以随时联系我们：${company.tel}！<a
							href="<%=basePath%>web/user/toUserRentHistory" style="color: #f00; text-decoration: underline;">查看我的订单</a>
					</p>
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
