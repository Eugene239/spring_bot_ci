<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:message code="bot_version" var="version" text="none" scope="application"/>
<title>Bot ui ${version}</title>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>

<link type="text/css" rel="stylesheet" href="//unpkg.com/bootstrap@next/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="//unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>

<script src="//unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="//unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>


<meta  charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
<script src="<c:url value="/webjars/axios/0.17.0/dist/axios.min.js"/>"></script>
<script src="<c:url value="/webjars/vue/2.5.8/dist/vue.min.js"/>"></script>