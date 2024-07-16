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

		<h2>${inId }입고 기록</h2>
		<table border="1">
			<tr>
				<th>date</th>
				<th>book_code</th>
				<th>book_name</th>
				<th>quantity</th>
				<th>check</th>
				<th>comments</th>
			</tr>
		
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.flucDate}</td>
						<td>${vo.bookCode}</td>
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
           				<td>${vo.comments}</td>
					</tr>
				</c:forEach>
			</table>
			
			<c:choose>
    			<c:when test="${check eq 0}">
        			<a href="<c:url value='/branch/stockin/confirm/${inId}' />">도착했어요~~</a>
    			</c:when>
    			<c:otherwise>
        		<!-- Do nothing or display alternative content -->
    			</c:otherwise>
			</c:choose>
			<p><a href ="<c:url value="/branch/stockin/list"/>">목록으로 돌아가기</a></p>
    </div>
</body>
</html>