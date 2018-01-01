<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="player.connection,player.players" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="cobj" class="player.connection" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="cobj" />
<jsp:useBean id="pobj" class="player.players"></jsp:useBean>
<jsp:setProperty property="*" name="pobj" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Player Edit</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<%
	if(request.getParameter("edit")!=null){
		session.setAttribute("session", request.getParameter("edit").toString());
	}
		if (session.getAttribute("session") == null) {
	%>
	<script type="text/javascript">
		window.open('index.jsp','_self');
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
				<div id="register">
				<%
				ArrayList<players> al=null;
				if(request.getParameter("edit")!=null)
				{	
					al=cobj.getSinPlayers(session.getAttribute("session").toString());
				}
				%>
					<form action="player.jsp" method="post">
						<div class="form-group">
							<label for="fname">First Name</label> <input type="text"
								class="form-control" placeholder="First Name" id="fname"
								name="fname" value="<%= al.get(0).getName() %>" required>
						</div>
						<div class="form-group">
							<label for="lname">Last Name</label> <input type="text"
								placeholder="Last Name" class="form-control" id="lname"
								name="lname" value="<%= al.get(0).getLname() %>">
						</div>
						<div class="form-group">
							<label for="email">Enter Email</label> <input type="email"
								placeholder="Enter Email" class="form-control" id="email"
								name="email" value="<%= al.get(0).getEmail() %>" required>
						</div>
						<div class="form-group">
							<label for="pwd">Password</label> <input type="password"
								placeholder="Enter Password" class="form-control" id="pwd"
								name="pwd" value="<%= al.get(0).getPwd() %>" required>
						</div>
						<div class="form-group">
							<label for="age">Enter Age</label> <input type="text"
								placeholder="Enter age" class="form-control" id="age"
								name="age" value="<%= al.get(0).getAge() %>">
						</div>
						<div class="form-group">
							<label for="Phone">Enter Phone No</label> <input type="tel"
								placeholder="Enter Phone No" class="form-control" id="phone"
								name="phone" value="<%= al.get(0).getPhone() %>" required>
						</div>
						<div class="form-group">
							<label for="address">Enter Address-Street</label> <input
								type="text" placeholder="Enter street name and no."
								class="form-control" id="address" name="address" value="<%=al.get(0).getAdd()%>">
						</div>
						<center>
							<button type="submit" name="edit" value="<%= al.get(0).getId() %>" class="btn btn-default">Edit</button>
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