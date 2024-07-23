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
</head>
<body data-addList="${addList}" data-error="${error}" data-modify="${modify}">
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

    <div class="content">
        <h1>교재 리스트 관리</h1>
        <form id="addToBookList" action="<c:url value='/admin/book/insert'/>"
            method="POST" onsubmit="return validatePriceInput();">
            <input type="hidden" name="${_csrf.parameterName}"
                value="${_csrf.token}" />
            <table>
                <tr>
                    <th>교재 ID</th>
                    <th>교재명</th>
                    <th>가격</th>
                    <th>과목 코드</th>
                    <th>추가</th>
                </tr>
                <tr>
                    <td><input type="text" name="bookCode" id="bookCodeInput"
                        maxlength="20" oninput="validateBookCode(this)"></td>
                    <td><input type="text" name="bookName" id="bookNameInput"
                        maxlength="30" oninput="validateBookName(this)"></td>
                    <td><input type="number" name="price" id="priceInput"
                        oninput="handleQuantityInput(this)"></td>
                    <td><input type="number" name="kindCode" id="kindInput"
                        oninput="handleQuantityInput(this)"></td>
                    <td><button type="button" onclick="addToBookList()"
                            class="add">추가</button></td>
                </tr>
            </table>
        </form>
        <form action="<c:url value='/admin/book/search'/>" method="GET">
            <table>
                <tr>
                    <th>교재명</th>
                    <td><input type="text" name="bookName"></td>
                    <td><input type="submit" value="검색"></td>
                </tr>
            </table>
        </form>
        <button type="button" onclick="downloadCSV()">엑셀 다운로드</button>
        <table>
            <tr>
                <th>교재 ID</th>
                <th>교재명</th>
                <th>가격</th>
                <th>과목 코드</th>
                <th>작업</th>
            </tr>
            <c:forEach items="${list}" var="vo" varStatus="status">
                <tr>
                    <td>${vo.bookCode}</td>
                    <td>${vo.bookName}</td>
                    <td>${vo.price}</td>
                    <td>${vo.kindCode}</td>
                    <td><a
                        href="<c:url value='/admin/book/update/${vo.bookCode}'/>"
                        class="update">수정</a> &nbsp; <a
                        href="<c:url value='/admin/book/delete/${vo.bookCode}'/>"
                        class="delete" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
    <script src="<c:url value='/javascript/bookupdate.js'/>"></script>
    
    <script type="text/javascript">
    function downloadCSV() {
        var table = document.querySelector("table"); // 테이블 요소를 가져옵니다.
        var rows = table.querySelectorAll("tr"); // 테이블의 모든 행을 선택합니다.
        
        var csvContent = "data:text/csv;charset=utf-8,";

        // 각 행의 셀 데이터를 CSV 형식으로 변환합니다.
        rows.forEach(function(row) {
            var rowData = [];
            row.querySelectorAll("td").forEach(function(cell) {
                rowData.push(cell.textContent); // 각 셀의 텍스트 내용을 가져와 배열에 추가합니다.
            });
            csvContent += rowData.join(",") + "\n"; // 각 행의 데이터를 CSV 행으로 변환하여 csvContent에 추가합니다.
        });

        // CSV 파일 다운로드를 위한 작업
        var encodedUri = encodeURI(csvContent);
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "table_data.csv");

        // 링크를 document body에 추가합니다.
        document.body.appendChild(link);

        // 링크를 클릭하여 CSV 파일 다운로드를 시작합니다.
        link.click();
    </script>

</body>
</html>
