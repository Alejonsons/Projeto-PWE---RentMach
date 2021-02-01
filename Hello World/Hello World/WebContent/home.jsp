<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.fabric.Response" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="classes.Usuario"%>
<%@page import="classes.Maquina"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<jsp:include page = "common/head.html" />
		<%
			Maquina maquina = new Maquina();
			String listCards = maquina.listCards();
		%>
		<title>RentMach</title>
		
		<style>
		
			body {
				background-color: #F5F5F5;
			}
		
			#carouselExampleControls {
				max-width: 80%;
				margin: 20px auto;
			}
		
			#carouselExampleControls img{
				border-radius: 10px;
				max-height: 500px;
			}
			
			#cards {
				width: 90%;
				padding: 2%;
				margin-left: 60px;
				justify-content: center;
			}
			
			.card {
				height: 340px;
				text-align: start;
				margin-left: 20px;
				background-color: white; 
				transition: 500ms linear;
				transition-duration: 0.2s;
			}
			
			.slick-prev:before, .slick-next:before {
				color: black;
			}
			
		</style>
	<body>
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
		        
		        	%>
		        		<jsp:include page = "common/navbarAdm.html" />
		        	<%
		        } else if(dados.getInt("idNivelUsuario") == 1){
		        	%>
		        		<jsp:include page = "common/navbar.html" />
		        	<% 
		        }
		    }
		%>
		
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="img/carrosel0.jpg" alt="Primeiro Slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="img/carrosel1.png" alt="Segundo Slide">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Anterior</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Próximo</span>
		  </a>
		</div>
		
		<br/>
		<div id="cards" class="d-flex">
			<%=listCards %>
		</div>
		
		<jsp:include page = "common/footer.html" />
	</body>
	
	<script>
		$(document).ready(
		        function() {
		            $("#logout").click(
		                function() {
		                    var formData = $("#frmClear").serialize();
		                    $.post( "testeForm.jsp", formData, function( data, status  ) {
		                        window.location.href = "login.jsp";
		                    }, "json");
		                }
		            );
		            $('#cards').slick({ 
		            	  infinite: true,
		            	  speed: 500,
		            	  slidesToShow: 4,
			        });
		       		$('.slick-active').hide();
		        }
		    );
	</script>
</html>