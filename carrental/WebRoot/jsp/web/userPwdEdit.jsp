<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
    $(function() {
    	$('#pickCaptcha').click(function(){
    		if($.trim($('#user_phone').val()) == ''){
    			$.prompt('请先填写您的手机号码' ,{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else{
	    		$.post('<%=basePath%>web/user/doPickCaptcha', {'phone':$.trim($('#user_phone').val())}, function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('验证码已发送到您的手机，请查收',{
							title: '提示',
		        			buttons: { "确定": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        				}
		        			}
		        		});
	        		}else{
	        			$.prompt(data.result,{
							title: '提示',
		        			buttons: { "确定": false}
		        		});
	        		}
	    		}, "json");
    		}
    	});
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>web/user/doUserPwdEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('您的密码已修改成功',{
							title: '提示',
		        			buttons: { "确定": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					$('#user_password').val('');
		        					$('#user_repassword').val('');
		        				}
		        			}
		        		});
	        		}else{
	        			$.prompt(data.result,{
							title: '提示',
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
		<input type="hidden" id="user_id" name="id" value="${user.id}"/>
		<input type="hidden" name="adminName" value="${user.adminName}"/>
		<input type="hidden" name="type" value="${user.type}"/>
		<div id="wrapp">
			<div class="member_title">
				<a href="<%=basePath%>web/user/toUserManage" class="current">个人信息</a><a href="javascript:void(0)">修改密码</a><a href="<%=basePath%>web/user/toUserRentHistory">租车历史</a>
				<h6 class="clear"></h6>
				<div class="member_main">
					<h1>注：如果您忘记了密码，点击获取验证码，您将会接收到验证短信。输入您接收到的验证码您就可以设置新密码了！</h1>
					<div style="padding: 50px 0">
						<table width="100%" border="0" cellspacing="15" cellpadding="0">
							<tr>
								<td width="15%" align="right">手机号码：</td>
								<td><input name="phone" type="text" class="input"
									id="user_phone" value="${user.phone}" readonly="readonly"/><input type="button" id="pickCaptcha"
									class="get" value="获取验证码" /></td>
							</tr>
							<tr>
								<td align="right">验证码：</td>
								<td><input name="phoneCaptcha" type="text" class="{required:true,digits:true,minlength:6,maxlength:6} input"/></td>
							</tr>
							<tr>
								<td align="right">新密码：</td>
								<td><input name="password" type="password" class="{required:true,minlengthCN:6,maxlengthCN:50,alphanumeric:true} input"
									id="user_password" /></td>
							</tr>
							<tr>
								<td align="right">确认密码：</td>
								<td><input type="password" id="user_repassword" class="{required:true,minlengthCN:6,maxlengthCN:50,alphanumeric:true,equalTo:'#user_password'} input"/></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="button" id="btn_submit"
									value="确定" class="loginin" /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<%@ include file="part_help.jsp"%>
		</div>
	</form>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
