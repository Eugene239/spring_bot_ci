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
</head>
<body>
<main-app></main-app>
<script>
    var graphs = [
        {name: "users", header: "Users: "+${users.size()}, url:'statistic/usercnt', color:'rgba(14,15,153,.7)'},
        {name: "tracks", header: "Tracks: "+${tracks.size()}, url:'statistic/trackcnt', color:'rgba(14,150,13,.7)'}
    ];
</script>
<c:import url="graph/graphTemplate.jsp"/>
<template id="main-app">
    <div class="page-container">
        <md-app  md-mode="flexible">
            <md-app-toolbar class="md-large md-primary " >

                <div class="md-toolbar-row">
                    <div class="md-toolbar-section-start">
                        <md-button class="md-icon-button" @click="menuVisible = !menuVisible">
                            <md-icon>menu</md-icon>
                        </md-button>
                    </div>

                    <div class="md-toolbar-section-end">
                        <md-button class="md-icon-button">
                            <md-icon>more_vert</md-icon>
                        </md-button>
                    </div>
                </div>

                <div class="md-toolbar-row md-toolbar-offset">
                    <span class="md-display-1">TrackBot ${version}</span>
                </div>
            </md-app-toolbar>

            <md-app-drawer :md-active.sync="menuVisible">
                <md-toolbar class="md-transparent" md-elevation="0">Navigation</md-toolbar>

                <md-list style="height: max-content">
                    <md-list-item>
                        <md-icon>move_to_inbox</md-icon>
                        <span class="md-list-item-text">Inbox</span>
                    </md-list-item>

                    <md-list-item>
                        <md-icon>send</md-icon>
                        <span class="md-list-item-text">Sent Mail</span>
                    </md-list-item>

                    <md-list-item>
                        <md-icon>delete</md-icon>
                        <span class="md-list-item-text">Trash</span>
                    </md-list-item>

                    <md-list-item>
                        <md-icon>error</md-icon>
                        <span class="md-list-item-text">Spam</span>
                    </md-list-item>
                </md-list>
            </md-app-drawer>

            <md-app-content style="height: auto">
                <div style="margin: auto" v-for="graph in graphsData">
                    <graph :gr="graph"></graph>
                </div>
            </md-app-content>
        </md-app>
    </div>
</template>


<script>

    Vue.use(VueMaterial.default)
    Main = new Vue({
        name: 'Reveal',
        el: "#main-app",
        template: "#main-app",
        data: () => ({
            menuVisible: false,
            graphsData: graphs
        })

    });

</script>
</body>
</html>