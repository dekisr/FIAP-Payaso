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

@WebServlet(urlPatterns="/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");
		Usuario usuario = null;
		String mensagem = null;
		String voltar = null;
		
		try {			
			usuario = new UsuarioDAO().validaUsuario(email, senha);
		} catch (Exception e) {	System.out.println(e); }
		
		if(usuario == null) {
			mensagem = "A senha e o usuário não conferem! Preencha os dados corretamente.";
			voltar = req.getHeader("Referer");
			req.setAttribute("mensagem", mensagem);
			req.setAttribute("voltar", voltar);
			req.getRequestDispatcher("/WEB-INF/pages/resultado.jsp").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("logado", usuario);
			if(usuario.getId_usuario() == 26) {				
				session.setAttribute("admin", true);
			} else {
				session.setAttribute("admin", false);				
			}
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
	}
}
