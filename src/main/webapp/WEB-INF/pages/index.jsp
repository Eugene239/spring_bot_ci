<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="head.jsp"/>
</head>
<body>
<c:import url="bootstrap.jsp"/>
<script src="<c:url value="/resources/js/canvasjs.min.js" />"></script>
<div class="container">
    <div class="row">
        <c:import url="graph/userGraph.jsp"/>
    </div>
    <div class="row">
        <c:import url="graph/trackGraph.jsp"/>
    </div>
    <button class="btn btn-danger" onclick="deleteUNUSED()">DELETE UNUSED </button>
    <button class="btn btn-danger" onclick="deleteSIGNIN()">DELETE SIGNIN </button>
    <button class="btn btn-danger" onclick="deleteGARBAGE()">DELETE GARBAGE </button>
</div>
</body>
<script>
    function deleteGARBAGE() {
        $.ajax({
            url: window.location.href + "users/deleteGarbage",
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