<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Electronic Repair</title>
<link rel="stylesheet" href="views/landingpage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <h3>Online Electronic Repair</h3>
        
        <div class="login-cards">
            <div class="login-card" data-value="userlogin">
                <i class="fas fa-user"></i>
                <h4>User Login</h4>
                <p>Access your customer account</p>
            </div>
            
            <div class="login-card" data-value="electriticianlogin">
                <i class="fas fa-bolt"></i>
                <h4>Electrician Login</h4>
                <p>Professional electrician portal</p>
            </div>
        </div>
        
        <div class="divider">
            <span>OR</span>
        </div>
        
        <div class="form-group">
            <label for="loginType">Select Login Type:</label>
            <select id="loginType">
                <option value="">-- Select --</option>
                <option value="userlogin">User Login</option>
                <option value="electriticianlogin">Electrician Login</option>
            </select>
        </div>
        
        <button class="action-button" type="button" onclick="goToLogin()">
            <i class="fas fa-arrow-right"></i> Let's GO
        </button>
        
        <div class="footer-text">
            Choose your login type to continue
        </div>
    </div>
</body>
<script>
// Add click functionality to login cards
document.querySelectorAll('.login-card').forEach(card => {
    card.addEventListener('click', function() {
        // Remove selected class from all cards
        document.querySelectorAll('.login-card').forEach(c => {
            c.classList.remove('selected');
        });
        
        // Add selected class to clicked card
        this.classList.add('selected');
        
        // Set the select value
        const value = this.getAttribute('data-value');
        document.getElementById('loginType').value = value;
    });
});

function goToLogin() {
    var selected = document.getElementById('loginType').value;
    if (selected !== '') {
        window.location.href = selected;
    } else {
        alert('Please select a login type.');
    }
}

// Add keyboard event listener
document.addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
        goToLogin();
    }
});
</script>
</html>