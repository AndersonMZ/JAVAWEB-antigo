<div class="panel panel-success">
	<div class="panel-heading">Usuário</div>
	<div class="panel-body">
		<p>
			<strong>Usuário: </strong><a href="ListarUsuarioServlet?id=<%= u.getId() %>"><% out.print(u.getNome()); %></a> 						
		</p>
		<p>
			<strong>Dt. Nasc: </strong> <% out.print(u.getDtNasc()); %>								
		</p>
		<p>
			<strong>Cidade: </strong> <% out.print(u.getCidade()); %>								
		</p>
		<p>
			<strong>Data: </strong> <% out.print(df.format(new Date())); %>
		</p>
		<a href="logoff.jsp">Sair do sistema</a>
	</div>
</div>

<!-- out.print(df.format(u.getDtNasc())); -->