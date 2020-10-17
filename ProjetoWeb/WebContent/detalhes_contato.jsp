<%@page import="br.senai.sp.model.Contato"%>
<%@ page import="java.text.SimpleDateFormat" import="java.util.Date"
	import="br.senai.sp.model.Usuario"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	//String nome = request.getParameter("txtEmail");
	//String senha = request.getParameter("txtSenha");

	if (session.getAttribute("usuario") == null) {
		response.sendRedirect("login.jsp");
	} else {

		Usuario u = new Usuario();
		//u = (Usuario)request.getAttribute("usuario");

		u = (Usuario) session.getAttribute("usuario");

		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		Contato contato = new Contato();
		contato = (Contato)request.getAttribute("contato");
		String estado = contato.getEstado();
		String pessoa = contato.getPessoa();
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>

<body>

	<div class="container"
		style="box-shadow: 3px 3px 5px 5px gray; border-radius: 6px; border: 3px inset;">

		<%@include file="cabecalho.html"%>

		<div class="row">
			<div class="col-md-3">
				<%@ include file="usuario.jsp"%>

				<%@ include file="menu.html"%>
			</div>
			<div class="col-md-9">
				<div class="panel panel-success">
					<div class="panel-heading"><img src="imagens/users24.png">Novo Contato</div>
					<div class="panel-body">						
							<fieldSet>
							<legend style="font-size:15px; font-weight:bold;">Dados Gerais:</legend>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtNome">Nome:</label> <input type="text"
										class="form-control" name="txtNome" value="<%= contato.getNome() %>" disabled>
								</div>
								<div class="form-group col-md-6">
									<label for="txtEmail">Email:</label> <input
										type="email" class="form-control" name="txtEmail"
										value="<%= contato.getEmail() %>" disabled>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtTelefone">Telefone:</label> <input type="text"
										class="form-control" name="txtTelefone" value="<%= contato.getTelefone() %>" disabled>
								</div>
								<div class="form-group col-md-4">
									<label for="txtCelular">Celular:</label> <input
										type="text" class="form-control" name="txtCelular"
										value="<%= contato.getCelular() %>" disabled>
								</div>
								<div class="form-group col-md-4">
									<label for="txtDtNasc">Dt. Nasc:</label> <input
										type="text" class="form-control" name="txtDtNasc"
										value="<%= contato.getDtNasc() %>" disabled>
								</div>
							</div>
							</fieldSet>
							<fieldSet> 
							<legend style="font-size:15px; font-weight:bold;">Endereço:</legend>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="txtLogradouro">Logradouro:</label> <input type="text"
										class="form-control" name="txtLogradouro" value="<%= contato.getLogradouro() %>" disabled>
								</div>
								<div class="form-group col-md-4">
									<label for="txtBairro">Bairro:</label> <input
										type="text" class="form-control" name="txtBairro"
										value="<%= contato.getBairro() %>" disabled>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<label for="txtCidade">Cidade:</label> <input type="text"
										class="form-control" name="txtCidade" value="<%= contato.getCidade() %>" disabled>
								</div>
								<div class="form-group col-md-4">
									<label for="txtEstado">Estado:</label>
									<select name="txtEstado" class="form-control" disabled>
										<option disabled value="SP" <%= (estado.equals("SP")) ? "selected" : ""  %>>São Paulo</option>
									  	<option disabled value="RJ" <%= (estado.equals("RJ")) ? "selected" : ""  %>>Rio de Janeiro</option>
									  	<option disabled value="RS" <%= (estado.equals("RS")) ? "selected" : ""  %>>Rio Grande do Sul</option>
									  	<option disabled value="MG" <%= (estado.equals("MG")) ? "selected" : ""  %>>Minas Gerais</option>
									  	<option disabled value="GO" <%= (estado.equals("GO")) ? "selected" : ""  %>>Goiás</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<label for="txtCep">CEP:</label> <input
										type="text" class="form-control" name="txtCep"
										value="<%= contato.getCep() %>" disabled>
								</div>
							</div>		
							</fieldSet>	
							<fieldSet>
							<legend style="font-size:15px; font-weight:bold;">Outros:</legend>				
							<div class="form-row">
								<div class="col-md-3">
									<label for="txtPessoa">Tipo pessoa:</label><br>
									<input type="radio" name="txtPessoa" value="F" <%= (pessoa.equals("F")) ? "checked" : ""  %> disabled>Física
									<input type="radio" name="txtPessoa" value="J" <%= (pessoa.equals("J")) ? "checked" : ""  %> disabled>Jurídica
								</div>
								<div class="form-group col-md-9">
									<label for="txtContato">Contato na empresa:</label> <input disabled type="text" class="form-control" name="txtContato" value=<%= contato.getContato() %>>			
								</div>
							</div>		
							</fieldSet>					
							<div class="form-row">
								<div class="col-md-12">
									<a href="contatos.jsp" class="btn btn-success">Voltar</a>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="rodape.html"%>

	</div>

</body>

</html>
<%
	}
%>