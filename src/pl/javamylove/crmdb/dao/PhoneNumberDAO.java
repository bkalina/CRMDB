package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.PhoneNumberModel;

@Component("phoneNumberDao")
public class PhoneNumberDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	public List<PhoneNumberModel> getNumbersList(int id) {
		System.out.println("pnDAO: getNumbersList()");
		
		return jdbc.query("SELECT UCASE(t.operator) AS operator, t.koniec_umowy, t.numer, REPLACE(t.typ_uslugi, '_', ' ') AS typ_uslugi, t.dlugosc_umowy, k.nazwa_firmy, CONCAT(k.imie, ' ', k.nazwisko, '   NIP:', k.nip) AS dane_klienta FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="+id, new RowMapper<PhoneNumberModel>() {

			public PhoneNumberModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				PhoneNumberModel phoneNumber = new PhoneNumberModel();
				
				phoneNumber.setNumer(rs.getString("numer"));
				phoneNumber.setOperator(rs.getString("operator"));
				phoneNumber.setDlugoscUmowy(rs.getString("dlugosc_umowy"));
				phoneNumber.setKoniecUmowy(rs.getString("koniec_umowy"));
				phoneNumber.setTypUslugi(rs.getString("typ_uslugi"));
				phoneNumber.setNazwaFirmy(rs.getString("nazwa_firmy"));
				phoneNumber.setDaneKlienta(rs.getString("dane_klienta"));
				
				return phoneNumber;
			}
		});
	}
}
