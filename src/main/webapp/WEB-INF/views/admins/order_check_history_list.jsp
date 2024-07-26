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
<style>
    td.clickable {
	    cursor: pointer;
	    padding: 10px 20px; /* 기존 th와 동일한 패딩 */
	    text-align: center;
	}

	/* 클릭 시 시각적 피드백 추가 */
	td.clickable:hover {
	    background-color: #e0e0e0; /* 호버 시 색상 변경 */
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
	<div class="content">
		<h1>종합 발주 이력</h1>
		<table>
			<tr>
				<th>번호</th>
				<th>주문 번호</th>
				<th>발주 승인 날짜</th>
				<th>비고</th>
			</tr>
			<c:forEach items ="${list }" var = "vo">
				<tr>
					<td>${vo.branchId }</td>
					<td>${vo.orderId }</td>
					<td>${vo.orderDate }</td>
					<td class="clickable" onclick="redirectToUrl('<c:url value='/admin/ordercheck/view'/>?order_ids=${vo.orderId }')">자세히 보기</td>
				</tr>
			</c:forEach>
			
		</table>
		
		<div class="back-link">
			<a href="<c:url value='/admin/ordercheck'/>">발주 승인 페이지로 돌아가기</a>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
