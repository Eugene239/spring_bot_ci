<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login Page</title>
    <c:import url="head.jsp"/>
    <c:import url="navbar.jsp"/>

</head>
<body>
<c:import url="scripts.jsp"/>
<div id="mapp">
    <navbar>
        <div slot="content">
            <md-snackbar md-position="center" md-duration="1500" :md-active.sync="isError" md-persistent
                         style="top:35%">
                <span>Wrong username or password</span>
            </md-snackbar>
                <form class="md-layout-row md-gutter" name="f" action="<c:url value='/j_spring_security_check' />"
                      method='POST'>
                    <md-card style="margin: auto; margin-top: 10% ; max-width: 400px;">
                        <md-card-header>
                            <div class="md-title">LOGIN</div>
                        </md-card-header>
                        <md-card-content>
                            <div class="md-layout-row md-layout-wrap md-gutter">
                                <div class="md-flex md-flex-small-80">
                                    <md-input-container>
                                        <md-field>
                                            <input placeholder="User" :name="usernameval" id="username"
                                                   autocomplete="given-name"
                                                   class="md-input" style="font-size: 16px"/>
                                        </md-field>
                                        <md-field>
                                            <input type="password" id="password" autocomplete="given-name"
                                                   name="password"
                                                   placeholder="Password" class="md-input" style="font-size: 16px"/>
                                        </md-field>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </md-input-container>
                                    <md-card-actions>
                                        <md-button type="submit" class="md-raised md-primary">SUBMIT</md-button>
                                    </md-card-actions>
                                </div>
                            </div>
                        </md-card-content>
                    </md-card>
                </form>
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
            isError: false,
            usernameval: "username"
        }),
        mounted: function () {
            this.isError = $_GET('error')
        },
    });
</script>
</html>