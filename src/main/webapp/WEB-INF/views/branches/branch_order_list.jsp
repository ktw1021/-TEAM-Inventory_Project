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
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var success = '${success}'; // 서버에서 전달된 success 변수

    if (success === 'true') {
        alert('발주 성공!');
    } else if (success === 'false') {
        alert('발주 실패!');
    }

    // 나머지 코드
});
</script>

<style>
/* 네비게이션 바 및 드롭다운 스타일 */
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

</head>
<body>

    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

    <div class="content">
        <div class="order-history">
            <h1>${authUser.branchName }지점 발주 기록</h1>
            <table class="custom-table">
                <tr>
                    <th>발주 번호</th>
                    <th>날짜</th>
                    <th class="custom-dropdown"><c:choose>
                            <c:when test="${param.no != null && param.no != ''}">
                                <c:forEach var="user" items="${userList}">
                                    <c:if test="${user.no == param.no}">
                                        ${user.name} ▼
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>담당자 ▼</c:otherwise>
                        </c:choose>
                        <div class="custom-dropdown-content">
                            <a href="#" onclick="submitWithChecked(null)">모두 보기</a>
                            <c:forEach items="${userList}" var="vo">
                                <a href="#" onclick="submitWithChecked(${vo.no})">${vo.name }</a>
                            </c:forEach>
                        </div>
                    </th>
                    <th class="custom-dropdown"><c:choose>
                            <c:when test="${param.checked != null && param.checked != ''}">
                                <c:choose>
                                    <c:when test="${param.checked == '0'}">미확인 ▼</c:when>
                                    <c:when test="${param.checked == '1'}">반려 ▼</c:when>
                                    <c:when test="${param.checked == '2'}">처리 완료 ▼</c:when>
                                    <c:when test="${param.checked == '3'}">발주 완료 ▼</c:when>
                                    <c:otherwise>처리 여부 ▼</c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>처리 여부 ▼</c:otherwise>
                        </c:choose>
                        <div class="custom-dropdown-content">
                            <a href="#" onclick="submitWithCh(null)">모두 보기</a>
                            <a href="#" onclick="submitWithCh(0)">미확인</a>
                            <a href="#" onclick="submitWithCh(1)">반려</a>
                            <a href="#" onclick="submitWithCh(2)">확인 완료</a>
                            <a href="#" onclick="submitWithCh(3)">발주 완료</a>
                        </div>
                    </th>
                    <th>상세 보기</th>
                </tr>
                <c:forEach items="${list}" var="vo" varStatus="status">
                    <tr>
                        <td>${vo.orderId}</td>
                        <td>${vo.orderDate}</td>
                        <td class="clickable" onclick="submitWithChecked(${vo.no})">${vo.name}</td>
                        <td class="clickable" onclick="submitWithCh(${vo.checked})">
	                        <c:choose>
	                            <c:when test="${vo.checked eq 0}">
	                                <span style="color: #FF4C4C; font-weight: bold;">미확인</span>
	                            </c:when>
	                            <c:when test="${vo.checked eq 1}">
	                                <span style="color: #B0B0B0; font-weight: bold;">반려</span>
	                            </c:when>
	                            <c:when test="${vo.checked eq 2}">
	                                <span style="color: orange; font-weight: bold;">확인 완료</span>
	                            </c:when>
	                            <c:when test="${vo.checked eq 3}">
	                                <span style="color: green; font-weight: bold;">발주 완료</span>
	                            </c:when>
	                            <c:otherwise>알 수 없음</c:otherwise>
	                        </c:choose>
                    	</td>
                        <td class="clickable"
                            onclick="redirectToUrl('<c:url value="/branch/order/detail" />?orderId=${vo.orderId}')">보러
                            가기</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
    <script src="<c:url value='/javascript/clickable.js'/>"></script>
</body>
</html>