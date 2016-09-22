<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="content">
	<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
	<form:form commandName="registerRequest"
		action="${contextPath}/member/regist">
		<p>
			<form:input path="email" class="txt"
				style="height: 40px; font-size:24pt;" placeholder="이메일" />
			<form:errors path="email" />
		</p>
		<p>
			<label>&nbsp;</label>
		</p>
		<p>
			<form:input path="name" class="txt"
				style="height: 40px; font-size:24pt;" placeholder="이름" />
			<form:errors path="name" />
		</p>
		<p>
			<label>&nbsp;</label>
		</p>
		<p>
			<form:password path="password" class="txt"
				style="height: 40px; font-size:24pt;" placeholder="비밀번호" />
			<form:errors path="password" />
		</p>
		<p>
			<label>&nbsp;</label>
		</p>
		<p>
			<form:password path="confirmPassword" class="txt"
				style="height: 40px; font-size:24pt;" placeholder="비밀번호 확인" />
			<form:errors path="confirmPassword" />
		</p>
		<p>
			<label>&nbsp;</label>
		</p>
		<p>
			<input type="submit"
				style="width: 200px; height: 50px; font-size: 20px; font-weight: bold; color: white; background: linear-gradient(to bottom, #73b95f, #5b9248);"
				value="가입하기" />
		</p>
	</form:form>
</div>