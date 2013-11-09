<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>司机管理</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/common/pager.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script type="text/javascript">
		var api = frameElement.api, W = api.opener;
			$(function(){
				//清空
				$("#clearForm").click(function(){
					$("#driver_driverName").val('');
					$("#driver_driverCode").val(''); 
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//确认选择
				$("#ok").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						var data = '[{"id":"'+getSelectedByName('id')+'","driverName":"'+getSelectedByName('driverName')+'"}]';
						W.loadDriverData(eval(data)[0]);
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
				$.show('司机详细信息','<%=basePath%>driver/toDriverDetail?id='+id,500,400,'Z');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>driver/showPopupDriverList" id="queryForm">
	<div class="button_nde">
		司机名称：<input type="text" id="driver_driverName" name="driverName" value="${driver.driverName}" class="input"/>
		司机编号：<input type="text" id="driver_driverCode" name="driverCode" value="${driver.driverCode}" class="input"/>
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
				<th>司机名称</th>
				<th>司机编号</th>
				<th>联系电话</th>
				<th>司机驾龄(年)</th>
			</tr>
			<c:forEach items="${drivers}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="driverName" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.driverName}"/></a></td>
				<td name="driverCode" align="center"><c:out value="${parent.driverCode}"/></td>
				<td name="phone" align="center"><c:out value="${parent.phone}"/></td>
				<td name="driverYears" align="center"><c:out value="${parent.driverYears}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>