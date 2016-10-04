<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; " charset=UTF-8">
<title>Moigo</title>
</head>
<body>
<%@include file="/include/header.jsp"%>
<%@include file="/include/loginBox2.jsp" %>
<div id="content">
	<c:if test="${!empty authInfo }">
		<!-- 추가, 수정 페이지 -->
		<!-- 추가 -->
		<form action="<%=request.getContextPath()%>/add" method="post">
	
			<%-- 	<p>
				<img id="UploadedImg" width="85" height="111"
				src="<%=request.getContextPath()%>/images/basic.png"> <br> 
					<input type="file" id="imgFile" name="imgFile"/> <br> 모임 대표 이미지</label>
			</p> --%>
			<p>
				<label> 카테고리 : <select id="cate" name="cate" style="height: 23px;">
						<option value="" selected>카테고리를 선택하세요</option>
						<c:forEach var="data" items="${requestScope.CATE}">
							<option value='<c:out value="${data.CATEID}" />'>
								<c:out value="${data.CATENAME}" />
							</option>
						</c:forEach>
				</select>
				</label>
			</p>
			<p>
				<label> 모임명 : <input type="text" id="grpName" name="grpName" />
					&nbsp;&nbsp; <input type="button" id="grpNameConfirm" value="중복확인" />
					<br>
				</label>
			</p>
			<p>
				<label> 모임소개 : <input type="text" id="grpIntro" name="grpIntro" maxlength="30" />
				30자 이내 //수정요망  
				  <br>
				</label>
			</p>
			<p>
				<label> 모임장 : <input type="text" disabled="disabled" value="${authInfo.userNick }" />
				<input type="hidden" id="grpLeader" name="grpLeader" value="${authInfo.userNick }" />
					<br>
				</label>
			</p>
			<p>
				<label> 모임 공개 여부 : <input type="radio" id="grpOpen" name="grpOpen" value="Y" />공개
				<input type="radio" id="grpOpen" name="grpOpen" value="N"/>비공개
	
			</label>
			</p>
			<input type="submit" value="모임개설" /> 
			<input type="button" value="취소" onclick="location.href = 'main';"/>
		</form>
	</c:if>
	<c:if test="${empty authInfo }">
		plz Login First
	</c:if>
</div>
</body>
</html>