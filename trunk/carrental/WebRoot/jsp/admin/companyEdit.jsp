<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>公司管理 新增 修改</title>
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
    $(function() {
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>company/doCompanyEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$('#id').val(data.id);
	        			$.prompt('操作成功',{
							title: '提示',
		        			buttons: { "确认": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
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
    	
    	$('#btn_reset').click(function(){
    		location.href = '<%=basePath%>company/toCompanyEdit';
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;企业信息管理</div>
		<h1>企业信息管理</h1>
	</div>
    <input type="hidden" name="id" value="${company.id}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">公司名称：</td>
                <td><input type="text" name="name" value="${company.name}" style="width:200px;" class="{required:true,maxlengthCN:100}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">公司电话：</td>
                <td>
                	<input type="text" name="tel" value="${company.tel}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">邮政编码：</td>
                <td>
                	<input type="text" name="postcode" value="${company.postcode}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">传真号码：</td>
                <td>
                	<input type="text" name="fax" value="${company.fax}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">公司地址：</td>
                <td>
                	<input type="text" name="address" value="${company.address}" style="width:200px;" class="{required:true,maxlengthCN:200}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">公司介绍：</td>
                <td>
                	<textarea rows="8" cols="50" name="content" class="{required:true,maxlengthCN:5000}">${company.content}</textarea>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px"></td>
                <td><div class="button_nde">
                	<input type="button" id="btn_submit" class="btn" value="保存"/>
                	<input type="button" id="btn_reset" class="btn" value="还原"/>
                	</div>
				</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
