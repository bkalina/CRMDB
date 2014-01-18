package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.AccountDAO;
import pl.javamylove.crmdb.model.WorkerModel;

@Service("accService")
public class AccountService {

	private AccountDAO accDao;

	@Autowired
	public void setSDao(AccountDAO accDao) {
		this.accDao = accDao;
	}

	public WorkerModel getWorker(int pracownikId) {
		System.out.println("accService: getWorker()");
		return accDao.getWorker(pracownikId);
	}

	public boolean updateNumber(WorkerModel worker) {
		System.out.println("accService: updateNumber()");
		return accDao.updateNumber(worker);
	}

	public boolean updateEmail(WorkerModel worker) {
		System.out.println("accService: updateEmail()");
		return accDao.updateEmail(worker);
	}

	public boolean updatePassword(WorkerModel worker) {
		System.out.println("accService: updatePassword()");
		return accDao.updatePassword(worker);
	}
}
