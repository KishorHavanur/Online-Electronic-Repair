<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.demo.main.model.Booking" %>

<%
    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
    if (bookings != null && !bookings.isEmpty()) {
        for (Booking b : bookings) {
%>
    <div class="task-card">
        <strong>Booking ID:</strong> <%= b.getId() %><br>
        <strong>Status:</strong> <%= b.getStatus() %><br>
        <strong>Issue:</strong> <%= b.getIssueDescription() %><br>
        <strong>User:</strong> <%= b.getUser().getName() %><br>
        <strong>Contact:</strong> <%= b.getUser().getPhone() %><br>
        <strong>Address:</strong> <%= b.getUser().getAddress() %><br>
        <strong>Date:</strong> <%= b.getDate() %> <br>
        <strong>Time Slot:</strong> <%= b.getTimeSlot() %><br><br>
        <a href="${pageContext.request.contextPath}/electritician/chat/start?userId=<%=b.getUser().getId()%>" 
   style="padding:5px 10px; background:#28a745; color:white; border-radius:5px; text-decoration:none;">
   Chat
</a>
 &nbsp;&nbsp; 
        <a href="${pageContext.request.contextPath}/electritician/deletework/<%= b.getId() %>" class="delete"
                   onclick="return confirm('Are you sure you want to delete this work?');"><span style="color:pink;background-color:red;border:2px,solid,black;padding:6px;border-radius:5px;">Delete</span></a>
    </div>
<%
        }
    } else {
%>
    <p>No assigned work currently.</p>
<%
    }
%>
