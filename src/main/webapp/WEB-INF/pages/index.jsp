<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="head.jsp"/>
</head>
<body>

<div class="container">
    <table class="table table-striped table-bordered">
        <thead style="background-color: #1d1e1f; color: white">
        <th>Время</th>
        <th>Номер заказа</th>
        <th width="5%"> Удалить</th>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
</div>
    <br>
    ${size}
    <ul>
    <c:forEach items="${list}" var="item">
        <li>${item.id} ${item.status}</li>
    </c:forEach>
    </ul>
</body>

<c:import url="bootstrap.jsp"/>
</html>
