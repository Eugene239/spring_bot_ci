<div id="trackGraph" style="width: 100%"></div>
<script>
    var trackGraph = new CanvasJS.Chart("trackGraph",
        {
            title: {
                text: "TRACKS: "+${tracks.size()}
            },
            axisX: {
                valueFormatString: "DD:MM"
            },
            data: [
                {
                    type: "splineArea",
                    dataPoints: [],
//                        markerColor: "red",
                    color: "rgba(14,150,13,.7)"
                }
            ]
        });
    trackGraph.render();
    uploadTrackGraph();

    function uploadTrackGraph() {
        axios.get('statistic/trackcnt')
            .then(function (response) {
                response = response.data;
                console.log(response);
                var oldTrackCnt;
                trackGraph.options.data[0].dataPoints = [];
                for (var i = 0; i < response.length; i++) {
                    if (oldTrackCnt === undefined) oldTrackCnt = response[i].value;
                    trackGraph.options.data[0].dataPoints.push({
                        x: new Date(Date.parse(response[i].dateTime)),
                        y: response[i].value - oldTrackCnt
                    });
                    oldTrackCnt = response[i].value;
                }
                trackGraph.render();
            }).catch(function (error) {
            console.log(error);
        });
    }
</script>