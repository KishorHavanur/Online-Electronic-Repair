<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Electritician</title>
<link rel="stylesheet" href="views/electriticiancss/electriticianaddform.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/saveelectritician" method="post" modelAttribute="electritician"> 
		<h1 class="form-title">Register Electritician</h1>
		
		<div class="form-group">
			<label for="name">Name</label>
			<input type="text" placeholder="Enter your full name" id="name" name="name" required />
		</div>
		
		<div class="form-group">
			<label for="email">Email</label>
			<input type="email" placeholder="Enter your email address" id="email" name="email" required />
		</div>
		
		<div class="form-group">
			<label for="phone">Phone Number</label>
			<input type="number" placeholder="Enter 10-digit phone number" pattern="[0-9]{10}" maxlength="10" id="phone" name="phone" required />
		</div>
		
		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" placeholder="Create a strong password" id="password" name="password" required />
		</div>
		
		<div class="form-group">
			<label for="type">Specialization</label>
			<input type="text" placeholder="Enter your specialization" id="type" name="type" required />
		</div>
		
		<input type="submit" value="Register Account"/>
		
		<div class="login-link">
			Already registered? <a href="${pageContext.request.contextPath}/electriticianlogin">Click here to login</a>
		</div>
	</form>
</body>
</html>