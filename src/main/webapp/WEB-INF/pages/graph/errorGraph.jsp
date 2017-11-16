<div id="errorGraph" style="height: 300px; width: 45%; display: inline-block"></div>
<script>
    $(document).ready(function () {
        var errorGraph = new CanvasJS.Chart("trackGraph",
            {
                title: {
                    text: "ERROR_MESSAGES"
                },
                data: [
                    {
                        type: "splineArea",
                        dataPoints: []
                    }
                ]
            });
        errorGraph.render();
        uploadErrorGraph();

        function uploadErrorGraph() {
            $.ajax({
                url: window.location.href + "statistic",
                type: 'GET',
                success: function (response) {
                    console.log(response);
                    console.log(errorGraph);
                    var oldErrorCnt;
                    for (var i = 0; i < response.length; i++) {
                        if (oldErrorCnt === undefined) oldErrorCnt = response[i].errorCnt;
                        errorGraph.options.data[0].dataPoints.push({
                            x: new Date(Date.parse(response[i].localDateTime)),
                            y: response[i].errorCnt - oldErrorCnt
                        });
                        oldErrorCnt = response[i].errorCnt;
                    }
                    errorGraph.render();
                    //  console.log(chart.data[0].dataPoints);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    });
</script>