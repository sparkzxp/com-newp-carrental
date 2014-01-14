<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>业务管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${business.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="30%" align="right" height="25px">业务名称：</td>
                <td colspan="3">${business.businessType}</td>
            </tr>
            <tr>
                <td align="right" height="25px">租用车型：</td>
                <td colspan="3">${business.rentType.typeName}</td>
            </tr>
            <tr>
                <td align="right" height="25px">起步价格(元)：</td>
                <td>${business.rentFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">代驾费用(元)：</td>
                <td colspan="3">${business.driverFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">保险费用(元)：</td>
                <td colspan="3">${business.insuranceFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">油费(燃油附加费)(元)：</td>
                <td colspan="3">${business.fuelFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">基础小时数(小时)：</td>
                <td colspan="3">${business.baseHour}</td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少分钟算一小时：</td>
                <td colspan="3">${business.exceedMinuteToHour}</td>
            </tr>
            <tr>
                <td align="right" height="25px">超小时费(元/小时)：</td>
                <td colspan="3">${business.exceedHourFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">基础公里数(公里)：</td>
                <td colspan="3">${business.baseKilometer}</td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少里算一公里：</td>
                <td colspan="3">${business.exceedMeterToKilometer}</td>
            </tr>
            <tr>
                <td align="right" height="25px">超公里费(元/公里)：</td>
                <td colspan="3">${business.exceedKilometerFee}</td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td colspan="3">${fn:replace(business.content,vEnter,"<br>")}</td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${business.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${business.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${business.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${business.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
