<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>

	<form action="<%=request.getContextPath()%>/modifyGroup" method="post"
		id="modifyGroup_form">
		<p>
		<h1>모임 수정하기</h1>
		<br>
		<table id="groupTable">
			<tr>
				<td id="tdleft"><label> 카테고리 <font color="red"><b>*</b></font>:
				</td>
				<td><input type="text" id="grpCate" 
				name="grpCate" value="${groupModifyCommand.grpCate} " disabled="disabled"/></td>
				</label>
			</tr>
			</p>
			<br>


			<p>
			<tr>
				<td id="tdleft"><label> 모임명 : </td>
				<td><input type="text" id="grpName" 
				name="grpName" value="${groupModifyCommand.grpName}" disabled="disabled"/></td>
				</label>
				</p>
			
			</tr>

			<p>
			<td id="tdleft"><label> 모임소개 <font color="red"><b>*</b></font>:
			</td>
			<td><input type="text" id="grpIntro" name="grpIntro"
				maxlength="30" value="${groupModifyCommand.grpIntro}"  onkeydown="return onlyNumber(event)" 
				onkeyup="removeChar(event)" style="ime-mode:disabled;"/></td>
			<td>(30자이내)
			</td>
			</label>
			</tr>
			</p>

			<p>
			<tr>
				<td id="tdleft"><label> 모임장 : </td>
				<td><input type="text" disabled="disabled"
					value="${authInfo.userNick }" /></td>
				<td><input type="hidden" id="grpLeader" name="grpLeader"
					value="${authInfo.userNick }" /></td>
				<br>
				</label>
			</tr>
			</p>

			<p>
			<td id="tdleft"><label> 모임 공개 여부 :
					<td id="tdopen"><input type="radio" id="grpOpen"
						name="grpOpen" value="Y" />공개 <input type="radio" id="grpOpen"
						name="grpOpen" value="N" />비공개</td>

			</label></td>
			</tr>
			</p>

			<tr>
				<td id="tdbottom" colspan="3">
				<input type="submit" id="btnbottom" value="수정하기" /> 
					<input type="button" id="btnbottom" value="취소" 
					onclick="location.href = 'group';" /></td>
			</tr>
		</table>
	</form>


</body>
</html>