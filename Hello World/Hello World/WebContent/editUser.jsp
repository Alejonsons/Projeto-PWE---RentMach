<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Usuario"%>
 <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int idUsuario = Integer.valueOf(request.getParameter("idUsuario"));	
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			int idNivelUsuario = Integer.valueOf(request.getParameter("idNivelUsuario"));
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf");
			
			Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, "", "", "", "", "", "", "");
			usuario.save();
			
			response.sendRedirect("adm.jsp");
		%>
		
	</body>
</html>