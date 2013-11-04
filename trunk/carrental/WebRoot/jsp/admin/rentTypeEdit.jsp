<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>租用类型管理 新增 修改</title>
	<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link rel="stylesheet" href="<%=basePath%>plugin/ztree/css/select.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath%>plugin/ztree/css/zTreeStyle.css" type="text/css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
	
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script language="javascript" src="<%=basePath%>js/common/json2.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/ztree/jquery.ztree.core-3.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/ztree/jquery.ztree.excheck-3.2.min.js"></script>
    <script type="text/javascript">
    var api = frameElement.api, W = api.opener;
    
    var setting = {
		check: {
			enable: true,
			chkboxType: {"Y":"ps", "N":"ps"}
		},
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: onCheck
		}
	};
   	
   	function onCheck(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("carSeriesTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#carSeriesSel").attr("value", v);
		$("#carSeriesIds").attr("value", k);
	}
   	
   	function showMenu() {
		var carSeriesObj = $("#carSeriesSel");
		var carSeriesOffset = $("#carSeriesSel").offset();
		$("#menuContent").css({left:carSeriesOffset.left + "px", top:carSeriesOffset.top + carSeriesObj.outerHeight() + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "carSeriesSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}
   	
    $(function() {
    	var zNodes = JSON.parse('${carSeriesJson}');
    	$.fn.zTree.init($("#carSeriesTree"), setting, zNodes);
    	var zTree = $.fn.zTree.getZTreeObj("carSeriesTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#carSeriesSel").attr("value", v);
		$("#carSeriesIds").attr("value", k);
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>rentType/doRentTypeEdit', $('#editForm').serialize(), function(data){
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
    <input type="hidden" name="id" value="${rentType.id}"/>
    <div class="content" style="height: 370px;">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="30%" align="right" height="25px">租用类型名称：</td>
                <td><input type="text" name="typeName" value="${rentType.typeName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">选择车系：</td>
                <td>
                	<textarea id="carSeriesSel" readonly="readonly" style="width:300px; height:60px;" onclick="showMenu();"></textarea>
                	&nbsp;<a id="menuBtn" href="javascript:void(0)" onclick="showMenu();" style="font-size:12px;">选择</a>
                	<input type="hidden" id="carSeriesIds" name="carSeriesIds"/>
				</td>
            </tr>
            <tr>
                <td align="right" height="25px">租用费用(元)：</td>
                <td><input type="text" name="rentFee" value="${rentType.rentFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">保险费用(元)：</td>
                <td><input type="text" name="insuranceFee" value="${rentType.insuranceFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">油费(燃油附加费)(元)：</td>
                <td><input type="text" name="fuelFee" value="${rentType.fuelFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少分钟算一小时：</td>
                <td><input type="text" name="exceedMinuteToHour" value="${rentType.exceedMinuteToHour}" style="width:200px;" class="{required:true,digits:true,min:0,max:59}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超小时费(元/小时)：</td>
                <td><input type="text" name="exceedHourFee" value="${rentType.exceedHourFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少里算一公里：</td>
                <td><input type="text" name="exceedMeterToKilometer" value="${rentType.exceedMeterToKilometer}" style="width:200px;" class="{required:true,digits:true,min:0,max:999}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">超公里费(元/公里)：</td>
                <td><input type="text" name="exceedKilometerFee" value="${rentType.exceedKilometerFee}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">限载人数：</td>
                <td><input type="text" name="loadLimit" value="${rentType.loadLimit}" style="width:200px;" class="{required:true,digits:true,min:0,max:120}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">备注说明：</td>
                <td><textarea name="content" rows="3" cols="35" class="{maxlengthCN:2000}">${rentType.content}</textarea></td>
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
    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="carSeriesTree" class="ztree" style="clear:both;margin-top:0; width:250px; height: 250px;"></ul>
	</div>
</body>
</html>
