<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<spring:eval var="version" expression="@environment.getProperty('bot_version')" scope="request"/>
<title>Bot ui ${version}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/resources/images/favicon.ico"/> " type="image/x-icon">
<meta  charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
<script src="<c:url value="/webjars/axios/0.17.0/dist/axios.min.js"/>"></script>
<script src="<c:url value="webjars/vue/2.5.8/dist/vue.min.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/lib/element.css" />">
<link rel="stylesheet" href="<c:url value="/resources/lib/element-theme.css" />">
<script src="<c:url value="/resources/lib/element.js"/>"></script>
<script src="<c:url value="/resources/js/canvasjs.min.js"/>"></script>