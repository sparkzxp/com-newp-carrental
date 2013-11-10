<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汽车租赁后台管理系统</title>
<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$('p').click(function(o){
		for(var i=0; i<$('p').length; i++){
			if($('p')[i] == o.currentTarget){
				$($('p')[i]).find('a').addClass('current');
				$($('ul')[i]).find('li').show();
			}else{
				$($('p')[i]).find('a').removeClass('current');
				$($('ul')[i]).find('li').hide();
			}
		}
	});
});

function toUrl(url){
	parent.$("#mainFrame").attr("src",url).load();
}
</script>
</head>
<body>
<div class="leftmenu">
<p><a href="javascript:void(0);">用户管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?type=CUSTOM&isDelete=0&inBlacklist=0')">注册用户管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?type=ADMIN&isDelete=0&inBlacklist=0')">系统用户管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>resource/showResourceList')">资源配置管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>role/showRoleList')">角色配置管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?type=CUSTOM&isDelete=0&inBlacklist=1')">黑名单管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>admin/showAdminList?isDelete=0&inBlacklist=0')">用户密码管理</a></li>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>city/showCityList?isDelete=0')">城市管理</a></p>
<ul>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>company/toCompanyEdit')">企业信息管理</a></p>
<ul>
</ul>
<p><a href="javascript:void(0);">车辆管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>carSeries/showCarSeriesList?isDelete=0')">车系管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentType/showRentTypeList')">租用类型管理</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>car/showCarList')">车辆管理</a></li>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>driver/showDriverList')">司机管理</a></p>
<ul>
</ul>
<p><a href="javascript:void(0);">业务管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=点到点代驾')">点到点代驾</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=机场及车站接送')">机场及车站接送</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=市用半日租')">市用半日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=市用全日租')">市用全日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=会务车辆安排')">会务车辆安排</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>business/showBusinessList?businessType=周边省市包车')">周边省市包车</a></li>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>coupon/showCouponList?isDelete=0')">活动优惠管理</a></p>
<ul>
</ul>
<p><a href="javascript:void(0);">车辆预订管理</a></p>
<ul>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=点到点代驾')">点到点代驾</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=机场及车站接送')">机场及车站接送</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=市用半日租')">市用半日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=市用全日租')">市用全日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=会务车辆安排')">会务车辆安排</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showBookCarList?rentStatus=1\'&rentStatus=\'1-A\'&rentStatus=\'2&business.businessType=周边省市包车')">周边省市包车</a></li>
</ul>
<p><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3\'&rentStatus=\'4')">车辆租用管理</a></p>
<ul>
<%-- <li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=点到点代驾')">点到点代驾</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=机场及车站接送')">机场及车站接送</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=市用半日租')">市用半日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=市用全日租')">市用全日租</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=会务车辆安排')">会务车辆安排</a></li>
<li style="display: none;"><a href="javascript:void(0);" onclick="toUrl('<%=basePath%>rentCar/showRentCarList?rentStatus=2\'&rentStatus=\'3&business.businessType=周边省市包车')">周边省市包车</a></li> --%>
</ul>
</div>
</body>
</html>