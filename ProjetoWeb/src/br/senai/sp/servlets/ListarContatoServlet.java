package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.ContatoDAO;
import br.senai.sp.model.Contato;

@WebServlet("/ListarContatoServlet")
public class ListarContatoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public ListarContatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Contato contato = new Contato();
		ContatoDAO contatoDao = new ContatoDAO();
		contato = contatoDao.getContato(id);
		
		String target = request.getParameter("tela");
		String arquivo = "";
		
		if (target.equals("editar")){			
			arquivo = "editar.jsp";			
		}else if (target.equals("detalhes")){		
			arquivo = "detalhes_contato.jsp";
		}else{	
			arquivo = "excluir.jsp";			
		}
		
		request.setAttribute("contato", contato);
		RequestDispatcher rd = request.getRequestDispatcher(arquivo);
		rd.forward(request, response);
		
	}
	
}
