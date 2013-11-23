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
	<form name="queryForm" id="queryForm">
		<div id="wrapp">
			<%@ include file="part_banner.jsp"%>
			<div class="main">
				<div class="place">
					<div>
						您所在的位置：<a href="<%=basePath%>">首页</a>&gt;<span>公司业务详细</span>
					</div>
					<h1>公司业务详细</h1>
				</div>
				<div class="box20 content">
					<h2>${businessDesc.name}</h2>
					<!-- <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
						<span class="bds_more">分享到：</span> <a class="bds_qzone">QQ空间</a> <a
							class="bds_tsina">新浪微博</a> <a class="bds_tqq">腾讯微博</a> <a
							class="bds_renren">人人网</a> <a class="bds_t163">网易微博</a> <a
							class="shareCount"></a>
					</div>
					<h6 class="clear"></h6>
					<script type="text/javascript" id="bdshare_js"
						data="type=tools&amp;uid=0"></script>
					<script type="text/javascript" id="bdshell_js"></script>
					<script type="text/javascript">
						var bds_config = {
							"bdTop" : 15
						};
						document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
								+ Math.ceil(new Date() / 3600000);
					</script> -->

					<div align="center">
						<img src="<%=basePath%>images/web/work01.jpg" width="348" height="191" />
					</div>
					<%-- ${fn:replace(parent.content,vEnter,"<br>")} --%>
					${businessDesc.content}
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</div>
	</form>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
