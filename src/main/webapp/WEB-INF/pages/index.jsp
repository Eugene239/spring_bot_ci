<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
<%@ page import="ru.epavlov.rest.TrackRest" %>
<%@ page import="ru.epavlov.rest.UserRest" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ApplicationContext context = RequestContextUtils.getWebApplicationContext(request);
    UserRest users = (UserRest) context.getBean("userRest");
    session.setAttribute("users", users);
    TrackRest tracks = (TrackRest) context.getBean("trackRest");
    session.setAttribute("tracks", tracks);
%>
<html>
<head>
    <c:import url="./common/head.jsp"/>
    <c:import url="./common/scripts.jsp"/>
    <%--<script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>--%>
</head>
<body style="margin: 0">
<c:import url="./common/navbar.jsp"/>
<navbar></navbar>
<div style="height: 100%">
    <div class="el-col el-col-14" style="margin: auto; float: none">
        <c:import url="graph/userGraph.jsp"/>
        <c:import url="graph/trackGraph.jsp"/>
    </div>
</div>
</body>
</html>