<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">车辆预订号：</td>
                <td colspan="3">${rentCar.rentNumber}</td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">租用城市：</td>
                <td width="30%">
                	${rentCar.city.cityName}
                </td>
                <td width="20%" align="right" height="25px">租用类型：</td>
                <td width="30%">
                	${rentCar.rentType.typeName}
                </td>
            </tr>
            <tr>
                <%-- <td align="right" height="25px">租用车系：</td>
                <td>
                	${rentCar.carSeries.seriesName}
                </td> --%>
                <td align="right" height="25px">预订方式：</td>
                <td>
                	${rentCar.rentWay}
                </td>
                <td align="right" height="25px">乘客数量：</td>
                <td>
                	${rentCar.passengerNo}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">起步价格(元)：</td>
                <td>
                	${rentCar.rentFee}
                </td>
                <td align="right" height="25px">代驾费用(元)：</td>
                <td>
                	${rentCar.business.driverFee}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">保险费用(元)：</td>
                <td>
                	${rentCar.business.insuranceFee}
                </td>
                <td align="right" height="25px">油费/燃油附加费(元)：</td>
                <td>
                	${rentCar.business.fuelFee}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">基础公里数(公里)：</td>
                <td>
                	${rentCar.business.baseKilometer}
                </td>
                <td align="right" height="25px">基础小时数(小时)：</td>
                <td>
                	${rentCar.business.baseHour}
                </td>
            </tr>
            <tr>
            	<td align="right" height="25px">超多少里算一公里：</td>
                <td>
                	${rentCar.business.exceedMeterToKilometer}
                </td>
            	<td align="right" height="25px">超公里费(元/公里)：</td>
                <td>
                	${rentCar.exceedKilometerFee}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">超多少分钟算一小时：</td>
                <td>
                	${rentCar.business.exceedMinuteToHour}
                </td>
                <td align="right" height="25px">超小时费(元/小时)：</td>
                <td>
                	${rentCar.exceedHourFee}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">预订人姓名：</td>
                <td width="30%">
                	${rentCar.bookUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">预订人公司名称：</td>
                <td width="30%">
                	${rentCar.bookUser.companyName}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">预订人手机号码：</td>
                <td width="30%">
                	${rentCar.bookUser.phone}
                </td>
                <td width="20%" align="right" height="25px">预订人邮件地址：</td>
                <td width="30%">
                	${rentCar.bookUser.email}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">客户姓名：</td>
                <td width="30%">
                	${rentCar.customer}
                </td>
                <td width="20%" align="right" height="25px">客户公司名称：</td>
                <td width="30%">
                	${rentCar.customerCompany}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">客户手机号码：</td>
                <td width="30%">
                	${rentCar.customerPhone}
                </td>
                <td width="20%" align="right" height="25px">客户邮件地址：</td>
                <td width="30%">
                	${rentCar.customerEmail}
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">预订业务类型：</td>
                <td width="30%">
                	${rentCar.business.businessType}
                </td>
                <td width="20%" align="right" height="25px">参加优惠活动：</td>
                <td width="30%">
                	<c:choose>
                		<c:when test="${rentCar.coupon == null or rentCar.coupon.id == null or rentCar.coupon.id ==  ''}">不参加</c:when>
                		<c:otherwise>${rentCar.coupon.couponTitle}</c:otherwise>
                	</c:choose>
                </td>
            </tr>
            <tr>
                <td width="20%" align="right" height="25px">预订取车时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${rentCar.bookPickUpDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
                <td width="20%" align="right" height="25px">预订取车地址：</td>
                <td width="30%">
                	${rentCar.bookPickUpAddress}
                </td>
            </tr>
            <c:if test="${rentCar.arriveFlightNo != ''}">
            <tr>
                <td width="20%" align="right" height="25px">到达航班号：</td>
                <td width="30%">
                	${rentCar.arriveFlightNo}
                </td>
                <td width="20%" align="right" height="25px">航班到达时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${rentCar.arriveFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            </c:if>
            <c:if test="${rentCar.takeOffFlightNo != ''}">
            <tr>
                <td width="20%" align="right" height="25px">起飞航班号：</td>
                <td width="30%">
                	${rentCar.takeOffFlightNo}
                </td>
                <td width="20%" align="right" height="25px">航班出发时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${rentCar.takeOfFlightDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            </c:if>
            <tr>
                <td width="20%" align="right" height="25px">预订还车时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${rentCar.bookGiveBackDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
                <td width="20%" align="right" height="25px">预订还车地址：</td>
                <td width="30%">
                	${rentCar.bookGiveBackAddress}
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">预订确认员：</td>
                <td colspan="3">
                	${rentCar.agent.adminName}
                </td>
            </tr>
        </table>
    </div>
