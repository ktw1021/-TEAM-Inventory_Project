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
.custom-dropdown {
    position: relative;
    color: black;
    border: 1px solid #ddd;
    padding: 10px;
    cursor: pointer;
    font-size: 16px;
}

.custom-dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    top: 100%;
    left: 0;
    width: 100%;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.custom-dropdown-content a {
    color: black;
    padding: 12px;
    background-color: white;
    text-decoration: none;
    display: block;
    text-align: center;
}

.custom-dropdown-content a:hover {
    background-color: #f1f1f1;
    text-decoration: underline;
}

.custom-dropdown:hover .custom-dropdown-content {
    display: block;
}

.custom-dropdown:hover {
    background-color: #b0b0b0;
}

/* 테이블 관련 스타일 */
.custom-table td.clickable {
    cursor: pointer;
    padding: 10px 20px; /* 기존 th와 동일한 패딩 */
    text-align: center;
}

/* 클릭 시 시각적 피드백 추가 */
.custom-table td.clickable:hover {
    background-color: #e0e0e0; /* 호버 시 색상 변경 */
}

/* 고정된 폼 스타일 */
.fixed-order-form {
    position: fixed;
    top: 20%; /* 페이지 상단에서의 위치 */
    right: 50px; /* 페이지 오른쪽에서의 위치 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 */
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
					<th class="custom-dropdown"><c:choose>
                            <c:when test="${param.userName != null && param.userName != ''}">
                                <c:forEach var="user" items="${userList}">
                                    <c:if test="${user.name == param.userName}">
                                        ${user.name} ▼
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>담당자 ▼</c:otherwise>
                        </c:choose>
                        <div class="custom-dropdown-content">
                            <a href="#" onclick="submitWithChecke(null)">모두 보기</a>
                            <c:forEach items="${userList}" var="vo">
                                <a href="#" onclick="submitWithChecke('${vo.name}')">${vo.name }</a>
                            </c:forEach>
                        </div>
                    </th>
					<th>상세보기</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.id}</td>
						<td>${vo.flucDate}</td>
						<td class="clickable" onclick="submitWithChecke('${vo.userName}')">${vo.userName}</td>
						<td class="clickable" onclick="redirectToUrl('<c:url value="/branch/stockout/detail/${vo.id }"/>')">자세히 보기</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
	<script src="<c:url value='/javascript/clickable.js'/>"></script>
</body>
</html>
