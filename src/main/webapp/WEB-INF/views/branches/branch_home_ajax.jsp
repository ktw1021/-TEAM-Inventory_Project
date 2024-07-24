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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/branches.css'/>">
<style>
/* 드래그 가능한 search-form 스타일 */
#search-form {
    cursor: move; /* 드래그 가능 커서 */
}
.mordan2 {
    position: sticky;
    top: 0;
    background-color: #f2f2f2;
    z-index: 9;
    cursor: pointer;
}
.mordan2:hover{
	background-color: #3e8e41;
	cursor: pointer;
}
.mordan-dropdown{
	position: relative;
    position: sticky;
    top: 0;
    background-color: #f2f2f2;
    z-index: 9;
    cursor: pointer;
}
.mordan-dropdown:hover{
	background-color: #3e8e41;
}
.mordan-dropdown:hover .dropdown-content{
	display: block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 10;
    top: 100%;
    left: 0;
    width: 100%;
}
.dropdown-content p {
    color: black;
    font-size: 12px;
    padding: 12px 5px;
    margin: 0;
    background-color: white;
    text-decoration: none;
    display: block;
    box-sizing: border-box;
    text-align: center;
}
.dropdown-content p:hover {
    background-color: #f1f1f1;
    text-decoration: underline;
}
</style>
<script src="<c:url value='/javascript/inven.js'/>"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	
	<div class="content">
		<h1>${authUser.branchName} 지점의 교재 재고 현황</h1>
		
		<form id="search-form">
			<label for="keyword">검색어: </label><input type="text" name="keyword" value="${param.keyword == null ? '' : param.keyword.trim()}">
			<input type="checkbox" 	name="check" id="check" value="check" ${param.check == 'check' ? 'checked' : ''} />
			<label for="check">재고 있는 책만 보기</label>
			<input type="hidden" id="orderBy" name="orderBy" value="${param.orderBy}">
			<input type="submit" value="검색">
			<button type="button" onclick="resetKeyword()">검색어 초기화</button>
			<button type="button" id="resetOrderBy">정렬 초기화</button>
			<button type="button" id="toggleTable">테이블 바꾸기</button>
			<input type="hidden" id="kindCode" name="kindCode" value="">
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
