<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
        	<c:if test="${rentCar.pickUpDt != null and rentCar.pickUpDt != ''}">
            <tr>
                <td width="20%" align="right" height="25px">取车时间：</td>
                <td><fmt:formatDate value="${rentCar.pickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
            </c:if>
            <c:if test="${rentCar.startMileage != null and rentCar.startMileage != ''}">
            <tr>
                <td align="right" height="25px">起始里程数(公里)：</td>
                <td>${rentCar.startMileage}</td>
            </tr>
            </c:if>
        </table>
    </div>
