<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>欢迎使用新广得利租车平台</title>
<link href="<%=basePath%>css/web/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
<style type="text/css">
form.cmxform label.error, label.error {
    color: #FF0000;
    font-style: italic;
}
</style>

<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/common/slide.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
<script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
	<script type="text/javascript">
	var begin;
	var secs = 0;
	var interval = 1000;
	function refreshCaptcha(){
		if(secs > 0){
			$('#pickCaptcha').val("获取验证码("+secs+")");
			secs--;
			begin = setTimeout('refreshCaptcha()', interval);
		}else{
			clearTimeout(begin);
			$('#pickCaptcha').val("获取验证码");
			$('#pickCaptcha').removeAttr("disabled");
		}
	}
	
	function bookCar(rentTypeId){
		$('#rentCar_rentType').val(rentTypeId);
		$('#rentCar_business_rentType').val(rentTypeId);
		$('#editForm').submit();
	}
	
    $(function() {
    	if($("#rentCar_bookPickUpDt") != null){
	    	$("#rentCar_bookPickUpDt").addClass("Wdate").click(function(){
				WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
			});
    	}
    	if($("#rentCar_arriveFlightDt") != null){
	    	$("#rentCar_arriveFlightDt").addClass("Wdate").click(function(){
				WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
			});
    	}
    	if($("#rentCar_takeOfFlightDt") != null){
	    	$("#rentCar_takeOfFlightDt").addClass("Wdate").click(function(){
				WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
			});
    	}
    	if($("#rentCar_bookGiveBackDt") != null){
	    	$("#rentCar_bookGiveBackDt").addClass("Wdate").click(function(){
				WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd HH:mm'});
			});
    	}
    	
    	$('#pickCaptcha').click(function(){
    		if($.trim($('#rentCar_bookUser_phone').val()) == ''){
    			$.prompt('请先填写您的手机号码' ,{
					title: '提示',
        			buttons: { "确定": false}
        		});
    		}else{
    			$(this).attr("disabled", "disabled");
	    		$.post('<%=basePath%>web/user/doPickCaptcha', {'phone':$.trim($('#rentCar_bookUser_phone').val())}, function(data){
	        		if(data.result == 'SUCCESS'){
	        			$.prompt('验证码已发送到您的手机，请查收',{
							title: '提示',
		        			buttons: { "确定": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					secs = 60;
		        					begin = setTimeout('refreshCaptcha()', interval);
		        				}
		        			}
		        		});
	        		}else{
	        			$.prompt(data.result,{
							title: '提示',
		        			buttons: { "确定": false}
		        		});
	        			$('#pickCaptcha').removeAttr("disabled");
	        		}
	    		}, "json");
    		}
    	});
    	
    	$('#logMyAccount').click(function(){
    		$.prompt({
    			state0:{
					title: '用户登录',
					html:'<label>手机号码：<input type="text" style="border: 1px solid #3E3E3E;" name="phone" id="user_phone"></label><br />'+
					'<label>登录密码：<input type="password" style="border: 1px solid #3E3E3E;" name="password" id="user_password"></label><br />',
	    			buttons: { "登录": true, "取消": false},
	    			submit:function(e,v,m,f){
	    				if(v){
	    					e.preventDefault();
	    					if($.trim($('#user_phone').val()) == ''){
	    						$.prompt.goToState('state1');
	    		    		}else if($.trim($('#user_password').val()) == ''){
	    		    			$.prompt.goToState('state2');
	    		    		}else{
	    			    		$.post('<%=basePath%>web/user/doLogin', {
	    			    			'phone' : $.trim($('#user_phone').val()),
	    			    			'password' : $.trim($('#user_password').val())
	    			    		}, function(data){
	    			        		if(data.result == 'SUCCESS'){
	    			        			window.location.reload();
	    			        		}else{
	    			        			alert(data.result);
	    			        		}
	    			    		}, "json");
	    		    		}
	    				}else{
	   						$.prompt.close();
	    				}
	    			}
	    		},
	    		state1:{
	    			title:'用户登录',
	    			html:'请输入手机号码',
	    			buttons: { "确定": false},
	    			submit:function(e,v,m,f){
	    				e.preventDefault();
	    				$.prompt.goToState('state0');
	    			}
	    		},
	    		state2:{
	    			title:'用户登录',
	    			html:'请输入密码',
	    			buttons: { "确定": false},
	    			submit:function(e,v,m,f){
	    				e.preventDefault();
	    				$.prompt.goToState('state0');
	    			}
	    		}
    		});
    	});
    	
    	$('#btn_submit').click(function(){
    		/* var inputs = $('input[type=text]');
    		for(var i=0; i<inputs.length; i++){
    			if($.trim($(inputs[i]).val()) == ''){
    				var s = $($(inputs[i]).parent().parent().find('td')[0]).text();
    				$.prompt('请填写'+s.substring(0, s.length-1),{
						title: '提示',
	        			buttons: { "确定": false}
	        		});
    				return false;
    			}
    		} */
    		if($('#rentCar_coupon') != null && $('#rentCar_coupon').val() != ''){
    			$('#rentCar_coupon_couponTitle').val($('#rentCar_coupon').find('option:selected').text());
    		}
    		if($('#editForm').valid()){
    			<c:choose>
    			<c:when test="${user == null or user.id == null or user.id == '' }">
    			$.post('<%=basePath%>web/user/doRegist', {
	    			'adminName' : $.trim($('#rentCar_bookUser_adminName').val()),
	    			'password' : '123456',
	    			'companyName' : $.trim($('#rentCar_bookUser_companyName').val()),
	    			'phone' : $.trim($('#rentCar_bookUser_phone').val()),
	    			'email' : $.trim($('#rentCar_bookUser_email').val()),
	    			'sex' : $.trim($(':radio[name=sex][checked]').val())
	    		}, function(data){
	        		if(data.result == 'SUCCESS'){
	        			$('#rentCar_bookUser').val(data.userId);
	        			$('#editForm').submit();
	        		}else{
	        			$.prompt(data.result,{
							title: '提示',
		        			buttons: { "确定": false}
		        		});
	        		}
	    		}, "json");
    			</c:when>
    			<c:otherwise>
    			$('#editForm').submit();
    			</c:otherwise>
    			</c:choose>
    		}
	   	});
    });
    </script>
</head>

<body>
	<%@ include file="part_top.jsp"%>
	<div id="wrapp">
		<form name="editForm" id="editForm" action="<%=basePath%>web/rental/toCheckInfo">
			<input type="hidden" name="city.id" id="rentCar_city" value="${rentCar.city.id}"/>
			<input type="hidden" name="city.cityName" id="rentCar_city_cityName" value="${rentCar.city.cityName}"/>
			<input type="hidden" name="business.businessType" id="rentCar_business_businessType" value="${rentCar.business.businessType}"/>
			<input type="hidden" name="business.businessMore" id="rentCar_business_businessMore" value="${rentCar.business.businessMore}"/>
			<input type="hidden" name="rentType.id" id="rentCar_rentType" value="${rentCar.rentType.id}"/>
			<input type="hidden" name="rentType.typeName" id="rentCar_rentType_typeName" value="${rentCar.rentType.typeName}"/>
			<input type="hidden" name="business.rentType.id" id="rentCar_business_rentType" value="${rentCar.business.rentType.id}"/>

			<input type="hidden" name="coupon.couponType" id="rentCar_coupon_couponType" value="${rentCar.coupon.couponType}"/>
			<input type="hidden" name="coupon.couponTitle" id="rentCar_coupon_couponTitle" value="${rentCar.coupon.couponTitle}"/>
			<input type="hidden" name="exceedHourFee" value="${rentCar.exceedHourFee}"/>
			<input type="hidden" name="exceedKilometerFee" value="${rentCar.exceedKilometerFee}"/>
			<input type="hidden" name="rentFee" value="${rentCar.rentFee}"/>
			<input type="hidden" name="business.fuelFee" value="${rentCar.business.fuelFee}"/>
			<input type="hidden" name="business.insuranceFee" value="${rentCar.business.insuranceFee}"/>
			<input type="hidden" name="business.driverFee" value="${rentCar.business.driverFee}"/>
			
			<input type="hidden" name="bookUser.id" id="rentCar_bookUser" value="${rentCar.bookUser.id}"/>
			<div class="choose_car">
				<ul>
					<li><span>1</span>
					<h1>选择用车方式</h1></li>
					<li><span>2</span>
					<h1>选择车辆</h1></li>
					<li class="now"><span>3</span>
					<h1>填写乘车信息</h1></li>
					<li><span>4</span>
					<h1>确认订单</h1></li>
					<li><span>5</span>
					<h1>成功</h1></li>
				</ul>
				<h6 class="clear"></h6>
			</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top">
						<div class="car">
							<h1>乘车信息</h1>
							<blockquote>
								<table width="100%" border="0" cellspacing="15" cellpadding="0">
									<c:if test="${user == null or user.id == null or user.id == '' }">
									<tr>
						                <td align="right">预订人姓名：</td>
						                <td>
						                	<input type="text" id="rentCar_bookUser_adminName" name="bookUser.adminName" value="${rentCar.bookUser.adminName}" style="width:160px;" class="{required:true,maxlengthCN:50} input"/>
						                	<input name="sex" type="radio"
											value="female" <c:if test="${rentCar.bookUser == null or rentCar.bookUser.sex == '' or rentCar.bookUser.sex == 'female'}">checked="checked"</c:if> /> 女士 <input type="radio"
											name="sex" value="male" <c:if test="${rentCar.bookUser != null and rentCar.bookUser.sex == 'male'}">checked="checked"</c:if>/> 先生
						                	<a href="javascript:void(0)" id="logMyAccount">已有账号，立即登录</a>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">预订人公司名称：</td>
						                <td>
						                	<input type="text" id="rentCar_bookUser_companyName" name="bookUser.companyName" value="${rentCar.bookUser.companyName}" style="width:200px;" class="{maxlengthCN:200} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">预订人手机号码：</td>
						                <td>
						                	<input type="text" id="rentCar_bookUser_phone" name="bookUser.phone" value="${rentCar.bookUser.phone}" style="width:200px;" class="{required:true,maxlengthCN:20} input"/>
						                	<p>请输入您的手机号码，以便我们向您确认预订信息</p>
						                </td>
						            </tr>
						            <tr>
										<td align="right">手机验证码：</td>
										<td><input type="text" name="captcha"
											class="{required:true,digits:true,minlength:6,maxlength:6} input" />
											<input type="button" class="get" id="pickCaptcha" value="获取验证码" />
											<p>请输入验证码</p></td>
									</tr>
						            <tr>
						                <td align="right">预订人邮箱：</td>
						                <td>
						                	<input type="text" id="rentCar_bookUser_email" name="bookUser.email" value="${rentCar.bookUser.email}" style="width:200px;" class="{required:true,maxlengthCN:50} input"/>
						                </td>
						            </tr>
									<tr>
										<th colspan="2"></th>
									</tr>
									</c:if>
									<c:if test="${coupons.size() > 0 and (rentCar.coupon == null or rentCar.coupon.couponType != '指定车型打折')}">
									<tr>
						                <td align="right">优惠活动：</td>
						                <td>
						                	<select id="rentCar_coupon" name="coupon.id" style="width:200px;">
						                		<option value="">--请选择优惠活动--</option>
						                		<c:forEach items="${coupons}" var="parent">
						                		<c:if test="${parent.couponType != '指定车型打折'}">
						                		<option value="${parent.id}" <c:if test="${parent.id == rentCar.coupon.id}">selected="true"</c:if>>${parent.couponTitle}</option>
						                		</c:if>
						                		</c:forEach>
						                	</select>
						                </td>
						            </tr>
									<tr>
										<th colspan="2"></th>
									</tr>
									</c:if>
									<c:if test="${rentCar.business.businessType == '机场及车站接送'}">
									<c:if test="${rentCar.business.businessMore == 'send'}">
									<tr>
						                <td align="right">起飞航班号：</td>
						                <td>
						                	<input type="text" id="rentCar_takeOffFlightNo" name="takeOffFlightNo" value="${rentCar.takeOffFlightNo}" style="width:200px;" class="{maxlengthCN:50} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">航班出发时间：</td>
						                <td>
						                	<input type="text" id="rentCar_takeOfFlightDt" name="takeOfFlightDt" value="<fmt:formatDate value="${rentCar.takeOfFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true} input"/>
						                </td>
						            </tr>
									</c:if>
									<c:if test="${rentCar.business.businessMore == 'pick'}">
									<tr>
						                <td align="right">到达航班号：</td>
						                <td>
						                	<input type="text" id="rentCar_arriveFlightNo" name="arriveFlightNo" value="${rentCar.arriveFlightNo}" style="width:200px;" class="{maxlengthCN:50} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">航班到达时间：</td>
						                <td>
						                	<input type="text" id="rentCar_arriveFlightDt" name="arriveFlightDt" value="<fmt:formatDate value="${rentCar.arriveFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true} input"/>
						                	<p>注：按航班号接机，我们会自动追踪航班信息，因航班延误造成的等待时间不需要您支付费用</p>
						                </td>
						            </tr>
									<tr>
										<th colspan="2"></th>
									</tr>
									</c:if>
									</c:if>
									<tr>
						                <td width="18%" align="right">乘车人姓名：</td>
						                <td>
						                	<input type="text" name="customer" value="${rentCar.customer}" style="width:200px;" class="{required:true,maxlengthCN:20} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">乘车人公司名称：</td>
						                <td>
						                	<input type="text" name="customerCompany" value="${rentCar.customerCompany}" style="width:200px;" class="{maxlengthCN:200} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">乘车人手机号码：</td>
						                <td>
						                	<input type="text" name="customerPhone" value="${rentCar.customerPhone}" style="width:200px;" class="{required:true,maxlengthCN:20} input"/>
						                </td>
						            </tr>
						            <tr>
						                <td align="right">乘车人邮箱：</td>
						                <td>
						                	<input type="text" name="customerEmail" value="${rentCar.customerEmail}" style="width:200px;" class="{maxlengthCN:50} input"/>
						                </td>
						            </tr>
						            <tr>
						            	<td align="right" height="25px">乘客数量：</td>
						                <td>
						                	<input type="text" name="passengerNo" value="${rentCar.passengerNo}" style="width:200px;" class="{required:true,number:true,min:0,max:100} input"/>
						                </td>
						            </tr>
									<tr>
										<th colspan="2"></th>
									</tr>
									<tr>
						                <td align="right">预订取车时间：</td>
						                <td>
						                	<input type="text" id="rentCar_bookPickUpDt" name="bookPickUpDt" value="<fmt:formatDate value="${rentCar.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true} input"/>
						                </td>
									</tr>
									<tr>
						                <td align="right">预订取车地址：</td>
						                <td>
						                	<input type="text" name="bookPickUpAddress" value="${rentCar.bookPickUpAddress}" style="width:200px;" class="{required:true,maxlengthCN:200} input"/>
						                </td>
						            </tr>
						            <tr>
						               <td align="right">预订还车时间：</td>
						               <td>
						               	<input type="text" id="rentCar_bookGiveBackDt" name="bookGiveBackDt" value="<fmt:formatDate value="${rentCar.bookGiveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" readonly="readonly" class="{required:true} input"/>
						               </td>
									</tr>
									<tr>
						               <td align="right">预订还车地址：</td>
						               <td>
						               	<input type="text" name="bookGiveBackAddress" value="${rentCar.bookGiveBackAddress}" style="width:200px;" class="{required:true,maxlengthCN:200} input"/>
						               </td>
						            </tr>
									<tr>
										<td align="right">&nbsp;</td>
										<td><input type="button" id="btn_submit"
											value="下一步，确认订单" class="btn" style="width: 150px;" /></td>
									</tr>
								</table>
							</blockquote>
						</div>
					</td>
					<td width="10" valign="top">&nbsp;</td>
					<td width="280" valign="top">
						<div class="car_station">
							<h1>
								<a href="<%=basePath%>web/rental/toChooseBusiness?city.id=${rentCar.city.id}&business.businessType=${rentCar.business.businessType}&business.businessMore=${rentCar.business.businessMore}">修改</a>您的用车方式
							</h1>
							<blockquote>
								<h2>用车城市：${rentCar.city.cityName}</h2>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="27"><img src="<%=basePath%>images/web/cion20.gif" width="22"
											height="22" /></td>
										<td>
											<c:choose>
												<c:when test="${rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'send'}">机场及车站送机</c:when>
												<c:when test="${rentCar.business.businessType == '机场及车站接送' && rentCar.business.businessMore == 'pick'}">机场及车站接机</c:when>
												<c:otherwise>${rentCar.business.businessType}</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
							</blockquote>
						</div>
						<div class="car_station">
							<h1>
								<a href="<%=basePath%>web/rental/toChooseCar?city.id=${rentCar.city.id}&business.businessType=${rentCar.business.businessType}&business.businessMore=${rentCar.business.businessMore}">修改</a>所选车辆
							</h1>
							<blockquote>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="80" height="30">车 型：</td>
										<td>${rentCar.rentType.typeName}</td>
									</tr>
									<tr>
										<td height="30">小时单价：</td>
										<td>${rentCar.exceedHourFee}元</td>
									</tr>
									<tr>
										<td height="30">公里单价：</td>
										<td>${rentCar.exceedKilometerFee}元</td>
									</tr>
									<tr>
										<td height="30">起步价格：</td>
										<td>${rentCar.rentFee}元</td>
									</tr>
									<tr>
										<td height="30">费用包含：</td>
										<td>
										<c:if test="${rentCar.business.fuelFee == null or rentCar.business.fuelFee == 0}">油</c:if>&nbsp;
										<c:if test="${rentCar.business.insuranceFee == null or rentCar.business.insuranceFee == 0}">险</c:if>&nbsp;
										<c:if test="${rentCar.business.driverFee == null or rentCar.business.driverFee == 0}">驾</c:if>
										</td>
									</tr>
								</table>
							</blockquote>
						</div>
					</td>
				</tr>
			</table>
			<%@ include file="part_help.jsp"%>
		</form>
	</div>
	<%@ include file="part_bottom.jsp"%>
</body>
</html>
