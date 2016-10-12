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
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<style>
	#mask {  
	  	position: absolute;  
	  	z-index: 9000;  
	  	background-color: #000;  
	  	display: none;  
	  	left: 0;
	  	top: 0;
	}
	.window{
	  	display: none;
	  	position: absolute;  
	  	left: 550px;
	  	top: 200px;
		z-index: 10000;
	}
	.divClose{
		float: right;
		padding-top: 10px;
		padding-right: 10px;	
	}
	.close{
		text-decoration:none;
		color: green;
		font-weight: bold;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
	<script>
	function wrapWindowByMask(){
		// 화면의 높이와 너비를 구하기
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  
		// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width':maskWidth,'height':maskHeight});  
		// 70% 불투명
//		$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("fast",0.7);    
		// 글쓰기 div 띄우기
		$('.window').show();
	}
	$(document).ready(function(){
		// 어두운 화면 띄우기
		$('.openMask').click(function(e){
			e.preventDefault();
			wrapWindowByMask();
		});
		// 닫기 버튼을 눌렀을 때
		$('.divClose .close').click(function (e) {  
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
		$('#mask').one('touchstart', function () {  
		    $(this).unbind('click');
		});
	});
	
	</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body>
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
			<h2>~ Please Login First ~</h2>
			</div>
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="content">
			<c:if test="${joined }">
				<div id="Total">
					<div id="grpCalendar">
						<div id="grpInfo">
							<div id="gName">그룹명 : <c:out value="${grpInfo.grpName }" /></div>
							<div id="gCate">카테고리 : <c:out value="${grpInfo.grpCate }" /></div>
							<div id="gCount">그룹인원수 : <c:out value="${grpInfo.grpNum }" />명</div>
							<input type="button" id="btnWrite" herf="#" class="openMask" value="글쓰기" />
						</div>
						<div id="Calender"></div>
					</div>
					<div id="board">
						<c:forEach var="geulInfo" items="${geulInfo }"> 

						<div id="geul" style="margin: 0, auto;">
	 							<c:if test="${authInfo.userID == geulInfo.getBrdWriter() }">
									<!-- <div style="text-align: right;"><input type="button" onclick="boardDelete();" value="삭제하기" /></div> -->
									<a href="/group/${grpInfo.grpName }/delete"">삭제</a>
								</c:if>		
							<div id="info" style="float: left; width: 450px;">
								${authInfo.userNick }
								<input type="hidden" id="wGrpName" name="wGrpName" value="${grpInfo.grpName }" />
								글쓴이 : ${geulInfo.getBrdWriter() }<br>
								작성일 : ${geulInfo.getBrdRegDate() }<br>
								제목 : ${geulInfo.getBrdTitle() }<br>
								내용 : ${geulInfo.getBrdContent() }
							</div>
							<div style="float: left; width: 200px;">	
								<c:if test="${empty geulInfo.brdThumbnail }"></c:if>
								<c:if test="${!empty geulInfo.brdThumbnail }">
									<img src="<%=request.getContextPath() %>/file/${geulInfo.brdThumbnail}" style="width: 100px; height: 100px; "><br>
								</c:if>
							</div>	
						</div>
 					</c:forEach>
					</div>
					<div id="grpProduct">
						<c:forEach var="grpPrds" items="${grpPrd }">
							<div class="grpProducts">
								<img src="<%=request.getContextPath() %>/file/${grpPrds.mktThumbNail}" style="width: 100px; height: 100px; ">
								판매물품 : ${grpPrds.mktPrName }
							</div>
						</c:forEach>
					</div>
				</div>	
				<div id="mask"></div> <!-- 화면 불투명에 쓸 div -->
				<div class="window"> <!-- writeBoard -->
					<div id="writeBoard" style="background: white;">
						<div class="divClose"><a href="#" class="close" >Close</a></div><br>
						<form action="${grpInfo.grpName }/groupwrite" method="post" enctype="multipart/form-data"> 
							<input type="hidden" id="writer" name="writer" value="${authInfo.userID }" />
							<div style="padding-left: 20px;"><input type="text" id="writeTitle" name="writeTitle" placeholder="Title" /></div><br>
							<div style="padding-left: 20px;"><textarea cols="105" rows="20" id="writeContent" name="writeContent" placeholder="Content" style="resize: none;"></textarea></div><br>
							<div style="padding-left: 20px;"><input type="file" id="grpThumbnail" name="grpThumbnail" /></div><br>
							<div style="padding-right: 30px; "><input type="submit" style="float: right; " value="게시하기"/></div>
						</form>
					</div>			
				</div>
			</c:if>
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
					<br>
					그룹 소개 : <c:out value="${grpInfo.grpIntro }" />
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