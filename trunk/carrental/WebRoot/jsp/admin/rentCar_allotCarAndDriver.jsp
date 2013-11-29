<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆租用管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$('#rentCar_carSeries').change(function(){
    		$('#rentCar_car_plateNumber').val('');
    	});
    	
    	$('#btn_submit').click(function(){
        	if($('#editForm').valid()){
	    		$.prompt(
					{state0:{
						html: '确认此次分配吗',
	        			buttons: { "确认": 1, "取消": 0},
	        			submit:function(e,v,m,f){
	        				e.preventDefault();
	        				if(v==0){
	        					$.prompt.close();
	        				}else if(v==1){
	        					$.post("<%=basePath%>rentCar/doRentCarAllot", $('#editForm').serialize(), function(data){
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
	        					W.pageLoad();
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
    
    var dstr = '&rentCarId=${rentCar.id}';
    
    function showDriverList(){
   		$.show('选择司机','<%=basePath%>driver/showPopupDriverList?city.id=${rentCar.city.id}'+dstr,600,400,"B");
    }
    
    function loadDriverData(data){
    	$('#rentCar_driverId').val(data.id);
    	$('#rentCar_driverName').val(data.driverName);
    }
    
    function showCarList(){
    	if($('#rentCar_carSeries').val() == ''){
    		$.prompt('请先选择租用车系',{
				title: '提示',
    			buttons: { "确认": false}
    		});
    	}else{
    		$.show('选择车辆','<%=basePath%>car/showPopupCarList?carSeries.id='+$('#rentCar_carSeries').val()+'&city.id=${rentCar.city.id}'+dstr,600,400,"B");
    	}
    }
    
    function loadCarData(data){
    	$('#rentCar_carId').val(data.id);
    	$('#rentCar_car_plateNumber').val(data.plateNumber);
    }
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${rentCar.id}"/>
    <input type="hidden" name="rentNumber" value="${rentCar.rentNumber}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table" style="width: 99%;">
            <tr>
                <td width="30%" align="right" height="25px">司机姓名：</td>
                <td>
                	<input type="text" id="rentCar_driverName" name="driver.driverName" value="${rentCar.driver.driverName}" style="width:200px;" readonly="readonly" class="{required:true}"/>
                	<input type="hidden" id="rentCar_driverId" name="driver.id" value="${rentCar.driver.id}"/>
                	<a href="javascript:void(0);" onclick="showDriverList()">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">租用车系：</td>
                <td>
                	<select id="rentCar_carSeries" name="carSeries.id" style="width:200px;" class="{required:true}">
                		<option value="">--请选择--</option>
                		<c:forEach items="${carSeriesList}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == rentCar.carSeries.id}">selected="true"</c:if>><c:out value="${parent.seriesName}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车牌号码：</td>
                <td>
                	<input type="text" id="rentCar_car_plateNumber" name="car.plateNumber" value="${rentCar.car.plateNumber}" style="width:200px;" readonly="readonly" class="{required:true}"/>
                	<input type="hidden" id="rentCar_carId" name="car.id" value="${rentCar.car.id}"/>
                	<a href="javascript:void(0);" onclick="showCarList()">选择</a>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="30" class="{maxlengthCN:2000}">${car.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><div class="button_nde">
                	<input type="button" id="btn_submit" class="btn" value="提交"/>
                	<input type="button" id="btn_close" class="btn" value="关闭" onclick="javascript:api.close();"/>
                	</div>
				</td>
            </tr>
        </table>
    </div>
    <%@ include file="rentCarDetail_bookPart.jsp"%>
    <%@ include file="rentCarDetail_userInfoPart.jsp"%>
    </form>
</body>
</html>
