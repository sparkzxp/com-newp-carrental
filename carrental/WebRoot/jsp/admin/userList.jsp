<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script type="text/javascript">
			$(function(){
				if($('#admin_type').val() == ''){
					$('#modifyPwd').show();
					$('#resetPwd').show();
					$('.title').html('用户密码管理');
				}else{
					$('#add').show();
					$('#update').show();
					$('#del').show();
					$('#intoBlacklist').show();
					$('.title').html('注册用户管理');
				}
				
				//清空
				$("#clearForm").click(function(){
					$("#admin_adminName").val('');
					$("#admin_loginName").val('');
					$("#admin_phone").val('');
					$("#admin_email").val('');
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增系统用户','<%=basePath%>admin/toAdminEdit?id=&type='+$('#admin_type').val()+'&inBlacklist='+$('#admin_inBlacklist').val(),450,250,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.show('修改系统用户','<%=basePath%>admin/toAdminEdit?id='+ids[0],450,250,'A');
					}else{
						$.prompt('请选择一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				});
				//删除
				$("#del").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==0){
						$.prompt('请选择至少一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}else{
						$.prompt(
							{state0:{
								html: '确定要删除吗?删除后该用户将不能登录本系统',
			        			buttons: { "确认": 1, "取消": 0},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v==0){
			        					$.prompt.close();
			        				}else if(v==1){
			        					$.post("<%=basePath%>admin/doAdminDelete", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("adminName"))
			        						}, function(data){
						   					if(data.result=="SUCCESS"){
						   						$.prompt.goToState('state1', true);
						   						return false;
						   					}else{
						   						$.prompt.goToState('state2', true);
						   						return false;
						   					}
						   				}, "json");
			        				}
			        			}
			        		},
			        		state1:{
			        			html: '操作成功!点击确定返回列表',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.close();
			        					pageLoad();
			        				}
			        			}
			        		},
			        		state2:{
			        			html: '操作失败',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.goToState('state0');
			        				}
			        			}
			        		}}
						);
					}
				});
				//加入黑名单
				$("#intoBlacklist").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==0){
						$.prompt('请选择至少一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}else{
						$.prompt(
							{state0:{
								html: '确定要加入黑名单吗?加入黑名单后该用户的手机号和邮箱地址将不能在用来预订和租车',
			        			buttons: { "确认": 1, "取消": 0},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v==0){
			        					$.prompt.close();
			        				}else if(v==1){
			        					$.post("<%=basePath%>admin/doAdminIntoBlacklist", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("adminName"))
			        						}, function(data){
						   					if(data.result=="SUCCESS"){
						   						$.prompt.goToState('state1', true);
						   						return false;
						   					}else{
						   						$.prompt.goToState('state2', true);
						   						return false;
						   					}
						   				}, "json");
			        				}
			        			}
			        		},
			        		state1:{
			        			html: '操作成功!点击确定返回列表',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.close();
			        					pageLoad();
			        				}
			        			}
			        		},
			        		state2:{
			        			html: '操作失败',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.goToState('state0');
			        				}
			        			}
			        		}}
						);
					}
				});
				//修改密码
				$("#modifyPwd").click(function(){
					var ids = getSelectedIdArray();
					var name = getSelectedByName('adminName');
					if(ids.length==1){
						$.show('修改系统用户','<%=basePath%>admin/toResetPwd?id='+ids[0]+'&adminName='+name,450,250,'A');
					}else{
						$.prompt('请选择一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				});
				//还原密码
				$("#resetPwd").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.prompt(
							{state0:{
								html: '是否还原成初始密码：123456',
			        			buttons: { "确认": 1, "取消": 0},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v==0){
			        					$.prompt.close();
			        				}else if(v==1){
			        					$.post("<%=basePath%>admin/doResetPwd", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("adminName"))
			        						}, function(data){
						   					if(data.result=="SUCCESS"){
						   						$.prompt.goToState('state1', true);
						   						return false;
						   					}else{
						   						$.prompt.goToState('state2', true);
						   						return false;
						   					}
						   				}, "json");
			        				}
			        			}
			        		},
			        		state1:{
			        			html: '操作成功!点击确定返回列表',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.close();
			        					pageLoad();
			        				}
			        			}
			        		},
			        		state2:{
			        			html: '操作失败',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.goToState('state0');
			        				}
			        			}
			        		}}
						);
					}else{
						$.prompt('请选择一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				});
			});
			//重新提交表单刷新页面
			function pageLoad(){
				$("#queryForm").submit();
			}
			function showDetail(id){
				$.show('用户详细信息','<%=basePath%>admin/toAdminDetail?id='+id,400,300,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>admin/showAdminList" id="queryForm">
	<input type="hidden" id="admin_type" name="type" value="${admin.type}"/>
	<input type="hidden" id="admin_inBlacklist" name="inBlacklist" value="${admin.inBlacklist}"/>
	<input type="hidden" id="admin_isDelete" name="isDelete" value="0"/>
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">用户管理</a>&gt;
			<span class="title">注册用户管理</span></div>
		<h1 class="title">注册用户管理</h1>
	</div>
	<div class="button_nde">
		用户姓名：<input type="text" id="admin_adminName" name="adminName" value="${admin.adminName}" class="input"/>
		登录账号：<input type="text" id="admin_loginName" name="loginName" value="${admin.loginName}" class="input"/>
		移动电话：<input type="text" id="admin_phone" name="phone" value="${admin.phone}" class="input"/>
		邮箱地址：<input type="text" id="admin_email" name="email" value="${admin.email}" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<a href="javascript:void(0);" id="add" style="display: none;"><span>新增</span></a>
		<a href="javascript:void(0);" id="update" style="display: none;"><span>修改</span></a>
		<a href="javascript:void(0);" id="del" style="display: none;"><span>删除</span></a>
		<a href="javascript:void(0);" id="intoBlacklist" style="display: none;"><span>加入黑名单</span></a>
		<a href="javascript:void(0);" id="modifyPwd" style="display: none;"><span>修改密码</span></a>
		<a href="javascript:void(0);" id="resetPwd" style="display: none;"><span>还原密码</span></a>
		<h6 class="clear"></h6>
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show">
			<tr>
				<th width="20"><input type="checkbox" name="checkbox" id="checkbox" /></th>
				<th>用户姓名</th>
				<th>登录账号</th>
				<th>移动电话</th>
				<th>邮箱地址</th>
				<th>所在城市</th>
				<th>用户类型</th>
			</tr>
			<c:forEach items="${admins}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="adminName" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.adminName}"/></a></td>
				<td name="loginName" align="center"><c:out value="${parent.loginName}"/></td>
				<td name="phone" align="center"><c:out value="${parent.phone}"/></td>
				<td name="email" align="center"><c:out value="${parent.email}"/></td>
				<td name="city" align="center"><c:out value="${parent.city.cityName}"/></td>
				<td name="type" align="center">
					<c:if test="${parent.type == 'CUSTOM_PERSONAL'}">个人用户</c:if>
                	<c:if test="${parent.type == 'CUSTOM_COMPANY'}">企业用户</c:if>
                	<c:if test="${parent.type == 'ADMIN'}">系统用户</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>