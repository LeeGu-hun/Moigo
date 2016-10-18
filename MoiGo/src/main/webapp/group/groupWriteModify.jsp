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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Moigo</title>
</head>
<body onload="calendar()">
	<%@include file="/include/header.jsp"%>
	<%@include file="/include/loginBox2.jsp"%>
	<div id="content">
		<div id="writeBoard3" style="background: #ffffff; position: absolute; left: 550px; top: 200px;">	
			<form action="/moigo/group/${geulInfo.grpName }/groupWriteModify" method="post" enctype="multipart/form-data">
				<input type="hidden" id="grpName" name="grpName" value="${geulInfo.grpName }"/>
				<input type="hidden" id="brdSeq" name="brdSeq" value="${geulInfo.brdSeq }"/>
				<div style="padding-left: 20px; padding-top: 20px;">
					<input type="text" id="brdTitle" name="brdTitle" value="${geulInfo.brdTitle }" />
				</div><br>	
				<div style="padding-left: 20px;">
					<textarea cols="80" rows="20" id="brdContent"
						name="brdContent" style="resize: none;">${geulInfo.brdContent }</textarea>
				</div><br>
				<div style="padding-left: 20px;">
					<input type="file" id="brdThumbnail" name="brdThumbnail" class="MyButton" value="<%=request.getContextPath() %>/file/${geulIfno.brdThumbnail }"></input>
				</div>
				<div style="padding-right: 30px;">
					<input type="submit" style="float: right;" value="게시하기" class="MyButton"/>
				</div>				
			</form>
		</div>	
	</div>
</body>
</html>