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

import pl.javamylove.crmdb.model.ScheduleModel;

@Component("scheduleDao")
public class ScheduleDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<ScheduleModel> getTermsList(int id) {
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
	
	public ScheduleModel getTerm(int termId) {
		System.out.println("scheduleDAO: getTerm()");
		MapSqlParameterSource param = new MapSqlParameterSource();
		param.addValue("id", termId);
		return jdbc.queryForObject("SELECT * FROM zdarzenie WHERE id=:id", param,
				new RowMapper<ScheduleModel>() {
					public ScheduleModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
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
	
	public boolean updateTerm(ScheduleModel schedule){
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				schedule);
		return jdbc.update("UPDATE zdarzenie SET data_zdarzenia=:dataZdarzenia, godzina=:godzina, opis=:opis, notatka=:notatka, pracownik_id=:pracownikId WHERE id=:id", params) == 1;
	}
	
	public boolean createTerm(ScheduleModel schedule){
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				schedule);
		return jdbc.update("INSERT INTO zdarzenie (data_zdarzenia, godzina, opis, notatka, pracownik_id) VALUES (:dataZdarzenia, :godzina, :opis, :notatka, :pracownikId)", params) == 1;
	}
	
	public boolean deleteTerm(int termId){
		MapSqlParameterSource param = new MapSqlParameterSource();
		param.addValue("id", termId);
		return jdbc.update("DELETE FROM zdarzenie WHERE id=:id", param) == 1; 
		}
}
