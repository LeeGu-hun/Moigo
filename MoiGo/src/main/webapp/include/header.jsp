<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css"
	rel="stylesheet">
<div id="header">
	<div id="logo">
		<a href="<c:url value='/' />"><span id="M">M</span>oi<span id="G">Go</span><span id="eMark">!</span></a>
	</div>
	<div id="search">
		<form action="/moigo/search" method="post">
			<input type="text" id="srchTxt" class="btn-style1" name="srchTxt"
				value="Search Here" onfocus="this.value=''" /> 
				<input type="submit"class="btn-style" id="srch" name="srch" value="검색" />
		</form>
	</div>
	<div id="menus">
		<div class="menus">
			<a href="<c:url value='/group' />"><img
				src="<%=request.getContextPath()%>/images/icons/myAccount.png"><br>나의그룹</a>
		</div>
		<div class="menus">
			<img src="<%=request.getContextPath()%>/images/icons/event.png"><br>나의일정
		</div>
		<div class="menus">
			<img src="<%=request.getContextPath()%>/images/icons/chat.png"><br>채팅
		</div>
		<div class="menus">
			<a href="<c:url value='/' />"><img
				src="<%=request.getContextPath()%>/images/icons/group.png"><br>추천그룹</a>
		</div>
		<div class="menus">
			<a href="<c:url value='/market' />"><img
				src="<%=request.getContextPath()%>/images/icons/market.png"><br>마켓</a>
		</div>
	</div>
	<div id="loginBox">
		<c:if test="${empty authInfo }">
			&nbsp;▶&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<input type="button" id="register" name="register"
				onclick="goRegister();" value="Join" class="btn-style" />
			&nbsp;<input type="button" id="login" name="login"
				onclick="showLogin();" value="Login" class="btn-style" />
		</c:if>

		<c:if test="${!empty authInfo }">
			<span style="color: black">${authInfo.userNick }</span>님 반갑습니다.
			<input type="button" class="btn-style" onclick="logout();"
				value="로그아웃" />
			<input type="button" class="btn-style" onclick="goModify();"
				value="정보수정" />
			<c:if test="${authInfo.userID=='admin' }">
				<input type="button" class="btn-style" value="관리자페이지" />
			</c:if>
		</c:if>
	</div>
</div>