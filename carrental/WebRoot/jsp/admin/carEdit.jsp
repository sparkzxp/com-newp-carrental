<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆管理 新增 修改</title>
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
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$("#car_purchaseDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>car/doCarEdit', $('#editForm').serialize(), function(data){
	        		if(data.result == 'SUCCESS'){
	        			$('#id').val(data.id);
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
    <input type="hidden" name="id" value="${car.id}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="25%" align="right" height="25px">车牌号码：</td>
                <td><input type="text" name="plateNumber" value="${car.plateNumber}" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">购买人姓名：</td>
                <td>
                	<input type="text" name="purchaser" value="${car.purchaser}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买人电话：</td>
                <td>
                	<input type="text" name="purchaserPhone" value="${car.purchaserPhone}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买日期：</td>
                <td>
                	<input type="text" id="car_purchaseDate" name="purchaseDate" value="<fmt:formatDate value="${car.purchaseDate}" type="both" pattern="yyyy-MM-dd"/>" style="width:200px;" readonly="readonly" class="{required:true}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">购买价格(万元)：</td>
                <td>
                	<input type="text" name="purchasePrice" value="${car.purchasePrice}" style="width:200px;" class="{required:true,number:true,min:0}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所属车系：</td>
                <td>
                	<select name="carSeries.id" style="width:200px;" class="{required:true}">
                		<c:forEach items="${carSeriesList}" var="parent">
                		<option value="${parent.id}" <c:if test="${parent.id == car.carSeries.id}">selected="true"</c:if>>${parent.seriesName}</option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所属城市：</td>
                <td>
                	<select name="city.id" style="width:200px;" class="{required:true}">
                		<c:forEach items="${citys}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == car.city.id}">selected="true"</c:if>><c:out value="${parent.cityName}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="30" class="{maxlengthCN:2000}">${car.content}</textarea>
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
