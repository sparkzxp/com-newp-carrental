<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>业务描述管理 新增 修改</title>
    <link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/common/fileEveryWhere.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$("input:file").fileEveryWhere({
			ButtonText : "浏览"
		});
    	
    	$("input[name=imageFile]").next("input[type=text]").val($('#businessDesc_imagePath').val());
    	if('${result}' == 'SUCCESS'){
    		$.prompt('操作成功',{
				title: '提示',
    			buttons: { "确认": true},
    			submit:function(e,v,m,f){
    				e.preventDefault();
    				if(v){
    					$.prompt.close();
    					W.pageLoad();
    				}
    			}
    		});
    	}else if('${result}' != ''){
    		$.prompt(data.result,{
				title: '提示',
    			buttons: { "确认": false}
    		});
    	}
    	
    	$('#btn_submit').click(function(){
    		if($("input[name=imageFile]").next("input[type=text]").val()==''){
				$.prompt("请先上传业务图片",{
					title: '提示',
	    			buttons: { "确认": false}
	    		});
				return;
   	   		}else if($('#editForm').valid()){
    			if($("input[name=imageFile]").next("input[type=text]").val() != $('#businessDesc_imagePath').val()){
	   				$('#businessDesc_imageUploadStatus').val('true');
	   			}
   	   			$('#editForm').submit();
    		}
    	});
    	
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm" enctype="multipart/form-data" method="post" action="<%=basePath%>businessDesc/doBusinessDescEdit">
    <input type="hidden" name="id" value="${businessDesc.id}"/>
    <input type="hidden" name="name" value="${businessDesc.name}"/>
    <input type="hidden" id="businessDesc_imagePath" name="imagePath" value="${businessDesc.imagePath}"/>
    <input type="hidden" id="businessDesc_imageUploadStatus" name="imageUploadStatus" value="false"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">业务简介：</td>
                <td>
                	<input type="text" name="brief" value="${businessDesc.brief}" style="width:250px;" class="{required:true,maxlengthCN:140}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">业务说明：</td>
                <td><textarea name="content" rows="6" cols="45" class="{maxlengthCN:3000}">${businessDesc.content}</textarea>
                	<br/><span style="color: red;">业务说明各段落之间请以&lt;p&gt;开头，以&lt;/p&gt;结尾</span>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">业务图片：</td>
                <td>
                	<input type="file" name="imageFile"/>
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
