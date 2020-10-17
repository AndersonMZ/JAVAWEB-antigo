<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
	import="br.senai.sp.dao.ContatoDAO"
	import="br.senai.sp.model.Contato"
	import="java.util.ArrayList"
	import="br.senai.sp.servlets.ListarContatoServlet"
	import="br.senai.sp.servlets.EditarContatoServlet"
	%>

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
		Contato contato =  new Contato();
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

	<div class="container" style="box-shadow: 3px 3px 5px 5px gray; border-radius: 6px; border: 3px inset;">

		<%@include file="cabecalho.html"%>

		<div class="row">
			<div class="col-md-3">
				<%@ include file="usuario.jsp"%>

				<%@ include file="menu.html"%>
			</div>
			<div class="col-md-9">
				<div class="panel panel-success">
					<div class="panel-heading"><img src="imagens/users24.png">Editar Contato</div>
					<div class="panel-body">
						<form action="EditarContatoServlet" method="post">
							<fieldSet>
							<input type="hidden" value="<%= contato.getId()%>" name="txtId">
							<legend style="font-size:15px; font-weight:bold;">Dados Gerais:</legend>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtNome">Nome:</label> <input type="text" 
										class="form-control" name="txtNome" value=<%= contato.getNome() %>>
								</div>
								<div class="form-group col-md-6">
									<label for="txtEmail">Email:</label> <input
										type="email" class="form-control" name="txtEmail" value=<%= contato.getEmail() %>>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtTelefone">Telefone:</label> <input type="text"
										class="form-control" name="txtTelefone" value=<%= contato.getTelefone() %>>
								</div>
								<div class="form-group col-md-4">
									<label for="txtCelular">Celular:</label> <input
										type="text" class="form-control" name="txtCelular"
										value=<%= contato.getCelular() %>>
								</div>
								<div class="form-group col-md-4">
									<label for="txtDtNasc">Dt. Nasc:</label> <input
										type="text" class="form-control" name="txtDtNasc"
										value=<%= contato.getDtNasc() %>>
								</div>
							</div>
							</fieldSet>
							<fieldSet> 
							<legend style="font-size:15px; font-weight:bold;">Endereço:</legend>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="txtLogradouro">Logradouro:</label> <input type="text"
										class="form-control" name="txtLogradouro" value=<%= contato.getLogradouro() %>>
								</div>
								<div class="form-group col-md-4">
									<label for="txtBairro">Bairro:</label> <input
										type="text" class="form-control" name="txtBairro"
										value=<%= contato.getBairro() %>>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<label for="txtCidade">Cidade:</label> <input type="text"
										class="form-control" name="txtCidade" value=<%= contato.getBairro() %>>
								</div>
								<div class="form-group col-md-4">
									<label for="txtEstado">Estado:</label>
									<select name="txtEstado" class="form-control">
										<option value="SP" <%= (estado.equals("SP")) ? "selected" : ""  %>>São Paulo</option>
									  	<option value="RJ" <%= (estado.equals("RJ")) ? "selected" : ""  %>>Rio de Janeiro</option>
									  	<option value="RS" <%= (estado.equals("RS")) ? "selected" : ""  %>>Rio Grande do Sul</option>
									  	<option value="MG" <%= (estado.equals("MG")) ? "selected" : ""  %>>Minas Gerais</option>
									  	<option value="GO" <%= (estado.equals("GO")) ? "selected" : ""  %>>Goiás</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<label for="txtCep">CEP:</label> <input
										type="text" class="form-control" name="txtCep"
										value=<%= contato.getCep() %>>
								</div>
							</div>		
							</fieldSet>	
							<fieldSet>
							<legend style="font-size:15px; font-weight:bold;">Outros:</legend>				
							<div class="form-row">
								<div class="col-md-3">
									<label for="txtPessoa">Tipo pessoa:</label><br>
									<input type="radio" name="txtPessoa" value="F" <%= (pessoa.equals("F")) ? "checked" : ""  %>>Física
									<input type="radio" name="txtPessoa" value="J" <%= (pessoa.equals("J")) ? "checked" : ""  %>>Jurídica
								</div>
								<div class="form-group col-md-9">
									<label for="txtContato">Contato na empresa:</label> <input type="text" class="form-control" name="txtContato" value=<%= contato.getContato() %>>			
								</div>
							</div>		
							</fieldSet>					
							<div class="form-row">
								<div class="col-md-12">
									<button type="submit" class="btn btn-success">Atualizar Contato</button>
									<a href="contatos.jsp" class="btn btn-warning">Cancelar</a>
								</div>
							</div>
						</form>
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