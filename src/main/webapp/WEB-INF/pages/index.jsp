<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>spring_bot</title>
</head>
<body>
    <c:import url="head.jsp"/>
    <br>
    ${size}
    <ul>
    <c:forEach items="${list}" var="item">
        <li>${item.id} ${item.status}</li>
    </c:forEach>
    </ul>
</body>
</html>
