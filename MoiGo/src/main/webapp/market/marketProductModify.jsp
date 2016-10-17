<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/calendar.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<script src="<%=request.getContextPath()%>/js/calendar.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body onload="calendar()">
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<div id="content">
		<div id="writeBoard" style="background: grey; position: absolute; left: 550px; top: 200px;">	
			<form action="/moigo/market/modiProduct" method="post" enctype="multipart/form-data">
			
				판매자 : ${authInfo.userNick }<br> 
				<input type="hidden" id="mktSeller" name="mktSeller" value="${authInfo.userNick }">
				<input type="hidden" id="mktCode" name="mktCode" value="${Proinfo.mktCode }"/>
				상품명 : <input type="text" id="modiProName" name="modiProName" value="${Proinfo.mktPrName }" /><br>
				가격 : <input type="text" id="modiProPrice" name="modiProPrice" 
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" value="${Proinfo.mktPrice }" style="ime-mode:disabled;" /><br>
				내용 : <input type="text" id="modiProContent" name="modiProContent" value="${Proinfo.mktContent }"/><br>
				그룹명 : <select id="grpName" name="grpName" style="height: 23px;">
					<option value="" selected>그룹을 선택하세요</option>
						<c:forEach var="data" items="${requestScope.groupName}">
							<option value='<c:out value="${data.grpName}" />'>
								<c:out value="${data.grpName}" />
							</option>
						</c:forEach>
						</select><br>
				상품이미지 : <input type="file" id="modiProThumbnail" name="modiProThumbnail" style="margin-right: 20px;">		
							 <input type="submit" value="상품 등록하기" />
			</form>
		</div>	
	</div>
</body>
</html>