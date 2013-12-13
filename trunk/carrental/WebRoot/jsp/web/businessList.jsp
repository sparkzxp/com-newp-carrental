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
</head>
<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<div class="main">
			<div class="place">
				<div>
					您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>业务介绍</span>
				</div>
				<h1>业务介绍</h1>
			</div>
			<div class="work">
				<c:forEach items="${businessDescs}" var="parent">
				<a href="<%=basePath%>web/toBusinessDetail?name=${parent.name}">
					<h1>${parent.name}</h1> <img src="<%=basePath%>${parent.imagePath}" width="298"
					height="313" />
					<p>${parent.brief}</p>
				</a>
				</c:forEach>
				<h6 class="clear"></h6>
			</div>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
