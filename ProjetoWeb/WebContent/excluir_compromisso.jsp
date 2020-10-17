<%@page import="br.senai.sp.model.Compromisso"%>
<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
	import="java.util.ArrayList"
	import="br.senai.sp.servlets.ListarContatoServlet"
	%>
	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  
<%
	//String nome = request.getParameter("txtEmail");
	//String senha = request.getParameter("txtSenha");

	if (session.getAttribute("usuario") == null){
		response.sendRedirect("login.jsp");
	} else{		
	
		Usuario u = new Usuario();
		//u = (Usuario)request.getAttribute("usuario");
		
		u = (Usuario)session.getAttribute("usuario");
		
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		Compromisso compromisso = new Compromisso();
		compromisso = (Compromisso)request.getAttribute("compromisso");
		
%>

		<!DOCTYPE html>
		<html>
		
			<head>	
				<meta charset="ISO-8859-1">
				<title>Contatos</title>
				<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
			</head>
			
			<body>
		
				<div class="container" style="box-shadow: 3px 3px 5px 5px gray; border-radius:6px; border:3px inset;">		
			
					<%@include file="cabecalho.html" %>	
					
					<div class="row">
						<div class="col-md-3">
						<%@ include file="usuario.jsp" %>
							
						<%@ include file="menu.html" %>	
						</div>			
						<div class="col-md-9">
							<div class="panel panel-success">
								<div class="panel-heading">Meus Contatos</div>
								<div class="panel-body">								
									<div class="alert alert-warning" role="alert">
										<img src="imagens/question24.png" style="margin-right:10px;">Confirmar a exclusão do contato abaixo?
									</div>
									<h4>Detalhes do Compromisso:</h4>
									<p>Nome: <%= compromisso.getNome()%></p>
									<p>Assunto: <%= compromisso.getAssunto() %></p>
									<p>Local: <%= compromisso.getLocal() %> </p>
									<p>Data: <%= compromisso.getData() %></p>
									<p>Hora: <%= compromisso.getHorario() %></p>
									<hr>
									<a href="ExcluirCompromissoServlet?id=<%= compromisso.getId() %>" class="btn btn-danger">Confirmar</a>
									<a href="contatos.jsp" class="btn btn-success">Cancelar</a>
								</div>
							</div>
						</div>
					</div>
					
					<%@ include file="rodape.html" %>
					
				</div>		
				
			</body>
			
		</html>
<%
}
%>