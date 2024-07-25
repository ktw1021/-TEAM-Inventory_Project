<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>본사 관리 시스템</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admins.css'/>">
</head>
<body>
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
	<div class="content">
		<h1>발주 승인</h1>

		<table>
			<td class="parent"
				style="display: inline-block; /* 인라인 요소로 설정 */ margin-right: 10px; /* 링크 사이의 간격 조절 */ padding: 5px; /* 링크 내부 여백 설정 */ background-color: #f0f0f0;">
				<a href="<c:url value='/admin/ordercheck/list'/>">초기화</a>
			</td>
			<c:forEach items="${branchList}" var="vo">
				<td class="parent" style="display: inline-block; /* 인라인 요소로 설정 */ margin-right: 10px; /* 링크 사이의 간격 조절 */ padding: 5px; /* 링크 내부 여백 설정 */ background-color: #f0f0f0;">
					<a href="<c:url value='/admin/ordercheck/list/${vo.branchId}'/>">${vo.branchName }</a>
				</td>
			</c:forEach>
		</table>
		<table>
			<tr>
				<th>주문 번호</th>
				<th>지점명</th>
				<th>주문일</th>
				<th>담당자</th>
				<th>진행 상황</th>
				<th>상세보기</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.orderId}</td>
					<td class="parent"><a
						href="<c:url value='/admin/ordercheck/list/${vo.branchId}'/>">${vo.branchName}</a></td>
					<td>${vo.orderDate}</td>
					<td>${vo.userName }</td>
					<td><c:choose>
							<c:when test="${vo.checked eq 0}">
								<span style="color: red; font-weight: bold;">미확인</span>
							</c:when>
							<c:when test="${vo.checked eq 1}">
								<span style="color: orange; font-weight: bold;">반려</span>
							</c:when>
							<c:when test="${vo.checked eq 2}">
								<span style="color: green; font-weight: bold;">처리 완료</span>
							</c:when>
							<c:otherwise>알 수 없음</c:otherwise>
						</c:choose></td>
					<td class="parent"><a href="<c:url value='/admin/ordercheck/detail/${vo.orderId}'/>">보러가기</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
