<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <c:import url="../common/scripts.jsp"/>
    <c:import url="../common/navbar.jsp"/>
</head>
<body>
<div id="mapp">
    <navbar>
        <div slot="content" style="margin: auto">
            <div style="margin-top:3rem ">
                <md-card md-with-hover>
                    <md-ripple>
                        <md-card-header>
                            <div class="md-title">Tracks</div>
                            <div class="md-subhead">Delete unused tracks</div>
                        </md-card-header>
                        <md-divider></md-divider>
                        <md-card-content>
                           Delete tracks with status:
                            <ul>
                                <li>SIGNIN</li>
                                <li>SIGNIN_EXC</li>
                            </ul>
                        </md-card-content>
                        <md-card-actions>
                            <md-button class="md-raised md-primary">DELETE</md-button>
                        </md-card-actions>
                        <md-divider></md-divider>
                        <md-card-content >
                            Delete tracks without users
                        </md-card-content>

                        <md-card-actions>
                            <md-button class="md-raised md-primary">DELETE</md-button>
                        </md-card-actions>

                    </md-ripple>
                </md-card>
            </div>
        </div>
    </navbar>
</div>
</body>
<script>
    Vue.use(VueMaterial.default)
    new Vue({
        el: "#mapp",
        data: () => ({
            menuVisible: false,
        }),
    });
</script>
</html>
