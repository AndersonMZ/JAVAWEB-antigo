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
						<form action="GravarContatoServlet" method="post">
							<fieldSet>
							<input type="hidden" value="<%= u.getId()%>" name="txtId">
							<legend style="font-size:15px; font-weight:bold;">Dados Gerais:</legend>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtNome">Nome:</label> <input type="text"
										class="form-control" name="txtNome" placeholder="Digite seu nome...">
								</div>
								<div class="form-group col-md-6">
									<label for="txtEmail">Email:</label> <input
										type="email" class="form-control" name="txtEmail"
										placeholder="Digite seu e-mail...">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtTelefone">Telefone:</label> <input type="text"
										class="form-control" name="txtTelefone" placeholder="Digite seu telefone...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtCelular">Celular:</label> <input
										type="text" class="form-control" name="txtCelular"
										placeholder="Digite seu celular...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtDtNasc">Dt. Nasc:</label> <input
										type="text" class="form-control" name="txtDtNasc"
										placeholder="Digite sua data de nascimento">
								</div>
							</div>
							</fieldSet>
							<fieldSet> 
							<legend style="font-size:15px; font-weight:bold;">Endereço:</legend>
							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="txtLogradouro">Logradouro:</label> <input type="text"
										class="form-control" name="txtLogradouro" placeholder="Digite rua, avenida, travessa...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtBairro">Bairro:</label> <input
										type="text" class="form-control" name="txtBairro"
										placeholder="Digite seu bairro...">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-5">
									<label for="txtCidade">Cidade:</label> <input type="text"
										class="form-control" name="txtCidade" placeholder="Digite sua cidade...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtEstado">Estado:</label>
									<select name="txtEstado" class="form-control">
										<option value="SP">São Paulo</option>
									  	<option value="RJ">Rio de Janeiro</option>
									  	<option value="RS">Rio Grande do Sul</option>
									  	<option value="MG">Minas Gerais</option>
									  	<option value="GO">Goiás</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<label for="txtCep">CEP:</label> <input
										type="text" class="form-control" name="txtCep"
										placeholder="Digite seu CEP...">
								</div>
							</div>		
							</fieldSet>	
							<fieldSet>
							<legend style="font-size:15px; font-weight:bold;">Outros:</legend>				
							<div class="form-row">
								<div class="col-md-3">
									<label for="txtPessoa">Tipo pessoa:</label><br>
									<input type="radio" name="txtPessoa" value="F">Física
									<input type="radio" name="txtPessoa" value="J">Jurídica
								</div>
								<div class="form-group col-md-9">
									<label for="txtContato">Contato na empresa:</label> <input
										type="text" class="form-control" name="txtContato"
										placeholder="Informe o contato na empresa...">
								</div>
							</div>		
							</fieldSet>					
							<div class="form-row">
								<div class="col-md-12">
									<button type="submit" class="btn btn-success">Gravar Contato</button>
									<button type="reset" class="btn btn-warning">Limpar Formulários</button>
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