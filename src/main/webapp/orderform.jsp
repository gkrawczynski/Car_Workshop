<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<fmt:setLocale value="en_US"/>
<fmt:formatNumber type="number" groupingUsed = "false" minFractionDigits="2" maxFractionDigits="2" value="${order.repairCost}" var="repairCost" />
<fmt:setLocale value="${user.locale}"/>
<%--
  Created by IntelliJ IDEA.
  User: kamil
  Date: 15.08.18
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="WEB-INF/fragments/header.jsp"/>
<p>
    <ul style="color:red">
        <c:forEach items="${formInfo}" var="info">
            <li>${info}</li>
        </c:forEach>
    </ul>
</p>
<form id="order-editing" action='' method='post'>
    Id Zlecenia:
    <input name="orderId" type='number' value='${order.id}' readonly><br>
    Pojazd:
    <select name='vehicle' id="vehicle">
        <c:forEach items="${vehicles}" var="vehicle">
            <option <c:if test="${order.vehicle.id == vehicle.id}">selected</c:if> value="${vehicle.id}">
                    ${vehicle.model} ${vehicle.make} ${vehicle.registration}
            </option>
        </c:forEach>
    </select><br>
    Właściciel pojazdu:
    <input type='text' id='vehicleOwner' readonly  value='${order.vehicle.client.firstName} ${order.vehicle.client.lastName}'><br>
    Data przyjęcia do naprawy:
    <input type='date' name='serviceAccept' value='${order.serviceAccept}' required><br>
    Planowana data rozpoczęcia naprawy:
    <input type='date' name='servicePlan' value='${order.servicePlan}'><br>
    Data rozpoczęcia naprawy:
    <input type='date' name='serviceStart' value='${order.serviceStart}'><br>
    Pracownik:
    <select name='employee' id="employee" class="costs-counting">
        <c:forEach items="${employees}" var="employee">
            <option <c:if test="${order.employee.id == employee.id}">selected</c:if> value="${employee.id}" data-hourly-rate="${employee.hourly_rate}">
                    ${employee.firstName} ${employee.lastName} (stawka: ${employee.hourly_rate} zł/h)
            </option>
        </c:forEach>
    </select><br>
    Opis problemu:
    <input type='text' name='issueDesc' value='${order.issueDesc}' required><br>
    Opis naprawy:
    <input type='text' name='repairDesc' value='${order.repairDesc}'><br>
    Koszty wykorzystanych części:
    <input type='number' step="0.01" name='partsCost' min="0" max="99999.99" value='${order.partsCost}' id="parts-cost" class="costs-counting"><br>
    Koszt roboczogodziny:
    <input type='number' id="hourly-rate" readonly value='${order.hourlyRate}' class="costs-counting"><br>
    Ilość roboczogodzin:
    <input type='number' step="1" min="0" name="manHours" value='${order.manHours}' id ="man-hours" class="costs-counting"><br>
    Status:
    <select name='status'>
        <c:forEach items="${statuses}" var="status">
            <option <c:if test="${order.status.id == status.id}">selected</c:if> value="${status.id}">
                ${status.name}
            </option>
        </c:forEach>
    </select><br>
    Całkowity koszt:
    <input type='number' step="0.01" readonly id="total-cost" max="99999.99"
           value='<c:if test="${order.repairCost != 0}">${repairCost}</c:if>'><br>
    <input type='submit' value='zapisz'>
</form>
<jsp:include page="WEB-INF/fragments/footer.jsp"/>