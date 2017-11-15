<div id="trackGraph" style="height: 300px; width: 45%; display: inline-block"></div>
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
                        dataPoints: []
                    }
                ]
            });
        trackGraph.render();
        uploadTrackGraph();

        function uploadTrackGraph() {
            $.ajax({
                url: window.location.href + "statistic",
                type: 'GET',
                success: function (response) {
                    console.log(response);
                    console.log(trackGraph);
                    var oldTrackCnt;
                    for (var i = 0; i < response.length; i++) {
                        if (oldTrackCnt === undefined) oldTrackCnt = response[i].trackCnt;
                        trackGraph.options.data[0].dataPoints.push({
                            x: new Date(Date.parse(response[i].localDateTime)),
                            y: response[i].trackCnt - oldTrackCnt
                        });
                        oldTrackCnt = response[i].trackCnt;
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