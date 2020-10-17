package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.senai.sp.dao.UsuarioDAO;
import br.senai.sp.model.Usuario;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * response.getWriter().append("Served at: ").append(request.
		 * getContextPath());
		 */

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* doGet(request, response); */
		
		String email = request.getParameter("txtEmail");
		String senha = request.getParameter("txtSenha");

		UsuarioDAO uDAO = new UsuarioDAO();
		Usuario u = new Usuario();
		u = uDAO.autenticar(email, senha);
		if (u != null ) {

/*			u.setId(1);
			u.setNome("Ana Pedroso");
			u.setEmail(email);
			u.setSenha("");
			u.setDtNasc("18/01/1998");
			u.setSexo("M");
			u.setTelefone("(11) 5564-8956");
			u.setCidade("Jandira");
			u.setSalario(2000);
*/
			
			/*request.setAttribute("usuario", u);

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);*/

			/* SESSÃO DO USUÁRIO */
						
			HttpSession sessao = request.getSession();
			sessao.setAttribute("usuario", u);
			response.sendRedirect("index.jsp");
			
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	
}
