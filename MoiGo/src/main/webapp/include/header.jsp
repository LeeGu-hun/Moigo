<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<div id="logo">
		<a href="<c:url value='/' />">Moi<span id="M">Go</span>!</a>
	</div>
	<div id="search">
		<form action="/moigo/search" method="post">
			<input type="text" id="srchTxt" class="btn-style" name="srchTxt" size="10" value="Search Here" onfocus="this.value=''"/>
			<input type="submit" class="btn-style" id="srch" name="srch" value="검색" />
		</form>
	</div>
	<div id="menus">
		<div class="menus">
			<a href="<c:url value='/group' />"><img src="<%=request.getContextPath()%>/images/myAccount.png"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="<%=request.getContextPath()%>/images/event.png">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="<%=request.getContextPath()%>/images/chat.png">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/' />"><img src="<%=request.getContextPath()%>/images/group.png"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/market' />"><img src="<%=request.getContextPath()%>/images/market.png"></a>
		</div>
	</div>
	<div id="loginBox">
		<c:if test="${empty authInfo }">
			&nbsp;▶&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<input type="button" id="register" name="register" onclick="goRegister();" value="Join" class="btn-style" />
			&nbsp;<input type="button" id="login" name="login" onclick="showLogin();" value="Login" class="btn-style" />
		</c:if>
		<c:if test="${!empty authInfo }">
			${authInfo.userNick }님 반갑습니다.
			<input type="button" class="btn-style" onclick="logout();" value="로그아웃" />
			<input type="button" class="btn-style" onclick="goModify();" value="정보수정" />
			<c:if test="${authInfo.userID=='admin' }">
				<input type="button" class="btn-style" value="관리자페이지" />
			</c:if>
		</c:if>
	</div>
</div>