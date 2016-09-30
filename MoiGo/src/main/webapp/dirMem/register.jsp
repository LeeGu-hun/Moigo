<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
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
	function Hangul() {
		if((event.keyCode < 12592) || (event.keyCode > 12687))
		event.returnValue = false;
	}
    function NotHangul(obj)
    {
        //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
        if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
        || event.keyCode == 46 ) return;
        //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
        obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
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
	
		<form action="join" method="post" id="my_reg_form"> 
		<br>
		<center><h2>Registration Form</h2></center>
		
		<table id="mytable">
		<fieldset>
		<legend>회 원 가 입</legend>
		<tr>
		<td id="left"> User Id <font color="red"><b>*<b></font></td>
		<td><input type="text" id="user_id" name="user_id" onkeydown="NotHangul(this);"/></td>
		</tr>
		
		<tr>
		<td id="left"> E-Mail <font color="red"><b>*<b></font></td>
		<td><input type="text" id="email" name="email" onkeydown="NotHangul(this);"/>@
		<select name=email_address">
		<option id="naver" value="naver.com"> naver.com</option>
		<option id="daum" value="daum.net"> daum.net</option>
		<option id="nate" value="nate.com"> nate.com</option>
		<option id="google" value="google.co.kr"> google.co.kr</option>
		</select>
		</tr>
		
		<tr>
		<td id="left"> Password <font color="red"><b>*<b></font></td>
		<td><input type="password" id="password" name="password" /></td>
		</tr>
		<tr>
		<td id="left"> confirmPassword <font color="red"><b>*<b></font></td>
		<td><input type="password" id="confirmPassword" name="confirmPassword" /></td>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		</tr>
		
		<tr>
		<td id="left"> Name <font color="red"><b>*<b></font></td>
		<td><input type="text" id="name" name="name" onKeyPress="Hangul()" style="ime-mode:active;" /></td>
		</tr>
		
		<tr>
		<td id="left"> NinkName <font color="red"><b>*<b></font></td>
		<td><input type="text" id="name" name="name" onKeyPress="Hangul()" style="ime-mode:active;" /></td>
		</tr>
		
		
		<tr>
		<td id="left"> NinkName <font color="red"><b>*<b></font></td>
		<td><input type="text" id="nickName" name="nickName" /></td>
		</tr>
		
		<tr>
		<td id="left"> Age <font color="red"><b>*<b></font></td>
		<td><input type="text" id="age" name="age" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /></td>
		</tr>
		
		<tr>
		<td id="left"> Gender <font color="red"><b>*<b></font></td>
		<td>
		<input type="radio" id="gender" name="gender" value="남">Male
		<input type="radio" id="gender" name="gender" value="여">Female</td>
		</tr>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		
		<tr>
		<td id="left" valign="top"> Gender <font color="red"><b>*<b></font></td>
		
		
		
		
		
		
		
		
		
		남
		여<br>
		주소 <input type="text" id="address" name="address" style="ime-mode:active;" /><br>
		휴대전화번호 <input type="text" id="phoneNumber" name="phoneNumber" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
		<input type="submit" value="가입하기" />	
		</fieldset>		
	</form>
	</div>
</body>
</html>