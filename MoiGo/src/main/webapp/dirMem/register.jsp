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
<!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(function() {
		$("#birthDate").datepicker(
			{
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});
		getDate();
	});
	function getDate() {
		var newDate = new Date();
		var yyyy = newDate.getFullYear();
		var mm = newDate.getMonth() + 1;
		if (mm < 10) {
			mm = "0" + mm;
		}
		var dd = newDate.getDate();
		if (dd < 10) {
			dd = "0" + dd;
		}
		var toDay = yyyy + "-" + mm + "-" + dd;
		document.getElementById("birthDate").value = toDay;
	} 	
 	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9 ) 
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
		<td><input type="text" id="id" name="id" /></td>
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
		<td id="left"> 이름 <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="name" name="name" style="ime-mode:active;" /></td>
		</tr>
		
		<tr>
		<td id="left"> 닉네임 <font color="red"><b>*</b></font></td>
		<td><input type="text" id="nickName" name="nickName" style="ime-mode:active;" /></td>
		</tr>
		
		
		<tr>
		<td id="left"> 생년월일 <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="birthDate" name="birthDate" /></td>
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
		
		<td>
			 <select id="phoneNumber1" name="phoneNumber1" style="width:70;">
			 	<option value="010">010</option>
			    <option value="011">011</option>
			    <option value="016">016</option>
			    <option value="017">017</option>
			    <option value="018">018</option>
			    <option value="019">019</option>
		   	</select>
			<input type="text" id="phoneNumber2" name="phoneNumber2" 
				onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" size="5" maxlength="4" /> -
			<input type="text" id="phoneNumber3" name="phoneNumber3" 
				onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" size="5" maxlength="4" />	 	
		</td><br>
		</tr>
		
		
	</table>
		
			
			
			<td><form method="post" action="moigo">
			
			<br><br>
			<input type="submit" id="register" value="가입하기" class="myButton"/>
			<input type="reset" id="clear" value="지우기" class="myButton" />
			<tr><td colspan="2"><hr width="100%" /></td></tr>
			
			<tr>
			<td colspan="2" align="center">
			<font color="red"><b>*</b></font>
			<font align="center" color="#808080">
			(Required) - Please fill up</font>
			</td>
			</tr>
			</form>
		
	</div>
</body>
</html>