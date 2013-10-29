<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理</title>
		<base href="<%=basePath%>">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
		<script type="text/javascript">
			$(function(){
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增用户信息','<%=basePath%>sys/admin_toEdit',800,430,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = checkMess();
					if(ids.length==1){
						$.show('修改用户信息','<%=basePath%>sys/admin_toEdit?admin.id='+ids[0],800,500,'A');
					}else{
						alert("请选择一条数据!");
					}
				});
				//详细
				$("#detail").click(function(){
					var ids = checkMess();
					if(ids.length==1){
						$.show('用户详细信息','<%=basePath%>sys/admin_toDetail?admin.id='+ids[0],800,350,'A');
					}else{
						alert("请选择一条数据!");
					}
				});
				//分配角色
				$("#editAdminRole").click(function(){
					var ids = checkMess();
					if(ids.length < 1){
						alert("请选择至少一条数据!");
					}else{
						$.show('分配角色','<%=basePath%>sys/admin_toEditAdminRole?adminIds='+idToString()+'&names='+getNames(),800,530,'A');
					}
				});	
				//删除
				$("#del").click(function(){
					var ids = checkMess();
					if(ids.length==0){
						alert("请选择至少一条数据!");
					}else{
						$.confirm("确定要删除吗?删除后该用户将不能登录本系统!", function(){
							$.post("<%=basePath%>sys/admin_delete?params="+idToString(),{"names":getNames()},function(data){
			   					if(data=="success"){
			   						$.success("操作成功!点击确定返回列表.",function(){
			   							pageLoad();
									}).lock(true);			   					 	
			   					}else{
			   						alert("操作失败!");
			   					}
			   				}); 
						});
					}
				});
				//全选全不选
				$("#checkAll").click(function(){
					checkAll(this.checked);
				});	
				//清空
				$("#clearForm").click(function(){
					$("#q_admin_name").val('');
					$("#q_login_name").val(''); 
				});
			});
			//重新提交表单刷新页面
			function pageLoad(){
				$("#queryForm").submit();
			}
		</script>	
	</head>
	<body>
	<form action="<%=basePath%>admin/showAdminList" id="queryForm">	
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="#">首页</a>&gt;<a href="#">菜单管理</a>&gt;菜单管理</div>
		<h1>sub菜单管理</h1>
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
			<tr onMouseOver="this.className='list_table_hilite'" onMouseOut="this.className=''">
				<td align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td align="center"><c:out value="${parent.adminName}"/>&nbsp;</td>
				<td align="center"><c:out value="${parent.loginName}"/>&nbsp;</td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>