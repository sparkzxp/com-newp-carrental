<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>优惠活动管理 新增 修改</title>
	<link href="<%=basePath%>css/admin/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.css">
    <link rel="stylesheet" href="<%=basePath%>plugin/ztree/css/select.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath%>plugin/ztree/css/zTreeStyle.css" type="text/css">
    <link href="<%=basePath%>plugin/jquery-validation-1.10.0/demo/css/screen.css" rel="stylesheet" type="text/css" />
	
    <script language="javascript" src="<%=basePath%>js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/lib/jquery.metadata.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/dist/additional-methods.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/jquery-validation-1.10.0/localization/messages_zh.js"></script>
    <script type="text/javascript" src="<%=basePath%>plugin/jquery-impromptu/jquery-impromptu.js"></script>
    <script language="javascript" src="<%=basePath%>js/common/json2.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/ztree/jquery.ztree.core-3.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>plugin/ztree/jquery.ztree.excheck-3.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common/fileEveryWhere.js"></script>
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
		var zTree = $.fn.zTree.getZTreeObj("rentTypeTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#rentTypeSel").attr("value", v);
		$("#rentTypeIds").attr("value", k);
	}
   	
   	function showMenu() {
		var rentTypeObj = $("#rentTypeSel");
		var rentTypeOffset = $("#rentTypeSel").offset();
		$("#menuContent").css({left:rentTypeOffset.left + "px", top:rentTypeOffset.top + rentTypeObj.outerHeight() + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "rentTypeSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}
	
	function changeCouponType(){
		if($('#coupon_couponType').find('option:selected').val() == ''){
			$('.discount').hide();
			$('.kmFree').hide();
			$('.hoursFree').hide();
		}else if($('#coupon_couponType').find('option:selected').val() == '公里满就送'){
			$('.discount').hide();
			$('.kmFree').show();
			$('.hoursFree').hide();
		}else if($('#coupon_couponType').find('option:selected').val() == '小时满就送'){
			$('.discount').hide();
			$('.kmFree').hide();
			$('.hoursFree').show();
		}else if($('#coupon_couponType').find('option:selected').val() == '指定车型打折'){
			$('.discount').show();
			$('.kmFree').hide();
			$('.hoursFree').hide();
		}
	}
   	
    $(function() {
    	$("input:file").fileEveryWhere({
			ButtonText : "浏览"
		});
    	
    	$("#coupon_startDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	$("#coupon_endDate").addClass("Wdate").click(function(){
			WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});
		});
    	
    	$("input[name=imageFile]").next("input[type=text]").val($('#coupon_imagePath').val());
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
    	
    	var zNodes = JSON.parse('${rentTypeJson}');
    	$.fn.zTree.init($("#rentTypeTree"), setting, zNodes);
    	var zTree = $.fn.zTree.getZTreeObj("rentTypeTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#rentTypeSel").attr("value", v);
		$("#rentTypeIds").attr("value", k);
    	
    	$('#btn_submit').click(function(){
    		if($("input[name=imageFile]").next("input[type=text]").val()==''){
				$.prompt("请先上传活动图片",{
					title: '提示',
	    			buttons: { "确认": false}
	    		});
				return;
   	   		}else if($('#editForm').valid()){
    			if($("input[name=imageFile]").next("input[type=text]").val() != $('#coupon_imagePath').val()){
	   				$('#coupon_imageUploadStatus').val('true');
	   			}
   	   			$('#editForm').submit();
    		}
    	});
    	
    	$('#coupon_couponType').change(function(){
    		changeCouponType();
    	});
    	
    	changeCouponType();
    });
    </script>
</head>
<body>
    <form name="editForm" id="editForm" enctype="multipart/form-data" method="post" action="<%=basePath%>coupon/doCouponEdit">
    <input type="hidden" name="id" value="${coupon.id}"/>
    <input type="hidden" id="coupon_imagePath" name="imagePath" value="${coupon.imagePath}"/>
    <input type="hidden" id="coupon_imageUploadStatus" name="imageUploadStatus" value="false"/>
    <div class="content" style="height: 370px;">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="30%" align="right" height="25px">优惠活动标题：</td>
                <td><input type="text" name="couponTitle" value="${coupon.couponTitle}" style="width:200px;" class="{required:true,maxlengthCN:100}"/></td>
            </tr>
            <tr>
				<td width="30%" align="right" height="25px">优惠活动类型：</td>
                <td>
                	<select id="coupon_couponType" name="couponType" class="{required:true}">
						<option value="">--请选择--</option>
						<option value="公里满就送" <c:if test="${coupon.couponType == '公里满就送'}">selected="true"</c:if>>公里满就送</option>
						<option value="小时满就送" <c:if test="${coupon.couponType == '小时满就送'}">selected="true"</c:if>>小时满就送</option>
						<option value="指定车型打折" <c:if test="${coupon.couponType == '指定车型打折'}">selected="true"</c:if>>指定车型打折</option>
					</select>
				</td>
			</tr>
            <tr>
                <td align="right" height="25px">活动图片：</td>
                <td>
                	<input type="file" name="imageFile"/>
                </td>
            </tr>
            <tr class="discount" style="display: none;">
                <td align="right" height="25px">选择车型：</td>
                <td>
                	<textarea id="rentTypeSel" readonly="readonly" style="width:300px; height:60px;" onclick="showMenu();"></textarea>
                	&nbsp;<a id="menuBtn" href="javascript:void(0)" onclick="showMenu();" style="font-size:12px;">选择</a>
                	<input type="hidden" id="rentTypeIds" name="rentTypeIds"/>
				</td>
            </tr>
            <tr class="discount" style="display: none;">
                <td align="right" height="25px">折扣：</td>
                <td><input type="text" name="discount" value="${coupon.discount}" style="width:200px;" class="{required:true,number:true,min:0,max:10}"/></td>
            </tr>
            <tr class="kmFree" style="display: none;">
                <td align="right" height="25px">开满(公里)：</td>
                <td><input type="text" name="fullKilometer" value="${coupon.fullKilometer}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr class="kmFree" style="display: none;">
                <td align="right" height="25px">免费送(公里)：</td>
                <td><input type="text" name="freeKilometer" value="${coupon.freeKilometer}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr class="hoursFree" style="display: none;">
                <td align="right" height="25px">租用(小时)：</td>
                <td><input type="text" name="rentHours" value="${coupon.rentHours}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr class="hoursFree" style="display: none;">
                <td align="right" height="25px">免费送(小时)：</td>
                <td><input type="text" name="freeHours" value="${coupon.freeHours}" style="width:200px;" class="{required:true,digits:true,min:0,max:30000}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">开始时间：</td>
                <td><input type="text" id="coupon_startDate" name="startDate" value="<fmt:formatDate value="${coupon.startDate}" type="both" pattern="yyyy-MM-dd"/>" readonly="readonly" style="width:200px;" class="{required:true}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">结束时间：</td>
                <td><input type="text" id="coupon_endDate" name="endDate" value="<fmt:formatDate value="${coupon.endDate}" type="both" pattern="yyyy-MM-dd"/>" readonly="readonly" style="width:200px;" class="{required:true}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">活动内容：</td>
                <td>
                	<textarea name="content" rows="3" cols="35" class="{required:true,maxlengthCN:5000}">${coupon.content}</textarea>
                	<br/><span style="color: red;">活动内容各段落之间请以&lt;p&gt;开头，以&lt;/p&gt;结尾</span>
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
    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="rentTypeTree" class="ztree" style="clear:both;margin-top:0; width:250px; height: 250px;"></ul>
	</div>
</body>
</html>
