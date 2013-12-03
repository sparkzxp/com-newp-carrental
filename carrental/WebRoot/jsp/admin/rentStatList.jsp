<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>数据统计汇总</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#statStartDate").addClass("Wdate").click(function(){
					WdatePicker({dateFmt:'yyyy-MM'});
				});
		    	$("#statEndDate").addClass("Wdate").click(function(){
					WdatePicker({dateFmt:'yyyy-MM'});
				});
		    	
		    	if('${result}' != ''){
		    		$.prompt('${result}',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
		    	}
		    	
				//查询
				$("#query").click(function(){
					if($('#statStartDate').val() == ''){
						$.prompt('请设置统计开始时间',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}else if($('#statEndDate').val() == ''){
						$.prompt('请设置统计结束时间',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}else{
						pageLoad();
					}
				});
			});
			//重新提交表单刷新页面
			function pageLoad(){
				$("#queryForm").submit();
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>stat/showRentStatList" id="queryForm">
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;数据统计汇总</div>
		<h1>数据统计汇总</h1>
	</div>
	<div class="button_nde">
		统计时间从：<input type="text" id="statStartDate" name="statStartDate" readonly="readonly" value="<fmt:formatDate value="${statStartDate}" type="both" pattern="yyyy-MM"/>" class="input"/>
		至：<input type="text" id="statEndDate" name="statEndDate" readonly="readonly" value="<fmt:formatDate value="${statEndDate}" type="both" pattern="yyyy-MM"/>" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
	</div>
	<div class="button_nde">
		<h6 class="clear"></h6>
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show">
			<tr>
				<th width="25%">统计月份</th>
				<th>租车数量</th>
				<th>取消预订数量</th>
				<th>费用总计(元)</th>
			</tr>
			<c:forEach items="${statList}" var="parent">
			<tr>
				<td name="dt" align="center"><c:out value="${parent.dt}"/></td>
				<td name="rentNum" align="center"><c:out value="${parent.rentNum}"/></td>
				<td name="cancelNum" align="center"><c:out value="${parent.cancelNum}"/></td>
				<td name="totalPrice" align="center">
					<c:if test="${parent.totalPrice == null}">0</c:if>
					<c:out value="${parent.totalPrice}"/>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</form>
	</body>
</html>