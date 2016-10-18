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
<title>Moigo</title>

</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
<center>
	<div id="content">
		<form action="<%=request.getContextPath()%>/modifyGroup" method="post" id="modifyGroup_form">
			<h1 style="padding-top: 25px;">모임 수정하기</h1>
			<br><br>
			<table id="groupTable" style="margin-top: -20px;">
				<tr>
					<td class="tdleft" style="width: 130px;" height="42px;">
						카테고리
					</td>
					<td class="tdRight" style="width: 420px;"><input type="text" id="grpCate" name="grpCate"
						value="${groupModifyCommand.grpCate} " disabled="disabled" style="padding: 3px;" /></td>	
				</tr>
				<tr>
					<td class="tdleft">모임명 : </td>
					<td class="tdRight">
						<input type="text" id="grpName" name="grpName" value="${groupModifyCommand.grpName}" disabled="disabled" style="padding: 3px;" />
					</td>
					<td>
						<input type="hidden" id="grpName" name="grpName" value="${groupModifyCommand.grpName}" />
					</td>
				</tr>
				<tr>
					<td class="tdleft">
						모임소개 <font color="red"><b>*</b></font>:
					</td>
					<td>
						<textarea cols="30" rows="5" id="grpIntro" name="grpIntro"
						style="ime-mode: disabled; resize: none;">${groupModifyCommand.grpIntro}</textarea>
					</td>
				</tr>
				<tr>
					<td class="tdleft">
						모임장 : 
					</td>
					<td>
						<input type="text" disabled="disabled" value="${authInfo.userNick }" style="padding: 3px;"/>
					</td>
				</tr>
				<tr>
					<td class="tdleft">모임 공개 여부 : 
						<c:choose>
							<c:when test="${groupModifyCommand.grpOpen=='Y'}">
								<td id="tdopen"><input type="radio" id="grpOpen"
									name="grpOpen" value="Y" checked="checked" />공개 <input
									type="radio" id="grpOpen" name="grpOpen" value="N" />비공개</td>
							</c:when>
							<c:when test="${groupModifyCommand.grpOpen=='N'}">
								<td id="tdopen"><input type="radio" id="grpOpen"
									name="grpOpen" value="Y" />공개 <input type="radio" id="grpOpen"
									name="grpOpen" value="N" checked="checked" />비공개</td>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td id="tdbottom" colspan="3">
					<input type="submit" id="btnbottom" value="수정하기" /> 
					<input type="button" id="btnbottom" value="취소" onclick="location.href = 'group';" /></td>
				</tr>
			</table>
		</form></body>
</html>