<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<base href="<%=basePath%>">
    <title>角色管理 新增 修改</title>
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
		var zTree = $.fn.zTree.getZTreeObj("resourceTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#resourceSel").attr("value", v);
		$("#resourceIds").attr("value", k);
	}
   	
   	function showMenu() {
		var resourceObj = $("#resourceSel");
		var resourceOffset = $("#resourceSel").offset();
		$("#menuContent").css({left:resourceOffset.left + "px", top:resourceOffset.top + resourceObj.outerHeight() + "px"}).slideDown("fast");

		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "resourceSel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}
   	
    $(function() {
    	var zNodes = JSON.parse('${resourceJson}');
    	$.fn.zTree.init($("#resourceTree"), setting, zNodes);
    	var zTree = $.fn.zTree.getZTreeObj("resourceTree"),
		nodes = zTree.getCheckedNodes(true);
		var v = "";
		var k = "";
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
			k += nodes[i].id + ",";
		}
		if (v.length > 0 ) v = v.substring(0, v.length-1);
		if (k.length > 0 ) k = k.substring(0, k.length-1);
		$("#resourceSel").attr("value", v);
		$("#resourceIds").attr("value", k);
    	
    	$('#btn_submit').click(function(){
    		if($('#editForm').valid()){
	    		$.post('<%=basePath%>role/doRoleEdit', $('#editForm').serialize(), function(data){
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
    <input type="hidden" name="id" value="${role.id}"/>
    <div class="content" style="height: 370px;">
        <table border="0" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">角色名称：</td>
                <td><input type="text" name="roleName" value="${role.roleName}" style="width:200px;" class="{required:true,maxlengthCN:50}"/></td>
            </tr>
            <tr>
                <td align="right" height="25px">监管城市：</td>
                <td>
                	<select name="city.id" style="width:200px;">
                		<c:if test="${removeTopCity == null}">
                		<option value="" <c:if test="${role.city == null or role.city.id == ''}">selected="true"</c:if>>所有城市</option>
                		</c:if>
                		<c:forEach items="${citys}" var="parent">
                		<option value="<c:out value="${parent.id}"/>" <c:if test="${parent.id == role.city.id}">selected="true"</c:if>><c:out value="${parent.cityName}"/></option>
                		</c:forEach>
                	</select>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">拥有资源：</td>
                <td>
                	<textarea id="resourceSel" readonly="readonly" style="width:300px; height:60px;" onclick="showMenu();"></textarea>
                	&nbsp;<a id="menuBtn" href="javascript:void(0)" onclick="showMenu();" style="font-size:12px;">选择</a>
                	<input type="hidden" id="resourceIds" name="resourceIds"/>
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
		<ul id="resourceTree" class="ztree" style="clear:both;margin-top:0; width:250px; height: 250px;"></ul>
	</div>
</body>
</html>
