package pl.javamylove.crmdb.model;

public class PhoneNumber {

	private int id;
	private String numer;
	private String operator;
	private String dlugosc_umowy;
	private String poczatek_umowy;
	private String koniec_umowy;
	private String typ_uslugi;
	private String notatka;
	private int klient_id;

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

	public String getDlugosc_umowy() {
		return dlugosc_umowy;
	}

	public void setDlugosc_umowy(String dlugosc_umowy) {
		this.dlugosc_umowy = dlugosc_umowy;
	}

	public String getPoczatek_umowy() {
		return poczatek_umowy;
	}

	public void setPoczatek_umowy(String poczatek_umowy) {
		this.poczatek_umowy = poczatek_umowy;
	}

	public String getKoniec_umowy() {
		return koniec_umowy;
	}

	public void setKoniec_umowy(String koniec_umowy) {
		this.koniec_umowy = koniec_umowy;
	}

	public String getTyp_uslugi() {
		return typ_uslugi;
	}

	public void setTyp_uslugi(String typ_uslugi) {
		this.typ_uslugi = typ_uslugi;
	}

	public String getNotatka() {
		return notatka;
	}

	public void setNotatka(String notatka) {
		this.notatka = notatka;
	}

	public int getKlient_id() {
		return klient_id;
	}

	public void setKlient_id(int klient_id) {
		this.klient_id = klient_id;
	}

	@Override
	public String toString() {
		return "Number [id=" + id + ", numer=" + numer + ", operator="
				+ operator + ", dlugosc_umowy=" + dlugosc_umowy
				+ ", poczatek_umowy=" + poczatek_umowy + ", koniec_umowy="
				+ koniec_umowy + ", typ_uslugi=" + typ_uslugi + ", notatka="
				+ notatka + ", klient_id=" + klient_id + "]";
	}

}
