<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<base href="<%=basePath%>">
		<title>城市管理</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
		<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/form_util.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
		<script language="javascript" src="<%=basePath%>js/common/json2.js"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
		<script type="text/javascript">
			$(function(){
				if('${result}' != ''){
					if('${result}' == 'SUCCESS'){
						initMap(JSON.parse('${latlng}'));
					}else{
						$.prompt('${result}',{
							title: '提示',
		        			buttons: { "确认": false}
		        		});
					}
				}
				
				$("#queryStartDt").addClass("Wdate").click(function(){
					WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});
				});
		    	$("#queryEndDt").addClass("Wdate").click(function(){
					WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});
				});
				//清空
				$("#clearForm").click(function(){
					$("#carNumber").val('');
					$("#queryStartDt").val('');
					$("#queryEndDt").val('');
				});
				//查询
				$("#query").click(function(){
					$.post('<%=basePath%>gps/doGpsFetch', $('#queryForm').serialize(), function(data){
		        		if(data.result == 'SUCCESS'){
		        			$.prompt('操作成功',{
								title: '提示',
			        			buttons: { "确认": true},
			        			submit:function(e,v,m,f){
			        				e.preventDefault();
			        				if(v){
			        					$.prompt.close();
			        					initMap(data.latlng);
			        				}
			        			}
			        		});
		        		}else{
		        			$.prompt(data.result,{
								title: '提示',
			        			buttons: { "确认": false}
			        		});
		        		}
		    		}, "json");
				});
			});
			
			function initMap(latlng){
				var map = new BMap.Map("container");
				if(null != latlng && latlng.length > 0){
					var point = new BMap.Point(latlng[0].lng, latlng[0].lat);
					map.centerAndZoom(point, 14);
					map.addControl(new BMap.NavigationControl({
						type:BMAP_NAVIGATION_CONTROL_LARGE
					}));
					map.addControl(new BMap.MapTypeControl({
						mapTypes:[BMAP_NORMAL_MAP,BMAP_SATELLITE_MAP,BMAP_HYBRID_MAP]
					}));
					map.addControl(new BMap.ScaleControl());
					map.addControl(new BMap.OverviewMapControl());
					map.enableScrollWheelZoom();
					map.enableContinuousZoom();
					map.disableDoubleClickZoom();
					
					// 编写自定义函数，创建标注
					function addMarker(point){
						// 创建图标对象
						var myIcon = new BMap.Icon("<%=basePath%>images/map/cardot.png",new BMap.Size(30,30),{
							imageSize:new BMap.Size(30,30),
							anchor:new BMap.Size(15,15)
						});
						// 创建标注对象并添加到地图
						var marker = new BMap.Marker(point, {icon: myIcon});// 创建标注
						map.addOverlay(marker);// 将标注添加到地图中
					}
					
					addMarker(point);
					
					var i=1;
					var step=3;
					function showCarHistory(){
						if(latlng.length > 1 && i < latlng.length){
							var length = (i+step)>latlng.length?latlng.length:(i+step);
							for(; i<length; i++){
								point = new BMap.Point(latlng[i].lng, latlng[i].lat);
								if(i % step == 0){
									addMarker(point);
									map.centerAndZoom(point, 14);
								}
								
								var polyline = new BMap.Polyline([
									point,
									new BMap.Point(latlng[i-1].lng, latlng[i-1].lat)
								],{
									strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5
								});
								map.addOverlay(polyline);
							}
							if(length<latlng.length){
								window.setTimeout(function(){showCarHistory();}, 1000);
							}else{
								$.prompt('历史轨迹播放完毕',{
									title: '提示',
				        			buttons: { "确认": false}
				        		});
							}
						}
					}
					window.setTimeout(function(){showCarHistory();}, 1000);
				}
			}
		</script>
	</head>
	<body>
	<form action="<%=basePath%>gps/doGpsFetch" id="queryForm">
	<div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;GPS在线监控</div>
		<h1>GPS在线监控</h1>
	</div>
	<div class="button_nde">
		车牌号码：<input type="text" id="carNumber" name="carNumber" value="${tracker.carNumber}" class="input"/>
		查询开始时间：<input type="text" id="queryStartDt" name="queryStartDt" readonly="readonly" value="<fmt:formatDate value="${tracker.queryStartDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" class="input" style="width: auto;"/>
		查询结束时间：<input type="text" id="queryEndDt" name="queryEndDt" readonly="readonly" value="<fmt:formatDate value="${tracker.queryEndDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" class="input" style="width: auto;"/>
	    <input type="button" id="query" class="btn" value="查询">
		<input type="button" id="clearForm" class="btn" value="清空">
	</div>
	<div class="button_nde">
		<h6 class="clear"></h6>
	</div>
	<div class="content" id="container" style="width:97%;height: 500px;">
		
	</div>
	</form>
	</body>
</html>