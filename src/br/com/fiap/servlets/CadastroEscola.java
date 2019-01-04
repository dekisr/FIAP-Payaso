package br.com.fiap.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.fiap.beans.Endereco;
import br.com.fiap.beans.Escola;
import br.com.fiap.bo.EscolaBO;

@WebServlet (urlPatterns="/cadastroEscola")
public class CadastroEscola extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nomeEscola = req.getParameter("nomeEscola");
		String endereco = req.getParameter("endereco");
		String numero = req.getParameter("numero");
		String cep = req.getParameter("cep");
		String complemento = req.getParameter("complemento");
		String bio = req.getParameter("bio");
		String avatar = "images/avatars/avatarEsc_default.png";

		Endereco end = new Endereco();
		end.setDs_endereco(endereco);
		if(Double.parseDouble(numero) > Integer.MAX_VALUE) numero = "9999999";
		end.setNr_endereco(Integer.parseInt(numero));
		end.setNr_cep(Integer.parseInt(cep));
		end.setDs_complemento(complemento);
		
		Escola esc = new Escola();
		esc.setNm_escola(nomeEscola);
		esc.setDs_bio(bio);
		esc.setEndereco(end);
		esc.setDs_img(avatar);
		
		try {
			String mensagem = EscolaBO.novoEscola(esc);
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
