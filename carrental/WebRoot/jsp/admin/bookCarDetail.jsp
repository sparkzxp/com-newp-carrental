<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆预订管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${rentCar.id}"/>
    <%@ include file="rentCarDetail_bookPart.jsp"%>
    <%@ include file="rentCarDetail_userInfoPart.jsp"%>
    <div class="button_nde" style="text-align: center;">
       	<input type="button" id="btn_close" class="btn" value="关闭" onclick="javascript:api.close();"/>
    </div>
    </form>
</body>
</html>
