<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
		<c:if test="${!empty authInfo }">
			<c:forEach var="jGrp" items="${joinGrp }">
				<div class="mainGroups">
					그룹명 : ${jGrp.grpName } <br>
					그룹장 : ${jGrp.grpLeader } <br>
					공개여부 : ${jGrp.grpOpen } <br>
					카테고리 : ${jGrp.grpCate } <br>
					그룹인원 : ${jGrp.grpNum } <br>
					개설일자 : ${jGrp.grpRegDate } <br><br>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty authInfo }">
			비로그인
		</c:if>
	</div>
</body>
</html>