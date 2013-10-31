<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>角色管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${role.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">角色名称：</td>
                <td colspan="3">${role.roleName}</td>
            </tr>
            <tr>
                <td align="right" height="25px">监管城市：</td>
                <td colspan="3">
                	<c:choose>
                		<c:when test="${role.city == null or role.city.id == ''}">所有城市</c:when>
                		<c:otherwise>${role.city.cityName}</c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">拥有资源：</td>
                <td colspan="3">
                	<c:forEach items="${role.resources}" var="parent">
                	${parent.name}&nbsp;
                	</c:forEach>
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${role.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${role.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${role.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${role.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
