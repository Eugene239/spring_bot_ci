<div id="userGraph" style=""></div>
<script>
    var userGraph = new CanvasJS.Chart("userGraph",
        {
            title: {
                text: "USERS: " +${users.size()}
            },
            data: [
                {
                    type: "splineArea",
                    dataPoints: [],
                    markerColor: "red",
                    color: "rgba(0,15,173,.7)"
                }
            ]
        });
    userGraph.render();
    uploadUserGraph();
    function uploadUserGraph() {
        userGraph.creditText='';
        console.log(userGraph);
        axios.get('statistic/usercnt')
            .then(function (response) {
                response = response.data;
                var oldUserCnt;
                userGraph.options.data[0].dataPoints = [];
                for (var i = 0; i < response.length; i++) {
                    if (oldUserCnt === undefined) oldUserCnt = response[i].value;
                    userGraph.options.data[0].dataPoints.push({
                        x: new Date(Date.parse(response[i].dateTime)),
                        y: response[i].value - oldUserCnt
                    });
                    oldUserCnt = response[i].value;
                }
                userGraph.render();
            })
            .catch(function (error) {
                console.log(error);
            });
    }
</script>