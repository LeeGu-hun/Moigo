<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/kopubbatang.css" rel="stylesheet">
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
	<%@include file="/include/loginBox2.jsp"%>
	<div id="content">
		<c:if test="${!empty authInfo }">
			<input type="button" onclick="addGroup();" value="모임개설" />
			<br>
			<c:forEach var="jGrp" items="${joinGrp }">
				<div class="mainGroups">
					<div id="main11">
					<span id="groupName">
						그룹명 : <a href="<c:url value='/group/${jGrp.grpName }' />">${jGrp.grpName }</a>
					</span>
						<c:if test="${authInfo.userNick==jGrp.grpLeader  }">
							<form name="modifyForm" method="post" action="modifyGroupInfo">
							<input type="hidden" id="grpCate" name="grpCate" value="${jGrp.grpCate }"/>
							<input type="hidden" id="grpName" name="grpName" value="${jGrp.grpName }"/>
							<input type="hidden" id="grpIntro" name="grpIntro" value="${jGrp.grpIntro }"/>
							<input type="submit" value="수정하기"/>
							</form>
						</c:if>
						<br> 그룹장 : ${jGrp.grpLeader } <br> 공개여부 : ${jGrp.grpOpen }
						<br> 카테고리 : ${jGrp.grpCate } <br> 그룹인원 : ${jGrp.grpNum }
						<br> 개설일자 : ${jGrp.grpRegDate } <br> 그룹소개 :
						${jGrp.grpIntro }<br> <br>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty authInfo }">
			plz Login First
		</c:if>
	</div>
</body>
</html>