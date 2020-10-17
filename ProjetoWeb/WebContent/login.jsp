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
				<div class="col-md-4">
				</div>
				
				<div class="col-md-4">
					<div class="panel panel-success">
						<div class="panel-heading" style="font-size:20px;"><img src="imagens/login48.png">Login</div>
						<div class="panel-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
							    	<label for="email">E-mail:</label>
							    	<input type="email" class="form-control" id="email" name="txtEmail">
							  	</div>
							  	<div class="form-group">
							    	<label for="pwd">Senha:</label>
									<input type="password" class="form-control" id="pwd" name="txtSenha">
								</div>
							  <!--
							  <div class="checkbox">
							    <label><input type="checkbox"> Lembrar</label>
							  </div>  -->							  	
								<button type="submit" class="btn btn-success">Entrar</button>	
								<p style="text-align:right;"> <a href="cadastra_usuario.jsp">Quero me cadastrar.</a></p>				  
							</form>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
				</div>
			</div>
			
			<br><br><br><br><br>
			
			<%@include file="rodape.html" %>
			
		</div>
		
	</body>
</html>