package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.WorkerDAO;

@Service("teamService")
public class TeamService {

	private WorkerDAO teamDao;

	@Autowired
	public void setSDao(WorkerDAO teamDao) {
		this.teamDao = teamDao;
	}
	
	
}
