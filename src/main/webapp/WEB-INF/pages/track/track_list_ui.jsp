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
    <td>
        <button onclick="deleteTerm('${track.id}')"
                class="btn btn-danger" style="margin: auto; display: table; cursor: pointer">X
        </button>
    </td>
</tr>
