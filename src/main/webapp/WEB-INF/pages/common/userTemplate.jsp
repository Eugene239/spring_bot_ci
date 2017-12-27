<%@ page contentType="text/html; charset=UTF-8" %>
<template id="userTemplate">
    <div>
        <md-dialog :md-active.sync="showDialog" v-if="userInfo!==null">
            <md-dialog-title>Пользователь: {{userInfo.id}}</md-dialog-title>
           <%-- <md-tabs md-dynamic-height >
                <md-tab md-label="Основное">--%>

                    <div class="md-layout-row md-gutter">
                        <div class="md-flex" style="margin: 0px 50px">
                            <md-field>
                                <label for="userId">userID</label>
                                <md-input id="userId" v-model="userInfo.id" disabled></md-input>
                            </md-field>
                            <md-field>
                                <label for="userFio">FIO</label>
                                <md-input id="userFio" v-model="userInfo.fio" disabled></md-input>
                            </md-field>
                            <md-field>
                                <label for="createdTime">Created Time</label>
                                <md-input id="createdTime" v-model="userInfo.createdTime" disabled></md-input>
                            </md-field>
                        </div>
                    </div>
            <%--    </md-tab>--%>

                <%--<md-tab md-label="Activity">--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--</md-tab>--%>

                <%--<md-tab md-label="Account">--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam mollitia dolorum dolores quae commodi impedit possimus qui, atque at voluptates cupiditate. Neque quae culpa suscipit praesentium inventore ducimus ipsa aut.</p>--%>
                <%--</md-tab>--%>
         <%--   </md-tabs>--%>

            <md-dialog-actions>
                <md-button class="md-primary" @click="showDialog = false; userInfo=null">Close</md-button>
              <%--  <md-button class="md-primary" @click="showDialog = false">Save</md-button>--%>
            </md-dialog-actions>
        </md-dialog>
        <span @click="open"> {{userid}}</span>
    </div>
</template>
<script>

    Vue.component("user-list", {
        props: ['userid'],
        template: "#userTemplate",
        data: function () {
            return {
                userInfo: null,
                openInfo: false,
                showDialog: false
            }
        },
        methods: {
            open: function () {
                this.showDialog = !this.showDialog;
                this.openInfo = !this.openInfo;
                if (this.userInfo === null) {
                    axios.get('users/' + this.userid)
                        .then((response) => {
                            console.log(response.data);
                            if (response.data !== null && response.data!=='') {
                                this.userInfo = response.data;
                            }
                        })
                        .catch(function (response) {
                            console.error(response);
                        });
                }
            }
        }
    });
</script>