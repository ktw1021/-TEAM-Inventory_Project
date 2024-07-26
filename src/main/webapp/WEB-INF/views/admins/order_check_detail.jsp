<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>본사 관리 시스템</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/admins.css'/>">
<script src="<c:url value='/javascript/check.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
	<div class="content">
		<h1>${id }번 order detail</h1>
		<table>
			<tr>
				<th>주문 번호</th>
				<th>지점명</th>
				<th>주문일</th>
				<th>교재명</th>
				<th>수량</th>
				<th>진행 상황</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.orderId}</td>
					<td>${vo.branchName}</td>
					<td>${vo.orderDate}</td>
					<td>${vo.bookName}</td>
					<td>${vo.quantity}</td>
					<td><c:choose>
						<c:when test="${vo.checked eq 0}">미확인</c:when>
						<c:when test="${vo.checked eq 1}">반려</c:when>
						<c:when test="${vo.checked eq 2}">확인 완료</c:when>
						<c:when test="${vo.checked eq 3}">발주 완료</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		<c:choose>
			<c:when test="${checked eq 0}">
				<p class="delete"><a href="<c:url value='/admin/ordercheck/refuse/${id}'/>" class="delete">반려</a></p>
				<p class="update"><a href="<c:url value='/admin/ordercheck/confirm/${id}'/>" class="update">승인</a>	</p>
			</c:when>
			<c:when test="${checked eq 2}">
				<p class="delete"><a href="<c:url value='/admin/ordercheck/refuse/${id}'/>" class="delete">반려</a></p>
			</c:when>
		</c:choose>
		<div class="back-link">
			<a href="javascript:void(0);" onclick="goBack();">이전 페이지로 돌아가기</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
