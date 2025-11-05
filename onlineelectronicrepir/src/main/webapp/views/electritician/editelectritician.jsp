<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Electritician</title>
</head>
<body>
<h2>Edit Electritician</h2>

<form action="${pageContext.request.contextPath}/updateelectritician" method="post">
    <input type="hidden" name="id" value="${electritician.id}">

    <label>Name:</label>
    <input type="text" name="name" value="${electritician.name}" required><br><br>

    <label>Email:</label>
    <input type="email" name="email" value="${electritician.email}" required><br><br>

    <label>Phone:</label>
    <input type="text" name="phone" value="${electritician.phone}" required><br><br>

    <label>Password:</label>
    <input type="password" name="password" value="${electritician.password}" required><br><br>

<label>Type:</label>
    <input type="text" name="type" value="${electritician.type}" required><br><br>
    
    <input type="submit" value="Update electritician">
</form>

<br>
<a href="/viewelectriticians">Back to List</a>

</body>
</html>
