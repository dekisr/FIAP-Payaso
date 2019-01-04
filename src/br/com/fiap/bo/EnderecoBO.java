	package br.com.fiap.bo;

import br.com.fiap.beans.Endereco;
import br.com.fiap.dao.EnderecoDAO;

public class EnderecoBO {
	public static String novoEndereco(Endereco e) throws Exception {

		// valida��o
//		if (String.valueOf(e.getNr_cep()).length() > 8) {
		if(!Integer.toString(e.getNr_cep()).matches("[0-9]{8}")) {
			return "Cep inv�lido. Deve conter 8 caracteres apenas num�ricos.";
		}
		if(Integer.toString(e.getNr_endereco()).length() > 6) {
			return "N�mero Inv�lido";
		}
		if (e.getDs_endereco().length() > 50) {
			return "O endere�o deve ter no m�ximo 50 caracteres.";
		}
		if (e.getDs_complemento().length() > 30) {
			return "O complemento deve ter no m�ximo 30 caracteres.";
		}

		EnderecoDAO daoEndereco = new EnderecoDAO();

		daoEndereco.gravarEndereco(e);

		daoEndereco.fechar();

		return "Endere�o gravado";

	}
}