package model;

public class Viaggio {
	private String username,citta_p,citta_a,descrizione,orario_p,orario_a,scadenza;
	private int id,nposti;
	private float costo;
	public Viaggio(String username, String citta_p, String citta_a, String orario_p, String orario_a, String scadenza,
			int id, int nposti, float costo) {
		this.username = username;
		this.citta_p = citta_p;
		this.citta_a = citta_a;
		this.orario_p = orario_p;
		this.orario_a = orario_a;
		this.scadenza = scadenza;
		this.id = id;
		this.nposti = nposti;
		this.costo = costo;
	}
	public Viaggio(String username, String citta_p, String citta_a, String descrizione, String orario_p,
			String orario_a, String scadenza, int id, int nposti, float costo) {
		this.username = username;
		this.citta_p = citta_p;
		this.citta_a = citta_a;
		this.descrizione = descrizione;
		this.orario_p = orario_p;
		this.orario_a = orario_a;
		this.scadenza = scadenza;
		this.id = id;
		this.nposti = nposti;
		this.costo = costo;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCitta_p() {
		return citta_p;
	}
	public void setCitta_p(String citta_p) {
		this.citta_p = citta_p;
	}
	public String getCitta_a() {
		return citta_a;
	}
	public void setCitta_a(String citta_a) {
		this.citta_a = citta_a;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getOrario_p() {
		return orario_p;
	}
	public void setOrario_p(String orario_p) {
		this.orario_p = orario_p;
	}
	public String getOrario_a() {
		return orario_a;
	}
	public void setOrario_a(String orario_a) {
		this.orario_a = orario_a;
	}
	public String getScadenza() {
		return scadenza;
	}
	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getCosto() {
		return costo;
	}
	public void setCosto(float costo) {
		this.costo = costo;
	}
	public int getNposti() {
		return nposti;
	}
	
	public void removePosto() {
		nposti--;
	}
	
	public void addPosto() {
		nposti++;
	}
}