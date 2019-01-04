package br.com.fiap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.beans.Escola;
import br.com.fiap.dao.EscolaDAO;

@WebServlet(urlPatterns="/cadastro")
public class Cadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tipo = req.getParameter("tipo");
		if(tipo == null) tipo = "oi";
		String retorno = "";
		
		if (tipo.equals("aluno")) {
			List<Escola> listaEscolas = null;
			try {
				EscolaDAO escDao = new EscolaDAO();
				listaEscolas = escDao.listaEscolas();
			} catch (Exception e) {
				// 404
				System.out.println(e);
			}
			req.setAttribute("listaEscolas", listaEscolas);
			retorno = "/WEB-INF/pages/cadastro_aluno.jsp";
		} else if (tipo.equals("escola")) {
			retorno = "/WEB-INF/pages/cadastro_escola.jsp";
		} else {
			retorno = "index.jsp";
		}
		req.getRequestDispatcher(retorno).forward(req, resp);
	}
}
