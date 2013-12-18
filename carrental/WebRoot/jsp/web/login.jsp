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
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
    $(function() {
    	$('#btn_submit').click(function(){
    		if($.trim($('#user_phone').val()) == ''){
    			$.prompt('请输入手机号码' ,{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else if($.trim($('#user_password').val()) == ''){
    			$.prompt('请输入密码' ,{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else{
	    		$.post('<%=basePath%>web/user/doLogin', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('点击确定跳转首页',{
							title: '登录成功',
		        			buttons: { "确定": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					window.location.href = '<%=basePath%>';
		        				}
		        			}
		        		});
	        		}else{
	        			$.prompt(data.result,{
							title: '登录失败',
		        			buttons: { "确定": false}
		        		});
	        		}
	    		}, "json");
    		}
    	});
    });
    </script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<form name="editForm" id="editForm">
	<div id="wrapp">
		<div class="login">
			<div class="login_title">
				<h1>
					如果您还不是是我们的会员，请点击【<a href="<%=basePath%>web/user/toRegist">会员注册</a>】，申请成为会员吧。
				</h1>
				<img src="<%=basePath%>images/web/cion14.gif" width="255" height="25" />
			</div>

			<table width="100%" border="0" cellspacing="26" cellpadding="0">
				<tr>
					<td width="25%" align="right">手机号码：</td>
					<td><input type="text" name="phone" id="user_phone"
						class="input" /></td>
				</tr>
				<tr>
					<td align="right">密码：</td>
					<td><input type="password" name="password" id="user_password"
						class="input" /></td>
				</tr>
				<!-- <tr>
					<td>&nbsp;</td>
					<td><input type="checkbox" name="checkbox" id="checkbox" />
						记住密码</td>
				</tr> -->
				<tr>
					<td>&nbsp;</td>
					<td><input type="button" id="btn_submit" value="登录"
						class="loginin" /></td>
				</tr>
			</table>
		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	</form>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
