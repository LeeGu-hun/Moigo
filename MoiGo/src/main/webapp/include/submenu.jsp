<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="submenu">
	<c:if test="${empty authInfo }">
		<div id="loginBox">
			<form action="login" method="post">
				아이디 <input type="text" id="userID" name="userID" /> <br> 비밀번호
				<input type="password" id="userPw" name="userPw" /> <br> <input
					type="button" onclick="goRegister();" value="회원가입" /> <input
					type="submit" value="로그인" />
			</form>
		</div>
	서브메뉴
	</c:if>
	<c:if test="${!empty authInfo }">
		<div id="loginBox">
			${authInfo.userNick }님 환영합니다.
			<input type="button" onclick="logout();" value="로그아웃" />
		</div>
	</c:if>
</div>