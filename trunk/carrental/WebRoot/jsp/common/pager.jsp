<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page">
<input type="hidden" id="pager_currentPage" name="currentPage" value="${pager.currentPage}"/>
共有${pager.totalSize}条记录&nbsp;&nbsp;第${pager.currentPage}页&nbsp;&nbsp;共${pager.totalPage}页&nbsp;&nbsp;
<c:if test="${pager.currentPage > 1}">
<a href="javascript:void(0);" onclick="pageLoadWithPager(0,1)">第一页</a>
<a href="javascript:void(0);" onclick="pageLoadWithPager(-1,0)">前一页</a>
</c:if>
<c:if test="${pager.currentPage < pager.totalPage}">
<a href="javascript:void(0);" onclick="pageLoadWithPager(1,0)">后一页</a>
<a href="javascript:void(0);" onclick="pageLoadWithPager(0,${pager.totalPage})">最末页</a>
</c:if>
</div>