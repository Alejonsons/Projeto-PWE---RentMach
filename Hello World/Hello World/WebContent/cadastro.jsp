<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="multitool.RandomCode"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="styles.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.css"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<title>Cadastro</title>
		
		<style>
			body {
				background-image: url("img/ilustracao.jpeg");
				background-size: cover;
				
			}
			
			#formCadastro {
				text-align: center;
				height: 700px;
				background-color: rgba(0,0,0,0.2);
			}
			
			#formCadastro form {
				width: 26%;
				margin-top: 200px;	
				display: inline-block;
				position: relative;
			}
			
			#cadastroInputs input{
				margin-bottom: 5px;
				
			}
			
			#bg-modalCadastro {
				width: 100%;
			    position: fixed;
			    display: block;
		    	transition: 350ms;
			}
			
			#modalCadastro {
				width: 80%;
			    height: 80%;
			    background-color: white;
			    border: 1px solid 	#A9A9A9;
			    border-radius: 5px;
			    margin: 80px auto 0 auto;
			}
		</style>
	</head>
	
	<body>
		
		<%
			String acao = request.getParameter("acao");
			 
			if (acao != null) {
				int idUsuario			= 0;
				String email			= request.getParameter("email");
				String senha 			= new Usuario(email).newPassword();
				int idNivelUsuario		= 1;
				String nome				= request.getParameter("nome");
				String cpf				= request.getParameter("cpf");
				String endereco			= "";
				String bairro			= "";
				String cidade			= "";
				String uf				= "";
				String cep				= "";
				String telefone			= "";
				String nasc				= "";
				Usuario usuario = new Usuario(idUsuario, email, senha, idNivelUsuario, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, nasc);

				usuario.save();
					
				String smtpHost = "smtp.gmail.com"; 
				String smtpPort = "587"; 
				String username = "alecortez0905@gmail.com";
				String password = "minifix52";
				String auth     = "tls";  
				SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
					
				String mailFrom 	= "alecortez0905@gmail.com"; 
				String mailTo 		= email; 
				String mailSubject 	= "Cadastro"; 
				String mailBody 	= "Você criou uma conta no nosso site, com o email: " + email + " e senha " + senha + " para completar seu cadastro e alterar senha faça login no nosso site"; 
				sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
				%>
				
				<script>
					$('#modalCadastro').style.top = '0';
				</script>
				<div id="bg-modalCadastro">
					<div id="modalCadastro" style="top: -100%">
						
						<div class="modal-body">
							<h5>Foi enviada ao seu e-mail uma senha gerada automaticamente. Utilize ambos para entrar em nosso site! Agradecemos pelo cadastro!</h5>
						</div>
					</div>
				</div>	
			<%}
		%>
		<div id="formCadastro">
			<form action="cadastro.jsp" class="form-group" method="POST">
				<div id="cadastroInputs">
					<input type="email" id="email" name="email" class="form-control"  placeholder="E-mail">
					<input type="text" id="nome" name="nome" class="form-control"  placeholder="Nome">
					<input type="text" id="cpf" name="cpf" class="form-control"  placeholder="CPF">
					<button class="btn" type="submit" id="btnCadastrar" style="background-color: #FCB830;color: white;" onclick="this.form.submit();">Cadastrar</button>
					
				</div>
					
				<input type="hidden" name="acao" value="1">
				
				<br/>
				
				<div class="justify-content-between">
					<a href="login.jsp"><input type="button" class="btn" id="btnVoltar" value="Voltar" style="background-color: #FCB830;color: white;"></a>
				</div>
				
			</form>
			
			<br/>	 
			
			<div style="text-align: center;">
				<h1 style="color: #FCB830; font-family: 'Quicksand', sans-serif; font-size: 70px;" >RentMach</h1>
			</div>
		</div>
	</body>
</html>