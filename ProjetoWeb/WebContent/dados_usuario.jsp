<%@page import="br.senai.sp.dao.UsuarioDAO"%>
<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
	import="br.senai.sp.dao.ContatoDAO"
	import="br.senai.sp.model.Contato"
	import="java.util.ArrayList"
	import="br.senai.sp.servlets.ListarUsuarioServlet"
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
		
%>

		<!DOCTYPE html>
		<html>
		
			<head>	
				<meta charset="ISO-8859-1">
				<title>Usuário</title>
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
								<div class="panel-heading">Dados Usuário</div>
								<div class="panel-body">
								<form action="EditarUsuarioServlet?modo=alterar" method="post">
									<input type="hidden" value="<%= u.getId()%>" name="txtId">
									<div class="form-group">
								    	<label for="txtNome">Nome:</label>
								    	<input type="text" class="form-control" name="txtNome" value="<%= u.getNome()%>">
								  	</div>
									<div class="form-group">
								    	<label for="txtEmail">E-mail:</label>
								    	<input type="email" class="form-control" name="txtEmail" value="<%= u.getEmail()%>">
								  	</div>
									<div class="form-row">
									  	<div style="padding:0;" class="form-group col-md-6">
									    	<label for="txtCidade">Cidade:</label>
											<input type="text" class="form-control" name="txtCidade" value="<%= u.getCidade()%>">
										</div>
										<div class="form-group col-md-6">
										    <label for="txtDtNasc">Data Nasc.:</label>
											<input type="date" class="form-control" name="txtDtNasc" value="<%= u.getDtNasc()%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6" style="padding:0px;">
									    	<label for="txtTelefone">Telefone:</label>
									    	<input type="tel" class="form-control" name="txtTelefone" value="<%= u.getTelefone()%>">
									  	</div>
										<div class="form-group col-md-6">
									    	<label for="txtSalario">Salario:</label>
									    	<input type="number" class="form-control" name="txtSalario" value="<%= u.getSalario()%>">
									  	</div>
								  	</div>
								  <!--
								  <div class="checkbox">
								    <label><input type="checkbox"> Lembrar</label>
								  </div>  -->							  	
									<button type="submit" class="btn btn-success">Atualizar</button>		
									<a href="index.jsp" class="btn btn-warning">Cancelar</a> 
									<a href="alterarSenha.jsp" class="btn btn-succes">Alterar Senha</a>
								</form>
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