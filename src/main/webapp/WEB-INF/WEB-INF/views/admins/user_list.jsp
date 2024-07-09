<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본사 관리 시스템</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #333;
            padding: 10px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
        }

        .content {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }

        .approve {
            background-color: #4CAF50;
            color: white;
        }

        .reject {
            background-color: #f44336;
            color: white;
        }

        .add {
            background-color: #008CBA;
            color: white;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp" %>

    <div class="content">
        <h1>회원 승인 히스토리</h1>
        <h3><a href="/admins/confirm_list.html">회원 승인</a></h3>
        <table>
            <tr>
                <th>회원 ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>구분</th>
                <th>가입일</th>
                <th>승인 상태</th>
                <th>처리일</th>
            </tr>
            <tr>
                <td>USER006</td>
                <td>송민수</td>
                <td>song@example.com</td>
                <td>010-7777-8888</td>
                <td>지점</td>
                <td>2024-07-01</td>
                <td>승인</td>
                <td>2024-07-02</td>
            </tr>
            <tr>
                <td>USER007</td>
                <td>정다혜</td>
                <td>jung@example.com</td>
                <td>010-9999-0000</td>
                <td>본사</td>
                <td>2024-06-30</td>
                <td>승인</td>
                <td>2024-07-01</td>
            </tr>
            <tr>
                <td>USER008</td>
                <td>강현우</td>
                <td>kang@example.com</td>
                <td>010-2222-3333</td>
                <td>지점</td>
                <td>2024-06-29</td>
                <td>반려</td>
                <td>2024-06-30</td>
            </tr>
            <tr>
                <td>USER009</td>
                <td>윤서연</td>
                <td>yoon@example.com</td>
                <td>010-4444-5555</td>
                <td>지점</td>
                <td>2024-06-29</td>
                <td>반려</td>
                <td>2024-06-30</td>
            </tr>
        </table>
    </div>
</body>

</html>