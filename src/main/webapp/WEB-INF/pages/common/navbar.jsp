<div id="header">
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
<script>
    Header = new Vue({
        el: '#header'
    });
</script>