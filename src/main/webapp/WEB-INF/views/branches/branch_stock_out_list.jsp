<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 관리 시스템</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/branches.css'/>">
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
<script src="<c:url value='/javascript/check.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
		<h1>${authUser.branchName } 지점 출고 기록</h1>
		<table border="1">
				<tr>
					<th>출고 번호</th>
					<th>출고일</th>
					<th>상세보기</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.id}</td>
						<td>${vo.flucDate}</td>
						<td class="clickable" onclick="redirectToUrl('<c:url value="/branch/stockout/detail/${vo.id }"/>')">보러 가기</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
	<script src="<c:url value='/javascript/clickable.js'/>"></script>
</body>
</html>
