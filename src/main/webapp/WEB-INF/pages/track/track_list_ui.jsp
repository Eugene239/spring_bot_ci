<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr>
    <td>${track.id}</td>
    <td>${track.status}</td>
    <td>${track.text}</td>
    <td>${track.last_modify}</td>
    <td>${track.time}</td>
    <td>
        <ul>
            <c:forEach items="${track.users.values()}" var="entry">
                <li class="user_ref" onclick="window.location.href='/user/${entry}'">${entry}</li>
            </c:forEach>
        </ul>
    </td>
</tr>

<%--<div class="container" style="width: 100%;height: 90px;  border: solid #000000 2px; vertical-align: middle">--%>
<%--<div class="track_list" >${track.id}</div>--%>
<%--<div class="track_list" style="width: 20%">${track.status}</div>--%>
<%--<div class="track_list">${track.text}</div>--%>
<%--<div class="track_list" style="width: 15%;">${track.last_modify}</div>--%>
<%--<div class="track_list" style="width: 15%">${track.time}</div>--%>
<%--</div>--%>