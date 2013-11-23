<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>业务描述管理</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script type="text/javascript">
			$(function(){
				//清空
				$("#clearForm").click(function(){
					$("#businessDesc_name").val('');
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.show('修改系统业务描述','<%=basePath%>businessDesc/toBusinessDescEdit?id='+ids[0],550,400,'A');
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
				$.show('业务描述详细信息','<%=basePath%>businessDesc/toBusinessDescDetail?id='+id,550,400,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>businessDesc/showBusinessDescList" id="queryForm">
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">业务管理</a>&gt;业务描述管理</div>
		<h1>业务描述管理</h1>
	</div>
	<div class="button_nde">
		业务描述名称：<input type="text" id="businessDesc_name" name="name" value="${businessDesc.name}" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<a href="javascript:void(0);" id="update"><span>修改</span></a>
		<h6 class="clear"></h6>
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show">
			<tr>
				<th width="20"><input type="checkbox" name="checkbox" id="checkbox" /></th>
				<th>业务名称</th>
				<th>最后修改时间</th>
			</tr>
			<c:forEach items="${businessDescs}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="name" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.name}"/></a></td>
				<td name="updatedDt" align="center"><fmt:formatDate value="${parent.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</form>
	</body>
</html>