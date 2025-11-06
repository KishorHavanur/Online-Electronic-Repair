<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Bookings - Electronic Repair</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    /* Base Styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    :root {
        --primary: #3498db;
        --secondary: #2ecc71;
        --warning: #f39c12;
        --danger: #e74c3c;
        --info: #9b59b6;
        --dark: #2c3e50;
        --light: #ecf0f1;
        --card-bg: rgba(255, 255, 255, 0.1);
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #1a2a3a, #2c3e50);
        color: var(--light);
        min-height: 100vh;
        padding: 2rem;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
    }

    /* Header */
    .header {
        text-align: center;
        margin-bottom: 3rem;
        animation: fadeInDown 0.8s ease;
    }

    .header h1 {
        font-size: 2.5rem;
        margin-bottom: 0.5rem;
        background: linear-gradient(45deg, var(--primary), var(--secondary));
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
    }

    .header p {
        color: rgba(255, 255, 255, 0.7);
        font-size: 1.1rem;
    }

    /* Stats Overview */
    .stats-overview {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .stat-card {
        background: var(--card-bg);
        backdrop-filter: blur(10px);
        border-radius: 15px;
        padding: 1.5rem;
        text-align: center;
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: transform 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .stat-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary), var(--secondary));
    }

    .stat-card:hover {
        transform: translateY(-5px);
    }

    .stat-card h3 {
        font-size: 2.2rem;
        margin-bottom: 0.5rem;
        color: var(--primary);
    }

    .stat-card p {
        color: rgba(255, 255, 255, 0.7);
        font-size: 0.9rem;
        font-weight: 600;
    }

    /* Filter Controls */
    .filter-controls {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .search-box {
        position: relative;
        flex: 1;
        max-width: 400px;
    }

    .search-box input {
        width: 100%;
        padding: 12px 20px 12px 45px;
        border-radius: 25px;
        border: 2px solid rgba(255, 255, 255, 0.1);
        background: rgba(255, 255, 255, 0.08);
        color: var(--light);
        font-size: 1rem;
        backdrop-filter: blur(10px);
        transition: all 0.3s ease;
    }

    .search-box input:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }

    .search-box i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: rgba(255, 255, 255, 0.6);
    }

    .filter-options {
        display: flex;
        gap: 1rem;
        align-items: center;
    }

    .filter-select {
        padding: 10px 20px;
        border-radius: 8px;
        border: 2px solid rgba(255, 255, 255, 0.1);
        background: rgba(255, 255, 255, 0.08);
        color: var(--light);
        backdrop-filter: blur(10px);
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .filter-select:focus {
        outline: none;
        border-color: var(--primary);
    }

    /* Bookings Grid */
    .bookings-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
        gap: 1.5rem;
    }

    .booking-card {
        background: var(--card-bg);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        padding: 2rem;
        border: 1px solid rgba(255, 255, 255, 0.1);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        animation: slideIn 0.5s ease forwards;
    }

    .booking-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary), var(--secondary));
    }

    .booking-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        border-color: rgba(255, 255, 255, 0.2);
    }

    .booking-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 1.5rem;
    }

    .booking-id {
        font-size: 1.3rem;
        font-weight: 700;
        color: var(--primary);
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .booking-id i {
        font-size: 1.1rem;
    }

    .status-badge {
        padding: 6px 15px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .status-pending { background: rgba(243, 156, 18, 0.2); color: var(--warning); border: 1px solid rgba(243, 156, 18, 0.3); }
    .status-confirmed { background: rgba(52, 152, 219, 0.2); color: var(--primary); border: 1px solid rgba(52, 152, 219, 0.3); }
    .status-in-progress { background: rgba(155, 89, 182, 0.2); color: var(--info); border: 1px solid rgba(155, 89, 182, 0.3); }
    .status-completed { background: rgba(46, 204, 113, 0.2); color: var(--secondary); border: 1px solid rgba(46, 204, 113, 0.3); }
    .status-cancelled { background: rgba(231, 76, 60, 0.2); color: var(--danger); border: 1px solid rgba(231, 76, 60, 0.3); }

    .booking-details {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .detail-row {
        display: flex;
        align-items: flex-start;
        gap: 12px;
    }

    .detail-icon {
        width: 20px;
        color: var(--primary);
        margin-top: 2px;
        flex-shrink: 0;
    }

    .detail-content {
        flex: 1;
    }

    .detail-label {
        font-weight: 600;
        color: rgba(255, 255, 255, 0.9);
        margin-bottom: 2px;
        font-size: 0.9rem;
    }

    .detail-value {
        color: rgba(255, 255, 255, 0.7);
        font-size: 0.95rem;
    }

    .electrician-info {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 10px;
        padding: 1rem;
        margin-top: 0.5rem;
    }

    .electrician-name {
        font-weight: 600;
        color: var(--primary);
        margin-bottom: 5px;
    }

    .booking-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 1.5rem;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .datetime-info {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .date-time {
        display: flex;
        align-items: center;
        gap: 8px;
        color: rgba(255, 255, 255, 0.7);
        font-size: 0.9rem;
    }

    .date-time i {
        color: var(--primary);
        width: 16px;
    }

    .booking-actions {
        display: flex;
        gap: 0.8rem;
    }

    .action-btn {
        padding: 8px 16px;
        border: none;
        border-radius: 8px;
        font-size: 0.85rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .btn-contact {
        background: rgba(52, 152, 219, 0.2);
        color: var(--primary);
        border: 1px solid rgba(52, 152, 219, 0.3);
    }

    .btn-contact:hover {
        background: var(--primary);
        color: white;
        transform: translateY(-2px);
    }

    .btn-cancel {
        background: rgba(231, 76, 60, 0.2);
        color: var(--danger);
        border: 1px solid rgba(231, 76, 60, 0.3);
    }

    .btn-cancel:hover {
        background: var(--danger);
        color: white;
        transform: translateY(-2px);
    }

    .btn-reschedule {
        background: rgba(243, 156, 18, 0.2);
        color: var(--warning);
        border: 1px solid rgba(243, 156, 18, 0.3);
    }

    .btn-reschedule:hover {
        background: var(--warning);
        color: white;
        transform: translateY(-2px);
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 4rem 2rem;
        background: var(--card-bg);
        backdrop-filter: blur(10px);
        border-radius: 20px;
        border: 2px dashed rgba(255, 255, 255, 0.1);
        grid-column: 1 / -1;
    }

    .empty-state i {
        font-size: 4rem;
        color: rgba(255, 255, 255, 0.3);
        margin-bottom: 1.5rem;
    }

    .empty-state h3 {
        font-size: 1.5rem;
        margin-bottom: 0.5rem;
        color: rgba(255, 255, 255, 0.7);
    }

    .empty-state p {
        color: rgba(255, 255, 255, 0.5);
        margin-bottom: 2rem;
    }

    .btn-new-booking {
        background: linear-gradient(45deg, var(--primary), var(--secondary));
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 8px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .btn-new-booking:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
    }

    /* Animations */
    @keyframes fadeInDown {
        from {
            opacity: 0;
            transform: translateY(-30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.02); }
        100% { transform: scale(1); }
    }

    .pulse {
        animation: pulse 2s infinite;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        body {
            padding: 1rem;
        }
        
        .bookings-grid {
            grid-template-columns: 1fr;
        }
        
        .filter-controls {
            flex-direction: column;
            align-items: stretch;
        }
        
        .search-box {
            max-width: 100%;
        }
        
        .booking-header {
            flex-direction: column;
            gap: 1rem;
        }
        
        .booking-footer {
            flex-direction: column;
            gap: 1rem;
            align-items: flex-start;
        }
        
        .booking-actions {
            width: 100%;
            justify-content: space-between;
        }
    }

    @media (max-width: 480px) {
        .header h1 {
            font-size: 2rem;
            flex-direction: column;
            gap: 10px;
        }
        
        .stats-overview {
            grid-template-columns: repeat(2, 1fr);
        }
        
        .booking-card {
            padding: 1.5rem;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>
                <i class="fas fa-calendar-check"></i>
                My Service Bookings
            </h1>
            <p>Track and manage all your electronic repair service requests</p>
        </div>

        <!-- Stats Overview -->
        <div class="stats-overview">
            <div class="stat-card">
                <h3 id="totalBookings">${bookings.size()}</h3>
                <p>Total Bookings</p>
            </div>
            <div class="stat-card">
                <h3 id="pendingBookings">0</h3>
                <p>Pending</p>
            </div>
            <div class="stat-card">
                <h3 id="activeBookings">0</h3>
                <p>In Progress</p>
            </div>
            <div class="stat-card">
                <h3 id="completedBookings">0</h3>
                <p>Completed</p>
            </div>
        </div>

        <!-- Filter Controls -->
        <div class="filter-controls">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search bookings by issue or electrician...">
            </div>
            <div class="filter-options">
                <select class="filter-select" id="statusFilter">
                    <option value="all">All Status</option>
                    <option value="pending">Pending</option>
                    <option value="confirmed">Confirmed</option>
                    <option value="in-progress">In Progress</option>
                    <option value="completed">Completed</option>
                    <option value="cancelled">Cancelled</option>
                </select>
                <select class="filter-select" id="sortFilter">
                    <option value="newest">Newest First</option>
                    <option value="oldest">Oldest First</option>
                    <option value="date">By Date</option>
                </select>
            </div>
        </div>

        <!-- Bookings Grid -->
        <div class="bookings-grid" id="bookingsContainer">
            <c:choose>
                <c:when test="${not empty bookings}">
                    <c:forEach var="b" items="${bookings}">
                        <div class="booking-card" 
                             data-id="${b.id}" 
                             data-status="${b.status.toLowerCase()}" 
                             data-electrician="${b.electritician.name}"
                             data-issue="${b.issueDescription}">
                            
                            <div class="booking-header">
                                <div class="booking-id">
                                    <i class="fas fa-hashtag"></i>
                                    #${b.id}
                                </div>
                                <div class="status-badge status-${b.status.toLowerCase().replace(' ', '-')}">
                                    ${b.status}
                                </div>
                            </div>
                            
                            <div class="booking-details">
                                <div class="detail-row">
                                    <i class="fas fa-tools detail-icon"></i>
                                    <div class="detail-content">
                                        <div class="detail-label">Service Issue</div>
                                        <div class="detail-value">${b.issueDescription}</div>
                                    </div>
                                </div>
                                
                                <div class="detail-row">
                                    <i class="fas fa-user-cog detail-icon"></i>
                                    <div class="detail-content">
                                        <div class="detail-label">Assigned Electrician</div>
                                        <div class="electrician-info">
                                            <div class="electrician-name">
                                                <i class="fas fa-user-hard-hat"></i>
                                                ${b.electritician.name}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="booking-footer">
                                <div class="datetime-info">
                                    <div class="date-time">
                                        <i class="fas fa-calendar"></i>
                                        ${b.date}
                                    </div>
                                    <div class="date-time">
                                        <i class="fas fa-clock"></i>
                                        ${b.timeSlot}
                                    </div>
                                </div>
                                
                                <div class="booking-actions">
                                    <c:if test="${b.status != 'completed' && b.status != 'cancelled'}">
                                        <button class="action-btn btn-contact">
                                            <i class="fas fa-phone"></i>
                                            Contact
                                        </button>
                                        <button class="action-btn btn-reschedule">
                                            <i class="fas fa-calendar-alt"></i>
                                            Reschedule
                                        </button>
                                        <button class="action-btn btn-cancel">
                                            <i class="fas fa-times"></i>
                                            Cancel
                                        </button>
                                    </c:if>
                                    <c:if test="${b.status == 'completed'}">
                                        <button class="action-btn btn-contact" style="background: var(--secondary); color: white;">
                                            <i class="fas fa-star"></i>
                                            Rate Service
                                        </button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-calendar-times"></i>
                        <h3>No Bookings Found</h3>
                        <p>You haven't made any service bookings yet.</p>
                        <a href="#" class="btn-new-booking">
                            <i class="fas fa-plus"></i>
                            Book Your First Service
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize stats
            updateBookingStats();
            
            // Search functionality
            document.getElementById('searchInput').addEventListener('input', function() {
                filterBookings();
            });
            
            // Filter functionality
            document.getElementById('statusFilter').addEventListener('change', filterBookings);
            document.getElementById('sortFilter').addEventListener('change', sortBookings);
            
            // Add hover effects
            document.querySelectorAll('.booking-card').forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-8px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
            
            // Action button handlers
            document.querySelectorAll('.btn-contact').forEach(btn => {
                btn.addEventListener('click', function() {
                    const card = this.closest('.booking-card');
                    const bookingId = card.getAttribute('data-id');
                    alert(`Contacting electrician for booking #${bookingId}`);
                });
            });
            
            document.querySelectorAll('.btn-cancel').forEach(btn => {
                btn.addEventListener('click', function() {
                    const card = this.closest('.booking-card');
                    const bookingId = card.getAttribute('data-id');
                    if(confirm('Are you sure you want to cancel this booking?')) {
                        // In real app, make API call to cancel booking
                        card.style.opacity = '0.5';
                        setTimeout(() => {
                            card.remove();
                            updateBookingStats();
                        }, 300);
                    }
                });
            });
        });
        
        function updateBookingStats() {
            const cards = document.querySelectorAll('.booking-card');
            let pending = 0, active = 0, completed = 0;
            
            cards.forEach(card => {
                const status = card.getAttribute('data-status');
                if (status.includes('pending')) pending++;
                else if (status.includes('progress') || status.includes('confirmed')) active++;
                else if (status.includes('completed')) completed++;
            });
            
            document.getElementById('pendingBookings').textContent = pending;
            document.getElementById('activeBookings').textContent = active;
            document.getElementById('completedBookings').textContent = completed;
        }
        
        function filterBookings() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const statusFilter = document.getElementById('statusFilter').value;
            const cards = document.querySelectorAll('.booking-card');
            
            cards.forEach(card => {
                const electrician = card.getAttribute('data-electrician').toLowerCase();
                const issue = card.getAttribute('data-issue').toLowerCase();
                const status = card.getAttribute('data-status');
                
                const matchesSearch = electrician.includes(searchTerm) || issue.includes(searchTerm);
                const matchesStatus = statusFilter === 'all' || status.includes(statusFilter);
                
                if (matchesSearch && matchesStatus) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
        
        function sortBookings() {
            const sortBy = document.getElementById('sortFilter').value;
            const container = document.getElementById('bookingsContainer');
            const cards = Array.from(container.querySelectorAll('.booking-card'));
            
            // Simple sorting - in real app, you'd sort by actual dates
            if (sortBy === 'newest') {
                cards.reverse();
            }
            // Add more sorting logic as needed
            
            // Reappend sorted cards
            cards.forEach(card => container.appendChild(card));
        }
    </script>
</body>
</html>