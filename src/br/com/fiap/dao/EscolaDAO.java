package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.beans.Endereco;
import br.com.fiap.beans.Escola;
import br.com.fiap.beans.Usuario;
import br.com.fiap.connection.Conexao;

public class EscolaDAO {

	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;

	// Conexao com o banco
	public EscolaDAO() throws Exception {
		con = Conexao.conectar();
	}

	public String gravar(Escola obj) throws Exception {
		String mensagem = null;
		try {
			stmt = con.prepareStatement(
					"INSERT INTO T_PAY_ESCOLA(ID_ESCOLA,NM_ESCOLA,DS_BIO,DS_IMG,ID_ENDERECO) VALUES(seq_esc_id.nextval,?,?,?,?)");
			stmt.setString(1, obj.getNm_escola());
			stmt.setString(2, obj.getDs_bio());
			stmt.setString(3, obj.getDs_img());
			stmt.setInt(4, obj.getEndereco().getId_endereco());
			stmt.executeQuery();
			mensagem = "Cadastro realizado com sucesso!";
		} catch (Exception e) {
			System.out.println(e);
			mensagem = "Erro no cadastro";
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

	public String enviarMensagem(String idUsuario, String idEscola, String texto) throws Exception {
		try {
			stmt = con.prepareStatement(
					"INSERT INTO T_PAY_MENSAGEM_ESCOLA(ID_MENSAGEM_ESCOLA,ID_USUARIO,ID_ESCOLA,DS_MENSAGEM_ESCOLA) VALUES(seq_msg_esc_id.nextval,?,?,?)");
			stmt.setString(1, idUsuario);
			stmt.setString(2, idEscola);
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
					"SELECT * FROM T_PAY_MENSAGEM_ESCOLA WHERE ID_ESCOLA = ? ORDER BY ID_MENSAGEM_ESCOLA DESC");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				UsuarioDAO usuarioDao = new UsuarioDAO();
				usuario = usuarioDao.buscaPorId(rs.getInt("ID_USUARIO"));
				lista.add("<p class=\"posts\"><b>" + usuario.getNm_usuario() + ": </b>"
						+ rs.getString("DS_MENSAGEM_ESCOLA") + "</p>");
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

	public List<Escola> listaEscolas() throws Exception {
		List<Escola> lista = new ArrayList<Escola>();
		try {
			stmt = con.prepareStatement(
					"SELECT * FROM T_PAY_ESCOLA E INNER JOIN T_PAY_ENDERECO END ON(E.ID_ENDERECO = END.ID_ENDERECO)");
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				lista.add(new Escola(rs.getInt("ID_ESCOLA"), rs.getString("NM_ESCOLA"), rs.getString("DS_BIO"),
						rs.getInt("NR_PONTO"), new Endereco(rs.getInt("ID_ENDERECO"), rs.getString("NM_ENDERECO"),
								rs.getInt("NR_ENDERECO"), rs.getString("NM_COMPLEMENTO"), rs.getInt("NR_CEP"))));
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

	public Escola buscaPorId(int id) throws Exception {
		Escola escola = new Escola();
		try {
			stmt = con.prepareStatement("SELECT * FROM T_PAY_ESCOLA WHERE ID_ESCOLA = ?");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			if (rs.next()) {
				escola.setId_escola(rs.getInt("ID_ESCOLA"));
				escola.setNm_escola(rs.getString("NM_ESCOLA"));
				escola.setDs_bio(rs.getString("DS_BIO"));
				escola.setDs_img(rs.getString("DS_IMG"));
				escola.setNr_pontos(rs.getInt("NR_PONTO"));
			} else
				escola = null;
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
		return escola;
	}

	public List<Escola> selecionarTodosID() throws Exception {
		List<Escola> lista = new ArrayList<Escola>();
		stmt = con.prepareStatement("SELECT ID_ESCOLA FROM T_PAY_ESCOLA");
		rs = null;
		rs = stmt.executeQuery();
		while (rs.next()) {
			lista.add(new Escola(rs.getInt("ID_ESCOLA")));
		}
		return lista;
	}

	public int ranking(int escola) throws Exception {
		int ranking = 0;
		stmt = con.prepareStatement(
				"SELECT NR_PONTUACAO FROM T_PAY_ESCOLA E JOIN T_PAY_USUARIO U ON E.ID_ESCOLA = U.ID_ESCOLA WHERE U.ID_ESCOLA = ?");
		stmt.setInt(1, escola);
		rs = null;
		rs = stmt.executeQuery();
		while (rs.next()) {
			ranking = ranking + rs.getInt("NR_PONTUACAO");
		}
		stmt = con.prepareStatement("UPDATE T_PAY_ESCOLA SET NR_PONTO = ? WHERE ID_ESCOLA = ?");
		stmt.setInt(1, ranking);
		stmt.setInt(2, escola);
		stmt.executeQuery();
		return ranking;
	}

	public List<Escola> rankingAll() throws Exception {
		List<Escola> lista = new ArrayList<Escola>();
		try {
			stmt = con.prepareStatement(
					"SELECT ID_ESCOLA, NM_ESCOLA, NR_PONTO FROM T_PAY_ESCOLA WHERE NR_PONTO > 0 ORDER BY NR_PONTO desc");
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				Escola esc = new Escola();
				esc.setId_escola(rs.getInt("ID_ESCOLA"));
				esc.setNm_escola(rs.getString("NM_ESCOLA"));
				esc.setNr_pontos(rs.getInt("NR_PONTO"));
				lista.add(esc);
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

	public void fechar() throws Exception {
		con.close();
	}

	public int qtdAluno(int id) throws Exception {
		int qtd = 0;
		try {
			stmt = con.prepareStatement("SELECT ID_USUARIO FROM T_PAY_USUARIO WHERE ID_ESCOLA = ?");
			stmt.setInt(1, id);
			rs = null;
			rs = stmt.executeQuery();
			while (rs.next()) {
				qtd++;
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

		return qtd;
	}
}
