<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All electriticians</title>
</head>
<body>
<h2>View electriticians</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>User ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Type</th>
        <th>operations</th>
    </tr>

    <c:forEach var="u" items="${ul}">
    
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.phone}</td>
            <td>${u.type}</td>
            <td>
                <a href="${pageContext.request.contextPath}/editelectritician/${u.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/deleteelectritician/${u.id}" class="delete"
                   onclick="return confirm('Are you sure you want to delete this electritician?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>