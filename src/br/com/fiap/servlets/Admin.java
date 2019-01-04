package br.com.fiap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.beans.Usuario;
import br.com.fiap.dao.UsuarioDAO;

@WebServlet(urlPatterns = "/admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Usuario logado = (Usuario) session.getAttribute("logado");
		Boolean admin = (Boolean) session.getAttribute("admin");
		String retorno = "";

		if (logado == null || admin == false) {
			retorno = "index.jsp";
		} else {
			try {
				List<Usuario> listaUsuarios = new UsuarioDAO().listaUsuarios();
				req.setAttribute("listaUsuarios", listaUsuarios);
			} catch (Exception e) {
				System.out.println(e);
			}
			retorno = "/WEB-INF/pages/admin.jsp";
		}
		req.getRequestDispatcher(retorno).forward(req, resp);

	}
}
