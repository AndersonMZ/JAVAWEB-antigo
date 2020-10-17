<%@page import="br.senai.sp.dao.CompromissoDAO"%>
<%@page import="br.senai.sp.model.Compromisso"%>
<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
	import="java.util.ArrayList"
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
		
		ArrayList<Compromisso> lista = new ArrayList<>();
		CompromissoDAO contatoDao = new CompromissoDAO();
		lista = contatoDao.listaCompromissos(u.getId());
		
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		
%>

		<!DOCTYPE html>
		<html>
		
			<head>	
				<meta charset="ISO-8859-1">
				<title>Compromissos</title>
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
								<div class="panel-heading">Meus Compromissos</div>
								<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
								        	<th>ID</th>
								        	<th>Assunto</th>
								        	<th>Local</th>
								   		</tr>
									</thead>								
									<tbody>
										<%
										for(Compromisso c : lista){
											out.print("<tr>");
											out.print("<td>" +  c.getId() + "</td>");
											out.print("<td><a href=\"ListarCompromissoServlet?id=" + c.getId() + "&tela=detalhes\">" +  c.getNome() + "</a></td>");
											out.print("<td>" + c.getAssunto() + "</td>");
											out.print("<td>" + c.getLocal() + "</td>");
											out.print("<td><a href=\"ListarCompromissoServlet?id=" + c.getId() + "&tela=editar\"><img src=\"imagens/edit20.png\"> </a>| <a href=\"ListarCompromissoServlet?id=" + c.getId() + "&tela=excluir\"> <img src=\"imagens/delete20.png\"></a></td>");
											out.print("</tr>");
										}
										%>								  	
									</tbody>
								  </table>
								  <a href="cadastra_compromisso.jsp" class="btn btn-primary">Novo Compromisso</a>
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