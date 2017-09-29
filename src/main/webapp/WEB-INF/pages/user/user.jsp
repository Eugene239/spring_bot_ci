<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="../head.jsp"/>
</head>
<body>
<br>
userId : ${user.id}
<br>
lastName : ${user.last_name}
<br>
firstName :${user.first_name}
<br>
createdTime : ${user.createdTime}
<br>
lastMessageTime : ${user.lastMessageTime}
<br>
active : ${user.active}

<h3>TrackList</h3>
<table>
    <thead>
    <th>id</th>
    <th>name</th>
    <th>createdTime</th>
    </thead>
    <tbody>
    <c:forEach var="userTrack" items="${user.trackList.values()}">
        <tr>
            <td class="track_ref" onclick="window.location.href='/track/${userTrack.trackId}'"> ${userTrack.trackId}</td>
            <td>${userTrack.name}</td>
            <td> ${userTrack.createdTime}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
<c:import url="../bootstrap.jsp"/>
</html>