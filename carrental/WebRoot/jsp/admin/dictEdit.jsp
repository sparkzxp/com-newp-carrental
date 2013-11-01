<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>字典表管理 新增 修改</title>
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
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>dict/doDictEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$('#id').val(data.id);
	        			$.prompt('操作成功',{
							title: '提示',
		        			buttons: { "确认": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					W.pageLoad(data);
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
    		}
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${dict.id}"/>
    <input type="hidden" name="typeName" value="${dict.typeName}"/>
    <input type="hidden" name="typeValue" value="${dict.typeValue}"/>
    <input type="hidden" name="parent.id" value="${dict.parent.id}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">${title}名称：</td>
                <td><input type="text" name="name" value="${dict.name}" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">${title}编码：</td>
                <td>
                	<input type="text" name="value" value="${dict.value}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
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
