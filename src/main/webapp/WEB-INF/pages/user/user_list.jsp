<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="../head.jsp"/>
</head>
<body>
<div class="container" style="width: 100%;">
    <table class="table table-striped table-bordered">
        <thead style="background-color: #1d1e1f; color: white">
        <th>id</th>
        <th>first_name</th>
        <th >last_name</th>
        <th>createdTime</th>
        <th>active</th>
        <th>tracks</th>
        </thead>
        <tbody id="tbody">
        <c:forEach var="item" items="${userList}">
            <c:set var="user" value="${item}" scope="request"/>
            <jsp:include page="user_item_list.jsp"/>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
<c:import url="../bootstrap.jsp"/>
</html>