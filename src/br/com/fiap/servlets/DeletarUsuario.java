package br.com.fiap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.beans.Usuario;
import br.com.fiap.dao.UsuarioDAO;

@WebServlet(urlPatterns = "/deletarUsuario")
public class DeletarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Usuario logado = (Usuario) session.getAttribute("logado");
		Boolean admin = (Boolean) session.getAttribute("admin");
		String mensagem = "";
		String retorno = "";

		if (logado == null || admin == false) {
			retorno = "index.jsp";
		} else {
			String adminEditar = req.getParameter("idUsuario");
			String voltar = "";
			try {
				mensagem = new UsuarioDAO().deletarUsuario(Integer.parseInt(adminEditar));;
				if(mensagem.equals("Usuário removido com sucesso.")) {			
					voltar = "admin";
				} else {
					mensagem = "Erro!";
					voltar = "index.jsp";
				}
				req.setAttribute("mensagem", mensagem);
				req.setAttribute("voltar", voltar);
			} catch (Exception e) {
				System.out.println(e);
			}
			retorno = "/WEB-INF/pages/resultado.jsp";
		}
		req.getRequestDispatcher(retorno).forward(req, resp);
	}
}
