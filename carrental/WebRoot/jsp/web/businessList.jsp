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
				<a href="<%=basePath%>web/toBusinessDetail?name=点到点代驾">
					<h1>点到点代驾</h1> <img src="<%=basePath%>images/web/work01.jpg" width="298"
					height="313" />
					<p>驾龄超过5年的专业司机提供服务。 统一着装：衬衫、西裤、白手套，秋冬季节配深色西装外套。
						标准普通话，经过培训的统一话术，文明用语。</p>
				</a> <a href="<%=basePath%>web/toBusinessDetail?name=机场及车站接送">
					<h1>机场及车站接送</h1> <img src="<%=basePath%>images/web/work02.jpg" width="298"
					height="313" />
					<p>会务用车，新广会务组提供专人全程跟踪。 现场和云端结合的车辆调度方式，确保您和您的客户的尊贵体验。</p>
				</a> <a href="<%=basePath%>web/toBusinessDetail?name=市用半日租">
					<h1>市用半日租</h1> <img src="<%=basePath%>images/web/work02.jpg" width="298"
					height="313" />
					<p>会务用车，新广会务组提供专人全程跟踪。 现场和云端结合的车辆调度方式，确保您和您的客户的尊贵体验。</p>
				</a> <a href="<%=basePath%>web/toBusinessDetail?name=市用全日租">
					<h1>市用全日租</h1> <img src="<%=basePath%>images/web/work01.jpg" width="298"
					height="313" />
					<p>驾龄超过5年的专业司机提供服务。 统一着装：衬衫、西裤、白手套，秋冬季节配深色西装外套。
						标准普通话，经过培训的统一话术，文明用语。</p>
				</a> <a href="<%=basePath%>web/toBusinessDetail?name=会务车辆安排">
					<h1>会务车辆安排</h1> <img src="<%=basePath%>images/web/work02.jpg" width="298"
					height="313" />
					<p>会务用车，新广会务组提供专人全程跟踪。 现场和云端结合的车辆调度方式，确保您和您的客户的尊贵体验。</p>
				</a> <a href="<%=basePath%>web/toBusinessDetail?name=周边省市包车">
					<h1>周边省市包车</h1> <img src="<%=basePath%>images/web/work02.jpg" width="298"
					height="313" />
					<p>会务用车，新广会务组提供专人全程跟踪。 现场和云端结合的车辆调度方式，确保您和您的客户的尊贵体验。</p>
				</a>
				<h6 class="clear"></h6>
			</div>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
