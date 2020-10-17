package br.senai.sp.servlets;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//double salario = Double.parseDouble(request.getParameter("txtSalario"));
		//DecimalFormat format = new DecimalFormat("#.##");
		//double aaa = Double.parseDouble(format.format(salario));
		String tipo = request.getParameter("modo");
		
		if(tipo.equals("alterarSenha")){
			
			Usuario usuario = new Usuario();
			
			usuario.setSenha(request.getParameter("txtSenha"));
			usuario.setId(Integer.parseInt(request.getParameter("txtId")));
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			usuarioDao.editarSenha(usuario);
			
		} else{
			
			Usuario usuario = new Usuario();
		
			usuario.setNome(request.getParameter("txtNome"));
			usuario.setEmail(request.getParameter("txtEmail"));
			usuario.setCidade(request.getParameter("txtCidade"));
			usuario.setTelefone(request.getParameter("txtTelefone"));
			usuario.setSalario(Double.parseDouble(request.getParameter("txtSalario")));
			usuario.setDtNasc(request.getParameter("txtDtNasc"));
			usuario.setId(Integer.parseInt(request.getParameter("txtId")));
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			usuarioDao.editar(usuario);
			
			HttpSession sessao = request.getSession();
			
			sessao.removeAttribute("usuario");
			sessao.setAttribute("usuario", usuario);		
		}
		
		response.sendRedirect("index.jsp");	
		
	}

}
