<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Home: Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/users.css'/>">
    <script src="<c:url value='/javascript/users.js'/>"></script>
</head>
<body>
    <div class="container">
        <a href="<c:url value='/main'/>" class="back-button">뒤로가기</a>
        <h2>로그인</h2>
        <!-- 에러 메시지를 표시할 div 추가 -->
        <c:if test="${not empty sessionScope.errorMessage}">
            <div style = "color: red;" class="error-message">${sessionScope.errorMessage}</div>
            <c:remove var="errorMessage" scope="session"/>
        </c:if>
        <form id="login-form"
              name="loginform"
              method="POST"
              action="<c:url value='/user/login'/>"
              onsubmit="return validateLoginForm(event)">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <label class="block-label" for="username">아이디</label> 
            <input id="username" name="username" type="text" value=""> 

            <label class="block-label" for="password">패스워드</label> 
            <input id="password" name="password" type="password" value="">

            <sec:csrfInput/>

            <input type="submit" value="로그인">
        </form>
        <a href="<c:url value='/user/forgotPassword'/>">비밀번호를 잊어버리셨나요?</a> <!-- 비밀번호 찾기 링크 추가 -->
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const errorMessageElement = document.querySelector(".error-message");
            if (errorMessageElement) {
                alert(errorMessageElement.textContent);
            }
        });
    </script>
</body>
</html>
