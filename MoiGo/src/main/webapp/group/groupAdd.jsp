<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/joinform.css" />
<meta http-equiv="Content-Type" content="text/html; " charset=UTF-8">
<script>
	function grpNameCheck() {
		var objEv = event.srcElement;
		var num = "{}[]()<>?_|~`@#$%^&*-+\"'\\/ "; //입력을 막을 특수문자 기재.
		event.returnValue = true;

		for (var i = 0; i < objEv.value.length; i++) {
			if (-1 != num.indexOf(objEv.value.charAt(i)))
				event.returnValue = false;
		}

		if (!event.returnValue) {
			alert("특수문자는 입력하실 수 없습니다.");
			objEv.value = "";
		}
	}

	function grpNameConfirm() {
		var grpNameConfirm = $("#grpName").val();

		if (grpNameConfirm == "") {
			alert("모임명을 입력해주세요.");
		} else {

			$.ajax({
				type : "POST",
				url : 'grpNameConfirm',
				data : "grpNameConfirm=" + grpNameConfirm,
				success : result
			});
		}

	}

	function result(msg) {
		if (msg.trim() == "1") {
			$("#grpNameConfirmResult").html('이미 사용중입니다.');
		} else {
			$("#grpNameConfirmResult").html('사용가능합니다.');
		}
	}
</script>
<title>Moigo</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<center>
		<div id="content">
			<c:if test="${!empty authInfo }">
				<!-- 추가, 수정 페이지 -->
				<!-- 추가 -->
				<form action="<%=request.getContextPath()%>/add" method="post"
					id="groupAdd_form" enctype="multipart/form-data">
					<h1 style="line-height: 23px;" >새 모임 개설하기</h1>
					<table id="groupTable" style="margin-top:-20px;">
						<tr>
							<td class="tdleft" style="width: 130px;">카테고리 <font color="red"><b>*</b></font>
							</td>
							<td class="tdRight" style="width: 420px;"><select id="cate" name="cate"
								style="height: 23px;">
									<option value="" selected>카테고리를 선택하세요</option>
									<c:forEach var="data" items="${requestScope.CATE}">
										<option value='<c:out value="${data.CATEID}" />'>
											<c:out value="${data.CATENAME}" />
										</option>
									</c:forEach>
							</select></td>
						</tr>
						
						<tr>
							<td class="tdLeft"><input type="hidden" id="grpNameChk"
								value="N" /> 모임명 <font color="red"><b>*</b></font> </td>
							<td class="tdRight"><input type="text" id="grpName"
								name="grpName" onKeyDown="grpNameCheck();" /> <input
								type="button" onclick="grpNameConfirm();" value="중복확인" /> <span
								id="grpNameConfirmResult"></span></td>
						</tr>
						<br>
						<tr>
							<td class="tdLeft">모임소개 <font color="red"><b>*</b></font>
							</td>
							<td><textarea cols="30" rows="5" id="grpIntro"
									name="grpIntro" style="resize: none;"></textarea><br>(30자이내)
							</td>
						</tr>
						<br>
						<tr>
							<td class="tdLeft">모임장 </td>
							<td><input type="text" disabled="disabled"
								value="${authInfo.userNick }" style="padding: 3px;"/></td>
							<td><input type="hidden" id="grpLeader" name="grpLeader"
								value="${authInfo.userNick }" style="padding: 3px;"/></td>
						</tr>
						<br>
						<tr>
							<td class="tdLeft">모임 공개 여부 </td>
							<td class="tdRight"><input type="radio" id="grpOpen"
								name="grpOpen" value="Y" />공개 <input type="radio" id="grpOpen"
								name="grpOpen" value="N" />비공개</td>
						</tr>
						<br>
						<tr>
							<td>모임이미지  <input type="file" id="grpThumbnail"
								name="grpThumbnail">
							</td>
						</tr>
						<br>
						<tr>
							<td id="tdbottom" colspan="3"><input type="submit"
								id="btnbottom" value="모임개설" /> <input type="button"
								id="btnbottom" value="취소"
								onclick="location.href = '/moigo/group';" /></td>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${empty authInfo }">
		plz Login First
	</c:if>
		</div>
</body>
</html>