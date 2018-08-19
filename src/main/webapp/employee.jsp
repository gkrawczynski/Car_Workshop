<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: staszek
  Date: 14.08.18
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="WEB-INF/fragments/header.jsp"/>
<form action="" method="post">
    <fieldset>
        <legend>
            Wyszukiwanie pracownika po nazwisku:
        </legend>
        <input type="text" name="find" required>
        <input type="submit" value="Szukaj">
    </fieldset>
</form>
<p style="color:red">${findInfo}</p>
<h2>Lista pracowników<c:if test="${!empty chosedEmployee}"> [szukaj: '${chosedEmployee}']</c:if></h2>

<table border="1">
    <tr>
        <th>id</th>
        <th>imię</th>
        <th>nazwisko</th>
        <th>adres</th>
        <th>nr tel.</th>
        <th>note</th>
        <th>stawka</th>
        <th>zlecenia</th>
        <th>edytuj</th>
        <th>usuń</th>
    </tr>
    <c:forEach var="element" items="${employeeList}">
        <tr>
            <td>${element.id}</td>
            <td>${element.firstName}</td>
            <td>${element.lastName}</td>
            <td>${element.address}</td>
            <td>${element.phone}</td>
            <td>${element.note}</td>
            <td>${element.hourly_rate}</td>
            <td><a href="/orders/employee?id=${element.id}">Sprawdź zlecenia</a> </td>
            <td><a href="/EmployeeUpdate?id=${element.id}">edytuj</a></td>
            <td><a href="/EmployeeDelete?id=${element.id}">usuń</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/employeeAdd.jsp">dodaj</a>

<jsp:include page="WEB-INF/fragments/footer.jsp"/>