<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/joinform.css" />
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/loginBox2.jsp" %>
<center>
	<div id="content">
	
		<form action="join" method="post" id="my_reg_form"> 
		<br>
		<table id="mytable">
		<fieldset>
		<legend><h1 id="reg1">회 원 가 입</h1></legend>
		<span id="reg2">Moigo에 오신것을 환영합니다. <br>
		어떤 모임에 흥미가 있으신가요?</span>
		</fieldset>		
		<tr>
		<td id="left" >아이디 <font color="red"><b>*</b></font></td>
		<td><input type="text" id="id" name="id" onkeydown="NotHangul(this);"/></td>
		</tr>
		
		
		
		<tr>
		<td id="left" >비밀번호 <font color="red"><b>*</b></font></td>
		<td><input type="password"  id="password" name="password" /></td>
		</tr>
		<tr>
		<td id="left"> 비밀번호<br>확인 <font color="red"><b>*</b></font></td>
		<td><input type="password"  id="confirmPassword" name="confirmPassword" /></td>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		</tr>
		
		<tr>
		<td id="left"> E-Mail <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="email" name="email" onkeydown="NotHangul(this);"/>@
		<select name=email_address">
		<option id="naver" value="naver.com"> naver.com</option>
		<option id="daum" value="daum.net"> daum.net</option>
		<option id="nate" value="nate.com"> nate.com</option>
		<option id="google" value="google.co.kr"> google.co.kr</option>
		</select>
		</tr>
		
		<tr>
		<td id="left"> 이름 <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="name" name="name" onKeyPress="Hangul()" style="ime-mode:active;" /></td>
		</tr>
		
		<tr>
		<td id="left"> 닉네임 <font color="red"><b>*</b></font></td>
		<td><input type="text" id="nickName" name="nickName" onKeyPress="Hangul()" style="ime-mode:active;" /></td>
		</tr>
		
		
		<tr>
		<td id="left"> 나이 <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="age" name="age" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /></td>
		</tr>
		
		<tr>
		<td id="left"> 성별 <font color="red"><b>*</b></font></td>
		<td>
		<input type="radio" id="gender" name="gender" value="남">Male
		<input type="radio" id="gender" name="gender" value="여">Female</td>
		</tr>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		
		
		<tr>
		<td id="left"> 주소 <font color="red"><b>*</b></font></td>
		
		<td><input type="text" class="regForm" id="address" name="address" style="ime-mode:active;" /><br>
		</td>
		</tr>
		
		
		<tr>
		<td id="left"> 휴대폰번호 <font color="red"><b>*</b></font></td>
		
		<td><input type="text" id="phoneNumber" name="phoneNumber" 
		onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /></td><br>
		</tr>
		
		
		<tr>
		<td id="left" valign="top"> Hobby<font color="red"><b>*</b></font> </td>
		<td id="right">
		<table width="100%">
		<tr>
		<td>
		<input type="checkbox" name="Like" value="반려동물"/> 반려동물 
		</td>
		<td>
		<input type="checkbox" name="Like" value="맛집"/> 맛집 
		</td>
		<td>
		<input type="checkbox" name="Like" value="운동"/> 운동 
		</td>
		<td>
		<input type="checkbox" name="Like" value="영화"/> 영화 
		</td>
		<td>
		<input type="checkbox" name="Like" value="여행"/> 여행 
		</td>
		</tr>
		</table>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		<tr>
			<td valign="top" id="left">자기소개<font color="red"><b>*<b></font>
			</td>
			
			<td><form method="post" action="moigo">
			<textarea id="comment" name="comment" rows="10" cols="50"></textarea>
			<br><br>
			<input type="submit" id="register" value="Register"/>
			<input type="reset" id="clear" value="Clear" />
			<tr><td colspan="2"><hr width="100%" /></td></tr>
			
			<tr>
			<td colspan="2" align="center">
			<font color="red"><b>*</b></font>
			<font align="center" color="#808080">
			(Required) - Please fill up</font>
			</td>
			</tr>
			</form>
		</table>
	
		<!-- <input type="submit" value="가입하기" />	 -->
		
	</form>
		
	</div>
</body>
</html>