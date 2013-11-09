<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
        	<c:if test="${rentCar.driver != null and rentCar.driver.id != ''}">
            <tr>
                <td width="20%" align="right" height="25px">司机姓名：</td>
                <td colspan="3">${rentCar.driver.driverName}</td>
            </tr>
            </c:if>
            <c:if test="${rentCar.car != null and rentCar.car.id != ''}">
            <tr>
                <td width="20%" align="right" height="25px">车牌号码：</td>
                <td colspan="3">
                	${rentCar.car.plateNumber}
                </td>
            </tr>
            </c:if>
        </table>
    </div>
