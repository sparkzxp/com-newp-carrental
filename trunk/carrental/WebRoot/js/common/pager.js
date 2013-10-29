/**
 * 分页跳转JS事件<br>
 * 
 * @author 张霄鹏
 */
// 分页指定下一页
function pageLoadWithPager(p1, p2){
	if(p1==0) {
		$("#pager_currentPage").val(p2);
	} else {
		$("#pager_currentPage").val(parseInt($("#pager_currentPage").val())+p1);
	}
	$("#queryForm").submit();
}