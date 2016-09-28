<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js" ></script>
<script>
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	function hangul() {
		if((event.keyCode < 12592) || (event.keyCode > 12687))
		event.returnValue = false;
	}
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
	<%@ include file="/include/header.jsp"%>
	<%@ include file="/include/loginBox2.jsp" %>
	<div id="content">
		<form action="join" method="post"> 
			아이디 <input type="text" id="id" name="id" style="ime-mode:inactive;"/><br>
			비밀번호 <input type="password" id="password" name="password" /><br>
			비밀번호 확인 <input type="password" id="confirmPassword" name="confirmPassword" /><br>
			이름 <input type="text" id="name" name="name" onKeyPress="hangul()" style="ime-mode:active;" /><br>
			닉네임 <input type="text" id="nickName" name="nickName" /><br>
			나이 <input type="text" id="age" name="age" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
			<input type="radio" id="gender" name="gender" value="남">남
			<input type="radio" id="gender" name="gender" value="여">여<br>
			주소 <input type="text" id="address" name="address" style="ime-mode:active;" /><br>
			휴대전화번호 <input type="text" id="phoneNumber" name="phoneNumber" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
			<input type="submit" value="가입하기" />			
	</form>
	</div>
</body>
</html>