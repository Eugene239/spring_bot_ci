<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr>
    <td class="user_ref" onclick="window.location.href='/user/${user.id}'">${user.id}</td>
    <td>${user.first_name}</td>
    <td>${user.last_name}</td>
    <td>${user.active}</td>
    <td>${user.createdTime}</td>
    <td>
        <ul>
            <c:forEach items="${user.trackList.values()}" var="entry">
                <li class="track_ref" onclick="window.location.href='/track/${entry.trackId}'">${entry.trackId} ${entry.name}</li>
            </c:forEach>
        </ul>
    </td>
</tr>