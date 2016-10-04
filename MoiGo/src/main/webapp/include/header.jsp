<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<c:if test="${empty authInfo }">
		<div id="logo">
			<a href="<c:url value='/' />">Moi<span id="M">Go</span>!</a>
		</div>
		<div id="search">
			<input type="text" id="srchTxt" class="btn-style" name="srchTxt" size="10" value="Search Here" onfocus="this.value=''"/>
			<input type="button" class="btn-style" id="srch" name="srch" value="검색" />
		</div>
		<div id="menus">
			<div class="menus">
				<a href="<c:url value='/' />"><img src="<%=request.getContextPath()%>/images/myAccount.png"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=request.getContextPath()%>/images/event.png">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=request.getContextPath()%>/images/chat.png">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/group' />"><img src="<%=request.getContextPath()%>/images/group.png"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=request.getContextPath()%>/images/market.png">
			</div>
		</div>
		<div id="loginBox">
			&nbsp;▶&nbsp;&nbsp;&nbsp;&nbsp;login
			&nbsp;&nbsp;&nbsp;
			<input type="button" id="register" name="register" onclick="goRegister();" value="Join" class="btn-style" />
			&nbsp;<input type="button" id="login" name="login" onclick="showLogin();" value="Login" class="btn-style" />
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="logo">
			<a href="<c:url value='/' />">Moi<span id="M">Go</span>!</a>
		</div>
			<div id="search">
				<input type="text" id="srchTxt" class="btn-style" name="srchTxt" size="10" value="Search Here" onfocus="this.value=''"/>
				<input type="button" class="btn-style" id="srch" name="srch" value="검색" />
			</div>
			<div id="menus">
				<div class="menus">
					<a href="<c:url value='/' />"><img src="<%=request.getContextPath()%>/images/myAccount.png"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<%=request.getContextPath()%>/images/event.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<%=request.getContextPath()%>/images/chat.png">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/group' />"><img src="<%=request.getContextPath()%>/images/group.png"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<%=request.getContextPath()%>/images/market.png">
				</div>
			</div>
			<div id="loginBox">
				${authInfo.userNick }님 반갑습니다.
				<input type="button" class="btn-style" onclick="logout();" value="로그아웃" />
				<input type="button" class="btn-style" onclick="goModify();" value="정보수정" />
				<c:if test="${authInfo.userID=='admin' }">
					<input type="button" class="btn-style" value="관리자페이지" />
				</c:if>
			</div>
	</c:if>
</div>