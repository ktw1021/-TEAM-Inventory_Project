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
<script>
    function submitWithChecked(checked) {
        var url = new URL(window.location.href);
        if (checked === null) {
            url.searchParams.delete('checked');
        } else {
            url.searchParams.set('checked', checked);
        }
        window.location.href = url.toString();
    }

    function submitWithBranchId(branchId) {
        var url = new URL(window.location.href);
        if (branchId === null) {
            url.searchParams.delete('branchId');
        } else {
            url.searchParams.set('branchId', branchId);
        }
        window.location.href = url.toString();
    }
    function redirectToUrl(url) {
        window.location.href = url;
    }
</script>
<style>
    .dropdown {
        position: relative;
        color: black;
        border: 1px solid #ddd;
        padding: 10px;
        cursor: pointer;
        font-size: 16px;
    }
    
    .dropdown-content {
        display: none;
        position: absolute;
        background-color: white;
        top: 100%;
        left: 0;
        width: 100%;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    
    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        background-color: white;
        text-decoration: none;
        display: block;
        text-align: center;
    }
    
    .dropdown-content a:hover {
        background-color: #f1f1f1;
        text-decoration: underline;
    }
    
    .dropdown:hover .dropdown-content {
        display: block;
    }
    
    .dropdown:hover {
        background-color: #3e8e41;
    }

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
        <h1>발주 승인</h1>

        <table>
            <tr>
                <th>order_id</th>
                <th class="dropdown">
				<c:choose>
				    <c:when test="${param.branchId != null && param.branchId != ''}">
				        <c:forEach items="${branchList}" var="vo">
				            <c:if test="${vo.branchId == param.branchId}">
				                ${vo.branchName} ▼
				            </c:if>
				        </c:forEach>
				    </c:when>
				    <c:otherwise>지점명 ▼</c:otherwise>
				</c:choose>
                <div class="dropdown-content">
                    <a href="#" onclick="submitWithBranchId(null)">모두 보기</a>
                    <c:forEach items="${branchList}" var="vo">
                        <a href="#" onclick="submitWithBranchId(${vo.branchId})">${vo.branchName }</a>
                    </c:forEach>
                </div>
                </th>
                <th>order_date</th>
                <th>담당자</th>
                <th class="dropdown">
                    <c:choose>
                        <c:when test="${param.checked != null && param.checked != ''}">
                            <c:choose>
                                <c:when test="${param.checked == '0'}">미확인 ▼</c:when>
                                <c:when test="${param.checked == '1'}">반려 ▼</c:when>
                                <c:when test="${param.checked == '2'}">처리 완료 ▼</c:when>
                                <c:otherwise>처리 여부 ▼</c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>처리 여부 ▼</c:otherwise>
                    </c:choose>
                    <div class="dropdown-content">
                        <a href="#" onclick="submitWithChecked(null)">모두 보기</a>
                        <a href="#" onclick="submitWithChecked(0)">미확인</a>
                        <a href="#" onclick="submitWithChecked(1)">반려</a>
                        <a href="#" onclick="submitWithChecked(2)">처리 완료</a>
                    </div>
                </th>
                <th>상세보기</th>
            </tr>
            <c:forEach items="${list}" var="vo">
                <tr>
                    <td>${vo.orderId}</td>
                    <td class="clickable" onclick="submitWithBranchId(${vo.branchId})">${vo.branchName}</td>
                    <td>${vo.orderDate}</td>
                    <td>${vo.userName }</td>
                    <td class="clickable" onclick="submitWithChecked(${vo.checked})">
                    	<c:choose>
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
                        </c:choose>
					</td>
                    <td class="clickable" onclick="redirectToUrl('<c:url value='/admin/ordercheck/detail/${vo.orderId}'/>')">보러가기</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
