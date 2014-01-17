package pl.javamylove.crmdb.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;

@Controller("loggerDao")
public class LoggerDAO {
	
	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}
	
	public boolean log(String log){
		MapSqlParameterSource param = new MapSqlParameterSource();
		param.addValue("log", log);
		return jdbc.update("INSERT INTO log (data, opis) VALUES (NOW(),:log)", param) == 1;
	}

}
