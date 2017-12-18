<template id="graphTemplate">
    <div style="margin: 3rem auto auto">
        <h2 style="text-align: center">{{gr.header}}</h2>
        <div :id="gr.name" style="width: 80%; margin: auto; height: 320px"></div>
    </div>
</template>

<script>
    Vue.component("graph", {
        props: ['gr'],
        data: function () {
            return {
                graph: Object
            }
        },
        mounted: function () {
            this.graph = new CanvasJS.Chart(this.gr.name,
                {
                    axisX: {
                        valueFormatString: "DD/MM"
                    },
                    data: [
                        {
                            type: "splineArea",
                            dataPoints: [],
                            color: this.gr.color,
                        }
                    ]
                });
            this.loadData(this.graph);
            this.graph.render();
        },
        methods: {
            loadData: function (graph) {
                axios.get(this.gr.url)
                    .then(function (response) {
                        response = response.data;
                        console.log(response);
                        var oldTrackCnt;
                        graph.options.data[0].dataPoints = [];
                        for (var i = 0; i < response.length; i++) {
                            if (oldTrackCnt === undefined) oldTrackCnt = response[i].value;
                            if (response[i].value > oldTrackCnt) {
                                graph.options.data[0].dataPoints.push({
                                    x: new Date(Date.parse(response[i].dateTime)),
                                    y: response[i].value - oldTrackCnt
                                });
                            }
                            oldTrackCnt = response[i].value;
                        }
                        graph.render();
                    }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        template: "#graphTemplate"
    });
</script>