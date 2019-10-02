<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="./temp/boot.jsp"></c:import>
<html>
<head>
<title>Weekend 뭐해</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css"> 
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo/logo.png" />
<script type="text/javascript" src="./resources/js/home.js"></script>
<script type="text/javascript" src="./resources/js/gps.js"></script> <!-- GPS -->
</head>
<body>
<div id="wrap">
	<div id="header">
		<c:import url="./inc/header.jsp"></c:import>
	</div>
	<div id="container">
		<c:import url="./inc/container.jsp"></c:import>
	</div> 
	<div id="footer">
		<c:import url="./inc/footer.jsp"></c:import>
	</div>
</div>
<!-- 실시간 채팅 API -->
<script type="text/javascript" src="./resources/js/chat.js"></script>
</body>
</html>

