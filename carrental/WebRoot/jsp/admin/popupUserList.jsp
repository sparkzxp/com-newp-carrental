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
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script type="text/javascript">
		var api = frameElement.api, W = api.opener;
			$(function(){
				//清空
				$("#clearForm").click(function(){
					$("#admin_adminName").val('');
					$("#admin_phone").val('');
					$("#admin_email").val('');
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//确认选择
				$("#ok").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						var data = '[{"id":"'+getSelectedByName('id')+'","adminName":"'+getSelectedByName('adminName')+'"}]';
						W.loadData(eval(data)[0]);
						setTimeout(function(){api.close();},100);
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
	<div class="button_nde">
		用户姓名：<input type="text" id="admin_adminName" name="adminName" value="${admin.adminName}" class="input"/>
		移动电话：<input type="text" id="admin_phone" name="phone" value="${admin.phone}" class="input"/>
		邮箱地址：<input type="text" id="admin_email" name="email" value="${admin.email}" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<a href="javascript:void(0);" id="ok"><span>确认选择</span></a>
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