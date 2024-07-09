<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
  
=======
>>>>>>> branch 'sungmin' of https://www.github.com/ktw1021/TEAM_Inventory_Project.git
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<<<<<<< HEAD
    
    <!-- 로그인 페이지:회원 이름과 비밀번호, 코드(1~7)를 확인 후 1일 경우, admin_home.html로 이동, 나머지는 branch_home.html로 이동-->
=======
>>>>>>> branch 'sungmin' of https://www.github.com/ktw1021/TEAM_Inventory_Project.git
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>환영합니다! 메인 페이지 - 로그인 및 회원가입</title>
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
    </style>
</head>
<body>
    <div class="container">
        <a href="/users/login.html" class="btn btn-login">로그인</a>
        <a href="/users/join.html" class="btn btn-signup">회원가입</a>
    </div>
</body>
</html>