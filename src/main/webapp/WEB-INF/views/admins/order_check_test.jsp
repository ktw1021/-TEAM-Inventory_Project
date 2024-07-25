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
<script src="<c:url value='/javascript/check.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>
	<div class="content">
		<h1>발주서</h1>
		<div>
			<h5 class="parent" style="text-align: left;">
				<a href="<c:url value='/admin/ordercheck/list'/>">발주 리스트 돌아가기</a>
			</h5>
			<button type="button" onclick="downloadCSV()">CSV 다운로드</button>
			<button type="button" onclick="redirectToUrl('<c:url value='/admin/ordercheck/order'/>')">발주 확정</button>
		</div>
		<table id="orderTable" border="1">
		    <tr>
		        <th>교재명</th>
		        <c:forEach items="${branchList}" var="branch">
		            <th>${branch.branchName}</th>
		        </c:forEach>
		        <th>수량</th>
		    </tr>
    		<c:forEach items="${bookBranchQuantities}" var="entry">
        		<tr>
            		<td>${entry.key}</td>
            		<c:forEach items="${branchList}" var="branch">
                		<td>
                    		<c:out value="${entry.value[branch.branchId] != null ? entry.value[branch.branchId] : 0}" />
                		</td>
            		</c:forEach>
            		<td>
                		<c:out value="${bookTotalQuantities[entry.key] != null ? bookTotalQuantities[entry.key] : 0}" />
            		</td>
        		</tr>
    		</c:forEach>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
