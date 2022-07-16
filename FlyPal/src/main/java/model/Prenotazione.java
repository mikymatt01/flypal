package model;

public class Prenotazione {
	private String username,citta_p,citta_a,descrizione,orario_p,orario_a,scadenza, url;
	private float quantita, costo;
	private int pagato;
	
	public Prenotazione(
			String username, 
			String citta_p, 
			String citta_a, 
			String orario_p, 
			String orario_a, 
			int quantita,
			float costo, 
			int pagato,
			String url) {
		this.username = username;
		this.citta_p = citta_p;
		this.citta_a = citta_a;
		this.orario_p = orario_p;
		this.orario_a = orario_a;
		this.quantita = quantita;
		this.pagato = pagato;
		this.costo = costo;
		this.url=url;
	}
	
	public String getUsername() {
		return username;
	}

	public String getCitta_p() {
		return citta_p;
	}

	public String getCitta_a() {
		return citta_a;
	}

	public String getOrario_p() {
		return orario_p;
	}

	public String getOrario_a() {
		return orario_a;
	}

	public float getCosto() {
		return costo;
	}
	
	public float getQuantita() {
		return quantita;
	}

	public String getPagato() {
		if(pagato==1)
			return "pagato";
		else
			return "non pagato";
	}

	public String getUrl() {
		return url;
	}

}
