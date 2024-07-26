<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
		<div class="order-history">
			<h1>주문번호: ${orderId }</h1>
				<p><a href="<c:url value="/branch/order/list" />">발주 기록</a></p>
			<table>
				<tr>
					<th>책 이름</th>
					<th>수량</th>
					<th>가격</th>
				</tr>

				<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.bookName }</td>
						<td>${vo.quantity }</td>
						<td><fmt:formatNumber value="${vo.price}" pattern="#,##0"/></td>
					</tr>
					<c:set var="totalQuantity" value="${totalQuantity + (vo.quantity)}" />
					<c:set var="totalPrice"
						value="${totalPrice + (vo.price * vo.quantity)}" />
				</c:forEach>
				<tr>
					<td><strong>총합</strong></td>
					<td><strong>${totalQuantity}</strong></td>
					<td><strong><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/></strong></td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>