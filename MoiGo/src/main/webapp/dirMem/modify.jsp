<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
$(function() {
		$("#modiBirth").datepicker(
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
		document.getElementById("modiBirth").value = toDay;
	} 	
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
		<form action="modify" method="post">
			아이디 <input type="text" id="modiId" name="modiId" value="${authInfo.userID }" disabled="disabled" /><br>
			<input type="hidden" id="modiId" name="modiId" value="${authInfo.userID }" />
			변경할 비밀번호 <input type="password" id="modiPass" name="modiPass" /><br>
			변경할 비밀번호 확인 <input type="password" id="modiConfirmPass" name="modiConfirmPass" /><br>
			이름 <input type="text" id="modiName" name="modiName" value="${authInfo.userName }" /><br>
			닉네임 <input type="text" id="modiNickName" name="modiNickName" value="${authInfo.userNick }" disabled="disabled" /><br>
			<input type="hidden" id="modiNickName" name="modiNickName" value="${authInfo.userNick }" />
			생년월일 <input type="text" id="modiBirth" name="modiBirth" value="${userInfo.getUserBirth() }" /><br>
			주소 <input type="text" id="modiAddress" name="modiAddress" style="ime-mode:active;" value="${userInfo.getUserAddr() }"/><br>
			휴대전화번호 <input type="text" id="modiPhoneNum" name="modiPhoneNum" value="${userInfo.getUserPhone() }" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style="ime-mode:disabled;" /><br>
			<input type="submit" value="수정하기" />
		</form>					
	</div>
</body>
</html>