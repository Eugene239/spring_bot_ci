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
        <th>id</th>
        <th>status</th>
        <th>text</th>
        <th>last_modify</th>
        <th>time</th>
        <th>users</th>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${list}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.status}</td>
                <td>${item.text}</td>
                <td width="15%">${item.last_modify}</td>
                <td width="15%">${item.time}</td>
                <td>
                    <ul>
                        <c:forEach items="${item.users.values()}" var="entry">
                            <li>${entry}</li>
                        </c:forEach>
                    </ul>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<br>
${size}
<ul>

</ul>
</body>

<c:import url="bootstrap.jsp"/>
</html>
