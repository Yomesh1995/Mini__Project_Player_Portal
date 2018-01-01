<%@ page language="java" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Player Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<%
		if (session.getAttribute("session") != null) {
	%>
	<script type="text/javascript">
		window.open('editPlayer.jsp','_self');
	</script>
	<%
		}
	%>
	<div class="container">
		<div class="row mheader">
			<div class="page-header">
				<h3>Portal - Player's Login</h3>
			</div>
		</div>
		<div class="row">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#login">Login</a></li>
				<li><a data-toggle="tab" href="#register">Register</a></li>
			</ul>
			<div
				class="tab-content col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3">
				<div class="tab-pane fade in active" id="login">
					<form action="player.jsp" method="post">
						<div class="form-group">
							<label for="lemail">Enter Email</label> <input type="email"
								placeholder="Enter email" class="form-control" name="lemail"
								id="lemail" required>
						</div>
						<div class="form-group">
							<label for="lpwd">Password</label> <input type="password"
								placeholder="Enter password" class="form-control" id="lpwd"
								name="lpwd" required>
						</div>
						<center>
							<button type="submit" name="login" class="btn btn-default">Submit</button>
						</center>
					</form>
				</div>
				<div class="tab-pane fade" id="register">
					<form action="player.jsp" method="post">
						<div class="form-group">
							<label for="fname">First Name</label> <input type="text"
								class="form-control" placeholder="First Name" id="fname"
								name="fname" required>
						</div>
						<div class="form-group">
							<label for="lname">Last Name</label> <input type="text"
								placeholder="Last Name" class="form-control" id="lname"
								name="lname">
						</div>
						<div class="form-group">
							<label for="email">Enter Email</label> <input type="email"
								placeholder="Enter Email" class="form-control" id="email"
								name="email" required>
						</div>
						<div class="form-group">
							<label for="pwd">Password</label> <input type="password"
								placeholder="Enter Password" class="form-control" id="pwd"
								name="pwd" required>
						</div>
						<div class="form-group">
							<label for="age">Enter Age</label> <input type="text"
								placeholder="Enter date" class="form-control" id="age"
								name="age">
						</div>
						<div class="form-group">
							<label for="Phone">Enter Phone No</label> <input type="tel"
								placeholder="Enter Phone No" class="form-control" id="phone"
								name="phone" required>
						</div>
						<div class="form-group">
							<label for="address">Enter Address-Street</label> <input
								type="text" placeholder="Enter street name and no."
								class="form-control" id="address" name="address">
						</div>
						<center>
							<button type="submit" name="register" class="btn btn-default">Register</button>
						</center>
					</form>
				</div>
			</div>
		</div>
		<div class="row mfoot">
			<div class="col-md-12">
				<button type="button" onclick="window.open('Ohome.jsp','_self')" class="btn btn-default">Officer</button>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>