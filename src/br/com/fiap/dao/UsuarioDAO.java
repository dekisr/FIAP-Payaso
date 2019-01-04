package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.beans.Usuario;
import br.com.fiap.connection.Conexao;

public class UsuarioDAO {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;

	// Conexão com o banco
	public UsuarioDAO() throws Exception {
		con = Conexao.conectar();
	}

	// Cadastrando usuario
	public String gravarUsuario(Usuario usu) throws Exception {
		String mensagem = null;
		try {
			stmt = con.prepareStatement(
					"INSERT INTO T_PAY_USUARIO(ID_USUARIO,NM_USUARIO,DS_SENHA,DS_EMAIL,DS_BIO_USUARIO,DS_IMG,ID_ESCOLA) VALUES(seq_usu_id.nextval,?,?,?,?,?,?)");
			stmt.setString(1, usu.getNm_usuario());
			stmt.setString(2, usu.getDs_senha());
			stmt.setString(3, usu.getDs_email());
			stmt.setString(4, usu.getDs_bio_usuario());
			stmt.setString(5, usu.getDs_img());
			stmt.setInt(6, usu.getId_escola());
			stmt.executeQuery();
			mensagem = "Gravado com sucesso";
		} catch (Exception e) {
			System.out.println(e);
			mensagem = "Erro";
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return mensagem;
	}

	public String enviarMensagem(String idUsuario, String idDestinatario, String texto) throws Exception {
		try {
			stmt = con.prepareStatement(
					"INSERT INTO T_PAY_MENSAGEM(ID_MENSAGEM,ID_USUARIO,ID_DESTINATARIO,DS_MENSAGEM) VALUES(seq_msg_id.nextval,?,?,?)");
			stmt.setString(1, idUsuario);
			stmt.setString(2, idDestinatario);
			stmt.setString(3, texto);
			stmt.executeQuery();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return "Mensagem enviada.";
	}

	public List<String> listaMensagens(int id) throws Exception {
		List<String> lista = new ArrayList<String>();
		try {
			stmt = con.prepareStatement(
					"SELECT * FROM T_PAY_MENSAGEM WHERE ID_DESTINATARIO = ? ORDER BY ID_MENSAGEM DESC");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				UsuarioDAO usuarioDao = new UsuarioDAO();
				usuario = usuarioDao.buscaPorId(rs.getInt("ID_USUARIO"));
				lista.add("<p class=\"posts\"><b>" + usuario.getNm_usuario() + ": </b>" + rs.getString("DS_MENSAGEM")
						+ "</p>");
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return lista;
	}

	public Usuario buscaPorId(int id) throws Exception {
		Usuario usuario = new Usuario();
		try {
			stmt = con.prepareStatement("SELECT * FROM T_PAY_USUARIO WHERE ID_USUARIO = ?");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			if (rs.next()) {
				usuario.setId_usuario(rs.getInt("ID_USUARIO"));
				usuario.setId_escola(rs.getInt("ID_ESCOLA"));
				usuario.setNm_usuario(rs.getString("NM_USUARIO"));
				usuario.setDs_email(rs.getString("DS_EMAIL"));
				usuario.setDs_senha(rs.getString("DS_SENHA"));
				usuario.setDs_img(rs.getString("DS_IMG"));
				usuario.setDs_bio_usuario(rs.getString("DS_BIO_USUARIO"));
				usuario.setNr_pontuacao(rs.getInt("NR_PONTUACAO"));
			} else
				usuario = null;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return usuario;
	}

	public Usuario validaUsuario(String email, String senha) throws Exception {
		Usuario usuario = new Usuario();
		try {
			stmt = con.prepareStatement("SELECT * FROM T_PAY_USUARIO WHERE DS_EMAIL = ? AND DS_SENHA = ?");
			stmt.setString(1, email);
			stmt.setString(2, senha);
			rs = null;
			rs = stmt.executeQuery();
			if (rs.next()) {
				usuario.setId_usuario(rs.getInt("ID_USUARIO"));
				usuario.setId_escola(rs.getInt("ID_ESCOLA"));
				usuario.setDs_email(rs.getString("DS_EMAIL"));
				usuario.setNm_usuario(rs.getString("NM_USUARIO"));
				usuario.setDs_img(rs.getString("DS_IMG"));
				usuario.setDs_bio_usuario(rs.getString("DS_BIO_USUARIO"));
				usuario.setNr_pontuacao(rs.getInt("NR_PONTUACAO"));
			} else
				usuario = null;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return usuario;
	}

	public List<Usuario> alunosPorPontuacao(int id) throws Exception {
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			stmt = con.prepareStatement(
					"SELECT ID_USUARIO,NM_USUARIO,NR_PONTUACAO,U.DS_IMG FROM T_PAY_USUARIO U INNER JOIN T_PAY_ESCOLA E ON(E.ID_ESCOLA = U.ID_ESCOLA) WHERE U.ID_ESCOLA = ? AND U.NR_PONTUACAO > 0 ORDER BY NR_PONTUACAO DESC");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usu = new Usuario();
				usu.setId_usuario(rs.getInt("ID_USUARIO"));
				usu.setNm_usuario(rs.getString("NM_USUARIO"));
				usu.setNr_pontuacao(rs.getInt("NR_PONTUACAO"));
				usu.setDs_img(rs.getString("DS_IMG"));
				lista.add(usu);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return lista;
	}
	
	public List<Usuario> listaUsuarios() throws Exception {
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			stmt = con.prepareStatement(
					"SELECT * FROM T_PAY_USUARIO ORDER BY ID_USUARIO ASC");
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usu = new Usuario();
				usu.setId_usuario(rs.getInt("ID_USUARIO"));
				usu.setNm_usuario(rs.getString("NM_USUARIO"));
				usu.setNr_pontuacao(rs.getInt("NR_PONTUACAO"));
				usu.setDs_img(rs.getString("DS_IMG"));
				lista.add(usu);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return lista;
	}

	public String deletarUsuario(int id) throws Exception {
		String resposta = null;
		try {
			stmt = con.prepareStatement("DELETE FROM T_PAY_USUARIO WHERE ID_USUARIO = ?");
			stmt.setInt(1, id);
			stmt.executeUpdate();
			resposta = "Usuário removido com sucesso.";
		} catch (Exception e) {
			System.out.println(e);
			resposta = "Erro.";
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return resposta;
	}

	public void updateUsuario(Usuario u) throws Exception {
		try {
			stmt = con.prepareStatement(
					"UPDATE T_PAY_USUARIO SET NM_USUARIO = ?, DS_SENHA = ?, DS_IMG = ?, DS_EMAIL = ?, DS_BIO_USUARIO = ? WHERE ID_USUARIO = ?");
			stmt.setString(1, u.getNm_usuario());
			stmt.setString(2, u.getDs_senha());
			stmt.setString(3, u.getDs_img());
			stmt.setString(4, u.getDs_email());
			stmt.setString(5, u.getDs_bio_usuario());
			stmt.setInt(6, u.getId_usuario());
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	
	public boolean verificaEmail(String email) throws Exception {
		Boolean existe = null;
		stmt = con.prepareStatement("SELECT * FROM T_PAY_USUARIO WHERE DS_EMAIL = ?");
		stmt.setString(1, email);
		rs = null;
		rs = stmt.executeQuery();
		if (rs.next()) {
			existe = true;
		} else 	existe = false;
		
		return existe;
	}

	public void fechar() throws Exception {
		con.close();
	}
}