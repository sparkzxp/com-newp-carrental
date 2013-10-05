$(function(){
	$("input[type=checkbox]").not(":first").click(function(){
		$("input[type=checkbox]:first").attr("checked",null);
	});
	
	$(".content_table tr").not(":first").hover(function(){
		$(this).find("td").each(function(index,item){
			$(item).addClass("list_table_hilite");
		});
	},function(){
		$(this).find("td").each(function(index,item){
			$(item).removeClass();
		});
	}).bind("click",function(event){
		var element = $(event.target);
		if(element.is("td")){
			var box = element.parent().find("td:first").find("input[type=checkbox]");
			if(null != box && box.length != 0){
				box.unbind("click").click();
			}
		} 
	});
});
//选中的复选框的值数组
function checkMess(){
	var arry = new Array();
	var index = 0;
	$("input:checkbox").not(":first").each(function(){	
		if(this.checked){
			arry[index] = $(this).val();
			index++;
		}
	}); 
	return arry;
}
//获取表格中的值,
function getTableText(tableId,trIndex,tdIndex){
	return $("#"+tableId).find("tr").eq(trIndex).find("td").eq(tdIndex).text(); 
}
//获取表格中的值,
function getTableTextByCheckBox(tableId,tdIndex){
	return $("#"+tableId).find("tr").find("td").find("input[type=checkbox]:checked").parent("td").parent("tr").find("td").eq(tdIndex).text();
}
//选中的复选框的值数组
function getNames(){
	var names = "";
	$("input:checkbox").not(":first").each(function(){	
		if(this.checked){
			names += $(this).next().val()+",";
		}
	}); 
	return names.substring(0, names.length-1);
}
//拼接选中ID用,分开
function idToString(){
	var ids = '';
	$("input:checkbox").not(":first").each(function(){	
		if(this.checked){
			ids+=this.value+",";
		}
	}); 
	return ids.substring(0, ids.length-1);
}

//全选全不选
function checkAll(temp){
	$("input[type=checkbox]").each(function(){
		$(this).attr("checked",temp);
	});
}
//打开新窗口居中
function openwindow(url,name,iWidth,iHeight){
	var url; //转向网页的地址;
	var name; //网页名称，可为空;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(url,name,'height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=0,menubar=0,scrollbars=1,location=0,status=0');
}

//两个时间进行比较(按日)
function DateDiff_Day(s1, s2) {
    return (s2-s1)>=0;   //day大于0表示s1大于s1
}