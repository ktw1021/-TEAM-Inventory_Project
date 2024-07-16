<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<div class="content">
		<div class="order-history">
			<h2>발주 기록</h2>
			<h3>
				<a href="<c:url value="/branch/order/form" />">발주</a>
			</h3>
			<table>
				<tr>
					<th>발주 번호</th>
					<th>날짜</th>
					<th>담당자</th>
					<th>상태</th>
				</tr>
				<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td><a href="<c:url value="/branch/order/detail" />?orderId=${vo.orderId}">${vo.orderId }</a></td>
						<td>${vo.orderDate }</td>
						<td>${vo.userName }</td>
						<c:choose>
							<c:when test="${vo.checked eq 0}">
								<td style="color: red;">미확인</td>
							</c:when>
							<c:when test="${vo.checked eq 1}">
								<td style="color: blue;">처리중</td>
							</c:when>
							<c:when test="${vo.checked eq 2}">
								<td style="color: green;">도착</td>
							</c:when>
							<c:otherwise>
								<td>????</td>
							</c:otherwise>
						</c:choose>

					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>