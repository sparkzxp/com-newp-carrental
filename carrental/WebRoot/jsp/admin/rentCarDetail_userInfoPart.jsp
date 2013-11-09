<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <div class="content">
        <table width="99%" border="1px" cellpadding="0" cellspacing="0" class="table">
            <tr>
                <td width="20%" align="right" height="25px">创建人：</td>
                <td width="30%">
                	${rentCar.createdUser.adminName}
                </td>
                <td width="20%" align="right" height="25px">创建时间：</td>
                <td width="30%">
                	<fmt:formatDate value="${rentCar.createdDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
            <tr>
                <td align="right" height="25px">修改人：</td>
                <td>
                	${rentCar.updatedUser.adminName}
                </td>
                <td align="right" height="25px">修改时间：</td>
                <td>
                	<fmt:formatDate value="${rentCar.updatedDt}" type="both" pattern="yyyy-MM-dd HH:mm"/>
                </td>
            </tr>
        </table>
    </div>
