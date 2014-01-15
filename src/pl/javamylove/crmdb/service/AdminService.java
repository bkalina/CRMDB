package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.WorkerDAO;

@Service("adminService")
public class AdminService {

	private WorkerDAO teamDao;

	@Autowired
	public void setSDao(WorkerDAO teamDao) {
		this.teamDao = teamDao;
	}
}
