<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<!DOCTYPE html>
<html>
<head>
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
	<div id="content">
		<form action="modify" method="post">
			아이디 <input type="text" id="modiId" name="modiId" value="${authInfo.userID}" disabled="disabled"/><br>
			<input type="hidden" id="modiId" name="modiId" value="${authInfo.userID}" />
			변경할 비밀번호 <input type="password" id="modiPass" name="modiPass" /><br>
			변경할 비밀번호 확인 <input type="password" id="modiConfirmPass" name="modiConfirmPass" /><br>
			이름 <input type="text" id="modiName" name="modiName" onKeyPress="Hangul()" style="ime-mode:active;" /><br>
			닉네임 <input type="text" id="modiNickName" name="modiNickName" /><br>
			나이 <input type="text" id="modiAge" name="modiAge" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
<%-- 			성별 : ${ } --%>
			<input type="radio" id="modiGender" name="modiGender" value="남">남
			<input type="radio" id="modiGender" name="modiGender" value="여">여<br>
			주소 <input type="text" id="modiAddress" name="modiAddress" style="ime-mode:active;" /><br>
			휴대전화번호 <input type="text" id="modiPhoneNum" name="modiPhoneNum" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
			<input type="submit" value="수정하기" />
		</form>					
	</div>
</body>
</html>