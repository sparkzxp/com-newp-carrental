<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>业务管理</title>
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
					$("#business_rentType").val('');
					$("#business_rentFee").val('');
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增业务','<%=basePath%>business/toBusinessEdit?id=&businessType='+$('#business_businessType').val(),550,400,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.show('修改业务','<%=basePath%>business/toBusinessEdit?id='+ids[0]+'&businessType='+$('#business_businessType').val(),550,400,'A');
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
								html: '确定要删除吗',
			        			buttons: { "确认": 1, "取消": 0},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v==0){
			        					$.prompt.close();
			        				}else if(v==1){
			        					$.post("<%=basePath%>business/doBusinessDelete", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("businessType"))
			        						}, function(data){
						   					if(data.result=="SUCCESS"){
						   						$.prompt.goToState('state1', true);
						   						return false;
						   					}else{
						   						alert(data.result);
						   						//$.prompt.goToState('state2', true);
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
				$.show('业务详细信息','<%=basePath%>business/toBusinessDetail?id='+id,550,400,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>business/showBusinessList" id="queryForm">
	<input type="hidden" id="business_businessType" name="businessType" value="${business.businessType}" />
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">车辆管理</a>&gt;业务管理</div>
		<h1>业务管理</h1>
	</div>
	<div class="button_nde">
		租用类型：<input type="text" id="business_rentType" name="rentType.typeName" value="${business.rentType.typeName}" class="input"/>
		租用价格小于：<input type="text" id="business_rentFee" name="rentFee" value="${business.rentFee}" class="input"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<a href="javascript:void(0);" id="add"><span>新增</span></a>
		<a href="javascript:void(0);" id="update"><span>修改</span></a>
		<a href="javascript:void(0);" id="del"><span>删除</span></a>
		<h6 class="clear"></h6>
	</div>
	<div class="content">
		<table width="100%" border="0" cellspacing="1" cellpadding="0" class="show">
			<tr>
				<th width="20"><input type="checkbox" name="checkbox" id="checkbox" /></th>
				<th>业务名称</th>
				<th>租用类型</th>
				<th>起步价格(元)</th>
				<th>超小时费(元/小时)</th>
				<th>超公里费(元/公里)</th>
			</tr>
			<c:forEach items="${businesss}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="businessType" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.businessType}"/></a></td>
				<td name="rentType" align="center"><c:out value="${parent.rentType.typeName}"/></td>
				<td name="rentFee" align="center"><c:out value="${parent.rentFee}"/></td>
				<td name="exceedHourFee" align="center"><c:out value="${parent.exceedHourFee}"/></td>
				<td name="exceedKilometerFee" align="center"><c:out value="${parent.exceedKilometerFee}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>