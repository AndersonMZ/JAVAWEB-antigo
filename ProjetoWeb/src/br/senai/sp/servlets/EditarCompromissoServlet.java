package br.senai.sp.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;

@WebServlet("/EditarCompromissoServlet")
public class EditarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditarCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Compromisso compromisso = new Compromisso();
		compromisso.setNome(request.getParameter("txtNome"));
		compromisso.setLocal(request.getParameter("txtLocal"));
		compromisso.setAssunto(request.getParameter("txtAssunto"));
		compromisso.setHorario(request.getParameter("txtHorario"));
		compromisso.setData(request.getParameter("txtData"));		
		compromisso.setId(Integer.parseInt(request.getParameter("txtId")));
		CompromissoDAO compromissoDao = new CompromissoDAO();
		compromissoDao.editar(compromisso);
		
		response.sendRedirect("compromissos.jsp");
	}

}
