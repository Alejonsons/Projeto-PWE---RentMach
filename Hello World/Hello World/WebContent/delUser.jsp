<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Usuario"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int id = Integer.valueOf(request.getParameter("id"));	
			Usuario usuario = new Usuario(id, "", "", 1, "", "", "", "", "", "", "", "", "");
			usuario.delete();
			response.sendRedirect("adm.jsp");
		%>
	</body>
</html>