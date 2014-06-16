package pl.javamylove.crmdb.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class PhoneNumberModel {

	private int id;
	@Size(min = 9, max = 12, message = "Nie podano numeru lub długość numeru nie prawidłowa!")
	private String numer;
	private String operator;
	private String dlugoscUmowy;
	@Pattern(regexp = "....-..-..", message = "Podaj datę w formacie rrrr-mm-dd!")
	private String poczatekUmowy;
	private String koniecUmowy;
	private String typUslugi;
	private String notatka;
	@NotNull(message = "Nie podano ID klienta! Kliknij odpowiednią komórkę w kolumnie 'ID klienta'.")
	private int klientId;
	private String nazwaFirmy;
	private String daneKlienta;

	public PhoneNumberModel() {

	}

	public PhoneNumberModel(int id, String numer, String operator,
			String dlugoscUmowy, String poczatekUmowy, String koniecUmowy,
			String typUslugi, String notatka, int klientId, String nazwaFirmy,
			String daneKlienta) {
		this.id = id;
		this.numer = numer;
		this.operator = operator;
		this.dlugoscUmowy = dlugoscUmowy;
		this.poczatekUmowy = poczatekUmowy;
		this.koniecUmowy = koniecUmowy;
		this.typUslugi = typUslugi;
		this.notatka = notatka;
		this.klientId = klientId;
		this.nazwaFirmy = nazwaFirmy;
		this.daneKlienta = daneKlienta;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumer() {
		return numer;
	}

	public void setNumer(String numer) {
		this.numer = numer;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getDlugoscUmowy() {
		return dlugoscUmowy;
	}

	public void setDlugoscUmowy(String dlugoscUmowy) {
		this.dlugoscUmowy = dlugoscUmowy;
	}

	public String getPoczatekUmowy() {
		return poczatekUmowy;
	}

	public void setPoczatekUmowy(String poczatekUmowy) {
		this.poczatekUmowy = poczatekUmowy;
	}

	public String getKoniecUmowy() {
		return koniecUmowy;
	}

	public void setKoniecUmowy(String koniecUmowy) {
		this.koniecUmowy = koniecUmowy;
	}

	public String getTypUslugi() {
		return typUslugi;
	}

	public void setTypUslugi(String typUslugi) {
		this.typUslugi = typUslugi;
	}

	public String getNotatka() {
		return notatka;
	}

	public void setNotatka(String notatka) {
		this.notatka = notatka;
	}

	public int getKlientId() {
		return klientId;
	}

	public void setKlientId(int klientId) {
		this.klientId = klientId;
	}

	public String getNazwaFirmy() {
		return nazwaFirmy;
	}

	public void setNazwaFirmy(String nazwaFirmy) {
		this.nazwaFirmy = nazwaFirmy;
	}

	public String getDaneKlienta() {
		return daneKlienta;
	}

	public void setDaneKlienta(String daneKlienta) {
		this.daneKlienta = daneKlienta;
	}

	@Override
	public String toString() {
		return "PhoneNumber [id=" + id + ", numer=" + numer + ", operator="
				+ operator + ", dlugoscUmowy=" + dlugoscUmowy
				+ ", poczatekUmowy=" + poczatekUmowy + ", koniecUmowy="
				+ koniecUmowy + ", typUslugi=" + typUslugi + ", notatka="
				+ notatka + ", klientId=" + klientId + ", nazwaFirmy="
				+ nazwaFirmy + ", daneKlienta=" + daneKlienta + "]";
	}

}
