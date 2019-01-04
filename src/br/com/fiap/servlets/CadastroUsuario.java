package br.com.fiap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.beans.Usuario;
import br.com.fiap.bo.UsuarioBO;

@WebServlet(urlPatterns="/cadastroAluno")
public class CadastroUsuario extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nome = req.getParameter("nome");
		String email = req.getParameter("emailConf");
		String idEscola = req.getParameter("escola");
		String bio = req.getParameter("bio");
		String avatar = "images/avatars/avatarAlu_default.jpg";
		String senha = req.getParameter("senhaConf");
		
		Usuario usuario = new Usuario();
		usuario.setNm_usuario(nome);
		usuario.setDs_email(email);
		usuario.setId_escola(Integer.parseInt(idEscola));
		usuario.setDs_bio_usuario(bio);
		usuario.setDs_img(avatar);
		usuario.setDs_senha(senha);
		
		
		try {
			String mensagem = UsuarioBO.novoUsuario(usuario);
			String voltar = null;
			if(mensagem.equals("Cadastro realizado com sucesso!")) {
				voltar = "index.jsp";
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