package br.com.fiap.beans;

public class Usuario{
	private int id_usuario;
	private String nm_usuario;
	private String ds_senha;
	private String ds_email;
	private int nr_pontuacao;
	private String ds_bio_usuario;
	private int id_escola;
	private String ds_img;
	
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNm_usuario() {
		return nm_usuario;
	}
	public void setNm_usuario(String nm_usuario) {
		this.nm_usuario = nm_usuario;
	}
	public String getDs_email() {
		return ds_email;
	}
	public void setDs_email(String ds_email) {
		this.ds_email = ds_email;
	}
	public int getNr_pontuacao() {
		return nr_pontuacao;
	}
	public void setNr_pontuacao(int nr_pontuacao) {
		this.nr_pontuacao = nr_pontuacao + this.nr_pontuacao;
	}
	public String getDs_senha() {
		return ds_senha;
	}
	public void setDs_senha(String ds_senha) {
		this.ds_senha = ds_senha;
	}
	public String getDs_bio_usuario() {
		return ds_bio_usuario;
	}
	public void setDs_bio_usuario(String ds_bio_usuario) {
		this.ds_bio_usuario = ds_bio_usuario;
	}
	public int getId_escola() {
		return id_escola;
	}
	public void setId_escola(int id_escola) {
		this.id_escola = id_escola;
	}
	public String getDs_img() {
		return ds_img;
	}
	public void setDs_img(String ds_img) {
		this.ds_img = ds_img;
	}
	
	public Usuario() {
		super();
	}
	
}