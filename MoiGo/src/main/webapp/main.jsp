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
		<c:if test="${empty authInfo }">
			<c:forEach var="allGrp" items="${grpAll }">
				<div class="groups">
					${allGrp.grpName } <br>
					${allGrp.grpLeader } <br>
					${allGrp.grpOpen } <br>
					${allGrp.grpCate } <br>
					${allGrp.grpNum } <br>
					${allGrp.grpRegDate } <br><br>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>