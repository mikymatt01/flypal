package model;

public class Agenzia {
	private String username,piva,nome,sede;

	public Agenzia(String username, String piva, String nome, String sede) {
		this.username = username;
		this.piva = piva;
		this.nome = nome;
		this.sede = sede;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPiva() {
		return piva;
	}

	public void setPiva(String piva) {
		this.piva = piva;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSede() {
		return sede;
	}

	public void setSede(String sede) {
		this.sede = sede;
	}
}
