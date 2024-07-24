<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="<c:url value='/javascript/users.js'/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/users.css'/>">
</head>
<body>
    <div class="container">
        <a href="javascript:history.back()" class="back-button">뒤로가기</a>
        <h2>회원가입</h2>
        <form id="joinForm" action="<c:url value='/user/join'/>" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <label for="name">사용자 아이디:</label>
            <input type="text" id="name" name="name" required>
            <input type="button" id="checkName" data-target="<c:url value='/user/checkName'/>" value="이름 중복 체크"><br>
            <input type="hidden" name="checkedName" value="n">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
            <div id="strengthBarContainer">
                <div class="strengthBarSegment"></div>
                <div class="strengthBarSegment"></div>
                <div class="strengthBarSegment"></div>
                <div class="strengthBarSegment"></div>
                <div class="strengthBarSegment"></div>
            </div>
            <span id="strengthText"></span>
            <label for="confirmPassword">비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <span id="passwordMismatch">비밀번호가 일치하지 않습니다.</span>
            <label for="branchId">지점명:</label>
            <select id="branchId" name="branchId" required>
                <c:forEach var="branch" items="${branches}">
                    <option value="${branch.branchId}">${branch.branchName}</option>
                </c:forEach>
            </select>
            <button type="submit">회원가입</button>
        </form>
    </div>
</body>
</html>
