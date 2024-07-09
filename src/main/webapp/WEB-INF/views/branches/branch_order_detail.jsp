<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지점 관리 시스템</title>
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
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp" %>

    <div class="content">
        <div class="order-history">
            <h2>발주 기록</h2>
            <h3><a href="/branches/branch_order_list.html">발주</a></h3>
            <table>
                <tr>
                    <th>발주 번호</th>
                    <th>날짜</th>
                    <th>상태</th>
                </tr>
                <tr><td>ORD001</td><td>2024-07-05</td><td>처리 중</td></tr>
                <tr><td>ORD002</td><td>2024-07-04</td><td>완료</td></tr>
                <tr><td>ORD003</td><td>2024-07-03</td><td>완료</td></tr>
            </table>
        </div>
    </div>
</body>
</html>