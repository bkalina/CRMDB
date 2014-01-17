package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.WorkerDAO;
import pl.javamylove.crmdb.model.WorkerModel;

@Service("workerService")
public class WorkerService {

	private WorkerDAO workerDao;

	@Autowired
	public void setWorkerDao(WorkerDAO workerDao) {
		this.workerDao = workerDao;
	}
	
	public WorkerModel getWorkerId(String username){
		System.out.println("workerService: getId()");
		return workerDao.getWorkerInitData(username);
	}
}
