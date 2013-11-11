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
<script type="text/javascript" src="<%=basePath%>js/common/adv.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<%@ include file="part_banner.jsp"%>
		<div class="main">
			<div class="place">
				<div>
					您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>关于新广</span>
				</div>
				<h1>关于新广</h1>
			</div>
			<div class="box20 content">
				<img src="<%=basePath%>images/web/peitu.jpg" width="398" height="224"
					style="float: left; margin: 0 10px 0 0;" />
				${company.content}
			</div>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
