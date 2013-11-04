<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${car.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="25%" align="right" height="25px">车牌号码：</td>
                <td colspan="3">${car.plateNumber}</td>
            </tr>
            <tr>
                <td align="right" height="25px">购买人姓名：</td>
                <td colspan="3">
                	${car.purchaser}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买人电话：</td>
                <td colspan="3">
                	${car.purchaserPhone}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买日期：</td>
                <td colspan="3">
                	<fmt:formatDate value="${car.purchaseDate}" type="both" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买价格(万元)：</td>
                <td colspan="3">
                	${car.purchasePrice}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所属车系：</td>
                <td colspan="3">
                	${car.carSeries.seriesName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所属城市：</td>
                <td colspan="3">
                	${car.city.cityName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td colspan="3">
                	${car.content}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${car.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${car.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${car.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${car.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
