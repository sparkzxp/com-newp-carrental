<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>空指针异常处理页面</title>
<style type="text/css">
/* content */
.full{width:560px; margin:0 auto;}
.full dl.error{width:560px;  background:#f5f5f5; border-bottom:1px solid #ebebeb; margin:100px 0 10px;}
.full dl.error dt{height:44px; line-height:44px;  background:url(<%=basePath%>images/error/pic_bg_jz.png) 0 0 no-repeat; text-align:left; padding:0 15px; vertical-align:center;}
/* .full dl.error dt img{padding-top:13px; width:167px; height:20px;  background:url(<%=basePath%>images/error/pic_bg.gif) -20px -309px no-repeat;} */
.full dl.error dd{text-align:center;}
.full dl.error dd span.errorNPE{padding:50px 0px 10px 0; display:inline-block;}
.full dl.error dd span.errorNPE img{width:200px; height:100px;  background:url(<%=basePath%>images/error/pic_bg_jz.png) 0 -290px no-repeat;}
.full dl.error dd p{ text-align:left;}
.full dl.error dd span.error_NPE_text{padding:50px 0 10px 0; display:inline-block;}
.full dl.error dd span.error_NPE_text img{width:180px; height:100px;  background:url(<%=basePath%>images/error/pic_bg_jz.png) -220px -400px no-repeat;}
.full dl.error dd span.btn_back{padding:30px 0 50px 0; display:inline-block;}
.full dl.error dd span.btn_back img{width:122px; height:42px;  background:url(<%=basePath%>images/error/pic_bg_jz.png) 0 -440px no-repeat;}
</style>
</head>
<body>
	<div class="full">	
		<dl class="error">
			<dt>
				<h2>空指针 提示页面</h2>
			<dd>
				<span class="errorNPE"><img src="<%=basePath%>images/error/pic_dot_jz.gif" alt="NPE" title="NPE"></span>
				<span class="error_NPE_text"><img src="<%=basePath%>images/error/pic_dot_jz.gif" alt="nullPointException" title="nullPointException"></span>
			</dd>
            <dd style="font-size:19px; font-family:Microsoft YaHei;">
            	神奇的空指针，你无处不在！
            </dd>
			<dd>
				<span class="btn_back"><a href="<%=basePath%>" ><img src="<%=basePath%>images/error/pic_dot_jz.gif" alt="返回" title="返回"></a></span> 
			</dd>
		</dl>
	</div>
</body>
</html>