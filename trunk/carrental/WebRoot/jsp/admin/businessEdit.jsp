<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>业务管理 新增 修改</title>
	<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
	
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script language="javascript" src="<%=basePath%>js/common/json2.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>business/doBusinessEdit', $('#editForm').serialize(), function(data){
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
    <input type="hidden" name="id" value="${business.id}"/>
    <div class="content" style="height: 370px;">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="35%" align="right" height="25px">业务名称：</td>
                <td><input type="text" name="businessType" value="${business.businessType}" readonly="readonly" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">租用车型：</td>
                <td>
                	<select name="rentType.id" style="width:200px;" class="{required:true}">
                		<c:forEach items="${rentTypes}" var="parent">
                		<option value="${parent.id}" <c:if test="${parent.id == business.rentType.id}">selected="true"</c:if>>${parent.typeName}</option>
                		</c:forEach>
                	</select>
				</td>
            </tr>
            <tr>
                <td align="right" height="25px">起步价格(元)：</td>
                <td><input type="text" name="rentFee" value="${business.rentFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">代驾费用(元)：</td>
                <td><input type="text" name="driverFee" value="${business.driverFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">保险费用(元)：</td>
                <td><input type="text" name="insuranceFee" value="${business.insuranceFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">油费(燃油附加费)(元)：</td>
                <td><input type="text" name="fuelFee" value="${business.fuelFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">基础小时数(小时)：</td>
                <td><input type="text" name="baseHour" value="${business.baseHour}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少分钟算一小时：</td>
                <td><input type="text" name="exceedMinuteToHour" value="${business.exceedMinuteToHour}" style="width:200px;" class="{required:true,digits:true,min:0,max:59}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超小时费(元/小时)：</td>
                <td><input type="text" name="exceedHourFee" value="${business.exceedHourFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">基础公里数(公里)：</td>
                <td><input type="text" name="baseKilometer" value="${business.baseKilometer}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少里算一公里：</td>
                <td><input type="text" name="exceedMeterToKilometer" value="${business.exceedMeterToKilometer}" style="width:200px;" class="{required:true,digits:true,min:0,max:999}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超公里费(元/公里)：</td>
                <td><input type="text" name="exceedKilometerFee" value="${business.exceedKilometerFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td><textarea name="content" rows="3" cols="35" class="{maxlengthCN:2000}">${business.content}</textarea></td>
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
