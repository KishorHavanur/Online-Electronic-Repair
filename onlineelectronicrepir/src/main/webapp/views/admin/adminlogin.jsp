<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="views/admincss/adminlogin.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/adminlogin" method="post" modelAttribute="admin"> 
		<label for="name">Name</label>
		<input type="text" placeholder="Enter name" id="name" name="name" required />
		<br><br>
		<label for="password">Password</label>
		<input type="password" placeholder="Enter password" id="password" name="password" required />
		<br><br>
		<input type="submit" value="login"/><br><br>
		new admin register here <a href="/createadmin">Admin register</a>
	</form>
	<c:if test="${not empty error}">
    <div style="color:red">${error}</div>
</c:if>
	 <script>
        // Add form submission animation
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.disabled = true;
            submitBtn.value = 'Logging in...';
            
            // Add success animation
            setTimeout(() => {
                this.classList.add('form-success');
            }, 100);
        });
        
        // Add input focus effects
        const inputs = document.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>
</html>