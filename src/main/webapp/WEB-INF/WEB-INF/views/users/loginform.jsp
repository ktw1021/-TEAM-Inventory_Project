<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home: Login</title>
</head>
<body>
	<form id="login-form" 
		name="loginform" 
		method="POST" 
		action="<c:url value="/users/login"/>">
		
		<label class="block-label" for="name">아이디</label> 
		<input id="name" name="name" type="text" value=""> 

		<label class="block-label">패스워드</label> 
		<input name="password" type="password" value="">

		<input type="submit" value="로그인">
	</form>
    
	<p><a href = "<%=request.getContextPath()%>">초기화면으로 돌아가기</a></p>
</body>
</html>