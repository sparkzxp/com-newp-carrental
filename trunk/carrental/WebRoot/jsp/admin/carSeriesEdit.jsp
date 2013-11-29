<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车系管理 新增 修改</title>
    <link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/common/fileEveryWhere.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$("#carSeries_marketDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	
    	$("input:file").fileEveryWhere({
			ButtonText : "浏览"
		});
    	
    	$("input[name=logoImgFile]").next("input[type=text]").val($('#carSeries_manufacturerLogoPath').val());
    	$("input[name=seriesImgFile]").next("input[type=text]").val($('#carSeries_seriesImgPath').val());
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
    		if($("input[name=logoImgFile]").next("input[type=text]").val()==''){
				$.prompt("请先上传生产厂商标志",{
					title: '提示',
	    			buttons: { "确认": false}
	    		});
				return;
   	   		}else if($("input[name=seriesImgFile]").next("input[type=text]").val()==''){
				$.prompt("请先上传车系图片",{
					title: '提示',
	    			buttons: { "确认": false}
	    		});
				return;
   	   		}else if($('#editForm').valid()){
   	   			if($("input[name=logoImgFile]").next("input[type=text]").val() != $('#carSeries_manufacturerLogoPath').val()){
   	   				$('#carSeries_manufacturerLogoUploadStatus').val('true');
   	   			}
   	   			if($("input[name=seriesImgFile]").next("input[type=text]").val() != $('#carSeries_seriesImgPath').val()){
	   				$('#carSeries_seriesImgUploadStatus').val('true');
	   			}
	    		$('#editForm').submit();
    		}
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm" enctype="multipart/form-data" method="post" action="<%=basePath%>carSeries/doCarSeriesEdit">
    <input type="hidden" name="id" value="${carSeries.id}"/>
    <input type="hidden" id="carSeries_manufacturerLogoPath" name="manufacturerLogoPath" value="${carSeries.manufacturerLogoPath}"/>
    <input type="hidden" id="carSeries_manufacturerLogoUploadStatus" name="manufacturerLogoUploadStatus" value="false"/>
    <input type="hidden" id="carSeries_seriesImgPath" name="seriesImgPath" value="${carSeries.seriesImgPath}"/>
    <input type="hidden" id="carSeries_seriesImgUploadStatus" name="seriesImgUploadStatus" value="false"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="25%" align="right" height="25px">生产厂商：</td>
                <td>
                	<input type="text" name="manufacturer" value="${carSeries.manufacturer}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                	<span style="color: red;">请上传宽29像素，高29像素的图片</span>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">生产厂商标志：</td>
                <td>
                	<input type="file" name="logoImgFile"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车系名称：</td>
                <td>
                	<input type="text" name="seriesName" value="${carSeries.seriesName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车系图片：</td>
                <td>
                	<input type="file" name="seriesImgFile"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车型名称：</td>
                <td><input type="text" name="styleName" value="${carSeries.styleName}" style="width:200px;" class="{maxlengthCN:100}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">上市时间：</td>
                <td>
                	<input type="text" id="carSeries_marketDate" name="marketDate" value="<fmt:formatDate value="${carSeries.marketDate}" type="both" pattern="yyyy-MM-dd"/>" style="width:200px;" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">级别：</td>
                <td>
                	<input type="text" name="level" value="${carSeries.level}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">发动机：</td>
                <td>
                	<input type="text" name="engine" value="${carSeries.engine}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">变速箱：</td>
                <td>
                	<input type="text" name="gearbox" value="${carSeries.gearbox}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">长*宽*高(mm)：</td>
                <td>
                	<input type="text" name="LWH" value="${carSeries.LWH}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车身结构：</td>
                <td>
                	<input type="text" name="structrue" value="${carSeries.structrue}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">平均油耗(L/100km)：</td>
                <td>
                	<input type="text" name="fuelConsumption" value="${carSeries.fuelConsumption}" style="width:200px;" class="{number:true,min:0}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">油箱容积(L)：</td>
                <td>
                	<input type="text" name="fuelCapacity" value="${carSeries.fuelCapacity}" style="width:200px;" class="{digits:true,min:0,max:999}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">行李箱容积(L)：</td>
                <td>
                	<input type="text" name="trunkCapacity" value="${carSeries.trunkCapacity}" style="width:200px;" class="{digits:true,min:0,max:999}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃料形式：</td>
                <td>
                	<input type="text" name="fuelForm" value="${carSeries.fuelForm}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃油标号：</td>
                <td>
                	<input type="text" name="ROZ" value="${carSeries.ROZ}" style="width:200px;" class="{maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="50" class="{maxlengthCN:2000}">${carSeries.content}</textarea>
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
