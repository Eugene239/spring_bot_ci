<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="head.jsp"/>
</head>
<body>

<div class="container" style="width: 100%;">
    <table class="table table-striped table-bordered">
        <thead style="background-color: #1d1e1f; color: white">
        <th>id</th>
        <th>status</th>
        <th width="20%">text</th>
        <th>last_modify</th>
        <th>time</th>
        <th>users</th>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${list}" var="item">
            <c:set var="track" value="${item}" scope="request"/>
            <jsp:include page="track/track_list_ui.jsp"/>
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
