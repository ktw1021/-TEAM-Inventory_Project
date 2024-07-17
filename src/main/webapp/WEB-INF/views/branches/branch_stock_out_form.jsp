<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소비 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
<script src="<c:url value= "/javascript/stockOut.js"/>"></script>

</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<h1>출고 소비 페이지</h1>

	<form id="search-form">
		<label for="keyword">검색어: </label> <input type="text" id="keyword"
			name="keyword"
			value="${param.keyword == null ? '' : param.keyword.trim()}">
		<input type="submit" value="검색">
		<button type="button" onclick="resetKeyword()">초기화</button>
	</form>

	<div id="results-container"></div>

	<div class="out-list">
		<table id="table">
			<thead>
				<tr>
					<th>교재명</th>
					<th>수량</th>
					<th>작업</th>
					<th>코멘트</th>
				</tr>
			</thead>
			<tbody id="table-body">
				<!-- 검색 결과가 여기에 동적으로 추가됩니다. -->
			</tbody>
		</table>

		<form id="orderForm"
			action="<c:url value='/branch/stockout/confirm'/>" method="post">
			<button type="button" onclick="showConfirmationModal()">확정</button>
		</form>
	</div>

	<div id="confirmationModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>소비 처리 확인</h2>
			<div id="modal-body">
				<!-- JavaScript로 동적으로 내용이 추가됩니다. -->
			</div>
			<button type="button" onclick="submitOrderForm()">확인</button>
			<button type="button" onclick="closeModal()">취소</button>
		</div>
	</div>
</body>
</html>
