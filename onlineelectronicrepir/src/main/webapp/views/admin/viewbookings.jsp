<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Bookings</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f2f2;
}
h2 {
    text-align: center;
    color: #007bff;
    margin-top: 20px;
}
table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 0 8px rgba(0,0,0,0.1);
}
th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}
th {
    background: #007bff;
    color: white;
}
a.btn {
    padding: 6px 12px;
    text-decoration: none;
    border-radius: 4px;
    color: white;
}
a.approve { background: green; }
a.reject { background: red; }
span.status {
    font-weight: bold;
}
</style>
</head>
<body>

<h2>All Bookings</h2>
<table>
    <tr>
        <th>ID</th>
        <th>User</th>
        <th>Electrician</th>
        <th>Issue</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach var="b" items="${bookings}">
        <tr>
            <td>${b.id}</td>
            <td>${b.user.name}</td>
            <td>${b.electritician.name}</td>
            <td>${b.issueDescription}</td>
            <td>${b.date}</td>
            <td>${b.timeSlot}</td>
            <td><span class="status">${b.status}</span></td>
            <td>
                <c:choose>
                    <c:when test="${b.status eq 'Pending'}">
                        <a href="${pageContext.request.contextPath}/admin/booking/approve/${b.id}" class="btn approve">Approve</a>
                        <a href="${pageContext.request.contextPath}/admin/booking/reject/${b.id}" class="btn reject">Reject</a>
                    </c:when>
                    <c:otherwise>
                        <span>${b.status}</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
