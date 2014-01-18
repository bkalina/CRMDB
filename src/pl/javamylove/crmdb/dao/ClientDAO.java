package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.ClientModel;

@Component("clientDao")
public class ClientDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	public List<ClientModel> getClientsList(int id) {
		System.out.println("clientDAO: getClientsList()");
		return jdbc
				.query("SELECT k.id, UCASE(k.imie) as imie, UCASE(k.nazwisko) AS nazwisko, UCASE(k.nazwa_firmy) as nazwa_firmy, UCASE(k.ulica) AS ulica, UCASE(k.nr_budynku) AS nr_budynku, UCASE(k.nr_lokalu) AS nr_lokalu, UCASE(k.kod_pocztowy) AS kod_pocztowy, UCASE(k.miasto) AS miasto, UCASE(k.nip) AS nip, UCASE(k.tel_kontaktowy) AS tel_kontaktowy, (SELECT COUNT(*) FROM telefon t WHERE klient_id=k.id) AS numery FROM klient k WHERE pracownik_id="
						+ id, new RowMapper<ClientModel>() {
					public ClientModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ClientModel clientModel = new ClientModel();

						clientModel.setId(rs.getInt("id"));
						clientModel.setImie(rs.getString("imie"));
						clientModel.setNazwisko(rs.getString("nazwisko"));
						clientModel.setNazwaFirmy(rs.getString("nazwa_firmy"));
						clientModel.setUlica(rs.getString("ulica"));
						clientModel.setNrBudynku(rs.getString("nr_budynku"));
						clientModel.setNrLokalu(rs.getString("nr_lokalu"));
						clientModel.setKodPocztowy(rs.getString("kod_pocztowy"));
						clientModel.setMiasto(rs.getString("miasto"));
						clientModel.setNip(rs.getString("nip"));
						clientModel.setTelKontaktowy(rs
								.getString("tel_kontaktowy"));
						clientModel.setIloscNumerow(rs.getInt("numery"));

						return clientModel;
					}
				});
	}

	public ClientModel getClient(int klientId) {
		System.out.println("clientDAO: getClient()");
		return jdbc.queryForObject("SELECT * FROM klient WHERE id=" + klientId,
				new RowMapper<ClientModel>() {
					public ClientModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						ClientModel clientModel = new ClientModel();

						clientModel.setId(rs.getInt("id"));
						clientModel.setNazwaFirmy(rs.getString("nazwa_firmy"));
						System.out.println(rs.getString("nazwa_firmy"));
						clientModel.setImie(rs.getString("imie"));
						clientModel.setNazwisko(rs.getString("nazwisko"));
						clientModel.setUlica(rs.getString("ulica"));
						clientModel.setNrBudynku(rs.getString("nr_budynku"));
						clientModel.setNrLokalu(rs.getString("nr_lokalu"));
						clientModel.setKodPocztowy(rs.getString("kod_pocztowy"));
						clientModel.setMiasto(rs.getString("miasto"));
						clientModel.setNip(rs.getString("nip"));
						clientModel.setRegon(rs.getString("regon"));
						clientModel.setEmail(rs.getString("email"));
						clientModel.setTelKontaktowy(rs
								.getString("tel_kontaktowy"));
						clientModel.setPracownikId(rs.getInt("pracownik_id"));

						return clientModel;
					}
				});
	}

	public boolean updateClient(ClientModel client) {
		return jdbc.update("UPDATE klient SET nazwa_firmy='"
				+ client.getNazwaFirmy() + "', imie='" + client.getImie()
				+ "', nazwisko='" + client.getNazwisko() + "', ulica='"
				+ client.getUlica() + "', nr_budynku='" + client.getNrBudynku()
				+ "', nr_lokalu='" + client.getNrLokalu() + "', kod_pocztowy='"
				+ client.getKodPocztowy() + "', miasto='" + client.getMiasto()
				+ "', nip='" + client.getNip() + "', regon='"
				+ client.getRegon() + "', email='" + client.getEmail()
				+ "', tel_kontaktowy='" + client.getTelKontaktowy()
				+ "' where id=" + client.getId()) == 1;
	}

	public boolean createClient(ClientModel client) {
		return jdbc
				.update("INSERT INTO klient (nazwa_firmy, imie, nazwisko, ulica, nr_budynku, nr_lokalu, kod_pocztowy, miasto, nip, regon, email, tel_kontaktowy, pracownik_id) VALUES ('"
						+ client.getNazwaFirmy()
						+ "',  '"
						+ client.getImie()
						+ "', '"
						+ client.getNazwisko()
						+ "', '"
						+ client.getUlica()
						+ "', '"
						+ client.getNrBudynku()
						+ "', '"
						+ client.getNrLokalu()
						+ "', '"
						+ client.getKodPocztowy()
						+ "', '"
						+ client.getMiasto()
						+ "', '"
						+ client.getNip()
						+ "', '"
						+ client.getRegon()
						+ "', '"
						+ client.getEmail()
						+ "', '"
						+ client.getTelKontaktowy()
						+ "', '"
						+ client.getPracownikId() + "')") == 1;
	}

	public boolean deleteClient(int clientId) {
		return jdbc.update("DELETE FROM klient where id=" + clientId) == 1;
	}
}
