package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.fiap.beans.Endereco;
import br.com.fiap.connection.Conexao;

public class EnderecoDAO {
	private Connection con;
	private PreparedStatement st;
	private ResultSet rs;

	// Conexao com o banco
	public EnderecoDAO() throws Exception {
		con = Conexao.conectar();
	}

	// Inserir
	public String gravarEndereco(Endereco obj) throws Exception {
		st = con.prepareStatement("INSERT INTO T_PAY_ENDERECO VALUES(seq_end_id.nextval,?,?,?,?)");
		st.setString(1, obj.getDs_endereco());
		st.setInt(2, obj.getNr_endereco());
		st.setString(3, obj.getDs_complemento());
		st.setInt(4, obj.getNr_cep());
		st.executeQuery();
		return "Gravado com Sucesso";
	}

	public Integer findByMax() throws Exception {
		Integer id_end = null;
		st = con.prepareStatement("select max(ID_ENDERECO) as ID_ENDERECO from T_PAY_ENDERECO");
		rs = st.executeQuery();
		if (rs.next()) {
			id_end = rs.getInt("ID_ENDERECO");
		}
		return id_end;
	}

	// deletar
	public int apagar(int numero) throws Exception {
		st = con.prepareStatement("DELETE * FROM T_PAY_ENDERECO WHERE id_endereco = ?");
		st.setInt(1, numero);
		return st.executeUpdate();
	}

	// atualizar
	public void atualizar(int num, String ds, int numero, String comp) throws Exception {
		st = con.prepareStatement(
				"UPDATE T_PAY_ENDERECO SET ds_endereco = ?, nr_endereco = ?, ds_complemento = ? Where id_endereco = ?");
		st.setString(1, ds);
		st.setInt(2, numero);
		st.setString(3, comp);
		st.setInt(4, num);
		st.executeUpdate();
	}
	
	public void fechar() throws Exception {
		con.close();
	}

	// listar

}
