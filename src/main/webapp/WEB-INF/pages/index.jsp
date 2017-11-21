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
    <c:import url="head.jsp"/>
</head>
<header class="masthead">
    <h3 class="text-muted">Track bot ${version}</h3>
    <nav class="navbar navbar-expand-md navbar-light bg-light rounded mb-3 colored">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav text-md-center nav-justified w-100">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Downloads</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<body style="width: 80%; margin: auto">
<script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
<div class="container" style="margin: auto">
    <div class="container" style="height: 400px; width: 100%">
        <c:import url="graph/userGraph.jsp"/>
    </div>
    <div class="container" style="height: 400px; width: 100%">
        <c:import url="graph/trackGraph.jsp"/>
    </div>
</div>
</body>
<script>
    //    function deleteGARBAGE() {
    //        $.ajax({
    //            url: window.location.href + "users/deleteGarbage",
    //            type: 'DELETE',
    //            success: function (response) {
    //                location.reload();
    //                //console.log(response);
    //            },
    //            error: function (error) {
    //                console.log(error);
    //            }
    //        });
    //    }
    //    function deleteUNUSED() {
    //        $.ajax({
    //            url: window.location.href + "track/deleteUNUSED",
    //            type: 'DELETE',
    //            success: function (response) {
    //                location.reload();
    //            },
    //            error: function (error) {
    //                console.log(error);
    //            }
    //        });
    //    }
    //    function deleteSIGNIN() {
    //        $.ajax({
    //            url: window.location.href + "track/deleteSIGNIN",
    //            type: 'DELETE',
    //            success: function (response) {
    //                location.reload();
    //            },
    //            error: function (error) {
    //                console.log(error);
    //            }
    //        });
    //    }
</script>
</html>