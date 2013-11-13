<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>系统用户管理 新增 修改</title>
    <link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	if($('#admin_id').val() == ''){
    		$($(':radio')[0]).attr('checked', 'checked');
    	}
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>admin/doAdminEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			var _txt = '操作成功'+($('#id')==''?'，新增用户默认密码为123456':'');
	        			$('#id').val(data.id);
	        			$.prompt(_txt,{
							title: '提示',
		        			buttons: { "确认": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					W.pageLoad();
		        					//setTimeout(function(){api.close();},100);
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
    		}
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" id="admin_id" name="id" value="${admin.id}"/>
    <input type="hidden" name="type" value="${admin.type}"/>
    <input type="hidden" name="password" value="${admin.password}"/>
	<input type="hidden" id="admin_inBlacklist" name="inBlacklist" value="${admin.inBlacklist}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">用户姓名：</td>
                <td><input type="text" name="adminName" value="${admin.adminName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                	<input name="sex" type="radio" value="female" <c:if test="${admin.sex == 'female'}">checked="checked"</c:if> /> 女士 <input type="radio"
						name="sex" value="male" <c:if test="${admin.sex == 'male'}">checked="checked"</c:if>/> 先生
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">登录账号：</td>
                <td>
                	<input type="text" name="loginName" value="${admin.loginName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">移动电话：</td>
                <td>
                	<input type="text" name="phone" value="${admin.phone}" style="width:200px;" class="{required:true,phoneCN:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">邮箱地址：</td>
                <td>
                	<input type="text" name="email" value="${admin.email}" style="width:200px;" class="{required:true,email:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所在城市：</td>
                <td>
                	<select name="city.id" style="width:200px;" class="{required:true}">
                		<c:forEach items="${citys}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == admin.city.id}">selected="true"</c:if>><c:out value="${parent.cityName}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">角色名称：</td>
                <td>
                	<select name="role.id" style="width:200px;" class="{required:true}">
                		<option value="">--请选择--</option>
                		<c:forEach items="${roles}" var="parent">
                		<option value="${parent.id}" <c:if test="${admin.role.id == parent.id}">selected="true"</c:if> >${parent.roleName}</option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px"></td>
                <td><div class="button_nde">
                	<input type="button" id="btn_submit" class="btn" value="提交"/>
                	<input type="button" id="btn_close" class="btn" value="关闭" onclick="javascript:api.close();"/>
                	</div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
