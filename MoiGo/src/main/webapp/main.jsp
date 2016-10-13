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
	<div id="total">
		<div id="cateBox" style="height:100%; width:223px; overflow:hidden; padding: 10px; float: left;">
			<div id="mainCate" style="height:100%; width:250px; overflow:auto; ">
				<c:forEach var="cates" items="${cate }">
					<div style="float: left; margin: 15px;">
						<a href="<c:url value='/search/${cates.CATENAME }' />" >
							<img src="<%=request.getContextPath()%>/images/cate/${cates.CATEID}.jpg"/>	
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="demoGrp">
			<div id="recomGrp">
				<p><h2>추천그룹</h2></p>
				<br>
				<c:forEach var="rGrp" items="${recomGrp }">
					<div class="recomGrp">
						<div id="rGrp">
							<br>
							그룹명 : <a href="<c:url value='/group/${rGrp.grpName }' />">${rGrp.grpName }</a>	
							<br>
							그룹장 : ${rGrp.grpLeader } <br>
							카테고리 : ${rGrp.grpCate } <br>
							그룹소개 : ${rGrp.grpIntro }<br>
						</div>
						<div id="rImg">
							<img src="<%=request.getContextPath() %>/file/${rGrp.grpThumbnail}" style="width: 100px; height: 100px; padding-top: 10px; padding-left: 40px;">
						</div>
					</div>
				</c:forEach>
					<br><br>
			</div>
			<div id="newGrp">
			<p><h2>신규그룹</h2></p><br>
				<c:forEach var="nGrp" items="${newGrp }">
					<div class="recomGrp">

						<div id="rGrp">
								<br>
								그룹명 : <a href="<c:url value='/group/${nGrp.grpName }' />">${nGrp.grpName }</a>	
								<br>
								그룹장 : ${nGrp.grpLeader } <br>
								카테고리 : ${nGrp.grpCate } <br>
								그룹소개 : ${nGrp.grpIntro }<br>
							</div>
						<div id="rImg">
							<img src="<%=request.getContextPath() %>/file/${nGrp.grpThumbnail}" style="width: 100px; height: 100px; padding-top: 10px; padding-left: 40px;">
						</div>
						<br>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>