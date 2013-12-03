<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>汽车租赁后台管理系统 登录</title>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/common/png.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.query-2.1.7.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/json2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	if(window.parent!=window){
		top.location.href = "<%=basePath%>admin/login";
	}
	
	if($.query.get('logout') == '' && '${message}' == '' && $.cookie('carrental.com') != null){
		var adminJson = JSON.parse($.cookie('carrental.com'));
		$('#admin_loginName').val(adminJson.loginName);
		$('#admin_password').val(adminJson.password);
		submitLoginForm();
	}
	
	if($('#admin_loginName').val()==''){
		$('#admin_loginName').focus();
	}else if($('#admin_password').val()==''){
		$('#admin_password').focus();
	}
	document.onkeydown = function(e){
		var ev = document.all ? window.event : e;
		if(ev.keyCode==13) {
			if($('#admin_loginName').val()==''){
				$('#admin_loginName').focus();
			}else if($('#admin_password').val()==''){
				$('#admin_password').focus();
			}else{
				submitLoginForm();
			}
		};
	};
});

function submitLoginForm(){
	$("#admin_loginName").val($.trim($("#admin_loginName").val()));
	$("#admin_password").val($.trim($("#admin_password").val()));
	if($("#admin_loginName").val()==""){
		alert("用户名不能为空!");
	}else if($("#admin_password").val()==""){
		alert("密码不能为空!");
	}else{
		if($('#checkbox').attr('checked') == 'checked'){
			$.cookie('carrental.com', '{"loginName":"'+$("#admin_loginName").val()+'","password":"'+$("#admin_password").val()+'"}', { expires: 7, path: '/' });
		}
		$("#loginForm").submit();
	}
}
</script>
</head>
<body class="login">
<form id="loginForm" name="loginForm" method="post" action="main/login">
<input type="hidden" id="admin_type" name="type" value="ADMIN">
<input type="hidden" id="admin_isDelete" name="isDelete" value="0">
<div id="wrapp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="register_table">
      <tr>
        <td width="390" height="353">&nbsp;</td>
        <td valign="middle">
            <div align="center" class="register">
            <table width="100%" border="0" cellpadding="0" cellspacing="20">
              <tr>
                <td><input name="loginName" id="admin_loginName" type="text" class="input" id="textfield" /></td>
              </tr>
              <tr>
                <td><input name="password" id="admin_password" type="password" class="input" id="textfield2" /></td>
              </tr>
              <tr>
                <td><input type="checkbox" id="checkbox" checked="checked" />
                  记住密码&nbsp;&nbsp;<span style="color: red;">${message}</span></td>
              </tr>
              <tr>
                <td><input type="button" value="登录" class="register_icon" onclick="submitLoginForm()"/></td>
              </tr>
            </table>
            
          </div>
        </td>
      </tr>
    </table>
    <h1>技术支持：某某公司</h1>
</div>
</form>
</body>

</html>
