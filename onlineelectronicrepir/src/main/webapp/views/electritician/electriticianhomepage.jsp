<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.demo.main.model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electrician Dashboard - Electronic Repair</title>
    <link rel="stylesheet" href="views/electriticiancss/electriticianhomepage.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- Real-time Notification -->
    <div class="notification" id="notification">
        <i class="fas fa-bell"></i>
        <span id="notificationText">New assignment received!</span>
    </div>

    <!-- Dashboard Header -->
    <div class="dashboard-header">
        <div class="header-left">
            <h1>
                <i class="fas fa-bolt"></i>
                Electrician Dashboard
            </h1>
        </div>
        <div class="welcome-section">
            <h2>Welcome! ${electritician.name}</h2>
            <div class="electrician-badge">
                <i class="fas fa-user-hard-hat"></i>
                <span>Certified Electrician</span>
            </div>
        </div>
    </div>

    <!-- Controls Section -->
    <div class="controls-section">
        <form action="${pageContext.request.contextPath}/viewelectriticians" method="get" style="display: inline;">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-users"></i>
                View All Electricians
            </button>
        </form>
        
        <button class="btn refresh-btn" id="refreshBtn">
            <i class="fas fa-sync-alt"></i>
            Refresh Assignments
        </button>
    </div>

    <!-- Stats Overview -->
    <div class="stats-overview">
        <div class="stat-card">
            <h3 id="totalTasks">0</h3>
            <p>Total Tasks</p>
        </div>
        <div class="stat-card">
            <h3 id="completedTasks">0</h3>
            <p>Completed</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="section-header">
            <h3>
                <i class="fas fa-tasks"></i>
                Your Assigned Works
            </h3>
            <div class="work-count">
                <span id="workCount">0</span> assignments
            </div>
        </div>

        <!-- Tasks Grid -->
        <div class="tasks-grid" id="bookingList">
            <!-- Content will be dynamically loaded -->
            <%
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null && !bookings.isEmpty()) {
                    for (Booking b : bookings) {
                        String statusClass = "status-" + b.getStatus().toLowerCase().replace(" ", "-");
            %>
            <div class="task-card" data-booking-id="<%= b.getId() %>">
                <div class="task-header">
                    <div class="booking-id">#<%= b.getId() %></div>
                    <div class="status-badge <%= statusClass %>"><%= b.getStatus() %></div>
                </div>
                
                <div class="task-details">
                    <div class="detail-item">
                        <i class="fas fa-exclamation-circle"></i>
                        <strong>Issue:</strong>
                        <span><%= b.getIssueDescription() %></span>
                    </div>
                    
                    <div class="detail-item">
                        <i class="fas fa-user"></i>
                        <strong>Client:</strong>
                        <span><%= b.getUser().getName() %></span>
                    </div>
                    
                    <div class="detail-item">
                        <i class="fas fa-phone"></i>
                        <strong>Contact:</strong>
                        <span><%= b.getUser().getPhone() %></span>
                    </div>
                    
                    <div class="detail-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <strong>Address:</strong>
                        <span><%= b.getUser().getAddress() %></span>
                    </div>
                </div>
                
                <div class="task-footer">
                    <div class="datetime-info">
                        <div>
                            <i class="fas fa-calendar"></i>
                            <%= b.getDate() %>
                        </div>
                        <div>
                            <i class="fas fa-clock"></i>
                            <%= b.getTimeSlot() %>
                        </div>
                    </div>
                    
                    <div class="task-actions">
                        <button class="action-btn btn-start" onclick="updateStatus(<%= b.getId() %>, 'in-progress')">
                            <i class="fas fa-play"></i>
                            Start
                        </button>
                        <button class="action-btn btn-complete" onclick="updateStatus(<%= b.getId() %>, 'completed')">
                            <i class="fas fa-check"></i>
                            Complete
                        </button>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="empty-state">
                <i class="fas fa-clipboard-list"></i>
                <h3>No Assigned Work</h3>
                <p>You don't have any assigned tasks at the moment.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script>
        let previousBookingCount = 0;

        function fetchBookings() {
            $('#refreshBtn').addClass('loading');
            
            $.ajax({
                url: '${pageContext.request.contextPath}/getBookingsForElectrician',
                method: 'GET',
                success: function(data) {
                    $('#bookingList').html(data);
                    $('#refreshBtn').removeClass('loading');
                    updateStats();
                    
                    // Check for new assignments
                    const currentBookingCount = $('.task-card').length;
                    if (currentBookingCount > previousBookingCount && previousBookingCount > 0) {
                        showNotification('New assignment received!');
                    }
                    previousBookingCount = currentBookingCount;
                },
                error: function() {
                    console.error("Failed to fetch latest bookings");
                    $('#refreshBtn').removeClass('loading');
                    showNotification('Failed to refresh assignments', true);
                }
            });
        }

        function updateStats() {
            const totalTasks = $('.task-card').length;
            const pendingTasks = $('.status-pending').length;
            const inProgressTasks = $('.status-in-progress').length;
            const completedTasks = $('.status-completed').length;
            
            $('#totalTasks').text(totalTasks);
            $('#pendingTasks').text(pendingTasks);
            $('#inProgressTasks').text(inProgressTasks);
            $('#completedTasks').text(completedTasks);
            $('#workCount').text(totalTasks);
        }

        function showNotification(message, isError = false) {
            const notification = $('#notification');
            const notificationText = $('#notificationText');
            
            notificationText.text(message);
            notification.toggleClass('error', isError);
            notification.fadeIn(300);
            
            setTimeout(() => {
                notification.fadeOut(300);
            }, 3000);
        }

        function updateStatus(bookingId, status) {
            $.ajax({
                url: '${pageContext.request.contextPath}/updateBookingStatus',
                method: 'POST',
                data: {
                    bookingId: bookingId,
                    status: status
                },
                success: function(response) {
                    showNotification('Status updated successfully!');
                    fetchBookings(); // Refresh the list
                },
                error: function() {
                    showNotification('Failed to update status', true);
                }
            });
        }

        // Event Listeners
        $(document).ready(function() {
            // Initial stats update
            updateStats();
            previousBookingCount = $('.task-card').length;
            
            // Refresh button click
            $('#refreshBtn').click(function(e) {
                e.preventDefault();
                fetchBookings();
            });
            
            // Auto-refresh every 30 seconds
            setInterval(fetchBookings, 30000);
            
            // Add hover effects
            $('.task-card').hover(
                function() {
                    $(this).css('transform', 'translateY(-8px)');
                },
                function() {
                    $(this).css('transform', 'translateY(0)');
                }
            );
        });

        // Initial load
        fetchBookings();
    </script>
</body>
</html>