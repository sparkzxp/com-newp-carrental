<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
        	<c:if test="${rentCar.pickUpDt != null and rentCar.pickUpDt != ''}">
            <tr>
                <td width="20%" align="right" height="25px">还车时间：</td>
                <td width="30%"><fmt:formatDate value="${rentCar.giveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/></td>
                <td width="20%" align="right" height="25px">结束里程数(公里)：</td>
                <td width="30%">${rentCar.endMileage}</td>
            </tr>
            <tr>
                <td align="right" height="25px">破损部分描述：</td>
                <td colspan="3">${rentCar.brokenPart}</td>
            </tr>
            <tr>
                <td align="right" height="25px">超公里数：</td>
                <td>${rentCar.exceedKilometer}</td>
                <td align="right" height="25px">超小时数：</td>
                <td>${rentCar.exceedHour}</td>
            </tr>
            <tr>
                <td align="right" height="25px">破损补偿费用(元)：</td>
                <td>${rentCar.brokenFee}</td>
                <td align="right" height="25px">总计应付(元)：</td>
                <td>${rentCar.totalPrice}</td>
            </tr>
            </c:if>
        </table>
    </div>
