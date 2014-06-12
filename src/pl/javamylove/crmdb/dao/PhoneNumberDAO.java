package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.PhoneNumberModel;

@Component("phoneNumberDao")
public class PhoneNumberDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<PhoneNumberModel> getNumbersList(int id) {
		System.out.println("pnDAO: getNumbersListClient()");

		return jdbc
				.query("SELECT t.id, t.poczatek_umowy, t.klient_id, t.notatka, UCASE(t.operator) AS operator, t.koniec_umowy, t.numer, REPLACE(t.typ_uslugi, '_', ' ') AS typ_uslugi, t.dlugosc_umowy, k.nazwa_firmy, CONCAT(k.imie, ' ', k.nazwisko, '   NIP:', k.nip) AS dane_klienta FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="
						+ id, new RowMapper<PhoneNumberModel>() {

					public PhoneNumberModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						PhoneNumberModel phoneNumber = new PhoneNumberModel();
						phoneNumber.setId(rs.getInt("id"));
						phoneNumber.setNumer(rs.getString("numer"));
						phoneNumber.setOperator(rs.getString("operator"));
						phoneNumber.setDlugoscUmowy(rs
								.getString("dlugosc_umowy"));
						phoneNumber.setPoczatekUmowy(rs
								.getString("poczatek_umowy"));
						phoneNumber.setKoniecUmowy(rs.getString("koniec_umowy"));
						phoneNumber.setNotatka(rs.getString("notatka"));
						phoneNumber.setTypUslugi(rs.getString("typ_uslugi"));
						phoneNumber.setKlientId(rs.getInt("klient_id"));
						phoneNumber.setNazwaFirmy(rs.getString("nazwa_firmy"));
						phoneNumber.setDaneKlienta(rs.getString("dane_klienta"));

						return phoneNumber;
					}
				});
	}
	
	public List<PhoneNumberModel> getNumbersListClient(int id) {
		System.out.println("pnDAO: getNumbersListClient()");

		return jdbc
				.query("SELECT t.id, t.poczatek_umowy, t.klient_id, t.notatka, UCASE(t.operator) AS operator, t.koniec_umowy, t.numer, REPLACE(t.typ_uslugi, '_', ' ') AS typ_uslugi, t.dlugosc_umowy, k.nazwa_firmy, CONCAT(k.imie, ' ', k.nazwisko, '   NIP:', k.nip) AS dane_klienta FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE t.klient_id="
						+ id, new RowMapper<PhoneNumberModel>() {

					public PhoneNumberModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						PhoneNumberModel phoneNumber = new PhoneNumberModel();
						phoneNumber.setId(rs.getInt("id"));
						phoneNumber.setNumer(rs.getString("numer"));
						phoneNumber.setOperator(rs.getString("operator"));
						phoneNumber.setDlugoscUmowy(rs
								.getString("dlugosc_umowy"));
						phoneNumber.setPoczatekUmowy(rs
								.getString("poczatek_umowy"));
						phoneNumber.setKoniecUmowy(rs.getString("koniec_umowy"));
						phoneNumber.setNotatka(rs.getString("notatka"));
						phoneNumber.setTypUslugi(rs.getString("typ_uslugi"));
						phoneNumber.setKlientId(rs.getInt("klient_id"));
						phoneNumber.setNazwaFirmy(rs.getString("nazwa_firmy"));
						phoneNumber.setDaneKlienta(rs.getString("dane_klienta"));

						return phoneNumber;
					}
				});
	}

	public PhoneNumberModel getNumber(int id) {
		System.out.println("pnDAO: getNumbersList()");
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);
		return jdbc.queryForObject("SELECT * FROM telefon WHERE id=:id",
				params, new RowMapper<PhoneNumberModel>() {

					public PhoneNumberModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						PhoneNumberModel phoneNumber = new PhoneNumberModel();
						phoneNumber.setId(rs.getInt("id"));
						phoneNumber.setNumer(rs.getString("numer"));
						phoneNumber.setOperator(rs.getString("operator"));
						phoneNumber.setDlugoscUmowy(rs
								.getString("dlugosc_umowy"));
						phoneNumber.setPoczatekUmowy(rs
								.getString("poczatek_umowy"));
						phoneNumber.setKoniecUmowy(rs.getString("koniec_umowy"));
						phoneNumber.setNotatka(rs.getString("notatka"));
						phoneNumber.setTypUslugi(rs.getString("typ_uslugi"));
						phoneNumber.setKlientId(rs.getInt("klient_id"));

						return phoneNumber;
					}
				});
	}

	public boolean updateNumber(PhoneNumberModel number, int numberId) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				number);
		return jdbc
				.update("UPDATE telefon SET numer=:numer, operator=:operator, dlugosc_umowy=:dlugoscUmowy, poczatek_umowy=:poczatekUmowy, koniec_umowy=:koniecUmowy, typ_uslugi=:typUslugi, notatka=:notatka, klient_id=:klientId WHERE id="
						+ numberId, params) == 1;
	}

	public boolean createNumber(PhoneNumberModel number) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				number);
		return jdbc
				.update("INSERT INTO telefon (numer, operator, dlugosc_umowy, poczatek_umowy, koniec_umowy, typ_uslugi, notatka, klient_id) VALUES (:numer, :operator, :dlugoscUmowy, :poczatekUmowy, :koniecUmowy, :typUslugi, :notatka, :klientId)",
						params) == 1;
	}

	public boolean deleteNumber(int numberId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", numberId);
		return jdbc.update("DELETE FROM telefon where id=:id", params) == 1;
	}
}
