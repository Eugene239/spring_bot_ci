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
    <c:import url="scripts.jsp"/>
    <script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
</head>
<body>
<div id="app">
    <b-navbar toggleable="md" type="dark" style="background-color: #49525e" sticky="true">
        <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
        <b-navbar-brand href="/"
                        style="color: white; text-shadow: 1px 2px 0px black, 0 0 2em #000; padding-top: 0; padding-left: 20%">
            TrackBot: ${version}
        </b-navbar-brand>
        <b-collapse is-nav id="nav_collapse" style="padding-right: 250px">
            <%--<b-navbar-nav>--%>
                <%--<b-nav-item href="#">USERS</b-nav-item>--%>
                <%--<b-nav-item href="#">TRACKS</b-nav-item>--%>
            <%--</b-navbar-nav>--%>
            <!-- Right aligned nav items -->
            <b-navbar-nav class="ml-auto">
                <b-nav-item href="#">USERS</b-nav-item>
                <b-nav-item href="#">TRACKS</b-nav-item>
                <%--<b-nav-item-dropdown text="Lang" right>--%>
                    <%--<b-dropdown-item href="#">EN</b-dropdown-item>--%>
                    <%--<b-dropdown-item href="#">ES</b-dropdown-item>--%>
                    <%--<b-dropdown-item href="#">RU</b-dropdown-item>--%>
                    <%--<b-dropdown-item href="#">FA</b-dropdown-item>--%>
                <%--</b-nav-item-dropdown>--%>
                <%--<b-nav-item-dropdown left &lt;%&ndash;style="padding-right: 250px"&ndash;%&gt;>--%>
                    <%--<!-- Using button-content slot -->--%>
                    <%--<template slot="button-content">--%>
                        <%--<em>User</em>--%>
                    <%--</template>--%>
                    <%--<b-dropdown-item href="#">Profile</b-dropdown-item>--%>
                    <%--<b-dropdown-item href="#">Signout</b-dropdown-item>--%>
                <%--</b-nav-item-dropdown>--%>
            </b-navbar-nav>
        </b-collapse>
    </b-navbar>
</div>
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
    Header = new Vue({
        el: '#app'
    });
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