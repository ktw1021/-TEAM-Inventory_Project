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
        <h1>회원 승인</h1>
        <h3><a href="/admins/user_list.html">회원 히스토리</a></h3>
        <table>
            <tr>
                <th>회원 ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>구분</th>
                <th>가입일</th>
                <th>작업</th>
            </tr>
            <tr>
                <td>USER001</td>
                <td>홍길동</td>
                <td>hong@example.com</td>
                <td>010-1234-5678</td>
                <td>지점</td>
                <td>2024-07-06</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>USER002</td>
                <td>김철수</td>
                <td>kim@example.com</td>
                <td>010-9876-5432</td>
                <td>본사</td>
                <td>2024-07-05</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>USER003</td>
                <td>이영희</td>
                <td>lee@example.com</td>
                <td>010-1111-2222</td>
                <td>지점</td>
                <td>2024-07-04</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>USER004</td>
                <td>박지민</td>
                <td>park@example.com</td>
                <td>010-3333-4444</td>
                <td>지점</td>
                <td>2024-07-03</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>USER005</td>
                <td>최유진</td>
                <td>choi@example.com</td>
                <td>010-5555-6666</td>
                <td>본사</td>
                <td>2024-07-02</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>