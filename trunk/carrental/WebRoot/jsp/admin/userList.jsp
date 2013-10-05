<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户管理</title>
		<base href="<%=basePath%>">
		<link href="<%=basePath%>css/content_list.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript">
			$(function(){
				//隔行显示颜色
				$(".mytable tr:odd").css("background", "#eeffff");
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增用户信息','<%=basePath%>sys/user_toEdit',800,430,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = checkMess();
					if(ids.length==1){
						$.show('修改用户信息','<%=basePath%>sys/user_toEdit?user.id='+ids[0],800,500,'A');
					}else{
						alert("请选择一条数据!");
					}
				});	
				//详细
				$("#detail").click(function(){
					var ids = checkMess();
					if(ids.length==1){
						$.show('用户详细信息','<%=basePath%>sys/user_toDetail?user.id='+ids[0],800,350,'A');
					}else{
						alert("请选择一条数据!");
					}
				});
				//分配角色
				$("#editUserRole").click(function(){
					var ids = checkMess();
					if(ids.length < 1){
						alert("请选择至少一条数据!");
					}else{
						$.show('分配角色','<%=basePath%>sys/user_toEditUserRole?userIds='+idToString()+'&names='+getNames(),800,530,'A');
					}
				});	
				//删除
				$("#del").click(function(){
					var ids = checkMess();
					if(ids.length==0){
						alert("请选择至少一条数据!");
					}else{
						$.confirm("确定要删除吗?删除后该用户将不能登录本系统!", function(){
							$.post("<%=basePath%>sys/user_delete?params="+idToString(),{"names":getNames()},function(data){
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
					$("#q_user_name").val('');
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
		<form action="user/showUserList" id="queryForm">	
			<div class="content_title">用户管理</div>
			<div class="content_list">
				<ul>
				    <li>用户姓名：<input type="text" id="q_user_name" name="userName"/></li>
				    <li>登录账号：<input type="text" id="q_login_name" name="loginName"/></li>
			    </ul>			
			    <input type="button" class="sub" id="clearForm" value="清空">
			    <input type="button" class="sub" id="query" value="查询">
                <input type="button" class="sub" id="add" value="新增">
				<input type="button" class="sub" id="update" value="修改">
				<input type="button" class="sub" id="del" value="删除">
				<input type="button" class="sub" id="editUserRole" value="分配角色">
			</div>
			
			<div class="content_table">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" class="mytable">
				<tr>
					<th width="5%">
						<input type="checkbox" id="checkAll"/>
					</th>
					<th align="center">
						用户姓名
					</th>
					<th align="center">
						登录账号
					</th> 
				</tr>
				<c:forEach var="" items="users" varStatus="parent">
					<tr onMouseOver="this.className='list_table_hilite'" onMouseOut="this.className=''">
						<td align="center"><input type="checkbox" value="<c:out value=”${parent.id}”/>"/></td>
						<td align="center"><c:out value=”${parent.userName}”/>&nbsp;</td>
						<td align="center"><c:out value=”${parent.loginName}”/>&nbsp;</td>
					</tr>								
				</c:forEach>
			</table>
			</div>
		</form>
	</body>
</html>