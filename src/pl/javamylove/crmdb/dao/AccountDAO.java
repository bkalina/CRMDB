package pl.javamylove.crmdb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.WorkerModel;

@Component("accDao")
public class AccountDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public WorkerModel getWorker(int workerId) {
		System.out.println("workerDAO: getWorker()");
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", workerId);
		return jdbc.queryForObject("SELECT * FROM pracownik WHERE id=:id",
				params, new RowMapper<WorkerModel>() {
					public WorkerModel mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						WorkerModel workerModel = new WorkerModel();

						workerModel.setId(rs.getInt("id"));
						workerModel.setImie(rs.getString("imie"));
						workerModel.setNazwisko(rs.getString("nazwisko"));
						workerModel.setTelefon(rs.getString("telefon"));
						workerModel.setEmail(rs.getString("email"));
						workerModel.setHaslo(rs.getString("haslo"));
						workerModel.setRanga(rs.getString("ranga"));
						workerModel.setPrzelozonyId(rs.getInt("przelozony_id"));

						return workerModel;
					}
				});
	}

	public boolean updateWorker(WorkerModel worker) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				worker);
		return jdbc.update("", params) == 1;
	}

	public boolean updateNumber(WorkerModel worker) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				worker);
		return jdbc.update(
				"update pracownik set telefon=:telefon where id=:id", params) == 1;
	}

	public boolean updateEmail(WorkerModel worker) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				worker);
		return jdbc.update("update pracownik set email=:email where id=:id",
				params) == 1;
	}

	public boolean updatePassword(WorkerModel worker) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				worker);
		return jdbc.update("update pracownik set haslo=:haslo where id=:id",
				params) == 1;
	}
}
