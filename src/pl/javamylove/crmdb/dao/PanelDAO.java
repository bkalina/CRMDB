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

	public PanelModel getCount(int id){
		PanelModel model = new PanelModel();
		model.setNrCount(jdbc.queryForInt("SELECT COUNT(*) FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="+id));
		model.setKlientCount(jdbc.queryForInt("SELECT COUNT(*) FROM klient WHERE pracownik_id="+id));
		model.setTerminCount(jdbc.queryForInt("SELECT COUNT(*) FROM zdarzenie WHERE pracownik_id="+id));
		model.setAneksCount(jdbc.queryForInt("SELECT COUNT(*) FROM telefon t JOIN klient k ON t.klient_id=k.id WHERE k.pracownik_id="+id+" AND koniec_umowy > 2000-01-01 AND koniec_umowy < DATE_ADD(CURDATE(),INTERVAL 60 DAY)"));
		return model;
	}
	
}
