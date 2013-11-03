<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车系管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${carSeries.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">生产厂商：</td>
                <td colspan="3">
                	${carSeries.manufacturer}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">生产厂商标志：</td>
                <td colspan="3">
                	<img alt="" src="<%=basePath%><c:out value="${carSeries.manufacturerLogoPath}"/>" style="width:60px; height:60px;"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车系名称：</td>
                <td colspan="3">
                	${carSeries.seriesName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车系图片：</td>
                <td colspan="3">
                	<img alt="" src="<%=basePath%><c:out value="${carSeries.seriesImgPath}"/>" style="width:170px; height:130px;"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车型名称：</td>
                <td colspan="3">
                	${carSeries.styleName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">上市时间：</td>
                <td colspan="3">
                	<fmt:formatDate value="${carSeries.marketDate}" type="both" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">级别：</td>
                <td colspan="3">
                	${carSeries.level}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">发动机：</td>
                <td colspan="3">
                	${carSeries.engine}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">变速箱：</td>
                <td colspan="3">
                	${carSeries.gearbox}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">长*宽*高(mm)：</td>
                <td colspan="3">
                	${carSeries.LWH}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车身结构：</td>
                <td colspan="3">
                	${carSeries.structrue}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">平均油耗(L/100km)：</td>
                <td colspan="3">
                	${carSeries.fuelConsumption}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">油箱容积(L)：</td>
                <td colspan="3">
                	${carSeries.fuelCapacity}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">行李箱容积(L)：</td>
                <td colspan="3">
                	${carSeries.trunkCapacity}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃料形式：</td>
                <td colspan="3">
                	${carSeries.fuelForm}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃油标号：</td>
                <td colspan="3">
                	${carSeries.ROZ}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td colspan="3">
                	${carSeries.content}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${carSeries.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${carSeries.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${carSeries.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${carSeries.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
