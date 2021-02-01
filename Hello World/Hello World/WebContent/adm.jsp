<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="classes.Maquina"%>
<%@page import="classes.Pedido"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		int userLogin = (int) session.getAttribute("userlogin");
		userLogin = (int) session.getAttribute("userlogin");
	    if ( ! (userLogin > 0 )){
	    	response.sendRedirect("logout.jsp");
	    }else{
	        Usuario usuarioNivel = new Usuario(userLogin);
	        ResultSet dados = usuarioNivel.selectBy(  "idUsuario", ""+userLogin );
	        dados.next();
	        if(dados.getInt("idNivelUsuario") != 1){
	        	
	        } else if(dados.getInt("idNivelUsuario") == 1){
	        	response.sendRedirect("home.jsp");
	        }
	    }
	%>

	<%
		Usuario usuario = new Usuario(); 
		String listUser = usuario.listAllUsers();
	%>
		
	<%
		Maquina maquina = new Maquina();
		String listMach = maquina.listAllMachs();
	%>	
	<% 	
		Pedido pedido = new Pedido();
		String listOrder = pedido.listAllOrders();
	%>
	
	<jsp:include page = "common/head.html" />
	<title>Dashboard Administração</title>
	
	<style>
		table {
			text-align: center;
			table-layout: fixed;
			margin: 10px auto;
			word-wrap: break-word;
			justify-content: center;
			width: 90%;
		}
		
		#machTable, #userTable, #orderTable {
			margin-left: 25px;
			margin-right: 25px;
			border-radius: 15px;
			max-height: 250px;
			overflow: auto;
		}
		
		#btnAddMach, #btnAddOrder, #btnAddUser {
			margin-right: 65px;
			margin-bottom: 15px;
			float: right;
		}
		
		#formAddMach input, #formAddMach select {
			margin-top: 10px;
		}	
		
		#formEditMach input, #formEditForm select {
			margin-top: 10px;
		}	
			
		h5 {
			text-align: center;
		}
		th {
			background-color: black;
			font-size: 12px;
			color: #FCB830;
		}
	
		th, td{
			border: 1px solid black;
		}
	</style>
	
	<body>
		<jsp:include page = "common/navbarAdm.html" />
		
		<%=listMach	 %>
		
		<%=listOrder %>
		
		<%=listUser %>
		
		<div id="modalAddMach" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Adicionar Máquina</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span>x</span>
						</button>
					</div>
					
					<div class="modal-body" style="justify-content: center;">
						<form class="form-group" id="formAddMach" action="addMach.jsp">
							<input class="form-control" type="text" name="nome" placeholder="Nome" required/>
							<input class="form-control" type="text" name="categoria" placeholder="Categoria" required/>
							<input class="form-control" type="text" name="imagem" placeholder="Imagem" required/>
							<input class="form-control" type="text" name="preco" placeholder="Preço" value="R$" required/>
							<select class="form-control" name="status">
								<option value="Disponível"  selected>Disponível</option>
								<option value="Indisponível" >Indisponível</option>
							</select>
							<br/>
							<button type="button" class="btn btn-danger" data-dismiss="modal" >Fechar</button>
							<button type="submit" class="btn btn-success float-right" onclick="this.form.submit();">Salvar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div id="modalEditMach" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Editar Máquina</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span>x</span>
						</button>
					</div>
					
					<div class="modal-body" style="justify-content: center;">
						<form class="form-group" id="formEditMach" action="addMach.jsp">
							<input class="form-control" type="text" name="nome"  placeholder="Nome" required/>
							<input class="form-control" type="text" name="categoria" placeholder="Categoria" required/>
							<input class="form-control" type="text" name="imagem" placeholder="Imagem" required/>
							<input class="form-control" type="text" name="preco" placeholder="Preço" value="R$" required/>
							<select class="form-control" name="status">
								<option value="Disponível"  selected>Disponível</option>
								<option value="Indisponível" >Indisponível</option>
							</select>
							<br/>
							<button type="button" class="btn btn-danger" data-dismiss="modal" >Fechar</button>
							<button type="submit" class="btn btn-success float-right" onclick="this.form.submit();">Salvar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page = "common/footer.html" />
	</body>
</html>