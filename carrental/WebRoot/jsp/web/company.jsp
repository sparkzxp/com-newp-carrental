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
<script type="text/javascript" src="<%=basePath%>js/common/adv.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<%@ include file="part_banner.jsp"%>
		<div class="main">
			<div class="place">
				<div>
					您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>关于我们</span>
				</div>
				<h1>关于我们</h1>
			</div>
			<div class="box20 content">
				<img src="<%=basePath%>images/web/peitu.jpg" width="398" height="224"
					style="float: left; margin: 0 10px 0 0;" />
				${company.content}
				<p>联系地址：${company.address}</p>
				<p>邮编号码：${company.postcode}</p>
				<p>联系电话：${company.tel}</p>
				<p>传真地址：${company.fax}</p>
			</div>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
