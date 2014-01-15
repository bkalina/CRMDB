package pl.javamylove.crmdb.model;

import javax.validation.constraints.Size;

public class ClientModel {

	private int id;
	
	@Size(min=5, max=100)
	private String nazwaFirmy;
	
	private String imie;
	private String nazwisko;
	private String ulica;
	private String nrBudynku;
	private String nrLokalu;
	private String kodPocztowy;
	private String miasto;
	private String nip;
	private String regon;
	private String pesel;
	private String telKontaktowy;
	private String email;
	private int pracownikId;
	private int iloscNumerow;
	
	public ClientModel(){
		
	}

	public ClientModel(int id, String nazwaFirmy, String imie, String nazwisko,
			String ulica, String nrBudynku, String nrLokalu,
			String kodPocztowy, String miasto, String nip, String regon,
			String pesel, String telKontaktowy, String email, int pracownikId) {
		this.id = id;
		this.nazwaFirmy = nazwaFirmy;
		this.imie = imie;
		this.nazwisko = nazwisko;
		this.ulica = ulica;
		this.nrBudynku = nrBudynku;
		this.nrLokalu = nrLokalu;
		this.kodPocztowy = kodPocztowy;
		this.miasto = miasto;
		this.nip = nip;
		this.regon = regon;
		this.pesel = pesel;
		this.telKontaktowy = telKontaktowy;
		this.email = email;
		this.pracownikId = pracownikId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNazwaFirmy() {
		return nazwaFirmy;
	}

	public void setNazwaFirmy(String nazwaFirmy) {
		this.nazwaFirmy = nazwaFirmy;
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

	public String getUlica() {
		return ulica;
	}

	public void setUlica(String ulica) {
		this.ulica = ulica;
	}

	public String getNrBudynku() {
		return nrBudynku;
	}

	public void setNrBudynku(String nrBudynku) {
		this.nrBudynku = nrBudynku;
	}

	public String getNrLokalu() {
		return nrLokalu;
	}

	public void setNrLokalu(String nrLokalu) {
		this.nrLokalu = nrLokalu;
	}

	public String getKodPocztowy() {
		return kodPocztowy;
	}

	public void setKodPocztowy(String kodPocztowy) {
		this.kodPocztowy = kodPocztowy;
	}

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	public String getRegon() {
		return regon;
	}

	public void setRegon(String regon) {
		this.regon = regon;
	}

	public String getPesel() {
		return pesel;
	}

	public void setPesel(String pesel) {
		this.pesel = pesel;
	}

	public String getTelKontaktowy() {
		return telKontaktowy;
	}

	public void setTelKontaktowy(String telKontaktowy) {
		this.telKontaktowy = telKontaktowy;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPracownikId() {
		return pracownikId;
	}

	public void setPracownikId(int pracownikId) {
		this.pracownikId = pracownikId;
	}

	public int getIloscNumerow() {
		return iloscNumerow;
	}

	public void setIloscNumerow(int iloscNumerow) {
		this.iloscNumerow = iloscNumerow;
	}

	@Override
	public String toString() {
		return "ClientModel [id=" + id + ", nazwaFirmy=" + nazwaFirmy
				+ ", imie=" + imie + ", nazwisko=" + nazwisko + ", ulica="
				+ ulica + ", nrBudynku=" + nrBudynku + ", nrLokalu=" + nrLokalu
				+ ", kodPocztowy=" + kodPocztowy + ", miasto=" + miasto
				+ ", nip=" + nip + ", regon=" + regon + ", pesel=" + pesel
				+ ", telKontaktowy=" + telKontaktowy + ", email=" + email
				+ ", pracownikId=" + pracownikId + "]";
	}

}