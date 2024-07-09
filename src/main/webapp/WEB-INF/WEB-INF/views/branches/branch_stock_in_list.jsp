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

        .form-group {
            margin-bottom: 15px;
        }

        button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp" %>
    <div class="content">
        <h1>입고</h1>
        <h3><a href="/branches/branch_stock_in_detail.html">입고 기록</a></h3>
        <table>
            <tr>
                <th>발주 번호</th>
                <th>교재명</th>
                <th>주문 수량</th>
                <th>입고 수량</th>
                <th>상태</th>
                <th>작업</th>
            </tr>
            <tr>
                <td>ORD001</td>
                <td>국어 기본서</td>
                <td>10</td>
                <td><input type="number" value="10" min="0"></td>
                <td>대기 중</td>
                <td><button>입고 확인</button></td>
            </tr>
            <tr>
                <td>ORD001</td>
                <td>수학 문제집</td>
                <td>5</td>
                <td><input type="number" value="5" min="0"></td>
                <td>대기 중</td>
                <td><button>입고 확인</button></td>
            </tr>
        </table>

        
    </div>
</body>