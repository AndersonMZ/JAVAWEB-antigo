package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

@WebServlet("/ListarUsuarioServlet")
public class ListarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Usuario u = new Usuario();
		UsuarioDAO usuarioDao = new UsuarioDAO();
		u = usuarioDao.getUsuario(id);
		
		request.setAttribute("usuario", u);
		RequestDispatcher rd = request.getRequestDispatcher("dados_usuario.jsp");
		rd.forward(request, response);
		
	}

}
