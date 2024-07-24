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
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

    <div class="content">
        <h1>유저 리스트 및 관리</h1>
        <p>유저리스트</p>
        <button type="button" onclick="downloadCSV()">CSV 다운로드</button>
        <table>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>지점 번호</th>
                <th>auth code</th>
                <th>비고</th>
            </tr>
            <c:forEach items="${list}" var="vo">
                <tr>
                    <td>${vo.no}</td>
                    <td>${vo.name}</td>
                    <td>${vo.branchId}</td>
                    <td><c:choose>
                            <c:when test="${vo.authCode eq 0}">승인 대기</c:when>
                            <c:when test="${vo.authCode eq 1}">지점 담당자</c:when>
                            <c:when test="${vo.authCode eq 2}">관리자</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose></td>
                    <td><c:choose>
                            <c:when test="${vo.authCode eq 0}">
                                <a href="<c:url value='/admin/usermanage/confirm/${vo.branchId}/${vo.no}'/>" class="update">승인</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${vo.authCode eq 0 || vo.authCode eq 1}">
                                <a href="<c:url value='/admin/usermanage/delete/${vo.no}'/> " class="delete">삭제</a>
                            </c:when>
                            <c:otherwise>비워뒀음</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="parent">
            <a href="<c:url value='/admin'/>">admin 홈으로 돌아가기</a>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
    <script>
        function downloadCSV() {
            var csvContent = "data:text/csv;charset=utf-8,";
            csvContent += "번호,이름,지점 번호,auth code,비고\n"; // CSV 헤더

            <c:forEach items="${list}" var="vo">
                var authCode;
                if (${vo.authCode} == 0) {
                    authCode = "승인 대기";
                } else if (${vo.authCode} == 1) {
                    authCode = "지점 담당자";
                } else if (${vo.authCode} == 2) {
                    authCode = "관리자";
                } else {
                    authCode = "알 수 없음";
                }
                var row = "${vo.no},${vo.name},${vo.branchId}," + authCode + ",\n";
                csvContent += row;
            </c:forEach>

            var encodedUri = encodeURI(csvContent);
            var link = document.createElement("a");
            link.setAttribute("href", encodedUri);
            link.setAttribute("download", "users.csv");
            document.body.appendChild(link);
            link.click();
        }
    </script>
</body>
</html>
