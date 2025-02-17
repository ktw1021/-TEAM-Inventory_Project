<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>지점 관리 시스템</title>
<!-- CSRF 토큰을 메타 태그로 설정 -->
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS 파일 추가 -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
<style type="text/css">

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
	<div id="head"></div>
	<button id="downloadCSV">CSV 다운로드</button>
	<!-- 장바구니 섹션 -->
	<div id="cart" class="cart">
		<div id="mouse">
		<h2>장바구니</h2></div>
		<input type="text" id="searchInput" placeholder="교재명...">
		<button id="searchBtn">검색</button>
		<button id="resetBtn">초기화</button>
		<button id="saveBtn" class="add">장바구니 추가</button>
		<!-- 장바구니 아이템이 여기에 동적으로 추가됨 -->
		<div id="cartItems" class="cart-content"></div>
		<!-- 발주 제출 폼 -->
		<br>
		<button id="clearCartBtn" class="deleteAll">비우기</button>
		<form action="<c:url value="/branch/order/submit"/>" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<button type="submit" id="orderBtn" class="update" style="">발주</button>
		</form>
	</div>

	<!-- 검색 입력 및 버튼 -->

	<!-- 검색 결과가 여기에 렌더링됨 -->
	<div id="result"></div>
	
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
	<script src="<c:url value='/javascript/bookorder.js'/>"></script>
</body>
</html>