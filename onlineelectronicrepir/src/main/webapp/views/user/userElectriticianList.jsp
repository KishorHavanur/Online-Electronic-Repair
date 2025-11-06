<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Electricians</title>
<style>
table { border-collapse: collapse; width: 80%; margin: auto; }
th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
th { background-color: #007bff; color: white; }
a.book-btn { background-color: #28a745; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; }
a.book-btn:hover { background-color: #218838; }
</style>
</head>
<body>
<h2 style="text-align:center;">Available Electricians</h2>
${loggeduser.name}
<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Type</th>
    <th>Action</th>
    <th>Chat</th>
  </tr>

  <c:forEach var="e" items="${electriticians}">
    <tr>
      <td>${e.id}</td>
      <td>${e.name}</td>
      <td>${e.email}</td>
      <td>${e.phone}</td>
      <td>${e.type}</td>
      <td>
        <a class="book-btn" href="${pageContext.request.contextPath}/booking/form?electriticianId=${e.id}">
          Book
      </td>
      <td>
      	 </a>
         <a class="book-btn" style="background-color:#ffc107; margin-left:5px;"
     href="${pageContext.request.contextPath}/chat/start?electriticianId=${e.id}">
    Chat
  </a>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
