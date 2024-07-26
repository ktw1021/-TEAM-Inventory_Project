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
</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">

		<h2>${inId }입고 기록</h2>
		<table border="1">
			<tr>
				<th>입고일</th>
				<th>교재명</th>
				<th>수량</th>
				<th>진행 상황</th>
			</tr>

				<c:forEach items="${list }" var="vo">
					<tr>
						<td>
							<c:choose>
						        <c:when test="${vo.flucDate == ''}">
						            미정
						        </c:when>
						        <c:otherwise>
						            ${vo.flucDate}
						        </c:otherwise>
					    	</c:choose>
					    </td>
						<td>${vo.bookName}</td>
						<td>${vo.quantity}</td>
						<td>
						<c:choose>
							<c:when test="${vo.checkedIn eq -1}">처리 완료</c:when>
                			<c:when test="${vo.checkedIn eq 0}">미확인</c:when>
                			<c:when test="${vo.checkedIn eq 1}">처리 완료</c:when>
                			<c:otherwise>알 수 없음</c:otherwise>
           				</c:choose>
           				</td>
					</tr>
				</c:forEach>
			</table>

			
		<c:choose>
   			<c:when test="${check eq 0}">
       			<a href="<c:url value='/branch/stockin/confirm/${inId}' />" id="take">도착했어요~~</a>
   			</c:when>
   			<c:otherwise>
       		<!-- Do nothing or display alternative content -->
   			</c:otherwise>
		</c:choose>
		<div class="back-link">
			<a href="javascript:void(0);" onclick="goBack();">이전 페이지로 돌아가기</a>
		</div>
    </div>
    <%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>