<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="wrapp">
	<div class="topnav">
		<blockquote>
			<a href="javascript:void(0)">注册</a>/<a href="javascript:void(0)">登录</a>
		</blockquote>
		<h1>
			欢迎光临 新广得利租赁！<span>服务热线：4008-123-123</span>
		</h1>
	</div>
	<img src="<%=basePath%>images/web/logo.jpg" width="189" height="60" class="logo" />
	<div class="menu">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="290"><h1 id="date">现在时间：</h1></td>
				<td><a href="<%=basePath%>">首&nbsp;&nbsp;&nbsp;&nbsp;页</a><a href="<%=basePath%>/web/company">公司简介</a><a
					href="javascript:void(0)">在线订车</a><a href="javascript:void(0)">接送机</a><a href="javascript:void(0)">日&nbsp;&nbsp;&nbsp;&nbsp;租</a><a
					href="javascript:void(0)">业务介绍</a><a href="javascript:void(0)">优惠活动</a></td>
			</tr>
		</table>
	</div>
	<div class="notice">
		公告：
		<c:forEach items="${notices}" var="parent">
			<a href="javascript:void(0)">${parent.title}<span><fmt:formatDate value="${parent.updatedDt}" type="both" pattern="yyyy.MM.dd"/></span></a>
		</c:forEach>
	</div>
</div>
<script language="javascript">
	function show() {
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = date.getMinutes();
		//var second = date.getSeconds();
		if (month < 10) {
			month = "0" + month;
		}
		if (day < 10) {
			day = "0" + day;
		}
		if (hour < 10) {
			hour = "0" + hour;
		}
		if (minute < 10) {
			minute = "0" + minute;
		}
		/* if (second < 10) {
			second = "0" + second;
		} */
		var time = "现在时间：" + year + "." + month + "." + day + "&nbsp;"
				+ hour + ":" + minute;
		document.getElementById("date").innerHTML = time;
		setTimeout("show()", 3000);
	}
	window.onload = show;
	
	function logout(){
		if(confirm("确认退出本系统吗？")){
			$.post("<%=basePath%>user/logout", null, function(data) {
				parent.location.href = "<%=basePath%>";
			});
		}
	}
</script>