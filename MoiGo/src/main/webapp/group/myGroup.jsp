<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/kopubbatang.css"
	rel="stylesheet">
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
	<div id="content">
		<div id="Total">
			<c:if test="${!empty authInfo }">
				<div id="addBtn">
					<center>
						<a href="/moigo/addgroup" style="font-size: 60px; font-weight: bold; text-align: center; line-height: 70px;">＋</a>
					</center>
				</div>
				<br>
				<c:forEach var="jGrp" items="${joinGrp }">
					<div class="mainGroups">
						<div id="main11">
							<span id="groupName"> &nbsp;그룹명 : <a
								href="<c:url value='/group/${jGrp.grpName }' />" id="groupName2">${jGrp.grpName }</a>
							</span>
							<c:if test="${authInfo.userNick==jGrp.grpLeader }">
								<form name="modifyForm" method="post" action="modifyGroupInfo"
									style="display: inline;">
									<input type="hidden" id="grpCate" name="grpCate"
										value="${jGrp.grpCate }" /> <input type="hidden" id="grpName"
										name="grpName" value="${jGrp.grpName }" /> <input
										type="hidden" id="grpIntro" name="grpIntro"
										value="${jGrp.grpIntro }" /> <input type="hidden" id="grpOpen"
										name="grpOpen" value="${jGrp.grpOpen }" /> <input
										type="submit"
										style="float: right; margin-right: 15px; margin-top: 10px;"
										value="수정하기" class="myButton"/>
								</form>
							</c:if>
						</div>
						<div id="mainGrp2">
							<div style="text-align: center; padding-top: 10px;">
								<img
									src="<%=request.getContextPath() %>/file/${jGrp.grpThumbnail}"
									style="width: 100px; height: 100px;">
							</div>
							<br> 그룹장 : ${jGrp.grpLeader } <br> 공개여부 :
							${jGrp.grpOpen } <br> 카테고리 : ${jGrp.grpCate } <br> 그룹인원
							: ${jGrp.grpNum } <br> 개설일자 : ${jGrp.grpRegDate } <br>
							그룹소개 : ${jGrp.grpIntro }<br> <br>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty authInfo }">
				<div id="myFirstLogin1">
					<center>
					
								<form action="/moigo/login" method="post" style="margin-top: 100px;">
									<br>
									로그인이 필요한 서비스 입니다. <br>
									로그인해 주세요. <br><br>
									
									&nbsp;ID&nbsp;<input type="text" id="userID" name="userID" class="btn-style1"/> <br> 
									PW<input type="password" id="userPw" name="userPw" class="btn-style1"/><br>
									<br>
									<input type="submit" class="btn-style" value="로그인" height="25" />
								</form>
					
					</center>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>