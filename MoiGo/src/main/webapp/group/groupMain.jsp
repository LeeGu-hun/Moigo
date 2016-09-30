<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<c:if test="${empty authInfo }">
		<div id="content">
			<c:out value="${grpInfo.grpName }" />
			<br>
			<c:out value="${grpInfo.grpLeader }" />
			<br>
			<c:out value="${grpInfo.grpCate }" />
			<br>
			<c:out value="${grpInfo.grpRegDate }" />
			<br>
			<c:out value="${grpInfo.grpIntro }" />
			<br> Please Login First
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="content">
			<c:if test="${joined }">
			true test
		</c:if>
			<c:if test="${!joined }">
			false test
		</c:if>
		</div>
	</c:if>
</body>
</html>