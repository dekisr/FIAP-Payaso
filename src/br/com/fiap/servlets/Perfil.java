package br.com.fiap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.beans.Escola;
import br.com.fiap.beans.Usuario;
import br.com.fiap.bo.EscolaBO;
import br.com.fiap.dao.EscolaDAO;
import br.com.fiap.dao.UsuarioDAO;

@WebServlet(urlPatterns="/perfil")
public class Perfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tipo = req.getParameter("tipo");
		String id = req.getParameter("id");
		if(tipo == null) tipo = "oi";
		if(id == null) id = "oi";
		String retorno = "";
		String retornoDefault = "index.jsp";
		
		Escola escola = null;
		int qtdAlunos = 0;
		Usuario usuario = null;
		List<Usuario> alunosEmDestaque = null;
		List<String> mensagens = null;
		
		if (tipo.equals("escola")) {
			try {
				EscolaBO.atualizaPontosEscola(Integer.parseInt(id));
				escola = new EscolaDAO().buscaPorId(Integer.parseInt(id));
				qtdAlunos = new EscolaDAO().qtdAluno(Integer.parseInt(id));
				alunosEmDestaque = new UsuarioDAO().alunosPorPontuacao(Integer.parseInt(id));
				mensagens = new EscolaDAO().listaMensagens(Integer.parseInt(id));
			} catch (Exception e) {
				System.out.println(e);
			}
			req.setAttribute("escola", escola);
			req.setAttribute("qtdAlunos", qtdAlunos);
			req.setAttribute("alunosEmDestaque", alunosEmDestaque);
			req.setAttribute("mensagens", mensagens);
			retorno = "/WEB-INF/pages/perfil_escola.jsp";
			if(escola == null) retorno = retornoDefault;
		} else if (tipo.equals("aluno")) {
			try {
				usuario = new UsuarioDAO().buscaPorId(Integer.parseInt(id));
				escola = new EscolaDAO().buscaPorId(usuario.getId_escola());
				mensagens = new UsuarioDAO().listaMensagens(Integer.parseInt(id));
			} catch (Exception e) {
				System.out.println(e);
			}
			req.setAttribute("aluno", usuario);
			req.setAttribute("escola", escola);
			req.setAttribute("mensagens", mensagens);
			retorno = "/WEB-INF/pages/perfil_usuario.jsp";
			if(usuario == null) retorno = retornoDefault;
		} else {
			// 404
			retorno = retornoDefault;
		}
		
		req.getRequestDispatcher(retorno).forward(req, resp);
		
	}
}
