<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="http://fonts.googleapis.com/earlyaccess/kopubbatang.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<style>
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	left: 550px;
	top: 200px;
	z-index: 10000;
}

.divClose {
	float: right;
	padding-top: 10px;
	padding-right: 10px;
}

.close {
	text-decoration: none;
	color: green;
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function wrapWindowByMask() {
		// 화면의 높이와 너비를 구하기
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		// 70% 불투명
		//		$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("fast", 0.7);

		// 글쓰기 div 띄우기
		$('.window').show();
	}

	$(document).ready(function() {
		// 어두운 화면 띄우기
		$('.openMask').click(function(e) {
			e.preventDefault();
			wrapWindowByMask();
		});

		// 닫기 버튼을 눌렀을 때
		$('.divClose .close').click(function(e) {
			//링크 기본동작은 작동하지 않도록 한다.
			e.preventDefault();
			$('#mask, .window').hide();
		});

		// 어두운 화면 클릭시 글쓰기창 닫기
		//		$('#mask').click(function () {  
		//		    $(this).hide();  
		//		    $('.window').hide();  
		//		});    

		// 어두운 화면 클릭시 아무 반응 없음.		
		$('#mask').one('touchstart', function() {
			$(this).unbind('click');
		});
	});
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<div id="content">
		<div id="Total">
			<div id="addMrkBtn">
				<center>
					<a href="#" class="openMask"
						style="font-size: 60px; font-weight: bold; text-align: center; line-height: 70px;">＋</a>
				</center>
			</div>
			<div id="cateBox"
				style="height: 100%; width: 223px; overflow: hidden; padding: 10px; float: left;">
				<div id="mainCate"
					style="height: 100%; width: 250px; overflow: auto;">
					<c:forEach var="cates" items="${cates }">
						<div style="float: left; margin: 15px;">
							<a href="<c:url value='/search/${cates.CATENAME }' />"> <img
								src="<%=request.getContextPath()%>/images/cate/${cates.CATEID}.jpg" />
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="product" style="width: 900px;">
				<div id="mask"></div>
				<!-- 화면 불투명에 쓸 div -->
				<div class="window">
					<!-- writeBoard -->
					<div id="writeBoard" style="background: white;">
						<div class="divClose">
							<a href="#" class="close">Close</a>
						</div>
						<br>
						<form action="market/addProduct" method="post"
							enctype="multipart/form-data">
							판매자 : ${authInfo.userNick }<br> <input type="hidden"
								id="mktSeller" name="mktSeller" value="${authInfo.userNick }">
							상품명 : <input type="text" id="productName" name="productName" /><br>
							가격 : <input type="text" id="productPrice" name="productPrice" /><br>
							내용 : <input type="text" id="productContent" name="productContent" /><br>
							그룹명 : <select id="grpName" name="grpName" style="height: 23px;">
								<option value="" selected>그룹을 선택하세요</option>
								<c:forEach var="data" items="${requestScope.groupName}">
									<option value='<c:out value="${data.grpName}" />'>
										<c:out value="${data.grpName}" />
									</option>
								</c:forEach>
								</select><br>
						상품이미지 : <input type="file" id="grpThumbnail" name="grpThumbnail" style="margin-right: 20px;">		
						<input type="submit" value="상품 등록하기" />
					</form>
				</div>			
			</div>
			<br><p><h1>마켓</h1></p><br><br>
			<c:forEach var="prd" items="${allProducts }">
				<div class="products" style="width:400px; height: 200px; float: left; margin-left: 20px; margin-bottom: 20px;">
					<c:if test="${authInfo.userNick == prd.mktSeller }">
						<form action="market/deleteProduct" method="post">
							<input type="hidden" id="mktCode" name="mktCode"
								value="${prd.mktCode }" /> <input type="submit"
								style="float: right;" value="삭제하기" />
						</form>
					</c:if>
					<div style="float: right; width: 240px;">
						<br>
						&nbsp;· 등록일 : ${prd.mktRegDate }<br>
						&nbsp;· 판매번호 : ${prd.mktCode } <br>
						&nbsp;· 그룹명 : ${prd.grpName } <br>
						&nbsp;· 판매자 : ${prd.mktSeller } <br>
						&nbsp;· 품명 : ${prd.mktPrName } <br>
						&nbsp;· 가격 : ${prd.mktPrice } 원<br>
						&nbsp;· 내용 : ${prd.mktContent } <br>
					</div>
					<c:if test="${empty prd.mktThumbnail }">
						<div style="text-align: center; padding-top: 10px;">
							<div style="width: 100px; height: 100px;"></div>
						</div>
					</c:if>
					<c:if test="${!empty prd.mktThumbnail }">
						<div style="text-align: center; padding-top: 10px;">
							<img src="<%=request.getContextPath() %>/file/${prd.mktThumbnail}"
								style="width: 100px; height: 100px;">
						</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>