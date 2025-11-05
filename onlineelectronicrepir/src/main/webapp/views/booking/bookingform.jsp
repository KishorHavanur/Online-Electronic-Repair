<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Electritician</title>
<link rel="stylesheet" href="views/bookingcss/booking.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h2>Book Electritician</h2>

<form action="${pageContext.request.contextPath}/booking/save" method="post">
    <input type="hidden" name="electriticianId" value="${electriticianId}">
	<p>${loggedInUser.name}</p>	
    <label>Date:</label>
    <input type="date" name="date" id="date" required><br><br>

    <label>Time Slot:</label>
    <select name="timeSlot" id="timeSlot" required>
        <option value="">Select a time slot</option>
    </select><br><br>

    <label>Issue Description:</label>
    <textarea name="issueDescription" rows="4" cols="50" required></textarea><br><br>
     <input type="hidden" id="latitude" name="latitude">
    <input type="hidden" id="longitude" name="longitude">
    <button type="submit">Book</button>
</form>

<script>
    $("#date").on("change", function() {
        var date = $(this).val();
        var electriticianId = ${electriticianId};

        $.ajax({
            url: '${pageContext.request.contextPath}/booking/available-slots',
            data: {electriticianId: electriticianId, date: date},
            success: function(slots) {
                $("#timeSlot").empty();
                $("#timeSlot").append('<option value="">Select a time slot</option>');
                slots.forEach(function(slot) {
                    $("#timeSlot").append('<option value="' + slot + '">' + slot + '</option>');
                });
            }
        });
    });
    
    navigator.geolocation.getCurrentPosition(function(position) {
        document.getElementById("latitude").value = position.coords.latitude;
        document.getElementById("longitude").value = position.coords.longitude;
    });
</script>

</body>
</html>
