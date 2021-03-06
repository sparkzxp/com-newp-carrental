﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>业务描述管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${businessDesc.id}"/>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">业务名称：</td>
                <td colspan="3">${businessDesc.name}</td>
            </tr>
            <tr>
                <td align="right" height="25px">业务简介：</td>
                <td colspan="3">${businessDesc.brief}</td>
            </tr>
            <tr>
                <td align="right" height="25px">业务说明：</td>
                <td colspan="3"><%-- ${fn:replace(businessDesc.content,vEnter,"<br>")} --%>${businessDesc.content}</td>
            </tr>
            <tr>
                <td align="right" height="25px">业务图片：</td>
                <td colspan="3">
                	<c:if test="${businessDesc.imagePath != null and businessDesc.imagePath != ''}">
                	<img alt="" src="<%=basePath%>${businessDesc.imagePath}" width="298" height="313"/>
                	</c:if>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${businessDesc.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${businessDesc.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
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
