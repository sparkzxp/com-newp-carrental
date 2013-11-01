<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车型管理 新增 修改</title>
    <link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    $(function() {
    	$("#carStyle_marketDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	
    	$('#carStyle_series_parent').change(function(){
			if($(this).children('option:selected').val() != ''){
				$.post('<%=basePath%>dict/queryDictList', {
					"parent.id":$(this).children('option:selected').val()
				}, function(data){
					if(data.result == 'SUCCESS'){
						$('#carStyle_series option').not(':first').remove();
						for(var i=0; i<data.dicts.length; i++){
							$("#carStyle_series").append("<option value='"+data.dicts[i].id+"'>"+data.dicts[i].name+"</option>");
						}
					}
				});
			}
		});
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>carStyle/doCarStyleEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$('#id').val(data.id);
	        			$.prompt('操作成功',{
							title: '提示',
		        			buttons: { "确认": true},
		        			submit:function(e,v,m,f){
		        				e.preventDefault();
		        				if(v){
		        					$.prompt.close();
		        					location.href='<%=basePath%>carStyle/showCarStyleList';
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
    	
    	$('#addManufacturer').click(function(){
    		$.show('新增厂商','<%=basePath%>dict/toDictEdit?typeName=生产厂商&typeValue=CAR_MANUFACTURER&title=生产厂商&parent.id=0',450,200,'A');
    	});
    	
    	$('#addSeries').click(function(){
    		if($('#carStyle_series_parent').val() == ''){
    			$.prompt('请先选择要新增车系的生产厂商',{
					title: '提示',
        			buttons: { "确认": false}
        		});
    		}else{
    			$.prompt('点击确认，为您选择的生产厂商【'+$('#carStyle_series_parent').find("option:selected").text()+'】增加新的车系',{
					title: '提示',
        			buttons: { "确认": true},
        			submit:function(e,v,m,f){
        				e.preventDefault();
        				if(v){
        					$.prompt.close();
        					$.show('新增车系','<%=basePath%>dict/toDictEdit?typeName=车系&typeValue=CAR_SERIES&title=车系&parent.id='+$('#carStyle_series_parent').val(),450,200,'A');
        				}
        			}
        		});
    		}
    	});
    });
    
	function pageLoad(data){
		if(data.typeValue == 'CAR_MANUFACTURER'){
			$("#carStyle_series_parent").append("<option value='"+data.id+"'>"+data.name+"</option>");
		}else if(data.typeValue == 'CAR_SERIES'){
			$("#carStyle_series").append("<option value='"+data.id+"'>"+data.name+"</option>");
		}
	}
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${carStyle.id}"/>
    <div class="maintitle">
		<div class="placenav">当前位置：<a href="javascript:void(0);">首页</a>&gt;车型管理&gt;编辑车型</div>
		<h1>编辑车型</h1>
	</div>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="25%" align="right" height="25px">生产厂商：</td>
                <td>
                	<select id="carStyle_series_parent" name="series.parent.id" style="width:200px;" class="{required:true}">
						<option value="" <c:if test="carStyle == null or carStyle.series == null or carStyle.series.parent == null or carStyle.series.parent.id == ''"></c:if>>--请选择--</option>
						<c:forEach items="${manufacturers}" var="parent">
						<option value="${parent.id}" <c:if test="${carStyle.series.parent.id == parent.id}">selected="true"</c:if>>${parent.name}</option>
						</c:forEach>
					</select>&nbsp;<a href="javascript:void(0);" id="addManufacturer">新增厂商</a>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车型系列：</td>
                <td>
                	<select id="carStyle_series" name="series.id" style="width:200px;" class="{required:true}">
						<option value="" <c:if test="carStyle == null or carStyle.series == null or carStyle.series.id == ''"></c:if>>--请选择--</option>
						<c:forEach items="${serieses}" var="parent">
						<option value="${parent.id}" <c:if test="${carStyle.series.id == parent.id}">selected="true"</c:if>>${parent.name}</option>
						</c:forEach>
					</select>&nbsp;<a href="javascript:void(0);" id="addSeries">新增车系</a>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车型名称：</td>
                <td><input type="text" name="styleName" value="${carStyle.styleName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">上市时间：</td>
                <td>
                	<input type="text" id="carStyle_marketDate" name="marketDate" value="<fmt:formatDate value="${carStyle.marketDate}" type="both" pattern="yyyy-MM-dd"/>" style="width:200px;" readonly="readonly" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">级别：</td>
                <td>
                	<input type="text" name="level" value="${carStyle.level}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">发动机：</td>
                <td>
                	<input type="text" name="engine" value="${carStyle.engine}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">变速箱：</td>
                <td>
                	<input type="text" name="gearbox" value="${carStyle.gearbox}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">长*宽*高(mm)：</td>
                <td>
                	<input type="text" name="LWH" value="${carStyle.LWH}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">车身结构：</td>
                <td>
                	<input type="text" name="structrue" value="${carStyle.structrue}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">平均油耗(L/100km)：</td>
                <td>
                	<input type="text" name="fuelConsumption" value="${carStyle.fuelConsumption}" style="width:200px;" class="{required:true,number:true,min:0}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">油箱容积(L)：</td>
                <td>
                	<input type="text" name="fuelCapacity" value="${carStyle.fuelCapacity}" style="width:200px;" class="{required:true,digits:true,min:0,max:999}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">行李箱容积(L)：</td>
                <td>
                	<input type="text" name="trunkCapacity" value="${carStyle.trunkCapacity}" style="width:200px;" class="{required:true,digits:true,min:0,max:999}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃料形式：</td>
                <td>
                	<input type="text" name="fuelForm" value="${carStyle.fuelForm}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">燃油标号：</td>
                <td>
                	<input type="text" name="ROZ" value="${carStyle.ROZ}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="50" class="{maxlengthCN:2000}">${carStyle.content}</textarea>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px"></td>
                <td><div class="button_nde">
                	<a href="javascript:void(0);" id="btn_submit"><span>提交</span></a>
					<a href="javascript:void(0);" id="btn_close" onclick="javascript:location.href='<%=basePath%>carStyle/showCarStyleList';"><span>返回列表</span></a>
					<h6 class="clear"></h6>
                	</div>
				</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
