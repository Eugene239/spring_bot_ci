<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:message code="bot_version" var="version" text="none" scope="application"/>
<title>Bot ui ${version}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico"/> " type="image/x-icon">
<!-- bootstrap vue css-->
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap@next/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>

<meta  charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
<script src="<c:url value="/webjars/axios/0.17.0/dist/axios.min.js"/>"></script>