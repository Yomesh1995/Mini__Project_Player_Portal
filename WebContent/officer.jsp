<%@ page language="java" session="true" import="player.connection"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE jsp:useBean PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="cobj" class="player.connection" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="cobj" />
<jsp:useBean id="pobj" class="player.players"></jsp:useBean>
<jsp:setProperty property="*" name="pobj" />

<%
	if (request.getParameter("login") != null) {
		String stat = cobj.checkPlayerLogin(request.getParameter("lemail"), request.getParameter("lpwd"));
		if (stat != null) {
			//out.println("You are successfully logged in");
			session.setAttribute("session", stat);
			//out.println(session.getAttribute("session").toString());
			response.sendRedirect("http://localhost:8080/Portal/editPlayer.jsp");
			//response.setHeader("Location", "http://localhost:8080/Portal/editPlayer.jsp");
		} else {
%>
<script type="text/javascript">
	alert("Sorry, check email or password");
	window.open('index.jsp','_self');
</script>
<%
	}
	} else if (request.getParameter("register") != null) {
		String[] values = {request.getParameter("fname"), request.getParameter("lname"),
				request.getParameter("email"), request.getParameter("pwd"), request.getParameter("age"),
				request.getParameter("phone"), request.getParameter("address")};
		boolean stat = cobj.playerRegister(values);
		if (stat) {
			out.println("You are successfully register");
		} else {
			out.println("Registeration error");
		}
%>
<script type="text/javascript">
	window.open('index.jsp','_self');
</script>
<%
	} else if (request.getParameter("edit") != null) {
		String[] values = {request.getParameter("fname"), request.getParameter("lname"),
				request.getParameter("email"), request.getParameter("pwd"), request.getParameter("age"),
				request.getParameter("phone"), request.getParameter("address"),
				session.getAttribute("session").toString()};
		boolean stat = cobj.editPlayer(values);
		if (stat) {
			session.removeAttribute("session");
%>
<script type="text/javascript">
	alert("Successfully Edit");
	window.open('index.jsp','_self');
</script>
<%
	}
	}
%>