<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header">
	<c:if test="${empty authInfo }">
		<div id="logo">logo</div>
		<div id="search">
			search 
			<input type="text" id="srchTxt" name="srchTxt" /> 
			<input type="button" id="srch" name="srch" value="검색" />
		</div>
		<div id="menus">
			<div class="">
			
			</div>
		</div>
		<div id="loginBox">
			login
			<input type="button" id="register" name="register" onclick="goRegister();" value="회원가입" />
			<input type="button" id="login" name="login" onclick="showLogin();" value="로그인" />
		</div>
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="logo">logo</div>
			<div id="search">
				search 
				<input type="text" id="srchTxt" name="srchTxt" /> 
				<input type="button" id="srch" name="srch" value="검색" />
			</div>
			<div id="menus">
				menus
			</div>
			<div id="loginBox">
				${authInfo.userName }님 반갑습니다.
				<input type="button" onclick="logout();" value="로그아웃" />
				<input type="button" onclick="" value="정보수정" />
				<c:if test="${authInfo.userID=='admin' }">
					<input type="button" value="관리자페이지" />
				</c:if>
			</div>
	</c:if>
</div>