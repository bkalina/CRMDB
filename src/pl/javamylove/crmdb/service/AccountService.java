package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.AccountDAO;

@Service("accService")
public class AccountService {

	private AccountDAO accDao;

	@Autowired
	public void setSDao(AccountDAO accDao) {
		this.accDao = accDao;
	}

}
