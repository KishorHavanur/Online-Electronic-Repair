<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
</head>
<body>
<h2>Edit User</h2>

<form action="${pageContext.request.contextPath}/updateuser" method="post">
    <input type="hidden" name="id" value="${user.id}">

    <label>Name:</label>
    <input type="text" name="name" value="${user.name}" required><br><br>

    <label>Email:</label>
    <input type="email" name="email" value="${user.email}" required><br><br>

    <label>Phone:</label>
    <input type="text" name="phone" value="${user.phone}" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" value="${user.password}" required><br><br>

    <input type="submit" value="Update User">
</form>

<br>
<a href="/viewusers">Back to List</a>

</body>
</html>
