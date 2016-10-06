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
	<div id="mktcate">
		카테고리임둥<br><br>
		<c:forEach var="cate" items="${cates }">
			${cate.CATENAME }<br>
		</c:forEach>
	</div>
	<div id="product">
		마켓임둥<br><br>
		<c:forEach var="prd" items="${allProducts }">
			<div class="products">
				판매번호 : ${prd.mktCode } <br>
				판매자 : ${prd.mktSeller } <br>
				품명 : ${prd.mktPrName } <br>
				가격 : ${prd.mktPrice } 원<br>
				내용 : ${prd.mktContent } <br>
				그룹명 : ${prd.grpName } <br>
				등록일 : ${prd.mktRegDate } <br>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>