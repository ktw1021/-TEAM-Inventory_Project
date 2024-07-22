<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td, th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1>Order Details for <c:out value="${param.date}"/></h1>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Branch ID</th>
                <th>Order Date</th>
                <th>Checked</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty showOrderListByDate}">
                <c:forEach items="${showOrderListByDate}" var="order">
                    <tr>
                        <td><c:out value="${order.orderId}"/></td>
                        <td><c:out value="${order.branchId}"/></td>
                        <td><c:out value="${order.orderDate}"/></td>
                        <td><c:out value="${order.checked}"/></td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty showOrderListByDate}">
                <tr>
                    <td colspan="4">No orders found for the selected date.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <a href="/admin/ordercheck/calendar">Back to Calendar</a>
</body>
</html>
