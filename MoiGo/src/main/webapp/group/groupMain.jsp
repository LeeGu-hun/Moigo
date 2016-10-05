<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<c:if test="${empty authInfo }">
		<div id="content">
			<c:out value="${grpInfo.grpName }" />
			<br>
			<c:out value="${grpInfo.grpLeader }" />
			<br>
			<c:out value="${grpInfo.grpCate }" />
			<br>
			<c:out value="${grpInfo.grpRegDate }" />
			<br>
			<c:out value="${grpInfo.grpIntro }" />
			<br> Please Login First
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="content">
			<c:if test="${joined }">
				<div id="brdTotal">
					<div id="grpCalendar">
					abc1
						<div id="grpInfo">
						</div>
						<div id="Calender">
						</div>
					</div>
					<div id="board">
 						<c:forEach var="geulInfo" items="geulInfo"> 
						<div id="geul">					
							<div id="info">
								<div id="writer">
									글쓴이 : ${geulInfo.getBrdWriter() }
								</div><p>
								<div id="writedDte">
								 	작성일 :
								</div>
							</div><br>
							<div id="naeyong">
								내용 : ${geulInfo.getBrdContent() }
							</div>
						</div>
 						</c:forEach>
					</div>
					<div id="grpProduct">
						abc3
					</div>
				</div>
			</c:if>
			<c:if test="${!joined }">
				false test
				<form id="grpJoin" action="/moigo/group/${grpName }/joingroup" method="post">
				<input type="hidden" id="grpName" name="grpName" value="${grpName }">
				<input type="submit" onclick="joinGroup(); return false;" value="모임 가입하기"/>
			</form>
			</c:if>
		</div>
	</c:if>
</body>
</html>