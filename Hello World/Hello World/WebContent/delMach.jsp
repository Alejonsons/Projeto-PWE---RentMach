<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Maquina"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int id = Integer.valueOf(request.getParameter("id"));	
			Maquina maquina = new Maquina(id, "", "", "", "", "");
			maquina.delete();
			response.sendRedirect("adm.jsp");
		%>
		
	</body>
</html>