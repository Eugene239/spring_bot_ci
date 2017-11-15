<div id="userGraph" style="height: 300px; width: 45%; display: inline-block"></div>
<script>
    $(document).ready(function () {
        var userGraph = new CanvasJS.Chart("userGraph",
            {
                title: {
                    text: "USERS"
                },
                data: [
                    {
                        type: "splineArea",
                        dataPoints: []
                    }
                ]
            });
        userGraph.render();
        uploadUserGraph();
        function uploadUserGraph() {
            $.ajax({
                url: window.location.href + "statistic",
                type: 'GET',
                success: function (response) {
                    console.log(response);
                  //  console.log(chart);
                    var oldUserCnt;
                    for (var i = 0; i < response.length; i++) {
                        if (oldUserCnt===undefined) oldUserCnt=response[i].userCnt;
                        userGraph.options.data[0].dataPoints.push({
                            x: new Date(Date.parse(response[i].localDateTime)),
                            y: response[i].userCnt - oldUserCnt
                        });
                        oldUserCnt= response[i].userCnt;
                    }
                    userGraph.render();
                  //  console.log(chart.data[0].dataPoints);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    });
</script>