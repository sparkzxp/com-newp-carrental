<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>系统用户管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${admin.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">用户姓名：</td>
                <td colspan="3">${admin.adminName}
                	<c:if test="${admin.sex == 'male'}">先生</c:if>
                	<c:if test="${admin.sex == 'female'}">女士</c:if>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">登录账号：</td>
                <td colspan="3">
                	${admin.loginName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所在城市：</td>
                <td colspan="3">
                	${admin.city.cityName}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">移动电话：</td>
                <td colspan="3">
                	${admin.phone}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">邮箱地址：</td>
                <td colspan="3">
                	${admin.email}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">联系地址：</td>
                <td colspan="3">
                	${admin.address}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">QQ：</td>
                <td colspan="3">
                	${admin.qq}
                </td>
            </tr>
            <c:if test="${admin.type == 'ADMIN'}">
            <tr>
                <td align="right" height="25px">角色名称：</td>
                <td colspan="3">
                	${admin.role.roleName}
                </td>
            </tr>
            </c:if>
            <tr>
                <td align="right" height="25px">账号类型：</td>
                <td colspan="3">
                	<c:if test="${admin.type == 'CUSTOM_PERSONAL'}">个人用户</c:if>
                	<c:if test="${admin.type == 'CUSTOM_COMPANY'}">企业用户</c:if>
                	<c:if test="${admin.type == 'ADMIN'}">系统用户</c:if>
                </td>
            </tr>
            <c:if test="${admin.type == 'CUSTOM_COMPANY'}">
			<tr>
                <td align="right" height="25px">企业名称：</td>
                <td colspan="3">
                	${admin.companyName}
                </td>
            </tr>
			</c:if>
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${admin.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${admin.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${admin.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${admin.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
