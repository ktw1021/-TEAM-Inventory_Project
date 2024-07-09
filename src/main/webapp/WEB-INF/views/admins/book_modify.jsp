<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

th, td {
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
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

	<div class="content">
		<form action="<c:url value="/admin/modify" />" method="POST">
			<input type="hidden" name="book_code" value="${vo.book_code }" />
			<table>
				<tr>

					<th>교재명</th>
					<th>가격</th>
					<th>과목 코드</th>
					<th>작업</th>
				</tr>

				<tr>

					<th><input type="text" name="book_name"
						value="${vo.book_name }"></th>
					<th><input type="text" name="price" value="${vo.price }"></th>
					<th><input type="text" name="kindcode" value="${vo.kindcode }"></th>
					<th><input type="submit" value="수정"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>