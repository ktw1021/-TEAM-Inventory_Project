<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>환영합니다! 메인 페이지 - 로그인 및 회원가입</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
}

.container {
	text-align: center;
}

.btn {
	display: inline-block;
	padding: 10px 20px;
	margin: 10px;
	font-size: 16px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
	color: #fff;
}

.btn-login {
	background-color: #007bff;
}

.btn-signup {
	background-color: #28a745;
}

.btn-home {
	display: flex;
	align-items: center;
	position: absolute;
	top: 10px;
	left: 10px;
	background-color: #ffc107;
	color: #fff;
}

.btn-home i {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<a href="<c:url value='/branches' />" class="btn btn-home"> 
    	<i class="fas fa-home"></i> Branch Home</a>
		<a href="<c:url value='/users/login' />" class="btn btn-login">로그인</a>
		<a href="<c:url value='/users/join' />" class="btn btn-signup">회원가입</a>
	</div>
	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
