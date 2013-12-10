<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新广得利租车后台管理系统</title>
<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/common/png.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
$.ajaxSetup({cache: false });
function logout(){
	if(confirm("确认退出本系统吗？")){
		$.post("<%=basePath%>main/logout", null, function(data) {
			parent.location.href = "<%=basePath%>admin?logout=TRUE";
		});
	}
}
</script>
</head>
<body>
<div class="topnav">
   	<div class="loginbar"><a href="javascript:void(0);" class="member">欢迎，用户&nbsp;${admin.adminName }</a><a href="javascript:logout();">注销</a></div>
</div>
<div class="menu">
    <a href="javascript:void(0);" class="current"><span>首页</span></a>
    <!-- <a href="javascript:void(0);"><span>菜单管理</span></a>
    <a href="javascript:void(0);"><span>用户管理</span></a>
    <a href="javascript:void(0);"><span>角色</span></a>
    <a href="javascript:void(0);"><span>密码初始化</span></a>
    <a href="javascript:void(0);"><span>短信平台</span></a>
    <a href="javascript:void(0);"><span>修改密码</span></a> -->
    <h6 class="clear"></h6>
</div>
</body>
</html>