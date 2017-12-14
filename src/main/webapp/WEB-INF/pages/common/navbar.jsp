<template id="navbar">
    <el-row type="flex" class="row-bg"
            style="background-color:white; margin-top: 2rem">
        <el-col :span="16" style="margin: auto">
            <el-menu
                    :default-active="activeIndex2"
                    class="el-menu-demo"
                    mode="horizontal"
                    @select="handleSelect"
                    text-color="#000"
                    background-color="white"
                    active-text-color="#5555ff"
            >
                <el-menu-item index="1" style="font-weight: bold">TRACK BOT</el-menu-item>

                <el-menu-item index="5" style="float: right">ADMIN</el-menu-item>
                <el-menu-item index="4" style="float: right">ERRORS</el-menu-item>
                <el-menu-item index="3" style="float: right">TRACKS</el-menu-item>
                <el-menu-item index="2" style="float: right">USERS</el-menu-item>
            </el-menu>
        </el-col>
    </el-row>
    </el-row>
</template>
<script>
    Header = new Vue({
        data() {
            return {
                activeIndex: '1',
                activeIndex2: '1'
            };
        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },

            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            }

        },
        template: "#navbar",
        el: "#navbar"
    })
</script>