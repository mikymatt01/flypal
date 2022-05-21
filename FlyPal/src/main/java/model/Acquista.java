package model;

public class Acquista {
	private int id,quantita;
	private String usernameUtente,dataora;
	private boolean pagato;
	
	public Acquista(int id, int quantita, String usernameUtente, String dataora, boolean pagato) {
		this.id = id;
		this.quantita = quantita;
		this.usernameUtente = usernameUtente;
		this.dataora = dataora;
		this.pagato = pagato;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public String getUsernameUtente() {
		return usernameUtente;
	}

	public void setUsernameUtente(String usernameUtente) {
		this.usernameUtente = usernameUtente;
	}

	public String getDataora() {
		return dataora;
	}

	public void setDataora(String dataora) {
		this.dataora = dataora;
	}

	public boolean isPagato() {
		return pagato;
	}

	public void setPagato(boolean pagato) {
		this.pagato = pagato;
	}
}