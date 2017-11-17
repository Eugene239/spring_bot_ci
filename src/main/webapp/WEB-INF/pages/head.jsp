<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:message code="bot_version" var="version" text="none" scope="application"/>
<title>Bot ui ${version}</title>
<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--<link rel="stylesheet" href="resources/css/bootstrap.min.css">--%>
<link rel="stylesheet" href="<c:url value="resources/css/styles.css" />">
<script src="resources/js/jquery-3.1.1.slim.min.js"></script>
<meta  charset="UTF-8">