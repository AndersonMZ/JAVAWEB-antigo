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
					<div class="panel-heading"><img src="imagens/users24.png">Novo Compromisso</div>
					<div class="panel-body">
						<form action="GravarCompromissoServlet" method="post">
							<fieldSet>
							<input type="hidden" value="<%= u.getId()%>" name="txtId">
							<legend style="font-size:15px; font-weight:bold;">Informações:</legend>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="txtNome">Nome:</label> <input
										type="text" class="form-control" name="txtNome"
										placeholder="Digite o nome...">
								</div>
								<div class="form-group col-md-4">
									<label for="txtData">Data:</label> <input type="date"
										class="form-control" name="txtData">
								</div>
								<div class="form-group col-md-4">
									<label for="txtHorario">Horário:</label> <input
										type="text" class="form-control" name="txtHorario"
										placeholder="Digite o horário...">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="txtAssunto">Assunto:</label> <input type="text"
										class="form-control" name="txtAssunto" placeholder="Digite o assunto...">
								</div>
								<div class="form-group col-md-6">
									<label for="txtLocal">Local:</label> <input
										type="text" class="form-control" name="txtLocal"
										placeholder="Digite o local...">
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