<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>okauto-barrier</title>
</head>
<body>
<ul>
<c:forEach items="${list}" var="item">
    <li>${item}</li>
</c:forEach>
</ul>
</body>
</html>
