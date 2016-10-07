<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
</script>
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
			<c:out value="${grpInfo.grpName }" />
			<br>
			<c:out value="${grpInfo.grpLeader }" />
			<br>
			<c:out value="${grpInfo.grpCate }" />
			<br>
			<c:out value="${grpInfo.grpRegDate }" />
			<br>
			<c:out value="${grpInfo.grpIntro }" />
			<br> Please Login First
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="content">
			<c:if test="${joined }">
				<div id="brdTotal">
					<div id="grpCalendar">
						<div id="grpInfo">
							<div id="gName">그룹명 : <c:out value="${grpInfo.grpName }" /></div>
							<div id="gCate">카테고리 : <c:out value="${grpInfo.grpCate }" /></div>
							<div id="gCount">그룹인원수 : <c:out value="${grpInfo.grpNum }" />명</div>
							<input type="button" id="btnWrite" herf="#" class="openMask" value="글쓰기" />
						</div>
					</div>
				</div>	
				<div id="mask"></div> <!-- 화면 불투명에 쓸 div -->
				<div class="window"> <!-- writeBoard -->
					
					<div id="writeBoard" style="background: white;">
						<div class="divClose"><a href="#" class="close" >Close</a></div><br>
						<form action="${grpInfo.grpName }/groupwrite" method="post"> 
							<div style="padding-left: 20px;"><input type="text" id="writeTitle" placeholder="Title" /></div><br>
							<div style="padding-left: 20px;"><textarea cols="105" rows="20" id="writeContent" placeholder="Content"></textarea></div><br>
							<div style="padding-right: 30px; "><input type="submit" style="float: right; " value="게시하기"/></div>
						</form>
					</div>			
				<div id="Calender"></div>
				</div>
				<div id="board">
 					<c:forEach var="geulInfo" items="${geulInfo }"> 
						<div id="geul">					
							<div id="info">
								<div id="writer">글쓴이 : ${geulInfo.getBrdWriter() }</div><p>
								<div id="writedDte">작성일 : ${geulInfo.getBrdRegDate() }</div>
							</div><br>
							<div id="naeyong">내용 : ${geulInfo.getBrdContent() }</div>
						</div>
 					</c:forEach>
				</div>
				<div id="grpProduct">
					abc3
				</div>
		</div>
	</c:if>
	<c:if test="${!joined }">
		false test
		<form id="grpJoin" action="/moigo/group/${grpName }/joingroup" method="post">
			<input type="hidden" id="grpName" name="grpName" value="${grpName }">
			<input type="submit" onclick="joinGroup(); return false;" value="모임 가입하기"/>
		</form>
	</c:if>
</div>
</c:if>
</body>
</html>