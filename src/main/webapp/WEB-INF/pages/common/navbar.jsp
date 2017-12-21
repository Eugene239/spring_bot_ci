<template id="navbarTemplate">
    <div class="page-container">
        <md-app md-mode="flexible">
            <md-app-toolbar class="md-large md-primary">

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
                <md-toolbar class="md-inset" md-elevation="0"><h3 style="margin: 1rem">TrackBot ${version}</h3></md-toolbar>

                <md-list style="height: max-content" >
                    <md-list-item onclick="window.location.href='/'">
                        <md-icon>home</md-icon>
                        <span class="md-list-item-text">Main</span>
                    </md-list-item>

                    <md-list-item onclick="window.location.href='/tracks'">
                        <md-icon>flight_takeoff</md-icon>
                        <span class="md-list-item-text">Tracks</span>
                    </md-list-item>

                    <md-list-item onclick="window.location.href='/clearDB'">
                        <md-icon>delete</md-icon>
                        <span class="md-list-item-text">Clear DB</span>
                    </md-list-item>
                </md-list>
            </md-app-drawer>

            <md-app-content style="height: auto">
                <slot name="content">
                    <h2 style="margin: auto; text-align: center">No content</h2>
                </slot>
            </md-app-content>
        </md-app>
    </div>
</template>
<script>

    Vue.component("navbar", {
        template: "#navbarTemplate",
        data: function () {
            return {
                menuVisible: false,
            }
        }
    });

</script>