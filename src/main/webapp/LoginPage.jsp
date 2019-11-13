<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body style="background-repeat: no-repeat; background-size: 100%"
	background="<c:url value="/resources/images/camera_bg.jpg" />">
	<div class="card" style="width: 18rem; margin: auto;">
		<div class="card-body">
			<form action="LoginControllerInDb" method=post id="form" name="form">
				<img class=" col-12 text-center card-title"
					src="<c:url value="/resources/images/login.png" />"> <label
					class="col-12 text-center">Enter Username</label>
				<div class="form-group">
					<input type="text" name="username" id="username"
						class="form-control col-12 text-center" required>
				</div>
				<label class="col-12 text-center">Enter Password</label>
				<div class="form-group">
					<input type="password" name="password" id="password"
						class="form-control col-12 text-center" required>
				</div>

				<p style="color: red"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></p>

				<div class=" col-12 text-center form-group">
					<button type="submit" class="btn btn-lg btn-dark">Login</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>