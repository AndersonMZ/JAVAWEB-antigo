<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<title>Agenda</title>
	</head>
	
	<body>
		
		<div class="container" style="box-shadow: 3px 3px 5px 5px gray; border-radius:6px; border:3px inset;">
			
			<%@include file="cabecalho.html" %>			
			<br><br><br><br><br>
				
			<div class="row">
				<div class="col-md-3">
				</div>
				
				<div class="col-md-6">
					<div class="panel panel-success">
						<div class="panel-heading" style="font-size:20px;"><img src="imagens/login48.png">Login</div>
						<div class="panel-body">
							<form action="CadastroUsuarioServlet" method="post">
								<div class="form-group">
							    	<label for="txtNome">Nome:</label>
							    	<input type="text" class="form-control" name="txtNome">
							  	</div>
								<div class="form-group">
							    	<label for="txtEmail">E-mail:</label>
							    	<input type="email" class="form-control" name="txtEmail">
							  	</div>
								<div class="form-group">
							    	<label for="txtSenha">Senha:</label>
							    	<input type="password" class="form-control" name="txtSenha">
							  	</div>
								<div class="form-row">
								  	<div style="padding:0;" class="form-group col-md-6">
								    	<label for="txtCidade">Cidade:</label>
										<input type="text" class="form-control" name="txtCidade">
									</div>
									<div class="form-group col-md-6">
									    <label for="txtDtNasc">Data Nasc.:</label>
										<input type="date" class="form-control" name="txtDtNasc">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6" style="padding:0px;">
								    	<label for="txtTelefone">Telefone:</label>
								    	<input type="tel" class="form-control" name="txtTelefone">
								  	</div>
									<div class="form-group col-md-6">
								    	<label for="txtSalario">Salario:</label>
								    	<input type="number" class="form-control" name="txtSalario">
								  	</div>
							  	</div>
								<div class="form-group">
									<label for="txtSexo">Sexo:</label><br>
									<input type="radio" name="txtSexo" value="F">Feminino
									<input type="radio" name="txtSexo" value="J">Masculino
								</div>
							  <!--
							  <div class="checkbox">
							    <label><input type="checkbox"> Lembrar</label>
							  </div>  -->							  	
								<button type="submit" class="btn btn-success">Cadastrar</button>		
								<a href="login.jsp" class="btn btn-warning">Cancelar</a> 
							</form>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
				</div>
			</div>
			
			<br><br><br><br><br>
			
			<%@include file="rodape.html" %>
			
		</div>
		
	</body>
</html>