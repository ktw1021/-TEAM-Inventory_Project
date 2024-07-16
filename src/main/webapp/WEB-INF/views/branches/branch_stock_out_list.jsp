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
</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
		<h1>출고</h1>
		<h3>
			<a href="/branches/branch_stock_out_detail.html">출고 기록</a>
		</h3>

		<div class="form-group">
			<select>
				<option value="">교재 선택</option>
				<option value="book1">국어 기본</option>
				<option value="book2">수학 문제집</option>
				<option value="book3">영어 단어장</option>
				<option value="book4">과학 실험서</option>
				<option value="book5">사회 참고서</option>
			</select> <input type="number" placeholder="수량" min="1" value="1">
			<button>출고 목록에 추가</button>
		</div>

		<h2>출고 목록</h2>
		<table>
			<thead>
				<tr>
					<th>출고 ID</th>
					<th>교재명</th>
					<th>수량</th>
					<th>출고일</th>
					<th>비고</th>
					<th>지점 ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="stockOut" items="${stockOuts}">
					<tr>
						<td>${stockOut.outId}</td>
						<td>${stockOut.bookName}</td>
						<td>${stockOut.quantity}</td>
						<td>${stockOut.outDate}</td>
						<td>${stockOut.comments}</td>
						<td>${stockOut.branchId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button>출고 확인</button>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>
