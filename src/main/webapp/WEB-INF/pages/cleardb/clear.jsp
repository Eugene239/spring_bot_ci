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
        <div slot="content">
            <md-dialog-alert
                    :md-active.sync="dialog"
                    :md-title="dialogTitle"
                    :md-content="dialogText" >
            </md-dialog-alert>

            <div class="md-layout md-gutter md-alignment-top-center">
                <div class="md-layout-item md-large-size-100 md-medium-size-40  md-small-size-80  md-xsmall-size-100" style="max-width: 500px">
                    <md-card md-with-hover >
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
                                <md-button class="md-raised md-primary" @click="deleteTracksWithStatus()">DELETE
                                </md-button>
                            </md-card-actions>
                            <md-divider></md-divider>
                            <md-card-content>
                                Delete tracks without users
                            </md-card-content>

                            <md-card-actions>
                                <md-button class="md-raised md-primary" @click="deleteUnusedTracks()">DELETE</md-button>
                            </md-card-actions>

                        </md-ripple>
                    </md-card>
                </div>
                <div class="md-layout-item md-large-size-100 md-medium-size-40  md-small-size-80 md-xsmall-size-100" style="max-width: 500px">
                    <md-card md-with-hover >
                        <md-ripple>
                            <md-card-header>
                                <div class="md-title">Users</div>
                                <div class="md-subhead">Delete</div>
                            </md-card-header>
                            <md-divider></md-divider>
                            <md-card-content>
                                Delete users without tracks
                            </md-card-content>
                            <md-card-actions>
                                <md-button class="md-raised md-primary" @click="deleteUselessUsers()"/>
                                DELETE</md-button>
                            </md-card-actions>

                        </md-ripple>
                    </md-card>
                </div>
            </div>

        </div>

    </navbar>
</div>
</body>
<script>
    Vue.use(VueMaterial.default)
    var vue =new Vue({
        el: "#mapp",
        data: () => ({
            menuVisible: false,
            dialog:false,
            dialogTitle:'title',
            dialogText:'texted <b>refe</b>'
        }),
        methods: {
            deleteTracksWithStatus: function () {
                console.log('deleteTracksWithStatus');
                axios.delete('api/tracks/deleteSIGNIN')
                    .then(function (response, ) {
                        vue.dialogTitle='Доставленные товары';
                        vue.dialogText='Удалено: '+response.data;
                        vue.dialog=true;
                        console.log(response);
                    })
                    .catch(function (response) {
                        console.error(response);
                    });
            },
            deleteUnusedTracks: function () {
                console.log('deleteUnusedTracks');
                axios.delete('api/tracks/deleteUNUSED')
                    .then(function (response) {
                        vue.dialogTitle='Треки без пользователей';
                        vue.dialogText='Удалено: '+response.data;
                        vue.dialog=true;
                        console.log(response);
                    })
                    .catch(function (response) {
                        console.error(response);
                    });
            },
            deleteUselessUsers: function () {
                console.log('deleteUselessUsers');
                axios.delete('users/deleteGarbage')
                    .then(function (response) {
                        vue.dialogTitle='Неактивные пользователи';
                        vue.dialogText='Удалено: '+response.data;
                        vue.dialog=true;
                        console.log(response);
                    })
                    .catch(function (response) {
                        console.error(response);
                    });
            }
        }
    });
</script>
</html>
