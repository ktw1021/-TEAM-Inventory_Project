<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .nav-link.active {
            font-weight: bold;
            color: white !important;
        }
        /* 드롭다운 메뉴 스타일 */
        .dropdown-menu {
            background-color: #333333;
        }
        .dropdown-menu a {
            color: white;
        }
        .dropdown-menu a:hover {
            background-color: #555555;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="<c:url value='/branch/inventory' />">지점 관리 시스템</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav" id="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/branch/inventory' />">교재 재고</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">발주</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value='/branch/order/form' />">발주 등록</a>
                        <a class="dropdown-item" href="<c:url value='/branch/order/list' />">발주 기록</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">입고</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value='/branch/stockin/list' />">입고 기록</a>
                        <a class="dropdown-item" href="<c:url value='/branch/initial/setting/form' />">재고 추가</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">출고</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="<c:url value='/branch/stockout/list' />">출고 기록</a>
                        <a class="dropdown-item" href="<c:url value='/branch/stockout/form' />">출고 처리</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <c:if test="${sessionScope.authUser.authCode == 2}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/admin/home' />">관리자 페이지</a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <span class="navbar-text text-white">
                        <a href="<c:url value='/user/mypage'/>" class="text-white"><c:out value="${sessionScope.authUser.name}"/> 님</a>
                    </span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/logout' />">로그아웃</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Active menu item script -->
    <script>
        $(document).ready(function() {
            var currentPath = window.location.pathname;
            
            // 네비게이션 링크에 대해 각 링크를 체크
            $('#navbarNav .nav-link').each(function() {
                var href = $(this).attr('href');
                if (currentPath.indexOf('/branch/order') !== -1 && href.indexOf('/branch/order') !== -1) {
                    $(this).addClass('active');
                } else if (currentPath.indexOf('/branch/stockin') !== -1 && href.indexOf('/branch/stockin') !== -1) {
                    $(this).addClass('active');
                } else if (currentPath.indexOf('/branch/stockout') !== -1 && href.indexOf('/branch/stockout') !== -1) {
                    $(this).addClass('active');
                } else if (currentPath.indexOf(href) !== -1) {
                    $(this).addClass('active');
                }
            });

            // 드롭다운 메뉴 항목에 대해 각 링크를 체크
            $('#navbarNav .dropdown-menu a').each(function() {
                var href = $(this).attr('href');
                if (currentPath.indexOf(href) !== -1) {
                    $(this).addClass('active');
                    // 드롭다운 부모 항목도 활성화
                    $(this).closest('.dropdown').find('.nav-link').addClass('active');
                }
            });
        });
    </script>
</body>
</html>
