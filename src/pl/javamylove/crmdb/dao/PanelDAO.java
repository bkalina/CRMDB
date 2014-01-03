package pl.javamylove.crmdb.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import pl.javamylove.crmdb.model.PanelModel;

@Component("panelDao")
public class PanelDAO {

	private JdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new JdbcTemplate(jdbc);
	}

	public PanelModel getCount(){
		PanelModel model = new PanelModel();
		model.setNrCount(jdbc.queryForInt("SELECT COUNT(*) FROM telefon"));
		model.setKlientCount(jdbc.queryForInt("SELECT COUNT(*) FROM klient"));
		model.setTerminCount(jdbc.queryForInt("SELECT COUNT(*) FROM zdarzenie"));
		model.setAneksCount(0);
		return model;
	}
	
}
