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
		<h2>출고 목록</h2>
		<p class="parent"><a href = "<c:url value="/branch/stockout/form"/>">출고 폼</a></p>
		<table border="1">
				<tr>
					<th>out_id</th>
					<th>date</th>
					<th>상세보기</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.id}</td>
						<td>${vo.flucDate}</td>
						<td class="parent"><a href = "<c:url value="/branch/stockout/detail/${vo.id }"/>">보러 가기</a></td>
					</tr>
				</c:forEach>
			</table>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>
