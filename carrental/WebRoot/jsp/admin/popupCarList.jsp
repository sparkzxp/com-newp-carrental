<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>车辆管理</title>
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
					$("#car_plateNumber").val('');
					$("#car_seriesName").val(''); 
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//确认选择
				$("#ok").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						var data = '[{"id":"'+getSelectedByName('id')+'","plateNumber":"'+getSelectedByName('plateNumber')+'"}]';
						W.loadCarData(eval(data)[0]);
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
				$.show('车辆详细信息','<%=basePath%>car/toCarDetail?id='+id,500,400,'Z');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>car/showPopupCarList" id="queryForm">
	<div class="button_nde">
		车牌号码：<input type="text" id="car_plateNumber" name="plateNumber" value="${car.plateNumber}" class="input"/>
		车系名称：<input type="text" id="car_seriesName" name="carSeries.seriesName" value="${car.carSeries.seriesName}" class="input"/>
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
				<th>车牌号码</th>
				<th>车系名称</th>
				<th>采购时间</th>
				<th>所在城市</th>
			</tr>
			<c:forEach items="${cars}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="plateNumber" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.plateNumber}"/></a></td>
				<td name="carSeries" align="center"><c:out value="${parent.carSeries.seriesName}"/></td>
				<td name="purchaseDate" align="center"><fmt:formatDate value="${parent.purchaseDate}" type="both" pattern="yyyy-MM-dd"/></td>
				<td name="city" align="center"><c:out value="${parent.city.cityName}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>