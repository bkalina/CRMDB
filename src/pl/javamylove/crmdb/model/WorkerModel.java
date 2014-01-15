package pl.javamylove.crmdb.model;

public class WorkerModel {

	private int id;
	private String imie;
	private String nazwisko;
	private String telefon;
	private String email;
	private String haslo;
	private String ranga;
	private int przelozonyId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHaslo() {
		return haslo;
	}

	public void setHaslo(String haslo) {
		this.haslo = haslo;
	}

	public String getRanga() {
		return ranga;
	}

	public void setRanga(String ranga) {
		this.ranga = ranga;
	}

	public int getPrzelozonyId() {
		return przelozonyId;
	}

	public void setPrzelozonyId(int i) {
		this.przelozonyId = i;
	}

	@Override
	public String toString() {
		return "WorkerModel [id=" + id + ", imie=" + imie + ", nazwisko="
				+ nazwisko + ", telefon=" + telefon + ", email=" + email
				+ ", haslo=" + haslo + ", ranga=" + ranga + ", przelozonyId="
				+ przelozonyId + "]";
	}

}
