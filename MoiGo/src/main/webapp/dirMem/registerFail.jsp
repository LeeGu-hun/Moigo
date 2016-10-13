<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/js/common.js" ></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MoiGo</title>
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<div id="content">
		회원가입에 실패하였습니다.
		<form action="/moigo/login" method="post">
			로그인이 필요한 서비스 입니다. 로그인해 주세요. <br>
			ID<input type="text" id="userID" name="userID" /> <br> 
			PW<input type="password" id="userPw" name="userPw" /><br>
			<input type="submit" class="btn-style" value="로그인" />
		</form>
	</div>
</body>
</html>