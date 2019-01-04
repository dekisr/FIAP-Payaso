package br.com.fiap.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.beans.Escola;
import br.com.fiap.bo.EscolaBO;
import br.com.fiap.dao.EscolaDAO;

@WebServlet(urlPatterns="/ranking")
public class Ranking extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Escola> listaEscolas = null;
		try {
			EscolaBO.novoRanking();
			listaEscolas = new EscolaDAO().rankingAll();
		} catch (Exception e) {
			System.out.println(e);
		}
		req.setAttribute("listaEscolas", listaEscolas);
		req.getRequestDispatcher("/WEB-INF/pages/ranking.jsp").forward(req, resp);
	}
}
