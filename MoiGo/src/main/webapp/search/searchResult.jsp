<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/kopubbatang.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/search.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
<%@include file="/include/header.jsp"%>
<%@include file="/include/loginBox2.jsp" %>
<div id="content">
	<div id="resultGroup">
		<br>
		<p style="font-family: 'Jeju Gothic', serif;"/>&nbsp;&nbsp;그룹 검색결과<br><br>
		<div id="grp2">
			<c:if test="${!empty srchGroup }">
				<c:forEach var="srchGrp" items="${srchGroup }">
					<div id="grp">
						<div id="grpInf">
							그룹명 : <a href="<c:url value='/group/${srchGrp.grpName }' />">${srchGrp.grpName }</a> <br>
							그룹장 : ${srchGrp.grpLeader }<br>
							카테고리 : ${srchGrp.grpCate }<br>
							그룹소개 : ${srchGrp.grpIntro }<br>
							그룹생성일 : ${srchGrp.grpRegDate }<br><br>
						</div>
						<div id="grpImg">
							<img src="<%=request.getContextPath() %>/file/${srchGrp.grpThumbnail}" style="width: 100px; height: 100px; padding-top: 15px; padding-left: 30px;">					
						</div>
					</div>
					<br>
				</c:forEach>
			</c:if>
			<c:if test="${empty srchGroup }">
				검색 결과가 없습니다.<br><br>
			</c:if>
		</div>
	</div>
	<div id="resultMarket">
		<br>
		<p style="font-family: 'Jeju Gothic', serif; "/>&nbsp;&nbsp;장터 검색결과<br><br>
		<div id="mkt2">
			<c:if test="${!empty srchMarket}">
				<c:forEach var="srchMkt" items="${srchMarket }">
					<div id="mkt">
						<div id="mktInf">
							등록일 : ${srchMkt.mktRegDate } <br>
							판매번호 : <a href="<c:url value='/market/Product/${srchMkt.mktCode }' />">${srchMkt.mktCode }</a> <br>
							그룹 : ${srchMkt.grpName } <br>
							판매자 : ${srchMkt.mktSeller } <br>
							품명 : ${srchMkt.mktPrName } <br>
							가격 : ${srchMkt.mktPrice } <br>
							<p id="mktCut1">내용 : ${srchMkt.mktContent }</p> <br>
						</div>
						<div id="mktImg">
							<img src="<%=request.getContextPath() %>/file/${srchMkt.mktThumbnail}" style="width: 100px; height: 100px; padding-top: 15px; padding-left: 30px;">	
						</div>
						<br><br>
					</div>
					<br>
				</c:forEach>
			</c:if>
			<c:if test="${empty srchMarket }">
				검색 결과가 없습니다.<br><br>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>