<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
<link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
	var begin;
	var secs = 0;
	var interval = 1000;
	function refreshCaptcha(){
		if(secs > 0){
			$('#pickCaptcha').val("获取验证码("+secs+")");
			secs--;
			begin = setTimeout('refreshCaptcha()', interval);
		}else{
			clearTimeout(begin);
			$('#pickCaptcha').val("获取验证码");
			$('#pickCaptcha').removeAttr("disabled");
		}
	}
	
    $(function() {
    	$('#pickCaptcha').click(function(){
    		if($.trim($('#user_phone').val()) == ''){
    			$.prompt('请先填写您的手机号码' ,{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else{
    			$(this).attr("disabled", "disabled");
	    		$.post('<%=basePath%>web/user/doPickCaptcha', {'phone':$.trim($('#user_phone').val())}, function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('验证码已发送到您的手机，请查收',{
							title: '提示',
		        			buttons: { "确定": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					secs = 60;
		        					begin = setTimeout('refreshCaptcha()', interval);
		        				}
		        			}
		        		});
	        		}else{
	        			$.prompt(data.result,{
							title: '提示',
		        			buttons: { "确定": false}
		        		});
	        			$('#pickCaptcha').removeAttr("disabled");
	        		}
	    		}, "json");
    		}
    	});
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>web/user/doRegist', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('点击确定跳转首页',{
							title: '注册成功',
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
							title: '注册失败',
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
					如果您已经是我们的会员，请点击【<a href="<%=basePath%>web/user/toLogin">会员登录</a>】，直接使用吧。
				</h1>
				<img src="<%=basePath%>images/web/cion15.gif" width="331" height="25" />
			</div>

			<table width="100%" border="0" cellspacing="26" cellpadding="0">
				<tr>
					<td width="25%" align="right"><font>*</font>邮箱地址：</td>
					<td><input type="text" name="email"
						class="{required:true,email:true,maxlengthCN:50} input" /> 请输入您的邮箱号码，我们会向您发送最新的优惠信息</td>
				</tr>
				<tr>
					<td align="right"><font>*</font>手机号码：</td>
					<td><input type="text" id="user_phone" name="phone"
						class="{required:true,phoneCN:true,maxlengthCN:50} input" /><input type="button"
						class="get" id="pickCaptcha" value="获取验证码" /> 请输入您的手机号码，以便我们向您确认预订信息</td>
				</tr>
				<tr>
					<td align="right"><font>*</font>手机验证码：</td>
					<td><input type="text" name="captcha"
						class="{required:true,digits:true,minlength:6,maxlength:6} input" /> 请输入验证码</td>
				</tr>
				<tr>
					<td align="right"><font>*</font>密码：</td>
					<td><input type="password" name="password" id="user_password"
						class="{required:true,minlengthCN:6,maxlengthCN:50,alphanumeric:true} input" /> 请输入密码，6-20位字符</td>
				</tr>
				<tr>
					<td align="right"><font>*</font>确认密码：</td>
					<td><input type="password"
						class="{required:true,minlengthCN:6,maxlengthCN:50,alphanumeric:true,equalTo:'#user_password'} input" /> 请再一次输入密码</td>
				</tr>
				<tr>
					<td align="right"><font>*</font>姓名：</td>
					<td><input type="text" name="adminName"
						class="{required:true,maxlengthCN:50} input" /> <input name="sex" type="radio"
						value="female" checked="checked" /> 女士 <input type="radio"
						name="sex" value="male" /> 先生</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="button" id="btn_submit"
						value="立即注册" class="loginin" /></td>
				</tr>
			</table>

		</div>
		<%@ include file="part_help.jsp"%>
	</div>
	</form>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
