<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汽车租赁后台管理系统</title>
<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$('p').click(function(o){
		for(var i=0; i<$('p').length; i++){
			if($('p')[i] == o.currentTarget){
				$($('p')[i]).find('a').addClass('current');
				$($('ul')[i]).find('li').show();
			}else{
				$($('p')[i]).find('a').removeClass('current');
				$($('ul')[i]).find('li').hide();
			}
		}
	});
});

function toUrl(url){
	parent.$("#mainFrame").attr("src",url).load();
}
</script>
</head>
<body>
<div class="leftmenu">
<p><a href="javascript:void(0);">用户管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?type=CUSTOM&isDelete=0&pageTitle=注册用户管理')">注册用户管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?type=ADMIN&isDelete=0&pageTitle=系统用户管理')">系统用户管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>resource/showResourceList')">资源配置管理</a></li>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>city/showCityList')">城市管理</a></p>
<ul>
</ul>
<p><a href="javascript:void(0);">菜单管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
</ul>
<p><a href="javascript:void(0);">菜单管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
</ul>
<p><a href="javascript:void(0);">菜单管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
</ul>
<p><a href="javascript:void(0);">菜单管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);">sub菜单管理</a></li>
</ul>
</div>
</body>
</html>