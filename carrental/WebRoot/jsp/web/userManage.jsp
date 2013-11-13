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
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>web/user/doUserManage', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('您的信息已修改成功',{
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
				<a href="javascript:void(0)" class="current">个人信息</a><a href="<%=basePath%>web/user/toUserPwdEdit">修改密码</a><a href="<%=basePath%>web/user/toRentHistory">租车历史</a>
				<h6 class="clear"></h6>
				<div class="member_main">
					<h1>登录账号和用户名不可修改！您可完善您的个人信息，以便于我们与您联系！</h1>
					<div style="padding: 50px 0">
						<table width="100%" border="0" cellspacing="15" cellpadding="0">
							<tr>
								<td width="15%" align="right">手机号码：</td>
								<td>${user.phone}</td>
							</tr>
							<tr>
								<td align="right">姓名：</td>
								<td>${user.adminName}
									<c:if test="${user.sex == 'male'}">先生</c:if>
                					<c:if test="${user.sex == 'female'}">女士</c:if>
								</td>
							</tr>
							<tr>
								<td align="right">用户类型：</td>
								<td><c:if test="${user.type == 'CUSTOM_PERSONAL'}">个人用户</c:if>
									<c:if test="${user.type == 'CUSTOM_COMPANY'}">企业用户</c:if>
									<c:if test="${user.type == 'ADMIN'}">系统用户</c:if>
								</td>
							</tr>
							<c:if test="${user.type == 'CUSTOM_COMPANY'}">
							<tr>
								<td align="right">企业名称：</td>
								<td>${user.companyName}
								</td>
							</tr>
							</c:if>
							<tr>
								<td align="right">联系地址：</td>
								<td><input name="address" value="${user.address}" type="text" class="{maxlengthCN:200} input"/></td>
							</tr>
							<tr>
								<td align="right">QQ：</td>
								<td><input name="qq" value="${user.qq}" type="text" class="{digits:true,maxlengthCN:20} input"/></td>
							</tr>
							<tr>
								<td align="right">Email：</td>
								<td><input name="email" value="${user.email}" type="text" class="{required:true,email:true,maxlengthCN:50} input"/></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="button" id="btn_submit" value="确定" class="loginin" /></td>
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
