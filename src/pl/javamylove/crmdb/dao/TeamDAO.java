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

import pl.javamylove.crmdb.model.WorkerModel;

@Component("teamDao")
public class TeamDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<WorkerModel> getWorkersList(int id) {
		System.out.println("workerDAO: getWorkersList()");
		return jdbc
				.query("SELECT *, concat(p.imie, ' ', p.nazwisko) as przelozony FROM pracownik w join pracownik p on w.przelozony_id=p.id WHERE w.przelozony_id="
						+ id, new RowMapper<WorkerModel>() {
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
						workerModel.setPrzelozony(rs.getString("przelozony"));
						return workerModel;
					}
				});
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

	public boolean createWorker(WorkerModel worker) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(
				worker);
		return jdbc
				.update("INSERT INTO pracownik (imie, nazwisko, telefon, email, haslo, ranga, przelozony_id) VALUES (:imie, :nazwisko, :telefon, :email, :haslo, :ranga, :przelozonyId)",
						params) == 1;
	}

	public boolean deleteWorker(int workerId) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", workerId);
		return jdbc.update("DELETE FROM pracownik WHERE id=:id", params) == 1;
	}
}
