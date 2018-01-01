<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java"
	import="player.connection,player.players,java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Players List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="Style.css">
</head>
<body>
	<%
		if (session.getAttribute("Offsession") != null) {
	%>
	<div class="container">
		<div class="row mheader">
			<div class="page-header col-md-12">
				<h3>Portal - Officer's Login</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<center>
					<h4>Players List</h4>
				</center>
			</div>
			<div class="col-md-12 col-sm-12">
				<center>
					<form action="editPlayer.jsp" method="post">
						<table border="1">
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Action</th>
							</tr>
							<jsp:useBean id="cobj" class="player.connection" scope="page"></jsp:useBean>
							<jsp:setProperty property="*" name="cobj" />
							<%
								ArrayList<players> al = cobj.getPlayers();
									for (int i = 0; i < al.size(); i++) {
							%>
							<tr>
								<td style="min-height: 20%; text-align: center;"><%=i + 1%></td>
								<td style="min-height: 20%; text-align: center;"><%=al.get(i).getName()%></td>
								<td style="min-height: 20%; text-align: center;"><%=al.get(i).getLname()%></td>
								<td style="min-height: 20%; text-align: center;"><button
										type="submit" id="edit" name="Offedit"
										value="<%=al.get(i).getId()%>" class="btn btn-success">Edit</button></td>
							</tr>
							<%
								}
							%>
						</table>
					</form>
				</center>
			</div>
		</div>
		<div class="row mfoot">
			<div class="col-md-10 col-sm-10">
				<form action="logout.jsp" method="post">
					<button type="submit" id="logout" name="officerLogout"
						class="btn btn-default">Logout</button>
				</form>
			</div>
			<div class="col-md-2 col-sm-2">
				<button type="button" onclick="window.open('index.jsp','_self');"
					class="btn btn-default">Player</button>
			</div>
		</div>
	</div>
	<%
		} else {
	%>
	<script type="text/javascript">
		window.open('Ohome.jsp', '_self');
	</script>
	<%
		}
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>