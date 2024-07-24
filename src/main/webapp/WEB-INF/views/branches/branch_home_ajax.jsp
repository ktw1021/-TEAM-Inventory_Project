<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>지점 관리 시스템</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">

<script src="<c:url value='/javascript/inven.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	
	<div class="content">
		<h1>${authUser.branchName} 지점의 교재 재고 현황</h1>
		<button id="downloadCSV">CSV 다운로드</button>
		<form id="search-form">
			<label for="keyword">검색어: </label><input type="text" name="keyword" value="${param.keyword == null ? '' : param.keyword.trim()}">
			<input type="checkbox" 	name="check" id="check" value="check" ${param.check == 'check' ? 'checked' : ''} />
			<label for="check">재고 있는 책만 보기</label>
			<input type="hidden" id="orderBy" name="orderBy" value="${param.orderBy}">
			<input type="submit" value="검색">
			<button type="button" onclick="resetKeyword()" class="add">초기화</button>
			<button type="button" id="resetOrderBy">정렬 초기화</button>
			<button type="button" id="toggleTable">테이블 바꾸기</button>
		</form>
		<br />
		<div id="table-container" class="table-container">
        <table id="inventory-table1" class="inventory-table">
            <!-- Table 1 content -->
        </table>
        <table id="inventory-table2" class="inventory-table">
            <!-- Table 2 content -->
        </table>
    </div>
		<p>
			<a href="<c:url value='/branch/order/list'/>">오더 리스트 보기</a>
		</p>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>
