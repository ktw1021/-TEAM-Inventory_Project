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
        <h1>교재 재고 현황</h1>
        <table>
            <tr>
                <th>교재명</th>
                <th>재고 수량</th>
                <th>최근 업데이트</th>
            </tr>
            <tr><td>국어 기본서</td><td>50</td><td>2024-07-06</td></tr>
            <tr><td>수학 문제집</td><td>30</td><td>2024-07-06</td></tr>
            <tr><td>영어 단어장</td><td>75</td><td>2024-07-05</td></tr>
            <tr><td>과학 실험서</td><td>25</td><td>2024-07-04</td></tr>
            <tr><td>사회 참고서</td><td>40</td><td>2024-07-03</td></tr>
        </table>
    </div>
</body>
</html>