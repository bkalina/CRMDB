package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.LoggerDAO;

@Service("loggerService")
public class LoggerService {

	private LoggerDAO loggerDao;

	@Autowired
	public void setLoggerDao(LoggerDAO loggerDao) {
		this.loggerDao = loggerDao;
	}

	public boolean log(String log) {
		return loggerDao.log(log);
	}

}
