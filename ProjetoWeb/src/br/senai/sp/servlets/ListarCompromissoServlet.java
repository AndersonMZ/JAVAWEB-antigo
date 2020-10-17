package br.senai.sp.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.senai.sp.dao.CompromissoDAO;
import br.senai.sp.model.Compromisso;

@WebServlet("/ListarCompromissoServlet")
public class ListarCompromissoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarCompromissoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Compromisso compromisso = new Compromisso();
		CompromissoDAO compromissoDao = new CompromissoDAO();
		compromisso = compromissoDao.getContato(id);
		
		String target = request.getParameter("tela");
		String arquivo = "";
		
		if (target.equals("editar")){			
			arquivo = "editar_compromisso.jsp";			
		}else if (target.equals("detalhes")){		
			arquivo = "detalhes_compromisso.jsp";
		}else{	
			arquivo = "excluir_compromisso.jsp";			
		}
		
		request.setAttribute("compromisso", compromisso);
		RequestDispatcher rd = request.getRequestDispatcher(arquivo);
		rd.forward(request, response);
	}

}
