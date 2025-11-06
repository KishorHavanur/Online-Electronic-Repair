<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<link rel="stylesheet" href="views/usercss/userlogin.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/userlogin" method="post" modelAttribute="user"> 
		<h1 class="form-title">User Login</h1>
		
		<div class="form-group">
			<label for="name">Name</label>
			<input type="text" placeholder="Enter your name" id="name" name="name" required />
		</div>
		
		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" placeholder="Enter your password" id="password" name="password" required />
		</div>
		
		<input type="submit" value="Login to Account"/>
		
		<div class="register-link">
			New user? <a href="/createuser">Register here</a>
		</div>
		
		<c:if test="${not empty error}">
			<div class="error-message">${error}</div>
		</c:if>
	</form>
</body>
</html>