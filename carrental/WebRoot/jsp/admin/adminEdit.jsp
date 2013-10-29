<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>系统用户管理 新增 修改</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script language="javascript" src="<%=basePath%>js/common/validation.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$('#btn_submit').click(function(){
    		$.post('<%=basePath%>admin/doAdminEdit', $('#editForm').serialize(), function(data){
        		if(data.result == 'success'){
        			$('#id').val(data.id);
        			$.prompt('操作成功',{
						title: '提示',
	        			buttons: { "确认": true},
	        			submit:function(e,v,m,f){
	        				e.preventDefault();
	        				if(v==0){
	        					$.prompt.close();
	        					setTimeout(function(){api.close();},100);
	        				}
	        			}
	        		});
        		}else{
        			$.prompt(data.result,{
						title: '提示',
	        			buttons: { "确认": false}
	        		});
        		}
    		}, "json");
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${admin.id}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">用户姓名：</td>
                <td><input type="text" name="adminName" value="${admin.adminName}" style="width:400px;" class="{required:true,maxlengthCN:200}"/></td>
            </tr>
            <tr>
                <td width="120px" align="right" height="25px">登录账号：</td>
                <td>
                	<input type="text" name="loginName" value="${admin.loginName}" style="width:400px;" class="{maxlengthCN:200}"/>
                </td>
            </tr>
            <tr>
                <td width="120px" align="right" height="25px"></td>
                <td><input type="button" id="btn_submit" class="btn_submit" value="提交"/></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
