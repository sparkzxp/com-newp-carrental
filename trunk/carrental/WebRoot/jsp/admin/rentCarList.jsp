<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>车辆租用管理</title>
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
				$('.title').html($('#rentCar_business').val());
				//清空
				$("#clearForm").click(function(){
					$("#rentCar_rentNumber").val('');
					$("#rentCar_carSeries_seriesName").val(''); 
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//分配车辆和司机
				$("#allot").click(function(){
					// 状态为2的才允许修改
					var ids = getSelectedIdArray();
					if(ids.length==1){
						if(getSelectedByName('rentStatus') == '2'){
							$.show('分配车辆和司机','<%=basePath%>rentCar/toCarAndDriverAllot?id='+ids[0]+'&business.businessType='+$('#rentCar_business').val()+'&business.id='+$('#rentCar_business_id').val(),700,500,'A');
						}else{
							$.prompt('该预订还未生效或已出租，无法分配车辆和司机',{
								title: '提示',
			        			buttons: { "确认": false}
			        		});
						}
					}else{
						$.prompt('请选择一条数据',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				});
				//取车
				$("#pickUp").click(function(){
					// 状态为2的才允许修改
					var ids = getSelectedIdArray();
					if(ids.length==1){
						if(getSelectedByName('car') == '' || getSelectedByName('driver') == ''){
							$.prompt('取车前请先分配车辆和司机',{
								title: '提示',
			        			buttons: { "确认": false}
			        		});
						}else if(getSelectedByName('rentStatus') == '2'){
							$.show('取车','<%=basePath%>rentCar/toCarPickUp?id='+ids[0]+'&business.businessType='+$('#rentCar_business').val()+'&business.id='+$('#rentCar_business_id').val(),700,500,'A');
						}else{
							$.prompt('该预订还未生效或已取车，请不要再次取车',{
								title: '提示',
			        			buttons: { "确认": false}
			        		});
						}
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
				$.show('车辆预订详细信息','<%=basePath%>rentCar/toRentCarDetail?id='+id,700,500,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>rentCar/showRentCarList" id="queryForm">
    <input type="hidden" id="rentCar_business" name="business.businessType" value="${rentCar.business.businessType}"/>
    <input type="hidden" id="rentCar_business_id" name="business.id" value="${rentCar.business.id}"/>
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">车辆租用管理</a>&gt;<span class="title">车辆租用管理</span></div>
		<h1><span class="title">车辆租用管理</span></h1>
	</div>
	<div class="button_nde">
		预订号：<input type="text" id="rentCar_rentNumber" name="rentNumber" value="${rentCar.rentNumber}" class="input"/>
		车系名称：<input type="text" id="rentCar_carSeries_seriesName" name="carSeries.seriesName" value="${rentCar.carSeries.seriesName}" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<a href="javascript:void(0);" id="allot"><span>分配车辆和司机</span></a>
		<a href="javascript:void(0);" id="pickUp"><span>取车</span></a>
		<h6 class="clear"></h6>
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show">
			<tr>
				<th width="20"><input type="checkbox" name="checkbox" id="checkbox" /></th>
				<th>预订号</th>
				<th>车系名称</th>
				<th>预订时间</th>
				<th>预订取车时间</th>
				<th>预订人电话</th>
				<th>订单状态</th>
				<th style="display: none;">订单状态码</th>
				<th style="display: none;">车牌号码</th>
				<th style="display: none;">司机姓名</th>
			</tr>
			<c:forEach items="${rentCars}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="rentNumber" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.rentNumber}"/></a></td>
				<td name="carSeries" align="center"><c:out value="${parent.carSeries.seriesName}"/></td>
				<td name="createdDt" align="center"><fmt:formatDate value="${parent.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td name="bookPickUpDt" align="center"><fmt:formatDate value="${parent.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
				<td name="bookUser" align="center"><c:out value="${parent.bookUser.phone}"/></td>
				<td align="center">
					<c:if test="${parent.rentStatus == '1'}"><span style="color: red;">已预订未受理</span></c:if>
					<c:if test="${parent.rentStatus == '1-A'}">预订已取消</c:if>
					<c:if test="${parent.rentStatus == '2'}">预订已生效</c:if>
					<c:if test="${parent.rentStatus == '3'}">已取车</c:if>
					<c:if test="${parent.rentStatus == '4'}">已归还</c:if>
				</td>
				<td style="display: none;" name="rentStatus" align="center"><c:out value="${parent.rentStatus}"/></td>
				<td style="display: none;" name="car" align="center"><c:out value="${parent.car.plateNumber}"/></td>
				<td style="display: none;" name="driver" align="center"><c:out value="${parent.driver.driverName}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>