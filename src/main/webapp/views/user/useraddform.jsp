<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add user</title>
</head>
<body>
	<form action="/saveuser" method="post" modelAttribute="user"> 
		<label for="name">Name</label>
		<input type="text" placeholder="Enter name" id="name" name="name" required />
		<br><br>
		<label for="email">Email</label>
		<input type="email" placeholder="Enter email" id="email" name="email" required />
		<br><br>
		<label for="phone">Phone Number</label>
		<input type="number" placeholder="Enter Phone Number" pattern="[0-9]{10}" maxlength="10" id="phone" name="phone" required />
		<br><br>
		<label for="password">Password</label>
		<input type="password" placeholder="Enter password" id="password" name="password" required />
		<br><br>
		<input type="submit" value="save"/>
	</form>
</body>
</html>