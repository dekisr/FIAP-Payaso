package br.com.fiap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.dao.EscolaDAO;
import br.com.fiap.dao.UsuarioDAO;

@WebServlet(urlPatterns="/mensagem")
public class Mensagem extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tipo = req.getParameter("tipo");
		String texto = req.getParameter("texto").trim();
		String idUsuario = req.getParameter("idUsuario");
		String idEscola = req.getParameter("idEscola");
		String idDestinatario = req.getParameter("idDestinatario");
		String mensagem = "";
		String voltar = req.getHeader("Referer");
		
		if(texto.length() > 256) {
			mensagem = "Sua mensagem deve conter no máximo 256 caracteres.";
			req.setAttribute("mensagem", mensagem);
			req.setAttribute("voltar", voltar);
			req.getRequestDispatcher("/WEB-INF/pages/resultado.jsp").forward(req, resp);
			return;
		} else if(texto.length() == 0) {
			mensagem = "Sua mensagem está vazia.";
			req.setAttribute("mensagem", mensagem);
			req.setAttribute("voltar", voltar);
			req.getRequestDispatcher("/WEB-INF/pages/resultado.jsp").forward(req, resp);
			return;
		} else {			
			if(tipo.equals("escola")) {
				try {
					EscolaDAO escDao = new EscolaDAO();
					escDao.enviarMensagem(idUsuario, idEscola, texto);
				} catch (Exception e) {
					System.out.println(e);
				}
			} else if (tipo.equals("aluno")) {
				try {
					UsuarioDAO usuDao = new UsuarioDAO();
					usuDao.enviarMensagem(idUsuario, idDestinatario, texto);
				} catch (Exception e) {
					System.out.println(e);
				}
			} else {
				//404
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}
		}
		String retorno = req.getHeader("Referer");
		resp.sendRedirect(retorno);
	}
}
