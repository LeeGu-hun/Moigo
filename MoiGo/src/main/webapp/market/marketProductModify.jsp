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
	<center>
		<div id="writeBoard4" style="background: white; position: absolute; left: 550px; top: 150px;">	
			<form action="/moigo/market/modiProduct" method="post" enctype="multipart/form-data">
				<h1>상품 수정하기</h1>
				<br><br>
				판매자 : ${authInfo.userNick }
				<input type="hidden" id="mktSeller" name="mktSeller" value="${authInfo.userNick }">
				<input type="hidden" id="mktCode" name="mktCode" value="${Proinfo.mktCode }"/><br><br>
				상품명 : <input type="text" id="modiProName" name="modiProName" value="${Proinfo.mktPrName }"  style="padding: 3px;"/><br><br>
				가격 : <input type="text" id="modiProPrice" name="modiProPrice" 
						onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" value="${Proinfo.mktPrice }" style="ime-mode:disabled; padding: 3px;" /><br><br>
				내용 : <input type="text" id="modiProContent" name="modiProContent" value="${Proinfo.mktContent }" style="padding: 4px;"/><br><br>
				그룹명 : <select id="grpName" name="grpName" style="height: 23px;">
					<option value="" selected>그룹을 선택하세요</option>
						<c:forEach var="data" items="${requestScope.groupName}">
							<option value='<c:out value="${data.grpName}" />'>
								<c:out value="${data.grpName}" />
							</option>
						</c:forEach>
						</select><br><br>
				상품이미지 : <input type="file" id="modiProThumbnail" name="modiProThumbnail" style="margin-right: 20px;" class="MyButton"><br><br>	
							 <input type="submit" value="상품 등록하기" class="MyButton" /> <br><br>
							 
			</form>
		</div>	
	</div>
</body>
</html>