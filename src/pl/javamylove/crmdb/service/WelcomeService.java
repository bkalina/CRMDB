package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.WorkerDAO;

@Service("wlcService")
public class WelcomeService {

	private WorkerDAO teamDao;

	@Autowired
	public void setSDao(WorkerDAO teamDao) {
		this.teamDao = teamDao;
	}
}
