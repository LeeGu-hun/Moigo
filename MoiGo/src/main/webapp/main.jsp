<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div id="content">메인</div>
	<div id="loginBox2">
		<form action="login" method="post">
			loginBox <br>
			ID<input type="text" id="userID" name="userID" /> <br> 
			PW<input type="password" id="userPw" name="userPw" />
			<input type="submit" value="로그인" />
		</form>
	</div>
</body>
</html>