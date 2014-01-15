package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.WorkerDAO;
import pl.javamylove.crmdb.model.WorkerModel;

@Service("adminService")
public class AdminService {

	private WorkerDAO workerDao;

	@Autowired
	public void setSDao(WorkerDAO workerDao) {
		this.workerDao = workerDao;
	}
	
	public List<WorkerModel> getWorkersList(){
		return workerDao.getWorkersList();
	}
}
