<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<form action="/userlogin" method="post" modelAttribute="user"> 
		<label for="name">Name</label>
		<input type="text" placeholder="Enter name" id="name" name="name" required />
		<br><br>
		<label for="password">Password</label>
		<input type="password" placeholder="Enter password" id="password" name="password" required />
		<br><br>
		<input type="submit" value="login"/>
	</form>
	<c:if test="${not empty error}">
    <div style="color:red">${error}</div>
</c:if>
	
</body>
</html>