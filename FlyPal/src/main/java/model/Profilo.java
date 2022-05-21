package model;

public class Profilo {
	private String username,nome,cognome,datanasc;
	
	public Profilo(String user, String name, String surname, String birthdate) {
		username = user;
		nome = name;
		cognome = surname;
		datanasc = birthdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getDatanasc() {
		return datanasc;
	}

	public void setDatanasc(String datanasc) {
		this.datanasc = datanasc;
	}
}