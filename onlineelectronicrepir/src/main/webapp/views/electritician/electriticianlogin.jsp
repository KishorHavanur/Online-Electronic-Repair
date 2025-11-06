<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Electritician Login</title>
<link rel="stylesheet" href="views/electriticiancss/electriticianlogin.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/electriticianlogin" method="post" modelAttribute="electritician"> 
		<h1 class="form-title">Electritician Login</h1>
		
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
			New electritician? <a href="${pageContext.request.contextPath}/createelectritician">Register here</a>
		</div>
		
		<c:if test="${not empty error}">
			<div class="error-message">${error}</div>
		</c:if>
	</form>
</body>
</html>