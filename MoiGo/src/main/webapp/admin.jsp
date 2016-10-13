<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<%@include file="/include/header.jsp"%>
<%@include file="/include/loginBox2.jsp" %>
<div id="content">
	<c:if test="${empty authInfo }">
		관리자가 아닙니다.
	</c:if>
	<c:if test="${!empty authInfo }">
		<c:if test="${authInfo.userID!='admin' }">
			관리자가 아닙니다.
		</c:if>
		<c:if test="${authInfo.userID=='admin' }">
			<form>
				<input type="text">
				<select>
					<option value="userInfo">회원</option>
					<option value="groupInfo">모임</option>
					<option value="market">장터</option>
				</select>
			</form>
		</c:if>
	</c:if>
</div>
</body>
</html>