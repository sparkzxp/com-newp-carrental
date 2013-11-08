<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>司机管理 新增 修改</title>
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
    	if('${driver.sex}' == ''){
    		$($('input[type=radio]')[0]).attr('checked', 'checked');
    	}
    	
    	$("#driver_entryDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>driver/doDriverEdit', $('#editForm').serialize(), function(data){
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
    <input type="hidden" name="id" value="${driver.id}"/>
    <div class="content">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="120px" align="right" height="25px">司机名称：</td>
                <td><input type="text" name="driverName" value="${driver.driverName}" style="width:200px;" class="{required:true,maxlengthCN:20}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">司机编号：</td>
                <td>
                	<input type="text" name="driverCode" value="${driver.driverCode}" style="width:200px;" class="{required:true,maxlengthCN:20}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">联系电话：</td>
                <td>
                	<input type="text" name="phone" value="${driver.phone}" style="width:200px;" class="{required:true,maxlengthCN:50}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">联系地址：</td>
                <td>
                	<input type="text" name="address" value="${driver.address}" style="width:200px;" class="{required:true,maxlengthCN:200}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">性别：</td>
                <td>
                	<input type="radio" name="sex" value="男" <c:if test="${driver.sex == '男'}">checked="checked"</c:if>/>男
                	<input type="radio" name="sex" value="女" <c:if test="${driver.sex == '女'}">checked="checked"</c:if> class="{required:true}"/>女
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">司机驾龄(年)：</td>
                <td>
                	<input type="text" name="driverYears" value="${driver.driverYears}" style="width:200px;" class="{required:true,digits:true,min:0,max:99}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">入职时间：</td>
                <td>
                	<input type="text" id="driver_entryDate" name="entryDate" value="<fmt:formatDate value="${driver.entryDate}" type="both" pattern="yyyy-MM-dd HH:mm"/>" style="width:200px;" class="{required:true}"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">所属城市：</td>
                <td>
                	<select name="city.id" style="width:200px;" class="{required:true}">
                		<c:forEach items="${citys}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == driver.city.id}">selected="true"</c:if>><c:out value="${parent.cityName}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td>
                	<textarea name="content" rows="4" cols="30" class="{maxlengthCN:2000}">${driver.content}</textarea>
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
