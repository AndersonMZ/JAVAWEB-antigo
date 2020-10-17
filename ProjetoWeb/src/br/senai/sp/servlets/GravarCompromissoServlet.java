package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;

@WebServlet("/GravarCompromissoServlet")
public class GravarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GravarCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Compromisso compromisso = new Compromisso();
		compromisso.setNome(request.getParameter("txtNome"));
		compromisso.setHorario(request.getParameter("txtHorario"));
		compromisso.setLocal(request.getParameter("txtLocal"));
		compromisso.setAssunto(request.getParameter("txtAssunto"));
		compromisso.setData(request.getParameter("txtData"));
		compromisso.setIdUsuario(Integer.parseInt(request.getParameter("txtId")));
		
		CompromissoDAO contatoDao = new CompromissoDAO();
		contatoDao.gravar(compromisso);
		
		response.sendRedirect("compromissos.jsp");
	}

}
