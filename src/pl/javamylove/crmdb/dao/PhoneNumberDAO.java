package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.PhoneNumber;

@Component("phoneNumberDao")
public class PhoneNumberDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	public List<PhoneNumber> getNumbersList() {
		System.out.println("pnDAO: getNumbersList()");
		
		return jdbc.query("select * from telefon", new RowMapper<PhoneNumber>() {

			public PhoneNumber mapRow(ResultSet rs, int rowNum) throws SQLException {
				PhoneNumber phoneNumber = new PhoneNumber();
				
				phoneNumber.setId(rs.getInt("id"));
				phoneNumber.setNumer(rs.getString("numer"));
				phoneNumber.setOperator(rs.getString("operator"));
				phoneNumber.setDlugosc_umowy(rs.getString("dlugosc_umowy"));
				phoneNumber.setPoczatek_umowy(rs.getString("poczatek_umowy"));
				phoneNumber.setKoniec_umowy(rs.getString("koniec_umowy"));
				phoneNumber.setTyp_uslugi(rs.getString("typ_uslugi"));
				phoneNumber.setNotatka(rs.getString("notatka"));
				phoneNumber.setKlient_id(rs.getInt("klient_id"));
				
				return phoneNumber;
			}
		});
	}
}
