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
    <c:import url="graph/graphTemplate.jsp"/>
    <c:import url="common/navbar.jsp"/>
</head>
<body>
<div id="mapp">
    <navbar>
        <div slot="content" style="margin: auto" v-for="graph in graphsData">
            <graph :gr="graph"></graph>
        </div>
    </navbar>
</div>

<script>
    var graphs = [
        {name: "users", header: "Users: " +${users.size()}, url: 'statistic/usercnt', color: 'rgba(14,15,153,.7)'},
        {name: "tracks", header: "Tracks: " +${tracks.size()}, url: 'statistic/trackcnt', color: 'rgba(14,150,13,.7)'}
    ];

    Vue.use(VueMaterial.default)
    new Vue({
        el: "#mapp",
        data: () => ({
            menuVisible: false,
            graphsData: graphs
        }),
    });
</script>

</body>
</html>