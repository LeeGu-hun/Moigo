<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
<%@include file="/include/header.jsp"%>
<%@include file="/include/loginBox2.jsp" %>
<div id="content">
	<div id="mainCate">
		
	</div>
	<div id="demoGrp">
		<div id="recomGrp">
			추천그룹<br>
			<c:forEach var="rGrp" items="${recomGrp }">
				<div class="recomGrp">
					그룹명 : <a href="<c:url value='/group/${rGrp.grpName }' />">${rGrp.grpName }</a>

					<br>
					그룹장 : ${rGrp.grpLeader } <br>
					카테고리 : ${rGrp.grpCate } <br>
					그룹소개 : ${rGrp.grpIntro }<br>
				</div>
			</c:forEach>
		</div>
		<div id="newGrp">
		신규그룹<br>
			<c:forEach var="nGrp" items="${newGrp }">
				<div class="newGrp">
					그룹명 : <a href="<c:url value='/group/${nGrp.grpName }' />">${nGrp.grpName }</a> <br>
					그룹장 : ${nGrp.grpLeader } <br>
					카테고리 : ${nGrp.grpCate } <br>
					그룹소개 : ${nGrp.grpIntro }<br>
				</div>
			</c:forEach>
		</div>
	</div>
	<div id="demoMkt">
		추천마켓
	</div>
</div>
</body>
</html>