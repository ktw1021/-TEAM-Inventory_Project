<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발주 페이지</title>
    <style>
        /* 이전 스타일 유지 */
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
        .order-form {
            margin-bottom: 20px;
        }
        .order-list {
            margin-top: 20px;
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
        <h1>발주 페이지</h1>
        <h3><a href="/branches/branch_order_detail.html">발주 기록</a></h3>
        <div class="order-form">
            <select>
                <option value="">교재 선택</option>
                <option value="book1">국어 기본서</option>
                <option value="book2">수학 문제집</option>
                <option value="book3">영어 단어장</option>
                <option value="book4">과학 실험서</option>
                <option value="book5">사회 참고서</option>
            </select>
            <input type="number" id="quantity" min="1" value="1">
            <button onclick="addToCart()">장바구니에 추가</button>
        </div>

        <div class="order-list">
            <table>
                <tr>
                    <th>교재명</th>
                    <th>수량</th>
                    <th>작업</th>
                </tr>
                <tr><td>국어 기본서</td><td>10</td><td><button>삭제</button></td></tr>
                <tr><td>수학 문제집</td><td>5</td><td><button>삭제</button></td></tr>
                <tr><td>영어 단어장</td><td>15</td><td><button>삭제</button></td></tr>
            </table>
            <button onclick="submitOrder()">발주 제출</button>
        </div>

    </div>

    <script>
        function addToCart() {
            // 장바구니에 항목을 추가하는 로직
        }

        function submitOrder() {
            // 발주를 제출하는 로직
        }
    </script>
</body>
</html>