<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="classes.Pedido"%>
 <%@page import="classes.Maquina"%>
<!DOCTYPE html>
<html>
	<body>
		<%
			int idPedido = 0;
			int idMaquina = Integer.valueOf(request.getParameter("id"));
			int idUsuario = (int) session.getAttribute("userlogin");
			String status = "Indisponível";
			
			Pedido newPedido = new Pedido(idPedido, idMaquina, idUsuario, "", "");
			newPedido.save();
			
			Maquina maquina = new Maquina();
			maquina.loadById(idMaquina);
			
			Maquina maquina2 = new Maquina(idMaquina, maquina.getNome(), maquina.getCategoria(), maquina.getImagem(), maquina.getPreco(), status);
			maquina2.save();
			
			response.sendRedirect("home.jsp");
		%>
		
	</body>
</html>