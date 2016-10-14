<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MoiGo</title>  
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
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<div id="content">
		<center>
		<form action="modify" method="post" id="my_modi_form">
		<br>
		<table id="modifytable">
		<fieldset>
		<legend><h1 id="mod1">회 원 수 정</h1></legend>
		<span id="mod2">나의 정보를 수정하세요 </span>
		</fieldset>		
		<tr>
		<td id="mdleft" >아이디 </td>
		<td> <input type="text" id="modiId" name="modiId" value="${authInfo.userID }" disabled="disabled" /></td>
		<input type="hidden" id="modiId" name="modiId" value="${authInfo.userID }" />
		</tr>
		
		<tr>
		<td id="mdleft" >비밀번호 <font color="red"><b>*</b></font></td>
		<td><input type="password" id="modiPass" name="modiPass" /></td>
		</tr>
		<tr>
		<td id="mdleft"> 비밀번호<br>확인 <font color="red"><b>*</b></font></td>
		<td><input type="password" id="modiConfirmPass" name="modiConfirmPass" /></td>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		</tr>
		
		
		
		<tr>
		<td id="mdleft"> 이름 <font color="red"><b>*</b></font></td>
		<td><input type="text"  id="modiName" name="modiName" value="${userInfo.userName }" style="ime-mode:active;" /></td>
		</tr>
		
		<tr>
		<td id="mdleft"> 닉네임 </td>
		<td><input type="text" id="modiNickName" name="modiNickName" value="${authInfo.userNick }" disabled="disabled" />
		<input type="hidden" id="modiNickName" name="modiNickName" value="${authInfo.userNick }" /></td>
		</tr>
		
		
		<tr>
		<td id="mdleft"> 생년월일</td>
		<td> <input type="text" id="modiBirth" name="modiBirth" value="${userInfo.getUserBirth() }" disabled="disabled" /></td>
		</tr>
		
		
		<tr>
		<td id="mdleft"> 주소 <font color="red"><b>*</b></font></td>
		
		<td> <input type="text" id="modiAddress" name="modiAddress" style="ime-mode:active;" value="${userInfo.getUserAddr() }"/></td>
		</tr>
		
		
		<tr>
		<td id="mdleft"> 휴대폰번호 <font color="red"><b>*</b></font></td>
		
		<td>
			<input type="text" id="modiPhoneNum" name="modiPhoneNum" value="${userInfo.getUserPhone() }" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" />
		</td>
		</tr>
		
		
		
		</table>
		<tr><td colspan="2"><hr width="100%" /></td></tr>
		<tr>
			
			
			<td><form method="post" action="moigo">
			
			<br><br>
			<input type="submit" value="수정하기" class="myButton"/>
			<input type="reset" value="지우기" class="myButton"/>
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
	</div>
</body>
</html>