package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

/**
 * Servlet implementation class CadastroUsuarioServlet
 */
@WebServlet("/CadastroUsuarioServlet")
public class CadastroUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastroUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Usuario usuario = new Usuario();
		usuario.setNome(request.getParameter("txtNome"));
		usuario.setSexo(request.getParameter("txtSexo"));
		usuario.setEmail(request.getParameter("txtEmail"));
		usuario.setSenha(request.getParameter("txtSenha"));
		usuario.setCidade(request.getParameter("txtCidade"));
		usuario.setDtNasc(request.getParameter("txtDtNasc"));
		usuario.setSalario(Double.parseDouble(request.getParameter("txtSalario")));
		usuario.setTelefone(request.getParameter("txtTelefone"));
		
		UsuarioDAO usuarioDao = new UsuarioDAO();
		usuarioDao.gravar(usuario);
		
		response.sendRedirect("sucesso_cadastro.jsp");
	}

}
