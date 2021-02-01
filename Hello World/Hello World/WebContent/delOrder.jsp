<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Pedido"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int id = Integer.valueOf(request.getParameter("id"));	
			Pedido pedido = new Pedido(id, 0, 0, "", "");
			pedido.delete();
			response.sendRedirect("adm.jsp");
		%>
	</body>
</html>