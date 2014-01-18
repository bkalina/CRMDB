package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.PanelModel;
import pl.javamylove.crmdb.model.ScheduleModel;

@Component("panelDao")
public class PanelDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	@SuppressWarnings("deprecation")
	public PanelModel getCount(int id) {
		PanelModel model = new PanelModel();
		model.setNrCount(jdbc
				.queryForInt("SELECT COUNT(*) FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="
						+ id));
		model.setKlientCount(jdbc
				.queryForInt("SELECT COUNT(*) FROM klient WHERE pracownik_id="
						+ id));
		model.setTerminCount(jdbc
				.queryForInt("SELECT COUNT(*) FROM zdarzenie WHERE pracownik_id="
						+ id));
		model.setAneksCount(jdbc
				.queryForInt("SELECT COUNT(*) FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="
						+ id
						+ " AND koniec_umowy > 2000-01-01 AND koniec_umowy < DATE_ADD(CURDATE(),INTERVAL 60 DAY)"));
		return model;
	}

	public List<ScheduleModel> getScheduleList10(int id) {
		System.out.println("pnDAO: getScheduleList10()");

		return jdbc
				.query("SELECT z.id, z.data_zdarzenia, z.godzina, z.opis, z.notatka, z.pracownik_id FROM zdarzenie z where z.pracownik_id="
						+ id + " order by z.data_zdarzenia asc limit 10",
						new RowMapper<ScheduleModel>() {

							public ScheduleModel mapRow(ResultSet rs, int rowNum)
									throws SQLException {
								ScheduleModel scheduleModel = new ScheduleModel();

								scheduleModel.setId(rs.getInt("id"));
								scheduleModel.setDataZdarzenia(rs
										.getString("data_zdarzenia"));
								scheduleModel.setGodzina(rs
										.getString("godzina"));
								scheduleModel.setOpis(rs.getString("opis"));
								scheduleModel.setNotatka(rs
										.getString("notatka"));
								scheduleModel.setPracownikId(rs
										.getInt("pracownik_id"));

								return scheduleModel;
							}
						});
	}

}
