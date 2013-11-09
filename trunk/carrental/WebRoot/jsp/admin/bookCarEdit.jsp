<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆预订管理 新增 修改</title>
    <link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$("#rentCar_bookPickUpDt").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
		});
    	$("#rentCar_arriveFlightDt").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
		});
    	$("#rentCar_takeOfFlightDt").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
		});
    	$("#rentCar_bookGiveBackDt").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
		});
    	
    	if($('#rentCar_id').val != ''){
    		$('#register').attr('checked', 'checked');
    		$('#bookUser_adminName').attr('readonly', 'readonly');
    		$('.register').show();
			$('.newer').hide();
    	}else{
    		$('#newer').attr('checked', 'checked');
    		$('#bookUser_adminName').removeAttr('readonly');
    		$('.register').hide();
			$('.newer').show();
    	}
    	
    	if('${rentCar.business.businessType}' == '机场及车站接送'){
    		$('.flight').show();
    	}
    	
    	$('#rentCar_rentType').change(function(){
    		if($(this).find('option:selected').val() != ''){
    			$.post('<%=basePath%>carSeries/queryListByRentType', {'rentTypeId':$(this).find('option:selected').val()}, function(data){
					if(data.result == 'SUCCESS'){
						$('#rentCar_carSeries').find('option').not(':first').remove();
						for(var i=0; i<data.list.length; i++){
							$('#rentCar_carSeries').append('<option value="'+data.list[i].id+'">'+data.list[i].seriesName+'</option>')
						}
					}
    			},"json");
    		}
    	});
    	
    	$(":radio").change(function(){
    		if($(':radio[checked]').val()=='0'){
    			$('#bookUser_adminName').attr('readonly', 'readonly');
    			$('.register').show();
    			if($('#bookUser_id').val() == ''){
    				$('#bookUser_adminName').val('');
    			}
    			$('.newer').hide();
    		}else if($(':radio[checked]').val()=='1'){
    			$('#bookUser_adminName').removeAttr('readonly');
    			$('.register').hide();
				$('.newer').show();
			}
    	});
    	
    	$('#btn_submit').click(function(){
    		if($('.flight').css('display') != 'none'){
    			if($.trim($('#rentCar_arriveFlightNo').val()) == '' && $.trim($('#rentCar_takeOffFlightNo').val()) == ''){
    				$.prompt('请填写机场(或车站)需要接机(或送机)的航班号',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($.trim($('#rentCar_arriveFlightNo').val()) != '' && $.trim($('#rentCar_takeOffFlightNo').val()) != ''){
    				$.prompt('请不要同时填写机场(或车站)需要接机(或送机)的航班号',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($('#rentCar_arriveFlightDt').val() == '' && $('#rentCar_takeOfFlightDt').val() == ''){
    				$.prompt('请选择机场(或车站)需要接机(或送机)的航班到达(或起飞)时间',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($('#rentCar_arriveFlightDt').val() != '' && $('#rentCar_takeOfFlightDt').val() != ''){
    				$.prompt('请不要同时选择机场(或车站)需要接机(或送机)的航班到达(或起飞)时间',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($.trim($('#rentCar_arriveFlightNo').val()) != '' && $('#rentCar_arriveFlightDt').val() == ''){
    				$.prompt('请选择机场(或车站)需要接机的航班到达时间',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($.trim($('#rentCar_takeOffFlightNo').val()) != '' && $('#rentCar_takeOfFlightDt').val() == ''){
    				$.prompt('请选择机场(或车站)需要送机的航班起飞时间',{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
    			}else if($('#editForm').valid()){
        			btnSubmit();
        		}
    		}else if($('#editForm').valid()){
    			btnSubmit();
    		}
    	});
    	
    	function btnSubmit(){
    		$.post('<%=basePath%>rentCar/doBookCarEdit', $('#editForm').serialize(), function(data){
        		if(data.result == 'SUCCESS'){
        			$('#id').val(data.id);
        			$.prompt('操作成功',{
						title: '提示',
	        			buttons: { "确认": true},
	        			submit:function(e,v,m,f){
	        				e.preventDefault();
	        				if(v){
	        					$.prompt.close();
	        					W.pageLoad();
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
    	}
    });
    
    function showUserList(){
    	$.show('选择预订人','<%=basePath%>admin/showPopupUserList?type=CUSTOM&isDelete=0&inBlacklist=0',600,400,"B");
    }
    
    function loadUserData(data){
    	$('#bookUser_id').val(data.id);
    	$('#bookUser_adminName').val(data.adminName);
    }
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" id="rentCar_id" name="id" value="${rentCar.id}"/>
    <input type="hidden" name="rentNumber" value="${rentCar.rentNumber}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">租用城市：</td>
                <td width="30%">
                	<select name="city.id" style="width:200px;" class="{required:true}">
                		<option value="">--请选择--</option>
                		<c:forEach items="${citys}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == rentCar.city.id}">selected="true"</c:if>><c:out value="${parent.cityName}"/></option>
                		</c:forEach>
                	</select>
                </td>
                <td width="20%" align="right" height="25px">租用类型：</td>
                <td width="30%">
                	<select id="rentCar_rentType" name="rentType.id" style="width:200px;" class="{required:true}">
                		<option value="">--请选择--</option>
                		<c:forEach items="${rentTypes}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == rentCar.rentType.id}">selected="true"</c:if>><c:out value="${parent.typeName}"/></option>
                		</c:forEach>
                	</select>
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
                <td align="right" height="25px">预订方式：</td>
                <td>
                	<input type="text" name="rentWay" value="${rentCar.rentWay}" style="width:200px;" class="{required:true,maxlengthCN:20}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订人类别：</td>
                <td colspan="3">
                	<input id="register" type="radio" name="bookUserType" value="0"/>注册用户
                	<input id="newer" type="radio" name="bookUserType" value="1"/>新用户
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订人姓名：</td>
                <td>
                	<input type="text" id="bookUser_adminName" name="bookUser.adminName" value="${rentCar.bookUser.adminName}" style="width:160px;" class="{required:true,maxlengthCN:50}"/>
                	<a class="register" style="display: none;" href="javascript:void(0);" onclick="showUserList()">选择</a>
                	<input type="hidden" id="bookUser_id" name="bookUser.id" value="${rentCar.bookUser.id}"/>
                </td>
                <td class="newer" style="display: none;" align="right" height="25px">预订人公司名称：</td>
                <td class="newer" style="display: none;">
                	<input type="text" name="bookUser.companyName" value="${rentCar.bookUser.companyName}" style="width:200px;" class="{maxlengthCN:200}"/>
                </td>
            </tr>
            <tr class="newer" style="display: none;">
                <td align="right" height="25px">预订人手机号码：</td>
                <td>
                	<input type="text" name="bookUser.phone" value="${rentCar.bookUser.phone}" style="width:200px;" class="{required:true,maxlengthCN:20}"/>
                </td>
                <td align="right" height="25px">预订人邮件地址：</td>
                <td>
                	<input type="text" name="bookUser.email" value="${rentCar.bookUser.email}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">客户姓名：</td>
                <td>
                	<input type="text" name="customer" value="${rentCar.customer}" style="width:200px;" class="{required:true,maxlengthCN:20}"/>
                </td>
                <td align="right" height="25px">客户公司名称：</td>
                <td>
                	<input type="text" name="customerCompany" value="${rentCar.customerCompany}" style="width:200px;" class="{maxlengthCN:200}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">客户手机号码：</td>
                <td>
                	<input type="text" name="customerPhone" value="${rentCar.customerPhone}" style="width:200px;" class="{required:true,maxlengthCN:20}"/>
                </td>
                <td align="right" height="25px">客户邮件地址：</td>
                <td>
                	<input type="text" name="customerEmail" value="${rentCar.customerEmail}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订业务类型：</td>
                <td>
                	<input type="text" name="business.businessType" value="${rentCar.business.businessType}" readonly="readonly" class="{required:true}"/>
                	<input type="hidden" name="business.id" value="${rentCar.business.id}"/>
                </td>
                <td align="right" height="25px">参加优惠活动：</td>
                <td>
                	<select name="coupon.id" style="width:200px;">
                		<option value="">--不参加--</option>
                		<c:forEach items="${coupons}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == rentCar.coupon.id}">selected="true"</c:if>><c:out value="${parent.couponTitle}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订取车时间：</td>
                <td>
                	<input type="text" id="rentCar_bookPickUpDt" name="bookPickUpDt" value="<fmt:formatDate value="${rentCar.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true}"/>
                </td>
                <td align="right" height="25px">预订取车地址：</td>
                <td>
                	<input type="text" name="bookPickUpAddress" value="${rentCar.bookPickUpAddress}" style="width:200px;" class="{required:true,maxlengthCN:200}"/>
                </td>
            </tr>
            <tr class="flight" style="display: none;">
                <td align="right" height="25px">到达航班号：</td>
                <td>
                	<input type="text" id="rentCar_arriveFlightNo" name="arriveFlightNo" value="${rentCar.arriveFlightNo}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
                <td align="right" height="25px">航班到达时间：</td>
                <td>
                	<input type="text" id="rentCar_arriveFlightDt" name="arriveFlightDt" value="<fmt:formatDate value="${rentCar.arriveFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly"/>
                </td>
            </tr>
            <tr class="flight" style="display: none;">
                <td align="right" height="25px">起飞航班号：</td>
                <td>
                	<input type="text" id="rentCar_takeOffFlightNo" name="takeOffFlightNo" value="${rentCar.takeOffFlightNo}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
                <td align="right" height="25px">航班出发时间：</td>
                <td>
                	<input type="text" id="rentCar_takeOfFlightDt" name="takeOfFlightDt" value="<fmt:formatDate value="${rentCar.takeOfFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">乘客数量：</td>
                <td colspan="3">
                	<input type="text" name="passengerNo" value="${rentCar.passengerNo}" style="width:200px;" class="{required:true,number:true,min:0,max:100}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订还车时间：</td>
                <td>
                	<input type="text" id="rentCar_bookGiveBackDt" name="bookGiveBackDt" value="<fmt:formatDate value="${rentCar.bookGiveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true}"/>
                </td>
                <td align="right" height="25px">预订还车地址：</td>
                <td>
                	<input type="text" name="bookGiveBackAddress" value="${rentCar.bookGiveBackAddress}" style="width:200px;" class="{required:true,maxlengthCN:200}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="30" class="{maxlengthCN:2000}">${car.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center"><div class="button_nde">
                	<input type="button" id="btn_submit" class="btn" value="提交"/>
                	<input type="button" id="btn_close" class="btn" value="关闭" onclick="javascript:api.close();"/>
                	</div>
				</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
