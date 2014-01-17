package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.ScheduleModel;

@Component("scheduleDao")
public class ScheduleDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	public List<ScheduleModel> getScheduleList(int id) {
		System.out.println("scheduleDAO: getScheduleList()");
		
		return jdbc.query("SELECT z.id, z.data_zdarzenia, z.godzina, z.opis, z.notatka, z.pracownik_id FROM zdarzenie z where z.pracownik_id="+id, new RowMapper<ScheduleModel>() {

			public ScheduleModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ScheduleModel scheduleModel = new ScheduleModel();
				
				scheduleModel.setId(rs.getInt("id"));
				scheduleModel.setDataZdarzenia(rs.getString("data_zdarzenia"));
				scheduleModel.setGodzina(rs.getString("godzina"));
				scheduleModel.setOpis(rs.getString("opis"));
				scheduleModel.setNotatka(rs.getString("notatka"));
				scheduleModel.setPracownikId(rs.getInt("pracownik_id"));
				
				return scheduleModel;
			}
		});
	}
}
