<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
	import="br.senai.sp.dao.ContatoDAO"
	import="br.senai.sp.model.Contato"
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
		
		ArrayList<Contato> lista = new ArrayList<>();
		ContatoDAO contatoDao = new ContatoDAO();
		lista = contatoDao.listaContatos(u.getId());
		
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
								<table class="table table-hover">
									<thead>
										<tr>
								        	<th>ID</th>
								        	<th>Nome</th>
								        	<th>E-mail</th>
								        	<th>Telefone</th>
								        	<th></th>
								   		</tr>
									</thead>
									<tbody>
										<%
										for(Contato c : lista){
											out.print("<tr>");
											out.print("<td>" +  c.getId() + "</td>");
											out.print("<td><a href=\"ListarContatoServlet?id=" + c.getId() + "&tela=detalhes\">" +  c.getNome() + "</a></td>");
											out.print("<td>" + c.getEmail() + "</td>");
											out.print("<td>" + c.getTelefone() + "</td>");
											out.print("<td><a href=\"ListarContatoServlet?id=" + c.getId() + "&tela=editar\"><img src=\"imagens/edit20.png\"> </a>| <a href=\"ListarContatoServlet?id=" + c.getId() + "&tela=excluir\"> <img src=\"imagens/delete20.png\"></a></td>");
											out.print("</tr>");
										}
										%>
								  	</tbody>
								  </table>
								  <a href="cadastra_contato.jsp" class="btn btn-primary">Novo Contato</a>
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


<!-- 		int i = 1;
			while (i < 10){
			out.println(									
					"<tr>" + 
			
			"<td>	John	</td> " + 
			"<td>	Doe		</td>" +
			"<td>	john@example.com	</td>" +
			
					"</tr>"									
						);
			i++;
			}
 -->