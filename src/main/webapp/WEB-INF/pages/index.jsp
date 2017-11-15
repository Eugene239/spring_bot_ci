<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="head.jsp"/>
</head>
<body>
<c:import url="bootstrap.jsp"/>
<script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
<div class="container">
    <div class="row">
        <c:import url="graph/userGraph.jsp"/>
    </div>
    <div class="row">
        <c:import url="graph/trackGraph.jsp"/>
    </div>
</div>
</body>
</html>