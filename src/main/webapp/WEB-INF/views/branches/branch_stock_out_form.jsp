<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>소비 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
<script src="<c:url value='/javascript/stout.js'/>"></script>

</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
	<h1>출고 처리</h1>

	<form id="search-form">
		<label for="keyword">검색어: </label>
		<input type="text" id ="keyword" name="keyword" value="${param.keyword == null ? '' : param.keyword.trim()}">
		<input type="submit" value="검색">
		<button type="button" onclick="resetKeyword()" class="add">초기화</button>
		<button type="button" onclick="showConfirmationModal()" class="update">확정</button>
		<div id="gije"></div>
	</form>

    <table id="table">
        <thead>
            <tr>
            	<th>번호</th>
            	<th>분류</th>
                <th>교재명</th>
                <th>수량</th>
                <th>작업</th>
                <th>코멘트</th>
            </tr>
        </thead>
        <tbody id="table-body">
        </tbody>
    </table>

	<div id="confirmationModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>소비 처리 확인</h2>
            <div id="modal-body">
            </div>
            <button type="button" onclick="submitOrderForm()" class="add">확인</button>
            <button type="button" onclick="closeModal()" class="delete">취소</button>
        </div>
    </div>
    </div>
    <%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>
