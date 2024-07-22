<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            width: 14.28%;
            height: 80px;
            text-align: center;
            border: 1px solid #ddd;
            vertical-align: top;
        }
        .header {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .clickable {
            cursor: pointer;
        }
        .button-container {
            margin-bottom: 20px;
        }
        .calendar-buttons button {
            margin-right: 10px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .calendar-buttons button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function fetchOrderDetails(date) {
            // Redirect to the endpoint with the selected date
            window.location.href = '/calendar/' + encodeURIComponent(date);
        }
    </script>
</head>
<body>
    <h1>July 2024</h1>
    
    <table>
        <tr>
            <td class="header">Sun</td>
            <td class="header">Mon</td>
            <td class="header">Tue</td>
            <td class="header">Wed</td>
            <td class="header">Thu</td>
            <td class="header">Fri</td>
            <td class="header">Sat</td>
        </tr>
        <%
            // Define the days in the month and starting day of the week
            int daysInMonth = 31;
            int startDayOfWeek = 1; // Adjust this based on the actual start day of July 2024

            // Print the calendar rows
            int day = 1;
            for (int row = 0; row < 6; row++) {
                out.print("<tr>");
                for (int col = 0; col < 7; col++) {
                    if (row == 0 && col < startDayOfWeek - 1) {
                        out.print("<td></td>");
                    } else if (day <= daysInMonth) {
                        String date = String.format("2024-07-%02d", day);
                        out.print("<td class='clickable' onclick='fetchOrderDetails(\"" + date + "\")'>" + day + "</td>");
                        day++;
                    } else {
                        out.print("<td></td>");
                    }
                }
                out.print("</tr>");
                if (day > daysInMonth) break;
            }
        %>
    </table>
    
    <hr/>
    <h2>Order Details</h2>
    <c:if test="${not empty showOrderListByDate}">
        <table border="1">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Branch ID</th>
                    <th>Order Date</th>
                    <th>Checked</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${showOrderListByDate}" var="order">
                    <tr>
                        <td><c:out value="${order.orderId}"/></td>
                        <td><c:out value="${order.branchId}"/></td>
                        <td><c:out value="${order.orderDate}"/></td>
                        <td><c:out value="${order.checked}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
