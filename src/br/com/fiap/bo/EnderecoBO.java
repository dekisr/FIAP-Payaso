	package br.com.fiap.bo;

import br.com.fiap.beans.Endereco;
import br.com.fiap.dao.EnderecoDAO;

public class EnderecoBO {
	public static String novoEndereco(Endereco e) throws Exception {

		// validação
//		if (String.valueOf(e.getNr_cep()).length() > 8) {
		if(!Integer.toString(e.getNr_cep()).matches("[0-9]{8}")) {
			return "Cep inválido. Deve conter 8 caracteres apenas numéricos.";
		}
		if(Integer.toString(e.getNr_endereco()).length() > 6) {
			return "Número Inválido";
		}
		if (e.getDs_endereco().length() > 50) {
			return "O endereço deve ter no máximo 50 caracteres.";
		}
		if (e.getDs_complemento().length() > 30) {
			return "O complemento deve ter no máximo 30 caracteres.";
		}

		EnderecoDAO daoEndereco = new EnderecoDAO();

		daoEndereco.gravarEndereco(e);

		daoEndereco.fechar();

		return "Endereço gravado";

	}
}