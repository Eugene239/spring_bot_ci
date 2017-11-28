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
    <script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
</head>
<body>
<c:import url="./common/navbar.jsp"/>
    <div class="container" style="margin: auto; margin-top: 3rem">
        <div class="container" style="height: 400px; width: 100%; margin: auto">
            <c:import url="graph/userGraph.jsp"/>
        </div>
        <div class="container" style="height: 400px; width: 100%; margin: auto">
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