<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/kopubbatang.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MoiGo</title>
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<%@include file="/include/loginBox2.jsp" %>
	<div id="content">
		<div id="total">
			<div id="myFirstLogin1">
				<center>
					<form action="/moigo/login" method="post" style="margin-top: 100px;">
						<br>
						로그인 실패!<br>
						아이디와 비밀번호를 확인하세요.<br><br>			
						&nbsp;ID&nbsp;<input type="text" id="userID" name="userID" class="btn-style1"/> <br> 
						PW<input type="password" id="userPw" name="userPw" class="btn-style1"/><br>
						<br>
						<input type="submit" class="btn-style" value="로그인" height="25" />
					</form>
				</center>
			</div>
		</div>
	</div>
</body>
</html>