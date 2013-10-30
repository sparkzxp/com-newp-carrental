<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理管理</title>
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
				//清空
				$("#clearForm").click(function(){
					$("#q_admin_name").val('');
					$("#q_login_name").val(''); 
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增系统用户','<%=basePath%>admin/toAdminEdit?id=&type='+$('#admin_type').val(),450,200,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.show('修改系统用户','<%=basePath%>admin/toAdminEdit?id='+ids[0],450,200,'A');
					}else{
						$.prompt('请选择一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				});
				//分配角色
				$("#editAdminRole").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length < 1){
						$.prompt('请选择至少一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}else{
						$.show('分配角色','<%=basePath%>sys/admin_toEditAdminRole?adminIds='+idToString()+'&names='+getNames(),800,530,'A');
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
			});
			//重新提交表单刷新页面
			function pageLoad(){
				$("#queryForm").submit();
			}
			function showDetail(id){
				$.show('用户详细信息','<%=basePath%>admin/toAdminDetail?id='+id,400,250,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>admin/showAdminList" id="queryForm">
	<input type="hidden" id="admin_type" name="type" value="${admin.type}"/>
	<input type="hidden" id="admin_isDelete" name="isDelete" value="0"/>
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="#">首页</a>&gt;<a href="#">用户管理</a>&gt;${pageTitle}</div>
		<h1>${pageTitle}</h1>
	</div>
	<div class="content_list">
		<ul>
		    <li>用户姓名：<input type="text" id="q_admin_name" name="adminName" value="${admin.adminName}"/></li>
		    <li>登录账号：<input type="text" id="q_login_name" name="loginName" value="${admin.loginName}"/></li>
	    </ul>			
	</div>
	<div class="button_nde">
		<input type="button" id="clearForm" value="清空">
	    <input type="button" id="query" value="查询">
		<input type="button" id="add" value="新增">
		<input type="button" id="update" value="修改">
		<input type="button" id="del" value="删除">
		<input type="button" id="editAdminRole" value="分配角色">
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show mytable">
			<tr>
				<th width="20"><input type="checkbox" name="checkbox" id="checkbox" /></th>
				<th>用户姓名</th>
				<th>登录账号</th>
			</tr>
			<c:forEach items="${admins}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="adminName" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.adminName}"/></a></td>
				<td name="loginName" align="center"><c:out value="${parent.loginName}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>