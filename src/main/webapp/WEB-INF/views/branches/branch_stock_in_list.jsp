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
		<h1>${user.branchName } 지점 입고 기록</h1>
		
		<table border="1">
			<tr>
				<th>입고 번호</th>
				<th>주문 번호</th>
				<th>입고일</th>
				<th>진행 상황</th>
				<th>상세보기</th>
			</tr>

			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.id}</td>
					<td><c:choose>
							<c:when test="${vo.orderId eq -1 }">임의 입고</c:when>
							<c:otherwise>${vo.orderId}</c:otherwise>
						</c:choose></td>
					<td>${vo.flucDate}</td>
					<td><c:choose>
							<c:when test="${vo.checkedIn eq -1}">처리 완료</c:when>
							<c:when test="${vo.checkedIn eq 0}">미확인</c:when>
							<c:when test="${vo.checkedIn eq 1}">처리 완료</c:when>
							<c:otherwise>알 수 없음</c:otherwise>
						</c:choose></td>

					<td class="parent"><a
						href="<c:url value="/branch/stockin/detail/${vo.id }"/>">보러 가기</a></td>
				</tr>
			</c:forEach>
		</table>
		<h6 class="parent">
			<a href="<c:url value="/branch/initial/setting/form"/>">재고 설정 페이지</a>
		</h6>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>