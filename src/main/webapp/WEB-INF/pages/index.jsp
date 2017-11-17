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
<body style="width: 80%; margin: auto">
<div class="pure-menu pure-menu-horizontal colored" style="margin-top: 2rem; height: fit-content; ">
    <ul class="pure-menu-list">
        <li class="pure-menu-item pure-menu-selected"><a href="<c:url value="/" />" class="pure-menu-link">Home</a></li>
        <%--<li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">--%>
            <%--<a href="" id="menuLink1" class="pure-menu-link">Contact</a>--%>
            <%--<ul class="pure-menu-children">--%>
                <%--<li class="pure-menu-item"><a href="#" class="pure-menu-link">Email</a></li>--%>
                <%--<li class="pure-menu-item"><a href="#" class="pure-menu-link">Twitter</a></li>--%>
                <%--<li class="pure-menu-item"><a href="#" class="pure-menu-link">Tumblr Blog</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    </ul>
</div>
<script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
<div class="container" style="margin: auto">
    <div class="row" style="margin: 2rem;display: block">
        <h3 style="text-align: center">User cnt: ${users.size()}</h3>
        <div style="display: flex">
            <div style="width: 45%; display: inline-block; float: right">
                <c:import url="graph/userGraph.jsp"/>
            </div>
            <div style="display: inline-block; margin: auto">
                <ul>
                    <c:forEach var="topUser" items="${users.top}">
                        <li style="padding: 10px">${topUser.FIO} ${topUser.trackList.size()}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="row" style="margin: 2rem; text-align: center">
        <h3 style="text-align: center">Track cnt: ${tracks.size()}</h3>
        <c:import url="graph/trackGraph.jsp"/>
    </div>
    <%--<div class="row">--%>
    <%--<c:import url="graph/trackGraph.jsp"/>--%>
    <%--</div>--%>
    <%--<button class="btn btn-danger" onclick="deleteUNUSED()">DELETE UNUSED</button>--%>
    <%--<button class="btn btn-danger" onclick="deleteSIGNIN()">DELETE SIGNIN</button>--%>
    <%--<button class="btn btn-danger" onclick="deleteGARBAGE()">DELETE GARBAGE</button>--%>
</div>
</body>
<script>
    function deleteGARBAGE() {
        $.ajax({
            url: window.location.href + "users/deleteGarbage",
            type: 'DELETE',
            success: function (response) {
                location.reload();
                //console.log(response);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    function deleteUNUSED() {
        $.ajax({
            url: window.location.href + "track/deleteUNUSED",
            type: 'DELETE',
            success: function (response) {
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    function deleteSIGNIN() {
        $.ajax({
            url: window.location.href + "track/deleteSIGNIN",
            type: 'DELETE',
            success: function (response) {
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
</html>