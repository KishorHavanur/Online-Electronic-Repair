<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Admin</title>
</head>
<body>
<h2>Edit Admin</h2>

<form action="${pageContext.request.contextPath}/updateadmin" method="post">
    <input type="hidden" name="id" value="${admin.id}">

    <label>Name:</label>
    <input type="text" name="name" value="${admin.name}" required><br><br>

    <label>Email:</label>
    <input type="email" name="email" value="${admin.email}" required><br><br>

    <label>Phone:</label>
    <input type="text" name="phone" value="${admin.phone}" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" value="${admin.password}" required><br><br>

    <input type="submit" value="Update Admin">
</form>

<br>
<a href="/viewadmins">Back to List</a>

</body>
</html>
