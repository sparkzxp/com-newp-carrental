<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>车型管理</title>
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
					$("#carStyle_styleName").val('');
					$("#carStyle_series").val(''); 
					$("#carStyle_series_parent").val('');
					$("#carStyle_engine").val('');
				});
				
				$('#carStyle_series_parent').change(function(){
					if($(this).children('option:selected').val() != ''){
						$.post('<%=basePath%>dict/queryDictList', {
							"parent.id":$(this).children('option:selected').val()
						}, function(data){
							if(data.result == 'SUCCESS'){
								$('#carStyle_series option').not(':first').remove();
								for(var i=0; i<data.dicts.length; i++){
									$("#carStyle_series").append("<option value='"+data.dicts[i].id+"'>"+data.dicts[i].name+"</option>");
								}
							}
						});
					}
				});
				
				//查询
				$("#query").click(function(){
					pageLoad();
				});
				//新增
				$("#add").click(function(){
					location.href = '<%=basePath%>carStyle/toCarStyleEdit?id=';
					//$.show('新增系统车型','<%=basePath%>carStyle/toCarStyleEdit?id=',450,200,"A");
				});
				//修改
				$("#update").click(function(){
					var ids = getSelectedIdArray();
					if(ids.length==1){
						location.href = '<%=basePath%>carStyle/toCarStyleEdit?id='+ids[0];
						//$.show('修改系统车型','<%=basePath%>carStyle/toCarStyleEdit?id='+ids[0],450,200,'A');
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
			        					$.post("<%=basePath%>carStyle/doCarStyleDelete", 
			        						{
			        							"ids": array2String(getSelectedIdArray()),
			        							"names":array2String(getSelectedArrayByName("styleName"))
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
				$.show('车型详细信息','<%=basePath%>carStyle/toCarStyleDetail?id='+id,400,250,'A');
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>carStyle/showCarStyleList" id="queryForm">
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;车型管理</div>
		<h1>车型管理</h1>
	</div>
	<div class="button_nde">
		车型名称：<input type="text" id="carStyle_styleName" name="styleName" value="${carStyle.styleName}" class="input"/>
		生产厂商：<select id="carStyle_series_parent" name="series.parent.id">
					<option value="" <c:if test="carStyle == null or carStyle.series == null or carStyle.series.parent == null or carStyle.series.parent.id == ''"></c:if>>--请选择--</option>
					<c:forEach items="${manufacturers}" var="parent">
					<option value="${parent.id}" <c:if test="${carStyle.series.parent.id == parent.id}">selected="true"</c:if>>${parent.name}</option>
					</c:forEach>
				</select>
		车型系列：<select id="carStyle_series" name="series.id">
					<option value="" <c:if test="carStyle == null or carStyle.series == null or carStyle.series.id == ''"></c:if>>--请选择--</option>
					<c:forEach items="${serieses}" var="parent">
					<option value="${parent.id}" <c:if test="${carStyle.series.id == parent.id}">selected="true"</c:if>>${parent.name}</option>
					</c:forEach>
				</select>
		发动机：<input type="text" id="carStyle_engine" name="engine" value="${carStyle.engine}" class="input"/>
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
				<th>车型名称</th>
				<th>车型系列</th>
				<th>生产厂商</th>
				<th>发动机</th>
			</tr>
			<c:forEach items="${carStyles}" var="parent">
			<tr>
				<td name="id" align="center"><input type="checkbox" value="<c:out value="${parent.id}"/>"/></td>
				<td name="styleName" align="center"><a href="javascript:void(0);" style="color: blue;" onclick="showDetail('${parent.id}')"><c:out value="${parent.styleName}"/></a></td>
				<td name="series" align="center"><c:out value="${parent.series.name}"/></td>
				<td name="manufacturer" align="center"><c:out value="${parent.series.parent.name}"/></td>
				<td name="engine" align="center"><c:out value="${parent.engine}"/></td>
			</tr>
			</c:forEach>
		</table>
		<%@ include file="../common/pager.jsp"%>
	</div>
	</form>
	</body>
</html>