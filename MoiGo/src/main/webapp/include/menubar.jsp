<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Moigo</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menubar.css" />
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/menubar.js"></script>
</head>
<body>

<div data-role="slider" data-width="650" data-height="121">
	<div class="container">
		<div class="item">
			<h1>Header 1</h1>
			<p>Gallery is...</p>
		</div>
		<div class="item">
			<h1>Header 2</h1>
			<p>Gallery is...</p>
		</div>
		<div class="item">
			<h1>Header 3</h1>
			<p>Gallery is...</p>
		</div>
		<div class="item">
			<h1>Header 4</h1>
			<p>Gallery is...</p>
		</div>
	</div>
</div>

<button id="left-button">←</button>
<button id="right-button">→</button>

</body>
</html>

