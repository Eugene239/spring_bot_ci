<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <c:import url="../head.jsp"/>
</head>
<body>
<br>
trackId : ${track.id}
<br>
status : ${track.status}
<br>
parserCode : ${track.parserCode}
<br>
text : ${track.text}
<br>
lastModify : ${track.last_modify}
<br>
lastCheck : ${track.last_check}
<br>
time : ${track.time}


<table>
    <thead>
    <th>id</th>
    </thead>
    <tbody>
    <c:forEach var="user" items="${track.users.values()}">
        <tr>
            <td class="user_ref" onclick="window.location.href='/user/${user}'">${user}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
<c:import url="../bootstrap.jsp"/>
</html>