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
        <h1>발주 히스토리</h1>
        <h3><a href="/admins/order_check_list.html">발주 리스트</a></h3>
        <table>
            <tr>
                <th>발주 번호</th>
                <th>지점명</th>
                <th>교재명</th>
                <th>수량</th>
                <th>발주일</th>
                <th>상태</th>
                <th>처리일</th>
            </tr>
            <tr>
                <td>ORD006</td>
                <td>서울 강남점</td>
                <td>국어 기본서</td>
                <td>50</td>
                <td>2024-07-01</td>
                <td>승인</td>
                <td>2024-07-02</td>
            </tr>
            <tr>
                <td>ORD007</td>
                <td>부산 해운대점</td>
                <td>수학 문제집</td>
                <td>30</td>
                <td>2024-06-30</td>
                <td>승인</td>
                <td>2024-07-01</td>
            </tr>
            <tr>
                <td>ORD008</td>
                <td>대구 중앙점</td>
                <td>영어 단어장</td>
                <td>40</td>
                <td>2024-06-29</td>
                <td>반려</td>
                <td>2024-06-30</td>
            </tr>
            <tr>
                <td>ORD009</td>
                <td>인천 송도점</td>
                <td>과학 실험서</td>
                <td>25</td>
                <td>2024-06-28</td>
                <td>승인</td>
                <td>2024-06-29</td>
            </tr>
            <tr>
                <td>ORD010</td>
                <td>광주 상무점</td>
                <td>사회 참고서</td>
                <td>35</td>
                <td>2024-06-27</td>
                <td>승인</td>
                <td>2024-06-28</td>
            </tr>
        </table>



    </div>
</body>

</html>