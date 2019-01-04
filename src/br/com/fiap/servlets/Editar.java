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

@WebServlet(urlPatterns="/editarUsuario")
public class Editar extends HttpServlet {
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
		String retorno = "";
		
		if (logado == null) {
			retorno = "index.jsp";
		} else if (admin != false) {
			String adminEditar = req.getParameter("idUsuario");
			try {
				if(adminEditar == null) adminEditar = Integer.toString(logado.getId_usuario());
				Usuario usuario = new UsuarioDAO().buscaPorId(Integer.parseInt(adminEditar));
				req.setAttribute("usuario", usuario);
			} catch (Exception e) {
				System.out.println(e);
			}
			retorno = "/WEB-INF/pages/perfil_usuario_editar.jsp";
		} else {
			try {
				Usuario usuario = new UsuarioDAO().buscaPorId(logado.getId_usuario());
				req.setAttribute("usuario", usuario);
			} catch (Exception e) {
				System.out.println(e);
			}
			retorno = "/WEB-INF/pages/perfil_usuario_editar.jsp";
		}
		req.getRequestDispatcher(retorno).forward(req, resp);
	}
}
