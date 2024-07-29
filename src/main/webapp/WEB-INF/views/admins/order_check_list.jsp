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
    .admin-dropdown {
        position: relative;
        color: black;
        border: 1px solid #ddd;
        padding: 10px;
        cursor: pointer;
        font-size: 16px;
    }
    
    .admin-dropdown-content {
        display: none;
        position: absolute;
        background-color: white;
        top: 100%;
        left: 0;
        width: 100%;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    
    .admin-dropdown-content a {
        color: black;
        padding: 12px;
        background-color: white;
        text-decoration: none;
        display: block;
        text-align: center;
    }
    
    .admin-dropdown-content a:hover {
        background-color: #f1f1f1;
        text-decoration: underline;
    }
    
    .admin-dropdown:hover .admin-dropdown-content {
        display: block;
    }
    
    .admin-dropdown:hover {
        background-color: #b0b0b0;
    }

    td.clickable {
        cursor: pointer;
        padding: 10px 20px;
        text-align: center;
    }

    td.clickable:hover {
        background-color: #e0e0e0;
    }
    
    #order-form {
        position: fixed;
        top: 20%;
        right: 50px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    button {
        width: 100%;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
    <c:if test="${param.result == 'success'}">
        <div class="alert alert-success">
            작업이 성공적으로 완료되었습니다.
        </div>
    </c:if>
    <c:if test="${param.result == 'failure'}">
        <div class="alert alert-danger">
            작업이 실패했습니다. 다시 시도해 주세요.
        </div>
    </c:if>
    <div class="content">
        <h1>발주 기록</h1>
        <div id="order-form">
            <button onclick="redirectToUrl('<c:url value='/admin/ordercheck/view'/>')">종합 발주서 생성</button><br/>
            <button onclick="redirectToUrl('<c:url value='/admin/ordercheck/history'/>')">종합 발주 내역 확인</button>
        </div>
        <table>
            <tr>
                <th>주문 번호</th>
                <th class="admin-dropdown">
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
                    <div class="admin-dropdown-content">
                        <a href="#" onclick="submitWithBranchId(null)">모두 보기</a>
                        <c:forEach items="${branchList}" var="vo">
                            <a href="#" onclick="submitWithBranchId(${vo.branchId})">${vo.branchName}</a>
                        </c:forEach>
                    </div>
                </th>
                <th>주문 일자</th>
                <th>담당자</th>
                <th class="admin-dropdown">
                    <c:choose>
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
                    <div class="admin-dropdown-content">
                        <a href="#" onclick="submitWithChecked(null)">모두 보기</a>
                        <a href="#" onclick="submitWithChecked(0)">미확인</a>
                        <a href="#" onclick="submitWithChecked(1)">반려</a>
                        <a href="#" onclick="submitWithChecked(2)">확인 완료</a>
                        <a href="#" onclick="submitWithChecked(3)">발주 완료</a>
                    </div>
                </th>
                <th>상세보기</th>
            </tr>
            <c:forEach items="${list}" var="vo">
                <tr>
                    <td>${vo.orderId}</td>
                    <td class="clickable" onclick="submitWithBranchId(${vo.branchId})">${vo.branchName}</td>
                    <td>${vo.orderDate}</td>
                    <td>${vo.userName}</td>
                    <td class="clickable" onclick="submitWithChecked(${vo.checked})">
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
                    <td class="clickable" onclick="redirectToUrl('<c:url value='/admin/ordercheck/detail/${vo.orderId}'/>')">자세히 보기</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
