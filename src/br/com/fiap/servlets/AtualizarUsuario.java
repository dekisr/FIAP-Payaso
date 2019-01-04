package br.com.fiap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.fiap.beans.Usuario;
import br.com.fiap.bo.UsuarioBO;
import br.com.fiap.dao.UsuarioDAO;

@WebServlet (urlPatterns="/atualizarUsuario")
public class AtualizarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String avatar = req.getParameter("avatar");
		String email = req.getParameter("emailConf");
		String bio = req.getParameter("bio");
		String senha = req.getParameter("senhaConf");
		String id = req.getParameter("id");
		
		Usuario usuario = new Usuario();
		usuario.setId_usuario(Integer.parseInt(id));
		usuario.setNm_usuario(nome);
		usuario.setDs_email(email);
		usuario.setDs_bio_usuario(bio);
		usuario.setDs_img(avatar);
		usuario.setDs_senha(senha);
		
		HttpSession session = req.getSession();
		Boolean admin = (Boolean) session.getAttribute("admin");
		
		try {
			String emailAntigo = new UsuarioDAO().buscaPorId(usuario.getId_usuario()).getDs_email();
			String mensagem = UsuarioBO.atualizaUsuario(usuario, emailAntigo);
			String voltar = null;
			if(mensagem.equals("Perfil atualizado com sucesso!")) {
				if(admin != false) {					
					voltar = "admin";
				} else {
					voltar = "perfil?tipo=aluno&id=" + usuario.getId_usuario();					
				}
			} else {
				voltar = req.getHeader("Referer");
			}
			req.setAttribute("mensagem", mensagem);
			req.setAttribute("voltar", voltar);
			req.getRequestDispatcher("/WEB-INF/pages/resultado.jsp").forward(req, resp);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}