<%@ page language="java" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("playerLogout") != null) {
		session.removeAttribute("session");
		response.sendRedirect("http://localhost:8080/Portal/");
	} else if (request.getParameter("officerLogout") != null) {
		session.removeAttribute("Offsession");
		response.sendRedirect("http://localhost:8080/Portal/Ohome.jsp");
	}
%>