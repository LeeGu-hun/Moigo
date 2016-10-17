<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Baloo+Da" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Comfortaa" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin	.css" />	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<%@include file="/include/header.jsp"%>
<%@include file="/include/loginBox2.jsp" %>
<div id="content">
	<c:if test="${empty authInfo }">
		관리자가 아닙니다.
	</c:if>
	<c:if test="${!empty authInfo }">
		<c:if test="${authInfo.userID!='admin' }">
			관리자가 아닙니다.
		</c:if>
		<c:if test="${authInfo.userID=='admin' }">
		<center>
		<br>
			<form action="admin" method="POST">
				<input type="text" id="txt" name="txt" <%if(request.getAttribute("txt")!=null){ %>value="${txt }"<%} %>>
				<select id="type" name="type">
					<c:if test="${!empty type }">
						<option value="userInfo" <%if(request.getAttribute("type").equals("userInfo")){ %>selected<%} %>>회원</option>
						<option value="group" <%if(request.getAttribute("type").equals("group")){ %>selected<%} %>>모임</option>
						<option value="market" <%if(request.getAttribute("type").equals("market")){ %>selected<%} %>>장터</option>
					</c:if>
					<c:if test="${empty type }">
						<option value="userInfo">회원</option>
						<option value="group">모임</option>
						<option value="market">장터</option>
					</c:if>
				</select>
				<input type="submit" value="검색"><br>
				<br>
			</form>
			<table border="1">
				<c:if test="${'userInfo' eq type }">
					<tr class="tableHead">
						<td>사용자ID</td>
						<td>이름</td>
						<td>닉네임</td>
						<td>비밀번호</td>
						<td>성별</td>
						<td>주소</td>
						<td>전화번호</td>
						<td>생일</td>
						<td>등록일</td>
					</tr>
					<c:forEach var="users" items="${results }">
						<tr>
							<td>${users.userID }</td>
							<td>${users.userName }</td>
							<td>${users.userNick }</td>
							<td>${users.userPw }</td>
							<td>${users.userGender }</td>
							<td>${users.userAddr }</td>
							<td>${users.userPhone }</td>
							<td>${users.userBirth }</td>
							<td>${users.userRegdate }</td>
						</tr>
					</c:forEach>			
				</c:if>
				<c:if test="${'group' eq type }">
					<tr class="tableHead">
						<td>모임명</td><td>모임장</td><td>모임공개여부</td><td>그룹인원</td><td>카테고리</td><td>그룹소개</td><td>그룹이미지</td><td>그룹등록일</td>
					</tr>
					<c:forEach var="groups" items="${results }">
						<tr>
							<td>${groups.grpName }</td>
							<td>${groups.grpLeader }</td>
							<td>${groups.grpOpen }</td>
							<td>${groups.grpNum }</td>
							<td>${groups.grpCate }</td>
							<td>${groups.grpIntro }</td>
							<td><img src="<%=request.getContextPath()%>/file/${groups.grpThumbnail }" style="width:100px; height: 100px;"></td>
							<td>${groups.grpRegDate }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${'market' eq type }">
					<tr class="tableHead">
						<td>판매코드</td><td>판매자</td><td>상품명</td><td>가격</td><td>내용</td><td>판매해당그룹</td><td>상품이미지</td><td>등록일</td>
					</tr>
					<c:forEach var="markets" items="${results }">
						<tr>
							<td>${markets.mktCode }</td>
							<td>${markets.mktSeller }</td>
							<td>${markets.mktPrName }</td>
							<td>${markets.mktPrice }</td>
							<td>${markets.mktContent }</td>
							<td>${markets.grpName }</td>
							<td><img src="<%=request.getContextPath()%>/file/${markets.mktThumbnail }" style="width:100px; height: 100px;"></td>
							<td>${markets.mktRegDate }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</center>
		</c:if>
	</c:if>
</div>
</body>
</html>