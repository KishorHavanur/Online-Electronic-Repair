<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add user</title>
<link rel="stylesheet" href="views/usercss/useraddform.css">
</head>
<body>
	<form action="${pageContext.request.contextPath}/saveuser" method="post" modelAttribute="user"> 
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
		<label for="address">address</label>
		<input type="text" placeholder="Enter Address" id="address" name="address" required />
		<br><br>
		<!-- Hidden fields to store latitude & longitude -->
    <input type="hidden" id="latitude" name="latitude">
    <input type="hidden" id="longitude" name="longitude">
		<input type="submit" value="save"/>
	</form>
</body>
<script>
// Automatically fill latitude & longitude
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        document.getElementById('latitude').value = position.coords.latitude;
        document.getElementById('longitude').value = position.coords.longitude;
    }, function(error) {
        console.warn("Geolocation error:", error.message);
    });
} else {
    console.warn("Geolocation not supported by this browser.");
}
</script>

</html>