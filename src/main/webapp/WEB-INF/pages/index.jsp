<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="head.jsp"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
</head>
<body>
<div class="container" style="width: 100%;">

    <div class="row">
    <div id="chartContainer" style="height: 300px; width: 45%; display: inline-block"></div>
    <div id="chartTracks" style="height: 300px; width: 45%; display: inline-block;"></div>
    </div>
    <button class="btn btn-danger" onclick="deleteUNUSED()">DELETE UNUSED </button>
    <button class="btn btn-danger" onclick="deleteSIGNIN()">DELETE SIGNIN </button>
    <table id="myTable" class="table table-striped table-bordered">
        <thead style="background-color: #1d1e1f; color: white">
        <th>id</th>
        <th>status</th>
        <th width="20%">text</th>
        <th>last_modify</th>
        <th>time</th>
        <th>users</th>
        <th>delete</th>
        </thead>
        <tbody id="tbody">
        <c:forEach items="${list}" var="item">
            <c:set var="track" value="${item}" scope="request"/>
            <jsp:include page="track/track_list_ui.jsp"/>
        </c:forEach>
        </tbody>
    </table>
</div>
    <table id="kek">

    </table>
<br>
${size}
<ul>

</ul>
</body>

<c:import url="bootstrap.jsp"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="/resources/js/canvasjs.min.js"></script>
<script>
    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer",
            {
                title:{
                    text: "USERS"
                },
                data: [
                    {
                        type: "splineArea",
                        dataPoints: []
                    }
                ]
            });
        var chartTracks = new CanvasJS.Chart("chartTracks",
            {
                title:{
                    text: "Tracks"
                },
                data: [
                    {
                        type: "splineArea",
                        dataPoints: []
                    }
                ]
            });
        chart.render();
        chartTracks.render();
        $.ajax({
            url: window.location.href + "statistic",
            type: 'GET',
            success: function (response) {
                console.log(response);
                for(var i=0; i<response.length;i++){
                    chart.data[0].dataPoints.push({x: new Date(Date.parse(response[i].localDateTime)),y:response[i].userCnt})
                    chartTracks.data[0].dataPoints.push({x: new Date(Date.parse(response[i].localDateTime)),y:response[i].trackCnt})
                }
                chart.render();
                chartTracks.render();
                console.log(chart.data[0].dataPoints);
            },
            error: function (error) {
                console.log(error);
            }
        });
    };
</script>
<script>
    $(document).ready(function () {
        table=  $('#myTable').DataTable();
    });

    function deleteTerm(track_id) {
        $.ajax({
            url: window.location.href + "track?trackId=" + track_id,
            type: 'DELETE',
            success: function (response) {
                location.reload();
                //console.log(response);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    function deleteUNUSED() {
        $.ajax({
            url: window.location.href + "track/deleteUNUSED",
            type: 'DELETE',
            success: function (response) {
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    function deleteSIGNIN() {
        $.ajax({
            url: window.location.href + "track/deleteSIGNIN",
            type: 'DELETE',
            success: function (response) {
                location.reload();
            },
            error: function (error) {
                console.log(error);
            }
        });
    }


</script>

</html>
