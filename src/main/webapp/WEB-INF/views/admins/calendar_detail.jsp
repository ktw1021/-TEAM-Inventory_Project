<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details for ${orderDate}</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admins.css'/>">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        th {
            background-color: #f4f4f4;
            text-align: center;
        }
        .no-data {
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

    <div class="content">
        <h1>Order Details for ${orderDate}</h1>

        <c:if test="${empty showOrderListByDate}">
            <p class="no-data">No orders available for the selected date.</p>
        </c:if>

        <c:if test="${not empty showOrderListByDate}">
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Branch ID</th>
                        <th>Book Name</th>
                        <th>Quantity</th>
                        <th>Order Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${showOrderListByDate}" var="order">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.branchId}</td>
                            <td>${order.bookName}</td>
                            <td>${order.quantity}</td>
                            <td>${order.orderDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>
</body>
</html>
