//js文件中导入js文件
var jsFile = '<script type="text/javascript" src="plugin/dialog/lhgdialog.min.js?skin=iblue"><\/script>';
document.write(jsFile);
function getRootPath(){    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp    
	var curWwwPath=window.document.location.href;    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp    
	var pathName=window.document.location.pathname;    
	var pos=curWwwPath.indexOf(pathName);    //获取主机地址，如： http://localhost:8083    
	var localhostPaht=curWwwPath.substring(0,pos);    //获取带"/"的项目名，如：/uimcardprj    
	var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);    
	return(localhostPaht+projectName);
}
;(function($) {
	$.extend( {
		//弹出一个信息框，2秒钟后关闭
		"tips" : function(content) {
			return $.dialog( {
				icon : 'tips.gif',
				title : '提示',
				content : content,
				time : 10,
				close : true
			});
		},
		//弹出一个操作成功的提示框
		"success" : function(content, ok) {
			return $.dialog( {
				title : '提示',
				icon : 'success.gif',
				content : content,
				ok : true,
				close : ok
			});
		},
		//弹出一个操作失败的提示框
		"error" : function(content) {
			return $.dialog( {
				title : '提示',
				icon : 'error.gif',
				content : content
			});
		},
		//弹出一个确认框
		"confirm" : function(content, ok) {
			return $.dialog( {
				title : '提示',
				lock : true,
				icon : 'prompt.gif',
				content : content,
				ok : ok,
				cancel : true
			/*true等价于function(){}*/
			});
		},
		//无图标的提示信息框
		"alert" : function(content, ok) {
			return $.dialog( {
				title : '提示',
				min : false,
				max : false,
				content : content,
				ok : true,
				close : ok
			});
		},
		//弹出层title:标题 url:路径 width:宽 height:高id: id
		"show" : function(title,url,width,height,id){
			return $.dialog({
				title : title,
				content : 'url:'+url,
				width : width,
				height : height,
				lock : true,
				id : id
			});
		}
	});
})(jQuery);
