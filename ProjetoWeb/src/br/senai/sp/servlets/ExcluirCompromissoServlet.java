package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;

@WebServlet("/ExcluirCompromissoServlet")
public class ExcluirCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		CompromissoDAO compromissoDao = new CompromissoDAO();
		compromissoDao.excluir(id);
		response.sendRedirect("compromisso.jsp");
	}

}
