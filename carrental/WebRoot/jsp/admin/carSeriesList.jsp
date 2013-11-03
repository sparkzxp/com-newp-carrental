<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>车系管理</title>
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
					$("#carSeries_seriesName").val('');
					$("#carSeries_manufacturer").val('');
					$("#carSeries_engine").val('');
				});
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					$.show('新增车系','<%=basePath%>carSeries/toCarSeriesEdit?id=',600,500,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						$.show('修改车系','<%=basePath%>carSeries/toCarSeriesEdit?id='+ids[0],600,500,'A');
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
			        					$.post("<%=basePath%>carSeries/doCarSeriesDelete", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("seriesName")),
			        							"logos":array2String(getSelectedArrayByName("manufacturerLogoPath")),
			        							"series":array2String(getSelectedArrayByName("seriesImgPath"))
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
				$.show('车系详细信息','<%=basePath%>carSeries/toCarSeriesDetail?id='+id,600,500,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>carSeries/showCarSeriesList" id="queryForm">
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">车辆管理</a>&gt;车系管理</div>
		<h1>车系管理</h1>
	</div>
	<div class="button_nde">
		车系名称：<input type="text" id="carSeries_seriesName" name="seriesName" value="${carSeries.seriesName}" class="input"/>
		生产厂商：<input type="text" id="carSeries_manufacturer" name="manufacturer" value="${carSeries.manufacturer}" class="input"/>
		发动机：<input type="text" id="carSeries_engine" name="engine" value="${carSeries.engine}" class="input"/>
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
				<th>车系名称</th>
				<th>生产厂商</th>
				<th>发动机</th>
				<th>车辆图片</th>
				<th style="display: none;">车辆图片</th>
				<th style="display: none;">生产厂商标志</th>
			</tr>
			<c:forEach items="${carSeriesList}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="seriesName" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.seriesName}"/></a></td>
				<td name="manufacturer" align="center"><c:out value="${parent.manufacturer}"/></td>
				<td name="engine" align="center"><c:out value="${parent.engine}"/></td>
				<td align="center" style="width:111px;"><img alt="" src="<%=basePath%><c:out value="${parent.seriesImgPath}"/>" style="width:111px; height:85px;"></td>
				<td name="seriesImgPath" align="center" style="display: none;"><c:out value="${parent.seriesImgPath}"/></td>
				<td name="manufacturerLogoPath" align="center" style="display: none;"><c:out value="${parent.manufacturerLogoPath}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>