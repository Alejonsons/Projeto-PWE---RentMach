<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Maquina"%>
 <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int idMaquina = Integer.valueOf(request.getParameter("id"));	
			String nome = request.getParameter("nome");
			String categoria = request.getParameter("categoria");
			String preco = request.getParameter("preco");
			String imagem = request.getParameter("imagem");
			String status = request.getParameter("status");
			
			Maquina newMaquina = new Maquina(idMaquina, nome, categoria, imagem, preco, status);
			newMaquina.save();
			
			response.sendRedirect("adm.jsp");
		%>
		
	</body>
</html>