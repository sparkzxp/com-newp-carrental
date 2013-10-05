<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>主页</title>
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/mainlayout.js"></script>

<script type="text/javascript">
$.ajaxSetup({cache: false });
function logout(){
	if(confirm("确认退出本系统吗？")){
		$.post("<%=basePath%>user/logout", null, function(data) {
			parent.location.href = "<%=basePath%>";
		});
	}
}

function toUrl(url){
	$("#frame_list").attr("src",url).load();
}

$(function(){
	$("#frame_list").attr("src",'<%=basePath%>jsp/index/welcome.jsp');
	$(".listMenuMain").find(".level_1").click(showMenu);
	$(".listMenuMain").find(".level_2,.level_3").click(function(event){
		$(".listMenuMain").find(".level_1").unbind();
		var ele = $(this).find(".listMenuTriangle").first();
		if(null != ele){
			ele.next().toggle();
			if(ele.next().css("display")!='none'){
				$(this).addClass("listChildren");
				if($(this).find("li").length <= 0){
					$(this).removeClass("listChildren");
				}
			}else{
				$(this).removeClass("listChildren");
			}
		}
		//阻止事件向上传递
		event.stopPropagation();
		$(".listMenuMain").find(".level_1").click(showMenu);
	});
});

function showMenu(){
	$("li").removeClass("listChildren");
	var ele = $(this).find(".listMenuTriangle").first();
	$(".listMenuTriangle").next("ul").hide();
	$(".listMenuMain").find("li").removeClass("listMenuActive");
	$(this).addClass("listMenuActive");
	if(null != ele){
		ele.next().toggle();
	}
}
</script>
</head>

<body scroll=no>
<div id="header">
    <div id="login_info">
    	<p>欢迎：${user.userName }</p>
        <p>[ <a href="javascript:logout();">退出</a> ]</p>
    </div>
    <div style="clear:both;"></div>
</div>
<div id="left">
	<ul class="listMenuMain">
        <li class="level_1"><img src="images/img/mainList8.png" />系统参数配置
        	<span class="listMenuTriangle"></span>
        	<ul style="display: none;">
        		<li class="level_2" onclick="toUrl('user/showUserList')">用户管理</li>
        	</ul>
        </li>
    </ul>
</div>
<div id="foot">
	<p>copyright@2012-2014</p>
</div>
<div id="content">
	<iframe width="100%" id="frame_list" height="97%" frameborder="0" marginwidth="100%" marginheight="100%" ></iframe>
</div>
</body>
</html>
