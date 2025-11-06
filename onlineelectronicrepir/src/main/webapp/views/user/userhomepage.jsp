<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Electric Easy Repair - Home</title>
<link rel="stylesheet" href="views/usercss/userhomepage.css">

</head>
<body>
	<h2>welcome! ${loggeduser.name}</h2>
	
	<header>
		<h1>Welcome to Electric Repair System</h1>
	</header>

	<nav>
		<a href="${pageContext.request.contextPath}/viewusers">View users</a> 
		<a href="${pageContext.request.contextPath}/viewelectriticians">View Electriticians</a>
		<a href="${pageContext.request.contextPath}/user/electriticians">Book</a>
		<a href="${pageContext.request.contextPath}/booking/user-bookings">view Recent Bookings</a>
		<a href="smartrepair.jsp">Smart Repair</a> 
		<a href="${pageContext.request.contextPath}/landingpage">Logout</a>
	</nav>

	<div class="main">
		<h2>Empowering Fast & Easy Electrical Services</h2>
		<p>Book trusted technicians online, manage bookings, and enjoy
			hassle-free repairs at your convenience.</p>

		<div class="grid">
			<div class="card">
				<h3>Verified Electricians</h3>
				<p>All our technicians are background-checked and certified for
					quality service.</p>
			</div>
			<div class="card">
				<h3>Instant Booking</h3>
				<p>Choose your time, select a technician, and book in just a few
					clicks.</p>
			</div>
			<div class="card">
				<h3>Admin Controls</h3>
				<p>Admins can monitor, approve or reject bookings and manage
					user data efficiently.</p>
			</div>
			<div class="card">
				<h3>24/7 Support</h3>
				<p>Facing issues? Our support is here to help you anytime,
					anywhere.</p>
			</div>
		</div>
	</div>

	<footer> &copy; 2025 Easy Electric Repair System | Developed
		by Kishor Havanur </footer>

</body>
</html>
