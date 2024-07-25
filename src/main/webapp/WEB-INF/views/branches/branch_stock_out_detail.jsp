<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 관리 시스템</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
<script src="<c:url value='/javascript/check.js'/>"></script>
<style>
.content a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #333333; /* 검은색으로 변경 */
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.content a:hover {
	background-color: #000000; /* 더 짙은 검은색으로 변경 */
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
		<h1>출고 번호: ${outId }</h1>
		<table border="1">
			<tr>
				<th>출고일</th>
				<th>교재 코드</th>
				<th>교재명</th>
				<th>수량</th>
				<th>사유</th>
			</tr>
					
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.flucDate}</td>
					<td>${vo.bookCode}</td>
					<td>${vo.bookName}</td>
					<td>${vo.quantity}</td>

           			<td>${vo.comments}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="back-link">
			<a href="javascript:void(0);" onclick="goBack();">이전 페이지로 돌아가기</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>