<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h5 class="page" style="margin: 10px 0 0 0;">
	<input type="hidden" id="pager_currentPage" name="currentPage" value="${pager.currentPage}"/>
	<c:if test="${pager.currentPage < pager.totalPage}">
	<a href="javascript:void(0)" onclick="pageLoadWithPager(0,${pager.totalPage})">尾页</a>
	<a href="javascript:void(0)" onclick="pageLoadWithPager(1,0)">下一页</a>
	</c:if>
	<c:if test="${pager.currentPage > 1}">
	<a href="javascript:void(0)" onclick="pageLoadWithPager(-1,0)">上一页</a>
	<a href="javascript:void(0)" onclick="pageLoadWithPager(0,1)">首页</a>
	</c:if>
	<span>${pager.pageSize}行/页</span><span>共${pager.totalSize}条</span><span>页次：${pager.currentPage}/${pager.totalPage}页</span>
	<h6 class="clear"></h6>
</h5>