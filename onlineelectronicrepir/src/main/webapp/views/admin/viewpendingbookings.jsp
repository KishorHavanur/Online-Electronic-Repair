<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Pending Bookings</title>
<link rel="stylesheet" href="views/admincss/viewpendingbooking.css">
</head>
<body>

<h2>Pending Bookings</h2>

<table>
    <tr>
        <th>ID</th>
        <th>User</th>
        <th>Electrician</th>
        <th>Electritician ID</th>
        <th>Issue</th>
        <th>Date</th>
        <th>Time Slot</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <c:forEach var="b" items="${bookings}">
        <tr>
            <td>${b.id}</td>
            <td>${b.user.name}</td>
            <td>${b.electritician.name}</td>
            <td>${b.electritician.id}</td>
            <td>${b.issueDescription}</td>
            <td>${b.date}</td>
            <td>${b.timeSlot}</td>
            <td>${b.status}</td>
            <td>
                <a href="${pageContext.request.contextPath}/approve/${b.id}" class="btn approve">Approve</a>
                <a href="${pageContext.request.contextPath}/reject/${b.id}" class="btn reject">Reject</a>
            </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
