package pl.javamylove.crmdb.model;

public class ScheduleModel {

	private int id;
	private String dataZdarzenia;
	private String godzina;
	private String opis;
	private String notatka;
	private int klientId;
	private int pracownikId;
	private String nazwaFirmy;
	private String imie;
	private String nazwisko;
	private String nip;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataZdarzenia() {
		return dataZdarzenia;
	}

	public void setDataZdarzenia(String dataZdarzenia) {
		this.dataZdarzenia = dataZdarzenia;
	}

	public String getGodzina() {
		return godzina;
	}

	public void setGodzina(String godzina) {
		this.godzina = godzina;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
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

	public int getPracownikId() {
		return pracownikId;
	}

	public void setPracownikId(int pracownikId) {
		this.pracownikId = pracownikId;
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

	public String getNip() {
		return nip;
	}

	public void setNip(String nip) {
		this.nip = nip;
	}

	@Override
	public String toString() {
		return "ScheduleModel [id=" + id + ", dataZdarzenia=" + dataZdarzenia
				+ ", godzina=" + godzina + ", opis=" + opis + ", notatka="
				+ notatka + ", klientId=" + klientId + ", pracownikId="
				+ pracownikId + "]";
	}

}
