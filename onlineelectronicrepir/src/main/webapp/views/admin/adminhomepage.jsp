<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home page</title>
<link rel="stylesheet" href="views/admincss/adminhomepage.css">
</head>
<body>
	<h2>AdminHomePage</h2>
	<h2>welcome! ${admin.name}</h2>
	<form action="${pageContext.request.contextPath}/viewadmins" method="get">
        <input type="submit" value="View All Admins" />
    </form><br><br>
    <form action="${pageContext.request.contextPath}/viewadminusers" method="get">
        <input type="submit" value="View All Users" />
    </form><br><br>
    <form action="${pageContext.request.contextPath}/viewadminelectriticians" method="get">
        <input type="submit" value="View All Electriticians" />
    </form><br><br>
     <a href="${pageContext.request.contextPath}/pending">Manage Bookings</a>
      <script>
        // Add interactive animations
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.dashboard-card');
            const buttons = document.querySelectorAll('.card-btn, .action-link');
            
            // Add hover sound effect (optional)
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-3px)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
            
            // Add click animation
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    // Add ripple effect
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.6);
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        width: ${size}px;
                        height: ${size}px;
                        top: ${y}px;
                        left: ${x}px;
                    `;
                    
                    this.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
            
            // Add styles for ripple effect
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(4);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>
</html>