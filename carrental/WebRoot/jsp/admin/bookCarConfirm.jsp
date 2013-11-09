<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>车辆预订管理 详细</title>
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    $(function() {
    	$('#btn_submit').click(function(){
    		$.prompt(
				{state0:{
					html: '确认此次预订吗',
        			buttons: { "确认": 1, "取消": 0},
        			submit:function(e,v,m,f){
        				e.preventDefault();
        				if(v==0){
        					$.prompt.close();
        				}else if(v==1){
        					$.post("<%=basePath%>rentCar/doRentCarConfirm", 
        						{
        							"id": '${rentCar.id}',
        							"rentNumber": '${rentCar.rentNumber}'
        						}, function(data){
			   					if(data.result=="SUCCESS"){
			   						$.prompt.goToState('state1', true);
			   						return false;
			   					}else{
			   						$.prompt.goToState('state2', true);
			   						return false;
			   					}
			   				}, "json");
        				}
        			}
        		},
        		state1:{
        			html: '操作成功!点击确定返回列表',
        			buttons: { "确认": true},
        			submit:function(e,v,m,f){
        				e.preventDefault();
        				if(v){
        					$.prompt.close();
        					W.pageLoad();
        				}
        			}
        		},
        		state2:{
        			html: '操作失败',
        			buttons: { "确认": true},
        			submit:function(e,v,m,f){
        				e.preventDefault();
        				if(v){
        					$.prompt.goToState('state0');
        				}
        			}
        		}}
			);
    	});
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm">
    <input type="hidden" name="id" value="${rentCar.id}"/>
    <%@ include file="rentCarDetail_bookPart.jsp"%>
    <%@ include file="rentCarDetail_userInfoPart.jsp"%>
    <div class="button_nde" style="text-align: center;">
    	<input type="button" id="btn_submit" class="btn" value="确认"/>
       	<input type="button" id="btn_close" class="btn" value="关闭" onclick="javascript:api.close();"/>
    </div>
    </form>
</body>
</html>
