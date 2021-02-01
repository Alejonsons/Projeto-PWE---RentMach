<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<jsp:include page = "common/head.html" />
		<title>RentMach</title>
		
		<style>
			body {
				background-image: url("img/ilustracao.jpeg");
				background-size: cover;
			}
			
		</style>
	<body>
	
		<nav class="navbar navbar-light justify-content-between" style="background-color:rgba(0, 0, 0, 0.2);">
		  <div class="navbar-brand" style="color: #FCB830; font-family: 'Quicksand', sans-serif; font-size: 30px;">RentMach</div>
		  <form id="frmLogin" method="post">
		  		<div style="display: flex;">
			  		<input class="form-control ml-1" type="email" name="user" placeholder="E-mail" required/><br/>
					<input class="form-control ml-1"  type="password" name="pass" placeholder="Senha" required/><br/>
					<button id="btnSendFrmLogin" style="background-color: #FCB830;" class="btn ml-1" type="button">Entrar</button>
		  		</div>
		  		<div id="smalls">
		  			<a href="cadastro.jsp" style="color: #FCB830;" class="ml-1">Cadastre-se.</a>
		  		</div>
				
		</form>
		</nav>
		<div id="msgLogin" style="right: 5px; float: left; width: 50%;" ></div>

	</body>
	<script type="text/javascript">
	
	$(document).ready(
			function() {
				$("#btnSendFrmLogin").click(
					function() {
						var formData = $("#frmLogin").serialize();
						$.post("testeForm.jsp",formData,function(data,status) {
							console.log(data.login);
							if (data.login == "true") {
								window.location.href = "home.jsp";
								alert("Logado com sucesso!");
							} else if (data.login == "false") {
								window.location.href = "login.jsp";
								alert("E-mail ou senha inválidos!");
							}
						},'json');
					}
				);
			}
		);
	</script>
</html>