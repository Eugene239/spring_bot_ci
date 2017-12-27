<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:import url="common/head.jsp"/>
    <c:import url="common/scripts.jsp"/>
    <c:import url="common/navbar.jsp"/>
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0"/>
</head>
<body>
<div id="mapp">
    <navbar>
        <div slot="content">
            <md-table v-model="searched" md-sort="name" md-sort-order="asc" md-card md-fixed-header style="height: 85%">
                <md-table-toolbar>
                    <div class="md-toolbar-section-start">
                        <h1 class="md-title">Tracks</h1>
                    </div>
                    <md-field md-clearable class="md-toolbar-section-end" style="max-width: 200px">
                        <md-input  placeholder="Search..." v-model="search" @input="searchOnTable" />
                    </md-field>
                </md-table-toolbar>

                <md-table-empty-state v-if="!loaded" md-label="Loading">
                    <md-progress-spinner v-if="!loaded" :md-diameter="150" :md-stroke="8" md-mode="indeterminate" style="margin: 1rem"/>
                </md-table-empty-state>

                <md-table-empty-state v-if="loaded" md-label="NO DATA">
                </md-table-empty-state>

                <md-table-row slot="md-table-row" slot-scope="{ item }">
                    <md-table-cell md-label="ID" md-sort-by="id" md-numeric>{{ item.id }}</md-table-cell>
                    <md-table-cell md-label="STATUS" md-sort-by="status">{{ item.status }}</md-table-cell>
                    <md-table-cell md-label="TEXT" md-sort-by="text">{{ item.text }}</md-table-cell>
                    <md-table-cell md-label="TIME" md-sort-by="time">{{ item.time }}</md-table-cell>
                    <md-table-cell md-label="USERS" md-sort-by="users" >
                        <div v-for="user in item.users">
                            {{user}}
                        </div>
                    </md-table-cell>
                </md-table-row>
            </md-table>
        </div>
    </navbar>
</div>
</body>
<script>
    Vue.use(VueMaterial.default)
    var vue = new Vue({
        el: "#mapp",
        data: () => ({
            search: '',
            searched: [],
            menuVisible: false,
            loaded: false,
            tracks: [],
        }),
        methods: {
            searchOnTable() {
                //console.log(this.search);
               if (this.search==='') this.searched=this.tracks;
               this.searched=this.tracks.filter(function (track) {
                    if (track===null|| track.id === null || track.status === null || track.text === null || track.users===null)
                        return false;
                    return this.search === ''
                        || track.id.toString().toLowerCase().indexOf(this.search.toLowerCase()) !== -1
                        || track.status.toString().toLowerCase().indexOf(this.search.toLowerCase()) !== -1
                        || track.text.toString().toLowerCase().indexOf(this.search.toLowerCase()) !== -1
                        || track.time.toString().toLowerCase().indexOf(this.search.toLowerCase()) !== -1
                        || JSON.stringify(track.users).toLowerCase().indexOf(this.search.toLowerCase()) !== -1
                }, this);
             //   console.log(this.search);
//                this.searched = function () {
//                    console.log(vue.tracks);
//                    return vue.tracks;
//                };
            }
        },
        mounted: function () {
            axios.get('api/tracks')
                .then(function (response) {
                    vue.tracks = response.data;
                    vue.searched = response.data;
                    vue.loaded = true;
                    console.log(response.data);
                })
                .catch(function (response) {
                    console.error(response);
                });
        }
    });

</script>
</html>