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

@WebServlet("/EditarContatoServlet")
public class EditarContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public EditarContatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Contato contato = new Contato();
		contato.setNome(request.getParameter("txtNome"));
		contato.setEmail(request.getParameter("txtEmail"));
		contato.setTelefone(request.getParameter("txtTelefone"));
		contato.setCelular(request.getParameter("txtCelular"));
		contato.setDtNasc(request.getParameter("txtDtNasc"));
		contato.setLogradouro(request.getParameter("txtLogradouro"));
		contato.setBairro(request.getParameter("txtBairro"));
		contato.setCidade(request.getParameter("txtCidade"));
		contato.setEstado(request.getParameter("txtEstado"));
		contato.setCep(request.getParameter("txtCep"));
		contato.setPessoa(request.getParameter("txtPessoa"));
		contato.setContato(request.getParameter("txtContato"));
		contato.setId(Integer.parseInt(request.getParameter("txtId")));
		ContatoDAO contatoDao = new ContatoDAO();
		contatoDao.editar(contato);
		
		response.sendRedirect("contatos.jsp");
		
	}

}
