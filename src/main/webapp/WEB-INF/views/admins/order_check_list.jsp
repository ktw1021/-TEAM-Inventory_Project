<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본사 관리 시스템</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admins.css'/>">
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
    <div class="content">
        <h1>발주 승인</h1>

        <table>
            <tr>
                <td class="parent" style="display: inline-block; margin-right: 10px; padding: 5px; background-color: #f0f0f0;">
                    <a href="<c:url value='/admin/ordercheck/list'/>">초기화</a>
                </td>
                <c:forEach items="${branchList}" var="vo">
                    <td class="parent" style="display: inline-block; margin-right: 10px; padding: 5px; background-color: #f0f0f0;">
                        <a href="<c:url value='/admin/ordercheck/list/${vo.branchId}'/>">${vo.branchName }</a>
                    </td>
                </c:forEach>
                <td class="parent" style="display: inline-block; margin-right: 10px; padding: 5px; background-color: #f0f0f0;">
                    <form action="${pageContext.request.contextPath}/admin/ordercheck/summary" method="get">
                        <button type="submit" class="btn btn-primary">승인된 발주상세요약</button>
                    </form>
                </td>
            </tr>
        </table>

        <table>
            <tr>
                <th>order_id</th>
                <th>branch_name</th>
                <th>order_date</th>
                <th>담당자</th>
                <th>order_check</th>
                <th>상세보기</th>
            </tr>
            <c:forEach items="${list}" var="vo">
                <tr>
                    <td>${vo.orderId}</td>
                    <td class="parent"><a href="<c:url value='/admin/ordercheck/list/${vo.branchId}'/>">${vo.branchName}</a></td>
                    <td>${vo.orderDate}</td>
                    <td>${vo.userName}</td>
                    <td>
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
                    <td class="parent"><a href="<c:url value='/admin/ordercheck/detail/${vo.orderId}'/>">보러가기</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
