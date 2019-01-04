package br.com.fiap.bo;

import br.com.fiap.beans.Usuario;
import br.com.fiap.dao.UsuarioDAO;

public class UsuarioBO {
	public static String novoUsuario(Usuario u) throws Exception {

		// validação
		if (u.getNr_pontuacao() > 100) {
			return "Pontuacao Inválida";
		}
		if (u.getNm_usuario().length() > 50) {
			return "Limite máximo de 50 caracteres para o nome do usuário.";
		}
		if(u.getDs_email().length() > 100) {
			return "O email deve ter no maximo 100 caracteres.";
		}
		if (u.getDs_senha().length() > 20 && u.getDs_senha().length() < 6) {
			return "Senha deve ter no minimo 6 e no máximo 20 caracteres";
		}
		if(u.getDs_bio_usuario().length() > 300) {
			return "A Bio deve conter no máximo 300 caracteres.";
		}
		if(u.getId_escola() == 0) {
			return "Você deve selecionar uma escola.";
		}
		
		UsuarioDAO dao = new UsuarioDAO();

		Boolean verificaEmail = dao.verificaEmail(u.getDs_email());
		if(verificaEmail == true) {
			return "Esse email já  está registrado. Por favor escolha outro.";
		}
		
		String usuario = dao.gravarUsuario(u);
		dao.fechar();
		
		if(usuario.equals("Gravado com sucesso")) {
			return "Cadastro realizado com sucesso!";
		} else {			
			return "Erro";
		}
	}
	
	public static String atualizaUsuario(Usuario u, String emailAntigo) throws Exception {

		// validação
		if (u.getNm_usuario().length() > 50) {
			return "Limite máximo de 50 caracteres para o nome do usuário.";
		}
		if(u.getDs_email().length() > 100) {
			return "O email deve ter no maximo 100 caracteres.";
		}
		if (u.getDs_senha().length() > 20) {
			return "Senha deve ter no máximo 20 caracteres";
		}
		if(u.getDs_bio_usuario().length() > 300) {
			return "A Bio deve conter no máximo 300 caracteres.";
		}
		if (u.getDs_email() == null) {
			return "Email vazio!";
		}
		if (u.getDs_senha() == null) {
			return "Senha vazia!";
		}
		if (u.getNm_usuario() == null) {
			return "Nome vazio!";
		}

		UsuarioDAO dao = new UsuarioDAO();
		
		Boolean verificaEmail = dao.verificaEmail(u.getDs_email());
		if(verificaEmail == true && !emailAntigo.equals(u.getDs_email())) {
			return "Esse email já  está registrado. Por favor escolha outro.";
		}

		dao.updateUsuario(u);

		dao.fechar();
		
		return "Perfil atualizado com sucesso!";

	}
}