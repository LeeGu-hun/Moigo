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
					<%-- 	<p>
				<img id="UploadedImg" width="85" height="111"
				src="<%=request.getContextPath()%>/images/basic.png"> <br> 
					<input type="file" id="imgFile" name="imgFile"/> <br> 모임 대표 이미지</label>
			</p> --%>
					<br>
					<p>
					<h1>새 모임 개설하기</h1>
					<br>
					<table id="groupTable">
						<tr>
							<td class="tdleft">
								카테고리 <font color="red"><b>*</b></font>:
							</td>
							<td class="tdRight">
								<select id="cate" name="cate" style="height: 23px;">
									<option value="" selected>카테고리를 선택하세요</option>
									<c:forEach var="data" items="${requestScope.CATE}">
										<option value='<c:out value="${data.CATEID}" />'>
											<c:out value="${data.CATENAME}" />
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdLeft">
								<input type="hidden" id="grpNameChk" value="N" />
								모임명 <font color="red"><b>*</b></font>
								: 
							</td>
							<td class="tdRight">
								<input type="text" id="grpName" name="grpName" />
								<input type="button" id="chkGrpName" value="중복확인" />
							</td>							
						</tr>
						<tr>
							<td class="tdLeft">
								모임소개 <font color="red"><b>*</b></font>:
							</td>
							<td>
								<textarea cols="30" rows="5" id="grpIntro"
								name="grpIntro" style="resize: none;"></textarea><br>(30자이내)
							</td> 
						</tr>
						<tr>
							<td class="tdLeft">
								모임장 : 
							</td>
							<td>
								<input type="text" disabled="disabled"
								value="${authInfo.userNick }" />
							</td>
							<td>
								<input type="hidden" id="grpLeader" name="grpLeader"
								value="${authInfo.userNick }" />
							</td>							
						</tr>
						<tr>
							<td class="tdLeft">
								모임 공개 여부 :
							</td>
							<td class="tdRight">
								<input type="radio" id="grpOpen" name="grpOpen" value="Y" />공개 
								<input type="radio" id="grpOpen" name="grpOpen" value="N" />비공개
							</td>
						</tr>
						<tr>
							<td>모임이미지 : <input type="file" id="grpThumbnail"
								name="grpThumbnail">
							</td>
						</tr>
						<tr>
							<td id="tdbottom" colspan="3"><input type="submit"
								id="btnbottom" value="모임개설" /> <input type="button"
								id="btnbottom" value="취소" onclick="location.href = 'main';" />
							</td>
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