<%@ page
	import="java.text.SimpleDateFormat"
	import="java.util.Date"	
	import="br.senai.sp.model.Usuario"
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
				<title>Home</title>
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
								<div class="panel-heading">Home</div>
								<div class="panel-body">
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