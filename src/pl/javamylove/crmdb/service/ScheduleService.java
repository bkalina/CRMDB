package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.ScheduleDAO;
import pl.javamylove.crmdb.model.ScheduleModel;

@Service("scheduleService")
public class ScheduleService {

	private ScheduleDAO sDao;

	@Autowired
	public void setSDao(ScheduleDAO sDao) {
		this.sDao = sDao;
	}
	
	public List<ScheduleModel> getTermsList(int id){
		System.out.println("scheduleService: getTermsList()");
		return sDao.getTermsList(id);
	}
	
	public ScheduleModel getTerm(int termId){
		System.out.println("scheduleService: getTerm()");
		return sDao.getTerm(termId);
	}
	
	public boolean updateTerm(ScheduleModel term){
		System.out.println("scheduleService: updateTerm()");
		return sDao.updateTerm(term);
	}
	
	public boolean createTerm(ScheduleModel term){
		System.out.println("scheduleService: createTerm()");
		return sDao.createTerm(term);
	}
	
	public boolean deleteTerm(int termId){
		System.out.println("scheduleService: deleteTerm()");
		return sDao.deleteTerm(termId);
	}
}
