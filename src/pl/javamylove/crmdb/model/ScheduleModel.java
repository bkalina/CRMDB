package pl.javamylove.crmdb.model;

public class ScheduleModel {

	private int id;
	private String dataZdarzenia;
	private String godzina;
	private String opis;
	private String notatka;
	private int pracownikId;

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

	public int getPracownikId() {
		return pracownikId;
	}

	public void setPracownikId(int pracownikId) {
		this.pracownikId = pracownikId;
	}

	@Override
	public String toString() {
		return "ScheduleModel [id=" + id + ", dataZdarzenia=" + dataZdarzenia
				+ ", godzina=" + godzina + ", opis=" + opis + ", notatka="
				+ notatka + ", pracownikId=" + pracownikId + "]";
	}

}
