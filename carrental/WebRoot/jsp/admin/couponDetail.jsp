<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>优惠活动管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    function changeCouponType(){
    	var t = '${coupon.couponType}';
		if(t == ''){
			$('.discount').hide();
			$('.kmFree').hide();
			$('.daysFree').hide();
		}else if(t == '公里满就送'){
			$('.discount').hide();
			$('.kmFree').show();
			$('.daysFree').hide();
		}else if(t == '天数租就送'){
			$('.discount').hide();
			$('.kmFree').hide();
			$('.daysFree').show();
		}else if(t == '指定车系打折'){
			$('.discount').show();
			$('.kmFree').hide();
			$('.daysFree').hide();
		}
	}
   	
    $(function() {
    	changeCouponType();
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${coupon.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="30%" align="right" height="25px">优惠活动标题：</td>
                <td colspan="3">${coupon.couponTitle}</td>
            </tr>
            <tr>
                <td align="right" height="25px">优惠活动类型：</td>
                <td colspan="3">${coupon.couponType}</td>
            </tr>
            <tr class="discount" style="display: none;">
                <td align="right" height="25px">选择车系：</td>
                <td colspan="3">
                	<c:forEach items="${coupon.carSeriesList}" var="parent">
                	${parent.seriesName}&nbsp;
                	</c:forEach>
                </td>
            </tr>
            <tr class="kmFree" style="display: none;">
                <td align="right" height="25px">开满(公里)：</td>
                <td colspan="3">${coupon.fullKilometer}</td>
            </tr>
            <tr class="kmFree" style="display: none;">
                <td align="right" height="25px">免费送(公里)：</td>
                <td colspan="3">${coupon.freeKilometer}</td>
            </tr>
            <tr class="daysFree" style="display: none;">
                <td align="right" height="25px">租用(天)：</td>
                <td colspan="3">${coupon.rentDays}</td>
            </tr>
            <tr class="daysFree" style="display: none;">
                <td align="right" height="25px">免费送(天)：</td>
                <td colspan="3">${coupon.freeDays}</td>
            </tr>
            <tr>
                <td align="right" height="25px">开始时间：</td>
                <td colspan="3"><fmt:formatDate value="${coupon.startDate}" type="both" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">结束时间：</td>
                <td colspan="3"><fmt:formatDate value="${coupon.endDate}" type="both" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td colspan="3">${coupon.content}</td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${coupon.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${coupon.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${coupon.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${coupon.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="text-align: center;">
                	<input type="button" id="btn_close" class="btn_submit" value="关闭" onclick="javascript:api.close();"/>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
