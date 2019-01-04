package br.com.fiap.beans;

public class Escola{
	
	private int id_escola;
	private String nm_escola;
	private String ds_bio;
	private Endereco endereco;
	private int nr_pontos;
	private String ds_img;
	
	
	public String getDs_img() {
		return ds_img;
	}
	public void setDs_img(String ds_img) {
		this.ds_img = ds_img;
	}
	public int getNr_pontos() {
		return nr_pontos;
	}
	public void setNr_pontos(int nr_pontos) {
		this.nr_pontos = nr_pontos;
	}
	public int getId_escola() {
		return id_escola;
	}
	public void setId_escola(int id_escola) {
		this.id_escola = id_escola;
	}
	public String getNm_escola() {
		return nm_escola;
	}
	public void setNm_escola(String nm_escola) {
		this.nm_escola = nm_escola;
	}
	
	public String getDs_bio() {
		return ds_bio;
	}
	public void setDs_bio(String ds_bio) {
		this.ds_bio = ds_bio;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public Escola(int id_escola,
			String nm_escola, String ds_bio, Endereco endereco) {
		super();
		this.id_escola = id_escola;
		this.nm_escola = nm_escola;
		this.ds_bio = ds_bio;
		this.endereco = endereco;
	}
	public Escola(int id_escola,
			String nm_escola, String ds_bio) {
		super();
		this.id_escola = id_escola;
		this.nm_escola = nm_escola;
		this.ds_bio = ds_bio;
	}
	public Escola(int id_escola,
			String nm_escola, String ds_bio, int nr_pontos, Endereco endereco) {
		super();
		setId_escola(id_escola);
		setNm_escola(nm_escola);
		setDs_bio(ds_bio);
		setNr_pontos(nr_pontos);
		setEndereco(endereco);
	}
	public Escola(String nm_escola) {
		setNm_escola(nm_escola);
	}
	public Escola(int id_escola) {
		setId_escola(id_escola);
	}
	public Escola() {
		super();
	}
	
}
