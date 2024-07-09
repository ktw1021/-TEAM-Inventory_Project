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
        <h1>발주 승인</h1>
        <h3><a href="/admins/order_chek_detail.html">발주 상세</a></h3>
        <table>
            <tr>
                <th>발주 번호</th>
                <th>지점명</th>
                <th>교재명</th>
                <th>수량</th>
                <th>발주일</th>
                <th>상태</th>
                <th>작업</th>
            </tr>
            <tr>
                <td>ORD001</td>
                <td>서울 강남점</td>
                <td>국어 기본서</td>
                <td>50</td>
                <td>2024-07-06</td>
                <td>대기중</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>ORD002</td>
                <td>부산 해운대점</td>
                <td>수학 문제집</td>
                <td>30</td>
                <td>2024-07-05</td>
                <td>대기중</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>ORD003</td>
                <td>대구 중앙점</td>
                <td>영어 단어장</td>
                <td>40</td>
                <td>2024-07-04</td>
                <td>대기중</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>ORD004</td>
                <td>인천 송도점</td>
                <td>과학 실험서</td>
                <td>25</td>
                <td>2024-07-03</td>
                <td>대기중</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
            <tr>
                <td>ORD005</td>
                <td>광주 상무점</td>
                <td>사회 참고서</td>
                <td>35</td>
                <td>2024-07-02</td>
                <td>대기중</td>
                <td>
                    <button class="approve">승인</button>
                    <button class="reject">반려</button>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>