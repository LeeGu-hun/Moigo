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

	$(document).ready(function() {
		
		// z-index
	});
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body onload="calendar()">
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<c:if test="${empty authInfo }">
		<div id="content">
			<center>
			<br><br>
				<div id="groupmNotlg">
		
			<img src="<%=request.getContextPath() %>/file/${grpInfo.grpThumbnail}" style="width: 100px; height: 100px; ">
			<br>
			
			그룹명 : <c:out value="${grpInfo.grpName }" />
			<br>
			그룹장 : <c:out value="${grpInfo.grpLeader }" />
			<br>
			카테고리 : <c:out value="${grpInfo.grpCate }" />
			<br>
			개설일자 : <c:out value="${grpInfo.grpRegDate }" />
			<br>
			그룹소개 : <c:out value="${grpInfo.grpIntro }" />
			<br><br>
			<h2><font color="#710000">※ Please Login First  ※</font></h2>
				<div>
					<form action="/moigo/login" method="post">
						로그인이 필요한 서비스 입니다.<br> 
						로그인해 주세요. <br>
						&nbsp;ID&nbsp;<input type="text" id="userID" name="userID" class="btn-style1"/> <br> 
						PW<input type="password" id="userPw" name="userPw" class="btn-style1"/><br>
						<input type="submit" class="btn-style" value="로그인" "/>
					</form>			
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="content">
			<c:if test="${joined }">
				<div id="Total" style="padding-top: 15px;">
					<div id="addBtn">
						<center>
							<a href="#" class="openMask" style="font-size: 60px; font-weight: bold; text-align: center; line-height: 70px;">＋</a>
						</center>
					</div>
					<div id="grpCalendar">
						<div id="grpInfo">
							<div>
								<img src="<%=request.getContextPath() %>/file/${grpInfo.grpThumbnail}" style="width: 100px; height: 100px; ">
							</div>
							<div>
								그룹명 : <c:out value="${grpInfo.grpName }" /><br>
								카테고리 : <c:out value="${grpInfo.grpCate }" /><br>
								그룹인원수 : <c:out value="${grpInfo.grpNum }" />명
							</div>
						</div>
						<div id="calendarView" ></div>
					</div>
					<div id="board">
						<!-- 한 줄로 줄여서 움직일 수 있게 해야함 -->
						<div style="width: 650px; height: 121px;">
							<div style="width: 25px; height: 100%; float: left;">
								<button id="left-button" style="width: 25px; height: 30px;"><<</button>
							</div>
							<div style="width: 600px; height: 121px; float: left;">
								<c:forEach var="myGrp" items="${myGrp }">
									<c:choose>
										<c:when test="${myGrp.grpThumbnail eq null }">
											<div class="item" style="display: block; width: 100px; height: 100%; float: left;">
												<img src="images/grpNameEqualsNull.png"
													style="width: 100px; height: 100px;" /><br> <a
													href="<c:url value='/group/${myGrp.grpName }' />">${myGrp.grpName }</a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="item" style="display: block; width: 100px; height: 100%; float: left;">
												<img
													src="<%=request.getContextPath() %>/file/${myGrp.grpThumbnail}"
													style="width: 100px; height: 100px;"><br> <a
													href="<c:url value='/group/${myGrp.grpName }' />">${myGrp.grpName }</a>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<div style="width: 25px; height: 100%; float: left;">
								<button id="right-button" style="width: 25px; height: 30px;" value="">>></button>
							</div>
						</div>
						<!--  -->
						<c:forEach var="geulInfo" items="${geulInfo }">
							<div id="geul" style="margin: 0, auto">
								<div id="info">
									<input type="hidden" id="wGrpName" name="wGrpName" value="${grpInfo.grpName }" /> 
									<div style="padding-left: 10px;">
									글쓴이 : ${geulInfo.getBrdWriter() }<br> 
									작성일 : ${geulInfo.getBrdRegDate() }<br> 
									제목 : ${geulInfo.getBrdTitle() }<br> 
									내용 : ${geulInfo.getBrdContent() }
									</div>
								</div>
								<div id="brdPic">
									<div id="btnDel">
										<c:if test="${authInfo.userNick == geulInfo.getBrdWriter() }">
											<a href="/group/${grpInfo.grpName }/delete"><button>삭제</button></a>
										</c:if>
										<c:if test="${authInfo.userNick != geulInfo.getBrdWriter() }">
											<div style="width: 30.67px; height: 22px;"></div>
										</c:if>
									</div>
									<div id="proImage">
										<c:if test="${empty geulInfo.brdThumbnail }">										<img
												src="<%=request.getContextPath() %>/images/noImage.png"
												style="width: 120px; height: 120px;">
											<br></c:if>
										<c:if test="${!empty geulInfo.brdThumbnail }">
											<img
												src="<%=request.getContextPath() %>/file/${geulInfo.brdThumbnail}"
												style="width: 120px; height: 120px;">
											<br>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div id="grpProduct">
						<c:forEach var="grpPrds" items="${grpPrd }">
							<div class="grpProducts">
								<div style="float: left; width:100px; height:100px;">
									<img src="<%=request.getContextPath() %>/file/${grpPrds.mktThumbnail}" style="width: 100px; height: 100px; ">
								</div>
								<div style="float: left;">
									품명 : ${grpPrds.mktPrName }<br>
									판매자 : ${grpPrds.mktSeller }
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="mask"></div>
				<!-- 화면 불투명에 쓸 div -->
				<div class="window">
					<!-- writeBoard -->
					<div id="writeBoard" style="background: white;">
						<div class="divClose">
							<a href="#" class="close">Close</a>
						</div>
						<br>
						<form action="${grpInfo.grpName }/groupwrite" method="post"
							enctype="multipart/form-data">
							<input type="hidden" id="writer" name="writer"
								value="${authInfo.userNick }" />
							<div style="padding-left: 20px;">
								<input type="text" id="writeTitle" name="writeTitle"
									placeholder="Title" />
							</div>
							<br>
							<div style="padding-left: 20px;">
								<textarea cols="105" rows="20" id="writeContent"
									name="writeContent" placeholder="Content" style="resize: none;"></textarea>
							</div>
							<br>
							<div style="padding-left: 20px;">
								<input type="file" id="grpThumbnail" name="grpThumbnail" />
							</div>
							<br>
							<div style="padding-right: 30px;">
								<input type="submit" style="float: right;" value="게시하기" />
							</div>
						</form>
					</div>
				</div>
			</c:if>
			
			<!-- 가입했을때 -->
			
			
			<!-- 가입x -->
			<c:if test="${!joined }">
				<div>
					그룹명 :
					<c:out value="${grpInfo.grpName }" />
					<br> 그룹장 :
					<c:out value="${grpInfo.grpLeader }" />
					<br> 카테고리 :
					<c:out value="${grpInfo.grpCate }" />
					<br> 개설일자 :
					<c:out value="${grpInfo.grpRegDate }" />
					<br> 그룹 소개 :
					<c:out value="${grpInfo.grpIntro }" />
				</div>
				<form id="grpJoin" action="/moigo/group/${grpName }/joingroup"
					method="post">
					<input type="hidden" id="grpName" name="grpName"
						value="${grpName }"> <input type="submit"
						onclick="joinGroup(); return false;" value="모임 가입하기" />
				</form>
			</c:if>
		</div>
	</c:if>
</body>
</html>