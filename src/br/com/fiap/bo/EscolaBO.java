package br.com.fiap.bo;

import java.util.ArrayList;
import java.util.List;

import br.com.fiap.beans.Escola;
import br.com.fiap.dao.EnderecoDAO;
import br.com.fiap.dao.EscolaDAO;

public class EscolaBO {
	public static String novoEscola(Escola esc) throws Exception {
		// validação
		if (esc.getNm_escola().length() > 50) {
			return "Nome Inválido. Máximo de 50 caracteres para o nome da Escola.";
		}
		if (esc.getEndereco() == null) {
			return "Endereço vazio!";
		}
		if (esc.getDs_bio().length() > 300) {
			return "Sua Bio deve conter no máximo de 300 caracteres";
		}

		EscolaDAO dao = new EscolaDAO();
		EnderecoDAO endDao = new EnderecoDAO();
		int idEnd = endDao.findByMax();
		esc.getEndereco().setId_endereco(idEnd);

		String resposta = EnderecoBO.novoEndereco(esc.getEndereco());
		String x = null;
		if (resposta.equals("Endereço gravado")) {
			x = dao.gravar(esc);
			dao.fechar();
		} else {
			return resposta;
		}
		return x;
	}

	public static void novoRanking() throws Exception {
		EscolaDAO dao = new EscolaDAO();
		List<Escola> lista = new ArrayList<>();

		lista = dao.selecionarTodosID();
		for (Escola c : lista) {
			int i = c.getId_escola();
			dao.ranking(i);
		}

		dao.fechar();
	}
	public static void atualizaPontosEscola(int idEscola) throws Exception {
		EscolaDAO dao = new EscolaDAO();
		dao.ranking(idEscola);
		dao.fechar();
	}
}
