<div id="trackGraph" style="margin: auto; width: 65%"></div>
<script>
    $(document).ready(function () {
        var trackGraph = new CanvasJS.Chart("trackGraph",
            {
                title: {
                    text: "TRACKS"
                },
                data: [
                    {
                        type: "splineArea",
                        dataPoints: [],
                        markerColor:"red",
                        color: "rgba(14,150,13,.7)"
                    }
                ]
            });
        trackGraph.render();
        uploadTrackGraph();

        function uploadTrackGraph() {
            $.ajax({
                url: window.location.href + "statistic/TRACKCNT",
                type: 'GET',
                success: function (response) {
                   // console.log(response);
                    //console.log(trackGraph);
                    var oldTrackCnt;
                    for (var i = 0; i < response.length; i++) {
                        if (oldTrackCnt === undefined) oldTrackCnt = response[i].value;
                        trackGraph.options.data[0].dataPoints.push({
                            x: new Date(Date.parse(response[i].dateTime)),
                            y: response[i].value - oldTrackCnt
                        });
                        oldTrackCnt = response[i].value;
                    }
                    trackGraph.render();
                    //  console.log(chart.data[0].dataPoints);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    });
</script>