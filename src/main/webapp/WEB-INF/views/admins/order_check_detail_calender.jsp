<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Calendar</title>
    <!-- FullCalendar CSS -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.css' rel='stylesheet' />
    <!-- FullCalendar JS -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.2/main.min.js'></script>
    <!-- Bootstrap CSS for modal styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS for modal functionality -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
        .fc-daygrid-day {
            position: relative;
        }
        .tooltip-content {
            display: none;
            position: absolute;
            background: #333;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
            z-index: 1000;
        }
        .tooltip-content.active {
            display: block;
        }
    </style>
</head>
<body>
    <h1>Order Calendar</h1>
    <div id='calendar'></div>

    <!-- Modal for showing order details -->
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderModalLabel">Order Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="orderDetails">
                    <!-- Order details will be dynamically inserted here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            // Initialize FullCalendar
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: function(fetchInfo, successCallback, failureCallback) {
                    // Fetch events from the server
                    fetch('/calendar/data')  // Change this URL to match your backend endpoint
                        .then(response => response.json())
                        .then(data => {
                            // Map data to FullCalendar event format
                            var events = data.map(event => ({
                                title: `Order ${event.orderId} - Branch ${event.branchName}`,
                                start: new Date(event.orderDate).toISOString(),
                                extendedProps: {
                                    orderId: event.orderId,
                                    branchId: event.branchId,
                                    orderDate: new Date(event.orderDate).toLocaleString(),
                                    checked: event.checked,
                                    bookCode: event.bookCode || 'N/A',
                                    bookName: event.bookName || 'N/A',
                                    branchName: event.branchName,
                                    inventory: event.inventory,
                                    price: event.price,
                                    quantity: event.quantity,
                                    outId: event.outId || 'N/A',
                                    totalQuantity: event.totalQuantity,
                                    userName: event.userName || 'N/A'
                                }
                            }));
                            successCallback(events);
                        })
                        .catch(error => {
                            console.error('Error fetching events:', error);
                            failureCallback(error);
                        });
                },
                dateClick: function(info) {
                    // Show tooltip or popup with order details
                    showTooltip(info.dateStr);
                }
            });

            calendar.render();

            function showTooltip(dateStr) {
                // Fetch and display order details for the selected date
                fetch(`/calendar/data?date=${dateStr}`)
                    .then(response => response.json())
                    .then(data => {
                        var tooltipContent = data.map(event => `
                            <div>
                                <p><strong>Order ID:</strong> ${event.orderId}</p>
                                <p><strong>Branch ID:</strong> ${event.branchId}</p>
                                <p><strong>Order Date:</strong> ${new Date(event.orderDate).toLocaleString()}</p>
                                <p><strong>Checked:</strong> ${event.checked}</p>
                                <p><strong>Book Code:</strong> ${event.bookCode || 'N/A'}</p>
                                <p><strong>Book Name:</strong> ${event.bookName || 'N/A'}</p>
                                <p><strong>Branch Name:</strong> ${event.branchName}</p>
                                <p><strong>Inventory:</strong> ${event.inventory}</p>
                                <p><strong>Price:</strong> ${event.price}</p>
                                <p><strong>Quantity:</strong> ${event.quantity}</p>
                                <p><strong>Out ID:</strong> ${event.outId || 'N/A'}</p>
                                <p><strong>Total Quantity:</strong> ${event.totalQuantity}</p>
                                <p><strong>User Name:</strong> ${event.userName || 'N/A'}</p>
                            </div>
                        `).join('');
                        
                        // Create tooltip element
                        var tooltip = document.createElement('div');
                        tooltip.className = 'tooltip-content active';
                        tooltip.innerHTML = tooltipContent;

                        // Append tooltip to the body
                        document.body.appendChild(tooltip);

                        // Position the tooltip near the cursor
                        document.addEventListener('mousemove', function(e) {
                            tooltip.style.top = e.clientY + 10 + 'px';
                            tooltip.style.left = e.clientX + 10 + 'px';
                        });

                        // Hide tooltip on mouseout
                        document.addEventListener('mouseout', function() {
                            tooltip.remove();
                        });
                    })
                    .catch(error => {
                        console.error('Error fetching order details:', error);
                    });
            }
        });
    </script>
</body>
</html>
