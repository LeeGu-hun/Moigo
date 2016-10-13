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
	<div id="Total">
		<img src="<%=request.getContextPath() %>/file/${prod.mktThumbnail}"><br>
		${prod.mktCode }<br>
		${prod.mktSeller }<br>
		${prod.mktPrName }<br>
		${prod.mktPrice }<br>
		${prod.mktContent }<br>
		${prod.grpName }<br>
		${prod.mktRegDate }<br>
		<input type="button" id="buyPrd" name="buyPrd" value="구입하기">
		<input type="button" id="cancle" name="cancle" value="취소">		
	</div>
</div>
</body>
</html>