package br.com.fiap.beans;

public class Endereco {
	private int id_endereco;
	private String ds_endereco;
	private int nr_endereco;
	private String ds_complemento;
	private int nr_cep;

	public int getNr_cep() {
		return nr_cep;
	}

	public void setNr_cep(int nr_cep) {
		this.nr_cep = nr_cep;
	}

	public int getId_endereco() {
		return id_endereco;
	}

	public void setId_endereco(int id_endereco) {
		this.id_endereco = id_endereco;
	}

	public String getDs_endereco() {
		return ds_endereco;
	}

	public void setDs_endereco(String ds_endereco) {
		this.ds_endereco = ds_endereco;
	}

	public int getNr_endereco() {
		return nr_endereco;
	}

	public void setNr_endereco(int nr_endereco) {
		this.nr_endereco = nr_endereco;
	}

	public String getDs_complemento() {
		return ds_complemento;
	}

	public void setDs_complemento(String ds_complemento) {
		this.ds_complemento = ds_complemento;
	}

	public Endereco(int id_endereco, String ds_endereco, int nr_endereco, String ds_complemento, int nr_cep) {
		super();
		this.id_endereco = id_endereco;
		this.ds_endereco = ds_endereco;
		this.nr_endereco = nr_endereco;
		this.ds_complemento = ds_complemento;
		this.nr_cep = nr_cep;
	}

	public Endereco() {
		super();
	}

}