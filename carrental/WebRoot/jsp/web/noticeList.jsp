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
<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<form action="<%=basePath%>web/toNoticeList" name="queryForm" id="queryForm">
		<div id="wrapp">
			<%@ include file="part_banner.jsp"%>
			<div class="main">
				<div class="place">
					<div>
						您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>公司公告列表</span>
					</div>
					<h1>公司公告列表</h1>
				</div>
				<div class="box20 sales">
					<c:forEach items="${noticeList}" var="parent">
					<div>
						<img src="<%=basePath%>${parent.imagePath}" width="348" height="191" />
						<h1>
							<a href="<%=basePath%>web/toNoticeDetail?id=${parent.id}">${parent.title}</a>
						</h1>
						<%-- ${fn:replace(parent.content,vEnter,"<br>")} --%>
						${parent.content}
						<p>
							<span>发布日期：<fmt:formatDate value="${parent.updatedDt}" type="both" pattern="yyyy/MM/dd HH:mm"/></span>
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
